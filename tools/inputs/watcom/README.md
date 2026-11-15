# Watcom C32 10.5 compiler input

`binw/wcc386.exe` is Watcom C32 10.5, the compiler version contemporary with
the pinned Watcom 10.5 runtime libraries. It is invoked through the original
DOS loader `binw/w32run.exe` inside the pinned DOSBox 0.74-3 package under
`../dosbox/`.

These are the original Watcom binaries, not Open Watcom. The compiler and
loader contain Watcom's 1988–1995 copyright strings. Version 10.5 is pinned
because it matches the included runtime libraries and reproduces the C spans
used by the exact-build check.

The compiler and loader are pinned in `tools/inputs.sha256`. Version 10.5
matches the Watcom 10.5 runtime libraries included here and is used to compile
the reconstructed C spans for the byte-identity build. This establishes a
matching build toolchain; it does not by itself prove which exact compiler
release produced every part of the original game executable.
