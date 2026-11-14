"""Verify linked CODE sections from the pinned Watcom and Rides Again libraries."""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import struct

from link_enginera import MODULES, apply_fixups, read_section, verify_span
from rdh import Image, OBJECTS, ROOT


def members(archive):
    kind, length, stop = struct.unpack_from("<BHI", archive)
    page = length + 3
    if kind != 0xF0 or not 7 <= page <= stop <= len(archive):
        raise ValueError("Invalid OMF archive header")
    cursor = page
    while cursor < stop and archive[cursor] != 0xF1:
        start = cursor
        if archive[start] not in (0x80, 0x82):
            raise ValueError(f"Invalid member header at {start:#x}")
        name = archive[start + 4:start + 4 + archive[start + 3]].decode("ascii")
        while cursor + 3 <= stop:
            kind, length = struct.unpack_from("<BH", archive, cursor)
            cursor += 3 + length
            if length < 1 or cursor > stop:
                raise ValueError(f"Invalid record in {name}")
            if kind in (0x8A, 0x8B):
                break
        else:
            raise ValueError(f"Missing module end in {name}")
        yield name, archive[start:cursor]
        cursor = (cursor + page - 1) // page * page


def verify(image, libraries, manifest, output, generated_fixups=None, *, collect=None):
    spans = [(m.base, m.base + m.size, m.name) for m in MODULES]
    data_base = OBJECTS[2].base
    spans.extend((data_base + offset, data_base + offset + size, m.name)
                 for m in MODULES for _, offset, size in m.data_sections)
    def link_data(row, blob):
        section = row["section"]
        payload, fixes, publics, sections = read_section(blob, section)
        if sections[section]["cls"] != "DATA" or len(payload) != row["size"]:
            raise ValueError(f"Unexpected initialized DATA section: {row['member']}")
        address = data_base + int(row["offset"], 16)
        if address < data_base or address + len(payload) > data_base + OBJECTS[2].pages * 4096:
            raise ValueError(f"DATA outside stored pages: {row['member']}")
        symbols = {symbol: [number, int(offset, 16)] for symbol, (number, offset)
                   in row.get("bindings", {}).items()}
        expected = apply_fixups(payload, fixes, publics, 3, address, symbols)
        emit(row["member"], address, payload, expected)
        counts.update(data_sections=1, data_bytes=len(payload), data_fixups=len(expected))

    def emit(name, address, payload, expected):
        verify_span(image, name, address, payload, expected)
        if collect is not None:
            collect(address, payload)
        if generated_fixups is not None:
            generated_fixups.update(expected)
        spans.append((address, address + len(payload), name))
        (output / f"{address:05x}.bin").write_bytes(payload)

    output.mkdir(parents=True, exist_ok=True)
    report = {}
    for library, path in libraries.items():
        entry = manifest[library]
        archive = path.read_bytes()
        if hashlib.sha256(archive).hexdigest() != entry["sha256"]:
            raise ValueError(f"Unexpected library: {path}")
        blobs = {hashlib.sha256(blob).hexdigest(): (name, blob) for name, blob in members(archive)}
        counts = Counter(sections=0, code_bytes=0, le_fixups=0, data_sections=0,
                         data_bytes=0, data_fixups=0)
        for row in entry["sections"]:
            name, blob = blobs[row["sha256"]]
            if name != row["member"]:
                raise ValueError(f"Unexpected member name: {name}")
            payload, fixes, publics, sections = read_section(blob, row["section"])
            if len(payload) != row["size"]:
                raise ValueError(f"Unexpected CODE size: {name}")
            base = int(row["address"], 16)
            object_number = row.get("object", 1)
            owner = OBJECTS[object_number - 1]
            if not owner.base <= base <= owner.base + owner.size - len(payload):
                raise ValueError(f"Section outside LE object: {name}")
            symbols = {symbol: [number, int(offset, 16)] for symbol, (number, offset) in row["bindings"].items()}
            expected = apply_fixups(payload, fixes, publics, object_number, base, symbols)
            emit(name, base, payload, expected)
            counts.update(sections=1, code_bytes=len(payload), le_fixups=len(expected))
            for data_row in row.get("data", []):
                link_data(dict(data_row, member=name), blob)
        for row in entry.get("data", []):
            name, blob = blobs[row["sha256"]]
            if name != row["member"]:
                raise ValueError(f"Unexpected member name: {name}")
            link_data(row, blob)
        report[library] = dict(counts)
    spans.sort()
    for previous, following in zip(spans, spans[1:]):
        if previous[1] > following[0]:
            raise ValueError(f"Overlapping linked sections: {previous[2]} and {following[2]}")
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("original", type=Path)
    parser.add_argument("upstream", type=Path, help="pinned Redneck-Rampage-RE checkout")
    parser.add_argument("clib", type=Path, help="Watcom 10.5 LIB386/DOS/CLIB3R.LIB")
    parser.add_argument("--math", type=Path, help="Watcom 10.5 LIB386/MATH387R.LIB")
    parser.add_argument("--emu", type=Path, help="Watcom 10.5 LIB386/DOS/EMU387.LIB")
    args = parser.parse_args()
    image = Image(args.original.read_bytes())
    manifest = json.loads((ROOT / "tools/data/library-layout.json").read_text(encoding="utf-8"))
    libraries = {"watcom": args.clib, "audio": args.upstream / "AUDIO_WF.LIB",
                 "mact": args.upstream / "mact/MACT386.LIB"}
    if args.math:
        libraries["math"] = args.math
    if args.emu:
        libraries["emu"] = args.emu
    print(json.dumps(verify(image, libraries, manifest, ROOT / "work/libraries"), indent=2))


if __name__ == "__main__":
    main()
