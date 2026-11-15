# Exact build and verification

On 64-bit Windows, run from the repository root with Python 3.10 or later on PATH.
The build compiles C spans with the bundled Watcom 10.5 DOS compiler in DOSBox;
DOSBox is used for compilation only.

```sh
python tools/verify_ci_build.py
```

The script checks the [input hashes](../tools/inputs.sha256), builds
`work/ci-build/RDH.EXE`, and verifies its [pinned file size and SHA-256](RDH.md).

On other platforms, supply your own NASM executable. Run the command from
the repository root.

```sh
python tools/build_rdh.py tools/inputs/rides-again/dos-stub.bin tools/inputs/rides-again tools/inputs/watcom/LIB386 RDH.EXE --nasm /usr/bin/nasm
```

## Comparing with an original copy

The standard build and [GitHub Actions](../.github/workflows/build.yml) use
the pinned size and SHA-256. To inspect the layout against an independently
supplied original, run from the repository root:

```powershell
$original = 'C:/path/to/original/RDH.EXE'
$inputs = 'tools/inputs'
$upstream = "$inputs/rides-again"
$stub = "$upstream/dos-stub.bin"
$watcom = "$inputs/watcom/LIB386"
$nasm = "$inputs/nasm/nasm.exe"
python tools/coverage_report.py $original
python tools/verify_relocations.py $original $stub $upstream $watcom --nasm $nasm
```

The coverage report accounts for stored payload spans and page padding. The
relocation verifier compares the reconstructed loader prefix. The builder
also accepts `--compare $original` for a full byte comparison.

## Input provenance

- `rides-again/` contains the three Build objects, the audio and MACT
  libraries, and the first 11,392 bytes of `enginerr/GAME.EXE` for the DOS
  stub. [Pinned Redneck-Rampage-RE checkout](https://github.com/NBlood/Redneck-Rampage-RE/tree/4109fb04260eaaddf9ccfcd5ef42bcd355b5f353)
- `watcom/LIB386/` contains the three Watcom 10.5 runtime libraries used
  by the linker. [Watcom 10.5 CD](https://winworldpc.com/download/0a5bbe4e-1209-11e9-9b71-fa163e9022f0)
- `watcom/binw/` contains Watcom C32 10.5 and its DOS loader, used to compile
  reconstructed C spans.
- `dosbox/` contains the pinned Windows DOSBox 0.74-3 runner and its SDL
  libraries; see the included [DOSBox license](../tools/inputs/dosbox/COPYING.txt).
- `nasm/` contains the Windows assembler also used by Fate-RE and its
  [BSD license](../tools/inputs/nasm/LICENSE).
