# C rewrite attempts and byte mismatches

This log records rejected translations and the evidence to carry into a retry.
Keep failed C candidates out of the build until their emitted bytes and
relocations match the pinned executable.

## `code_5d849` state update — resolved

The original span is 96 bytes. With `/of+`, Watcom emitted 88 bytes: the frame
layout matched, but optimization reduced the original `sete` / `movzx` / `test`
boolean sequence to a two-byte conditional branch. `/od` was not a solution;
it emitted 98 bytes and added saved registers and stack allocation. A raw byte
comparison also showed that the two Pascal parameters were assigned to the
opposite source variables than the initial C draft assumed.

The C source now expresses the state updates in the observed parameter order.
The build's code patches restore the original boolean sequence, branch
displacement, and `push 0` argument encoding. The compiled span then matched
all 96 target bytes and its relocation set, and the full executable hash
passed. See `src/code_5d849.c` and `tools/verify_control.py`.

## `code_5d8a9` wrapper — resolved

The 35-byte Pascal wrapper calls `code_5d849` and conditionally stores its
first argument. Watcom initially emitted 37 bytes: it loaded both stack
arguments into registers before pushing them, while the original pushes
directly from `[ebp+0x10]` and `[ebp+0x0c]`. `#pragma aux ... parm routine []`
did not remove those moves, so that trial was dropped. A narrow code patch
converts the two load/push pairs to the original memory pushes. The span then
matched the original, including its relative call and two data fixups; the
complete executable hash passed. See `src/code_5d8a9.c`.

## `code_88d83` diagnostic counter — resolved

The original 35-byte routine increments a counter and, on its first call,
invokes a variadic logger with a code-segment argument. The first C output was
40 bytes: Watcom saved `ECX` and `EDX`, and encoded the segment argument as
`push 0`. The verifier's narrow code patches remove those saves, adjust the
short branch, and change that push to `push cs`. The span now matches the
original bytes and fixups. Comparing the raw CODE section exposed both the
calling-convention difference and the required segment value; see
`src/code_88d83.c` and `tools/verify_control.py`.

## `code_5d8cc` variadic formatter — resolved

The first C output was 161 bytes and lacked the original EBP frame; even with
`/of+`, Watcom emitted 158 bytes, cached the first argument in `EDI`, used a
different local layout, and saved fewer registers. The target passes one
helper's arguments in `EAX`/`EDX`/`EBX`, while several other helpers use
Pascal stack arguments. A volatile variadic cursor preserved the target's
cursor store order. Small CODE patches then restored the saved-register order,
direct stack pushes, local offsets, result registers, and branch distances.
The patcher also needed explicit relocation-offset remaps for direct absolute
memory pushes. The final 167-byte span matched the target and its three data
fixups exactly. See `src/code_5d8cc.c` and `tools/verify_control.py`.

## `code_629c5` initializer — resolved

The original 152-byte range begins with a 16-byte repeated data pattern, so
that prefix stays in assembly while the 136-byte initializer is C. Watcom's
first output added three register saves, reordered two register loads, and
implemented the zero stores through registers. The original directly stores
immediates. Targeted patches restore the original instruction order and
stores; external symbols retain address fixups for the pointer arguments.
The C body then matched all 136 bytes and its 16 relocations, and the complete
executable hash passed. See `src/code_629c5.c` and `tools/verify_control.py`.

## `code_88e27` variadic log wrapper — resolved

The 40-byte wrapper uses two scope calls, a Pascal helper, a cdecl helper, and
the existing variadic logger. Watcom initially emitted 43 bytes because it
saved `ECX` and `EDX`, and it cleaned the cdecl helper's argument before the
logger call. The original lets the logger's 12-byte cleanup cover both sets
of arguments. Marking the wrapper's clobbered registers and removing that
intermediate cleanup reproduced the original 40 bytes and string relocation.
See `src/code_88e27.c` and `tools/verify_control.py`.

## `code_88da6` diagnostic-state wrapper — resolved

The first build draft declared the 16-bit return helper as `int` while asking
Watcom for `value [ax]`; it rejected that mismatch with E1121. Declaring its
return as `short` matched the helper's `movsx eax, ax` behavior. The compiler
then omitted the target's EBP frame until `/of+` was enabled. A compact
boolean expression evaluated the state bytes in a different order, so explicit
early branches were needed to preserve the target's short-circuit order.
Watcom also reused `BL` for both the active flag and the increment amount,
changing the flag store, counter increment, and comparison encodings. Narrow
patches restore those instructions and their relocation offsets. The final
129-byte span matched all target bytes and fixups; the first remaining byte
mismatch was the branch at span offset `0x27` (`0x4e` emitted, `0x4d`
expected). Correcting that displacement made the span exact. The full pinned
executable hash then passed. See `src/code_88da6.c` and
`tools/verify_control.py`.

## `code_75f93` heap-state check — resolved

The first C draft did not preserve the EBP frame and saved ESI instead of the
target's callee-saved EBX. `/of+` restored the frame; listing ESI as clobbered
while leaving EBX preserved made the register contract match. An early-goto
draft moved the `-1` return to the end of the routine and changed the initial
branch shape, so direct returns are needed to keep that path at the target's
early location.

Watcom zeroed the stack record through registers, while the target uses
immediate stores. It also materialized `address - 4` in temporary registers
inside the scan loop. Narrow code patches restore the immediate stores, form
the address in EBX before the loop, and replace the redundant load/LEA/compare
sequence with the target's direct memory compare. Returning DS as a C `uint16`
emitted `66 8c d8`; the target's `8c d8` writes the selector to EAX, so the
prefix is removed. The first C relocation for `nheapwal` also used the absolute
address as an object offset, adding `0x10000`; object 1 requires the
base-relative offset `0x76b0a` for address `0x86b0a`. After correcting that
binding, byte comparison isolated seven short-branch displacements and one
forward jump that differed. Patching those displacements yielded an exact
93-byte span and fixup set. See `src/code_75f93.c` and
`tools/verify_control.py`.

## Earlier rejected candidates — retry diagnostics incomplete

Direct C candidates for `setup_mouse` (712 bytes), `config_defaults` (148
bytes), and `read_save_names` (196 bytes) failed exact byte comparison and
were discarded; their candidate sources and first differing offsets were not
retained. The assembly remains authoritative. Do not treat the clues below as
confirmed causes for the original drafts; capture and record the first byte
and relocation mismatch on any further retry.

- `setup_mouse`: it uses lookup macros and several register-argument helpers.
  The target enters with the `EAX` argument copied to `EDI`, has a 0xa8-byte
  local frame, and makes calls with live values in `EAX`/`EBX`/`EDX`. The
  lookup macros also produce conditional branches into labels inside the
  function. Split out smaller helper-sized ranges first; verify register
  arguments, stack cleanup, and branch distances before attempting the whole
  function. The old draft's emitted bytes and first mismatch were not kept,
  so these are assembly-derived retry clues, not a diagnosis of that draft.
- `config_defaults`: it mixes word/dword setup with byte stores through `AH`.
  Preserve each store width and the initialization order; C integer promotions
  can change the encoding. A later instrumented retry with `/of+` emitted 143
  bytes including the three-byte padding, versus the 148-byte target. It saved
  only `EBX` and `EDX`; the original also saves `ECX` and `EDI` and keeps the
  `192`, `128`, and `8` values in registers, while the C draft used immediate
  stores. Register-qualified locals did not change that output. This is a
  code-generation mismatch, not yet a corrected translation.
- `read_save_names`: it calls helpers through registers and derives a slot
  index with a dword load from `[ebp-0x1a]`, arithmetic shift by 16, and
  multiply by 22. The dword load overlaps the 16-bit slot local and adjacent
  stack data; replacing it with a clean `uint16_t` load changes the machine
  code and potentially the observed calculation. Preserve that exact load
  width and slot calculation, plus the `EAX`/`ECX`/`EDX`/`EBX` helper argument
  assignments. The old draft's emitted bytes and first mismatch were not
  kept, so these are assembly-derived retry clues, not a diagnosis of that
  draft.

## `get_inc_angle` retry — rejected, mismatch measured

The 84-byte routine at `0x19ff0` corresponds semantically to
`getincangle` in NBlood's `gamedef1.c`, but the first C draft declared a
16-bit return while requesting `value [eax]`. Watcom 10.5 rejected it with
E1121 (invalid return register). The assembly returns the final 32-bit EAX
value, so changing the C result type to `int` fixed that declaration error.

Using the repository's exact Watcom command (`/4r /s /or /of+ /bt=dos`), a
short-argument draft generated 83 bytes and first differed at
offset `0x04`: it emitted `and ah,7` where the target saves ECX and copies
EAX to EBX before masking BH. Removing ECX from the pragma's clobber list
made Watcom save ECX, but yielded 85 bytes and still used AH rather than the
target's EBX/BH sequence. Changing both parameters to `int` generated 80
bytes; its first mismatch moved to offset `0x04`, where it emitted an
immediate mask (`and eax,0x7ff`) instead of the target's `push ecx`. The
inputs are custom register arguments (EAX and EDX), and the target deliberately
keeps the first value in EBX while masking only BH. Clue for a retry: control
the register allocation or use a small, documented code patch; changing C
types alone does not reproduce the target's register choices. No fixups were
expected for this span. All unaccepted C source and metadata changes were
removed; the assembly remains in the build.

## `do_move_things` upstream transplant — rejected before code generation

The 1,412-byte Deer routine at `0x19650` resembles `domovethings` in
NBlood's `game9.c`, but a direct upstream-body transplant would not preserve
Deer's behavior. Deer calls `update_target_clock` before the body, toggles a
byte at `0x972e` instead of incrementing upstream's `everyothertime`, and
uses a single conditional call at `0x2a0f0` in the per-player loop where
upstream separates `cheatkeys`, `processinput`, and `checksectors`. Deer also
uses `CORRECT_PREDICTED_MOVEMENT`; upstream calls
`fakedomovethingscorrect`. The periodic update calls likewise do not line up
one-for-one. These observations come from comparing Deer assembly with the
upstream C source, not from a failed compiler run. Clue for a later attempt:
resolve the `0x2a0f0` call and the periodic helper equivalences first, then
port Deer control flow and absolute state accesses rather than copying the
upstream body. No candidate C was added.

## Recording the next failed attempt

Before discarding a candidate, record the function and source revision, exact
compiler options, generated length, first differing CODE offset (expected and
actual bytes), and relocation differences. Keep the unaccepted C source out of
the build, but preserve a small diff or diagnostic excerpt here. Then add
evidence-backed clues: whether the first mismatch is in the prologue, an
argument load, an immediate width, a branch displacement, a call fixup, or
stack cleanup. Mark inferences as hypotheses until confirmed by another
byte comparison. This prevents speculative ABI explanations from being
mistaken for measured causes.
