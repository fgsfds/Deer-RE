"""Build RDH.EXE with the pinned inputs and verify its size and SHA-256."""

from hashlib import sha256
from pathlib import Path
import re

from build_rdh import build
from rdh import TARGET


TOOLS = Path(__file__).resolve().parent
ROOT = TOOLS.parent
INPUTS = TOOLS / "inputs"


def verify_inputs():
    for line in (TOOLS / "inputs.sha256").read_text(encoding="ascii").splitlines():
        match = re.fullmatch(r"([0-9a-f]{64})  (.+)", line)
        if match is None:
            raise ValueError(f"Invalid checksum entry: {line}")
        expected, relative = match.groups()
        if sha256((INPUTS / relative).read_bytes()).hexdigest() != expected:
            raise ValueError(f"SHA-256 mismatch: {relative}")

def main():
    verify_inputs()
    upstream = INPUTS / "rides-again"
    output = ROOT / "work" / "ci-build" / "RDH.EXE"
    result = build((upstream / "dos-stub.bin").read_bytes(), upstream,
                   INPUTS / "watcom" / "LIB386", INPUTS / "nasm" / "nasm.exe")
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_bytes(result)
    print(f"{output}: verified {len(result)} bytes, SHA-256 {TARGET}")


if __name__ == "__main__":
    main()
