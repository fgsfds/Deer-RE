"""Measure the verified RDH object spans and check linker page padding."""
import argparse
import json
from pathlib import Path

from link_enginera import MODULES
from rdh import Image, OBJECTS, ROOT
from verify_control import CODE, data_spans


def object_spans(manifest):
    for _, address, size, _ in CODE:
        yield 1, address, size
    for _, address, data, _ in data_spans():
        yield (1 if address < OBJECTS[2].base else 3), address, len(data)
    for module in MODULES:
        yield module.object_number, module.base, module.size
        for _, offset, size in module.data_sections:
            yield 3, OBJECTS[2].base + offset, size
    for library in manifest.values():
        for data in library.get("data", []):
            yield 3, OBJECTS[2].base + int(data["offset"], 16), data["size"]
        for row in library["sections"]:
            yield row.get("object", 1), int(row["address"], 16), row["size"]
            for data in row.get("data", []):
                yield 3, OBJECTS[2].base + int(data["offset"], 16), data["size"]


def coverage(image, manifest):
    spans = list(object_spans(manifest))
    results = []
    for number, obj in enumerate(OBJECTS, 1):
        raw = image.file_offset(obj.base)
        stored = min(obj.pages * image.page_size, len(image.blob) - raw)
        size = min(stored, obj.size)
        cursor = obj.base
        gaps = []
        matched = 0
        for start, length in sorted((a, n) for owner, a, n in spans if owner == number):
            end = start + length
            if length <= 0 or start < cursor or end > obj.base + size:
                raise ValueError(f"Overlapping or out-of-bounds span at {start:#x}")
            if start > cursor:
                gaps.append((cursor, start))
            matched += length
            cursor = end
        if cursor < obj.base + size:
            gaps.append((cursor, obj.base + size))
        padding = stored - size
        if image.blob[raw + size:raw + stored] != bytes(padding):
            raise ValueError(f"Nonzero page padding in object {number}")
        results.append({
            "object": number,
            "stored_payload_bytes": size,
            "bytes_in_verified_spans": matched,
            "zero_padding_bytes": padding,
            "unmatched_payload_bytes": size - matched,
            "unmatched_ranges": [[hex(start), hex(end)] for start, end in gaps],
        })
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("original", type=Path)
    args = parser.parse_args()
    image = Image(args.original.read_bytes())
    manifest = json.loads((ROOT / "tools/data/library-layout.json").read_text(encoding="utf-8"))
    print(json.dumps(coverage(image, manifest), indent=2))


if __name__ == "__main__":
    main()
