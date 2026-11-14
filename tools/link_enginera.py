"""Link pinned Rides Again OMF sections against the RDH symbol layout."""
import argparse
from dataclasses import dataclass
import hashlib
import json
from pathlib import Path
import struct

from omf_fixups import read_externals, read_fixups
from omf_sections import read_object
from rdh import Image, OBJECTS, ROOT


@dataclass(frozen=True)
class Module:
    name: str
    sha256: str
    object_number: int
    base: int
    size: int
    data_sections: tuple = ()


MODULES = (
    Module("CACHE1D", "8a0c46b724c4e1333c33108cab3c50e94d9538be3e01af0857616766743506c0",
           1, 0x307FF, 5754, ((2, 0x3AA4, 404), (4, 0x9E44, 553))),
    Module("ENGINE", "1465155528825ebc831a824bd9e206a43213b3ffbd4b6b1bcbee2d6a109557c8",
           1, 0x31E79, 127326, ((2, 0x3C38, 380), (4, 0xA070, 485))),
    Module("A", "5b790e4fa43991ab33766170137dda140b0e89467e43886f7c91ef715c96091e",
           4, 0x300000, 6995),
)


def read_module(directory, module):
    path = directory / f"{module.name}.OBJ"
    blob = path.read_bytes()
    if hashlib.sha256(blob).hexdigest() != module.sha256:
        raise ValueError(f"Unexpected upstream object: {path}")
    code, fixups, publics, sections = read_section(blob, 1)
    if len(code) != module.size:
        raise ValueError(f"Unexpected section size: {path}")
    data_indices = {section for section, _, _ in module.data_sections}
    if any(fix.segment in data_indices for fix in read_fixups(blob)):
        raise ValueError(f"Unexpected DATA relocation in {module.name}")
    return code, fixups, publics, sections


def read_section(blob, section):
    sections, publics = read_object(blob)
    code = sections[section]["data"]
    external = read_externals(blob)
    fixups = []
    for fix in read_fixups(blob):
        if fix.segment != section:
            continue
        if fix.location != 9 or fix.width != 4 or fix.target[0] not in (0, 2):
            raise ValueError(f"Unsupported OMF relocation in section {section} at {fix.offset:#x}")
        index = fix.target[1]
        symbol = external[index] if fix.target[0] == 2 else f"@segment:{sections[index]['name']}"
        addend = (struct.unpack_from("<i", code, fix.offset)[0] + fix.displacement)
        fixups.append((fix.offset, fix.relative, symbol, addend))
    return code, fixups, [(offset, symbol) for seg, offset, symbol in publics if seg == section], sections


def link(directory, module, symbols):
    code, fixups, publics, sections = read_module(directory, module)
    expected = apply_fixups(code, fixups, publics, module.object_number, module.base, symbols)
    data = []
    for section, offset, size in module.data_sections:
        payload = sections[section]["data"]
        if len(payload) != size:
            raise ValueError(f"Unexpected DATA size in {module.name}")
        data.append((offset, payload))
    return code, expected, len(fixups), data


def apply_fixups(code, fixups, publics, object_number, base, symbols):
    object_base = OBJECTS[object_number - 1].base
    for offset, symbol in publics:
        if symbol in symbols and symbols[symbol] != [object_number, base + offset - object_base]:
            raise ValueError(f"Unexpected binding for {symbol} at {base:#x}")
    expected = {}
    for offset, relative, symbol, addend in fixups:
        target_object, target = symbols[symbol]
        target = (target + addend) & 0xFFFFFFFF
        address = base + offset
        value = target
        if relative and target_object == object_number:
            value = object_base + target - (address + 4)
        else:
            kind = 8 if relative else 7
            expected[address] = (kind, 16 if target > 0xFFFF else 0, target_object, target)
            if relative:
                value = 0
        struct.pack_into("<I", code, offset, value & 0xFFFFFFFF)
    return expected


def verify_span(image, name, address, payload, expected):
    if image is None:
        return
    end = address + len(payload)
    actual = {a: (f.kind, f.flags, f.target_object, f.target_offset)
              for a, f in image.fixups.items() if address <= a < end}
    if actual != expected:
        differing = actual.keys() ^ expected.keys() or {
            a for a, value in actual.items() if value != expected[a]
        }
        raise ValueError(f"{name} LE relocation differs at {min(differing):#x}")
    raw = image.file_offset(address)
    if payload != image.blob[raw:raw + len(payload)]:
        raise ValueError(f"{name} linked bytes differ at {address:#x}")


def verify(image, directory, bindings, output, generated_fixups=None, *, collect=None):
    output.mkdir(parents=True, exist_ok=True)
    reports = []
    for module in MODULES:
        code, expected, count, data = link(directory, module, bindings[module.name])
        verify_span(image, module.name, module.base, code, expected)
        if collect is not None:
            collect(module.base, code)
        if generated_fixups is not None:
            generated_fixups.update(expected)
        (output / f"{module.name}.bin").write_bytes(code)
        for offset, payload in data:
            address = OBJECTS[2].base + offset
            verify_span(image, module.name, address, payload, {})
            if collect is not None:
                collect(address, payload)
            (output / f"{module.name}-{offset:04x}.bin").write_bytes(payload)
        reports.append({"module": module.name, "object": module.object_number,
                        "address": hex(module.base), "bytes": len(code),
                        "omf_fixups": count, "le_fixups": len(expected),
                        "data_bytes": sum(len(payload) for _, payload in data)})
    return reports


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("original", type=Path)
    parser.add_argument("enginera", type=Path)
    args = parser.parse_args()
    image = Image(args.original.read_bytes())
    bindings = json.loads((ROOT / "tools/data/enginera-bindings.json").read_text(encoding="utf-8"))
    print(json.dumps(verify(image, args.enginera, bindings, ROOT / "work/enginera"), indent=2))


if __name__ == "__main__":
    main()
