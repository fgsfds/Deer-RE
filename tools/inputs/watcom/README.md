# Watcom 10.5 compiler input

`binw/wcc386.exe` is Watcom C32 10.5, the compiler version contemporary with
the pinned Watcom 10.5 runtime libraries. It is invoked through the original
DOS loader `binw/w32run.exe` inside the pinned DOSBox 0.74-3 package under
`../dosbox/`.

The compiler and loader are pinned in `tools/inputs.sha256`. This is the
compiler used by the byte-identity build for C source spans; no newer Watcom
compiler is involved.
