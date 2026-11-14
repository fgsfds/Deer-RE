"""Inspect RDH.EXE 1.06."""
import argparse
from collections import Counter
from dataclasses import dataclass
import hashlib
import json
from pathlib import Path
import struct

TARGET = "6b72d5979d5fb308079f79707ffb3c3a59f43615fd875f6ed8b3bc4b8e462298"
STUB = "8bf4f1e780034f0f506b44b6730e6fb136e8144dbe95073287a83d3be376c2b7"
ROOT = Path(__file__).resolve().parents[1]


@dataclass(frozen=True)
class Object:
    size: int
    base: int
    flags: int
    first_page: int
    pages: int
    reserved: int


@dataclass(frozen=True)
class Fixup:
    kind: int
    flags: int
    target_object: int
    target_offset: int


OBJECTS = (
    Object(0x7C62E, 0x10000, 0x2045, 1, 125, 0),
    Object(0x5D, 0x90000, 0x2043, 126, 1, 0),
    Object(0x258250, 0xA0000, 0x2043, 127, 21, 0),
    Object(0x1B53, 0x300000, 0x2043, 148, 2, 0),
)


class Image:
    def __init__(self, blob):
        if hashlib.sha256(blob).hexdigest() != TARGET:
            raise ValueError("Expected the pinned RDH.EXE 1.06")
        self.blob = blob
        self.header = struct.unpack_from("<I", blob, 60)[0]
        if blob[self.header:self.header + 2] != b"LE":
            raise ValueError("Expected an LE image")
        self.page_size = self.field(0x28)
        self.page_count = self.field(0x14)
        self.data_offset = self.field(0x80)
        table = self.header + self.field(0x40)
        self.objects = [
            Object(*struct.unpack_from("<6I", blob, table + 24 * i))
            for i in range(self.field(0x44))
        ]
        self.page_records = list(self.read_pages())
        self.records = [record for page in self.page_records for record in page]
        self.fixups = {}
        for address, fixup in self.records:
            if self.fixups.setdefault(address, fixup) != fixup:
                raise ValueError(f"Conflicting fixups at {address:#x}")

    def field(self, offset):
        return struct.unpack_from("<I", self.blob, self.header + offset)[0]

    def file_offset(self, address):
        owner, = (o for o in self.objects if o.base <= address < o.base + o.size)
        return self.data_offset + (owner.first_page - 1) * self.page_size + address - owner.base

    def read_pages(self):
        pages = self.header + self.field(0x68)
        records = self.header + self.field(0x6C)
        for page in range(self.page_count):
            start, stop = struct.unpack_from("<II", self.blob, pages + 4 * page)
            owner, = (o for o in self.objects if o.first_page <= page + 1 < o.first_page + o.pages)
            base = owner.base + (page + 1 - owner.first_page) * self.page_size
            cursor, end = records + start, records + stop
            page_records = []
            while cursor < end:
                kind, flags, source, target = struct.unpack_from("<BBhB", self.blob, cursor)
                if kind not in (7, 8) or flags not in (0, 16) or not 1 <= target <= len(self.objects):
                    raise ValueError(f"Unsupported fixup at file offset {cursor:#x}")
                width = 4 if flags & 16 else 2
                operand = int.from_bytes(self.blob[cursor + 5:cursor + 5 + width], "little")
                cursor += 5 + width
                if cursor > end:
                    raise ValueError(f"Fixup exceeds page {page + 1}")
                page_records.append((base + source, Fixup(kind, flags, target, operand)))
            yield page_records

    def describe(self):
        kinds = Counter(f.kind for _, f in self.records)
        return {
            "sha256": TARGET,
            "size": len(self.blob),
            "le_header": hex(self.header),
            "stub_sha256": hashlib.sha256(self.blob[:self.header]).hexdigest(),
            "entry": hex(self.objects[self.field(0x18) - 1].base + self.field(0x1C)),
            "page_count": self.page_count,
            "page_size": self.page_size,
            "page_data_end": self.data_offset + (self.page_count - 1) * self.page_size + self.field(0x2C),
            "objects": [
                {"base": hex(o.base), "virtual_size": o.size, "pages": o.pages,
                 "file_offset": hex(self.file_offset(o.base))}
                for o in self.objects
            ],
            "fixup_records": len(self.records),
            "unique_fixup_sites": len(self.fixups),
            "absolute_fixups": kinds[7],
            "relative_fixups": kinds[8],
        }


def build_loader(setmain, page_records):
    stub = setmain[:0x2C80]
    if hashlib.sha256(stub).hexdigest() != STUB:
        raise ValueError("Input does not have the pinned DOS stub")
    header = bytearray(0xC4)
    page_size, page_count = 4096, sum(o.pages for o in OBJECTS)
    if len(page_records) != page_count:
        raise ValueError("Unexpected relocation page count")
    objects = b"".join(struct.pack("<6I", *vars(o).values()) for o in OBJECTS)
    page_map = b"".join(struct.pack(">I", p << 8) for p in range(1, page_count + 1))
    name = b"\x03rdh\0\0\0\0"
    names_at = len(header) + len(objects) + len(page_map)
    pages_at = names_at + len(name)
    offsets, records = [0], bytearray()
    pages = ((o, j) for o in OBJECTS for j in range(o.pages))
    for (owner, j), page in zip(pages, page_records, strict=True):
        for address, fixup in page:
            source = address - owner.base - j * page_size
            records.extend(struct.pack("<BBhB", fixup.kind, fixup.flags, source, fixup.target_object))
            records.extend(fixup.target_offset.to_bytes(4 if fixup.flags & 16 else 2, "little"))
        offsets.append(len(records))
    page_fixups = struct.pack(f"<{len(offsets)}I", *offsets)
    records_at = pages_at + len(page_fixups)
    imports_at = records_at + len(records)
    end = imports_at + 1
    data_at = (len(stub) + end + 511) & ~511
    fields = {
        0: 0x454C, 8: 0x10002, 0x10: 0x200,
        0x14: page_count, 0x18: 1, 0x1C: 0x4FE60,
        0x20: 3, 0x24: OBJECTS[2].size, 0x28: page_size,
        0x2C: OBJECTS[-1].size % page_size, 0x30: end - pages_at,
        0x38: end - len(header), 0x40: len(header), 0x44: len(OBJECTS),
        0x48: len(header) + len(objects), 0x50: names_at, 0x58: names_at,
        0x5C: pages_at - 1, 0x68: pages_at, 0x6C: records_at,
        0x70: imports_at, 0x78: imports_at, 0x80: data_at, 0x94: 3,
    }
    for offset, value in fields.items():
        struct.pack_into("<I", header, offset, value)
    prefix = stub + header + objects + page_map + name + page_fixups + records + b"\0"
    prefix += bytes(data_at - len(prefix))
    return prefix


def verify_loader(image, setmain):
    prefix = build_loader(setmain, image.page_records)
    if prefix != image.blob[:image.data_offset]:
        raise ValueError("Re-encoded DOS stub or LE metadata differs")
    return {"matching_prefix_bytes": len(prefix), "fixup_input": "original LE records"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("original", type=Path)
    parser.add_argument("--setmain", type=Path, help="verify the shared DOS stub and re-encoded LE metadata")
    args = parser.parse_args()
    image = Image(args.original.read_bytes())
    result = image.describe()
    if args.setmain:
        result["loader_verification"] = verify_loader(image, args.setmain.read_bytes())
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
