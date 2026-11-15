"""Build the pinned RDH.EXE 1.06 from reconstructed sections."""
import argparse
import hashlib
import json
from pathlib import Path
from tempfile import TemporaryDirectory

from rdh import OBJECTS, ROOT, TARGET, build_loader
from verify_relocations import generate_sections, ordered_pages

TARGET_SIZE = 833_363


def build(setmain, upstream, watcom_lib386, nasm,
          c_compiler=None, c_runner=None, dosbox=None):
    page_size = 4096
    sizes = [min(obj.size, obj.pages * page_size) for obj in OBJECTS]
    payloads = [bytearray(size) for size in sizes]
    spans = [[] for _ in OBJECTS]

    def collect(address, payload):
        end = address + len(payload)
        for obj, data, intervals in zip(OBJECTS, payloads, spans, strict=True):
            if obj.base <= address < end <= obj.base + len(data):
                offset = address - obj.base
                data[offset:offset + len(payload)] = payload
                intervals.append((address, end))
                return
        raise ValueError(f"Section outside stored payloads at {address:#x}")

    with TemporaryDirectory(prefix="deer-re-") as directory:
        fixups = generate_sections(None, upstream, watcom_lib386, nasm,
                                   Path(directory), collect=collect,
                                   c_compiler=c_compiler or ROOT / "tools/inputs/watcom/binw/wcc386.exe",
                                   c_runner=c_runner or ROOT / "tools/inputs/watcom/binw/w32run.exe",
                                   dosbox=dosbox or ROOT / "tools/inputs/dosbox/DOSBox.exe")
    for obj, size, intervals in zip(OBJECTS, sizes, spans, strict=True):
        cursor = obj.base
        for start, end in sorted(intervals):
            if start != cursor:
                raise ValueError(f"Gap or overlap in object {obj.base:#x} at {cursor:#x}")
            cursor = end
        if cursor != obj.base + size:
            raise ValueError(f"Incomplete object at {obj.base:#x}")

    order = json.loads((ROOT / "tools/data/relocation-order.json").read_text(encoding="utf-8"))
    pages, _ = ordered_pages(order, fixups, {})
    result = bytearray(build_loader(setmain, pages))
    for obj, data in zip(OBJECTS, payloads, strict=True):
        result.extend(data)
        if obj is not OBJECTS[-1]:
            result.extend(bytes(obj.pages * page_size - len(data)))
    if len(result) != TARGET_SIZE:
        raise ValueError(f"Expected {TARGET_SIZE} bytes, got {len(result)}")
    if hashlib.sha256(result).hexdigest() != TARGET:
        raise ValueError("Built executable differs from the SHA-256 of the original executable")
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stub_source", type=Path, help="DOS stub or executable containing it")
    parser.add_argument("upstream", type=Path)
    parser.add_argument("watcom_lib386", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--nasm", type=Path, required=True)
    parser.add_argument("--c-compiler", type=Path,
                        default=ROOT / "tools/inputs/watcom/binw/wcc386.exe")
    parser.add_argument("--c-runner", type=Path,
                        default=ROOT / "tools/inputs/watcom/binw/w32run.exe")
    parser.add_argument("--dosbox", type=Path, default=ROOT / "tools/inputs/dosbox/DOSBox.exe")
    parser.add_argument("--compare", type=Path, help="byte-compare with the original RDH.EXE")
    args = parser.parse_args()
    result = build(args.stub_source.read_bytes(), args.upstream, args.watcom_lib386,
                   args.nasm, args.c_compiler, args.c_runner, args.dosbox)
    if args.compare and result != args.compare.read_bytes():
        raise ValueError("Built executable differs from the supplied comparison file")
    args.output.write_bytes(result)
    print(f"{args.output}: verified {len(result)} bytes, SHA-256 {TARGET}")


if __name__ == "__main__":
    main()
