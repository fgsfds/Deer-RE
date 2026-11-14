# RDH.EXE 1.06

The original executable is 833,363 bytes with SHA-256
`6b72d5979d5fb308079f79707ffb3c3a59f43615fd875f6ed8b3bc4b8e462298`.
The initialized pages end at EOF. The LE entry is at logical address
`0x5fe60`, inside the Watcom runtime startup. The executable has no declared
debug payload or imported modules.

| Object | Logical base | Virtual bytes | Stored pages | File offset |
| --- | ---: | ---: | ---: | ---: |
| 1 | `0x10000` | 509,486 | 125 | `0x36c00` |
| 2 | `0x90000` | 93 | 1 | `0xb3c00` |
| 3 | `0xa0000` | 2,458,192 | 21 | `0xb4c00` |
| 4 | `0x300000` | 6,995 | 2 | `0xc9c00` |

The DOS stub matches the first 11,392 bytes of the game's `SETMAIN.EXE` and
Rides Again's `enginerr/GAME.EXE` at the pinned revision.
The LE loader has 25,058 fixup records at 25,035 distinct sites. There are
24,925 absolute records and 133 self-relative records. The linker encodes
all 25,058 records from the OMF sections and standalone sources. The saved
[page and record order](../tools/data/relocation-order.json) contains source offsets.
The linker checks all 23 cross-page duplicates.

The build emits all four stored object payloads and 6,517 bytes of
inter-object page padding. It checks the complete executable against
the original executable's size and SHA-256. The
[comparison commands](EXACT-BUILD.md#comparing-with-an-original-copy) inspect
stored spans and verify the loader prefix against a supplied original.

## Standalone reconstruction

The NASM sources cover game startup, input and configuration, the CON
interpreter, gameplay, rendering, and routines from MemCheck and the DOS
runtime. The initialized data includes game tables and defaults, diagnostic
strings, relocated pointer tables, and Watcom startup and exit callbacks.
The [standalone span inventory](../tools/verify_control.py) records their
addresses and relocations.

See the [build instructions](EXACT-BUILD.md) for input provenance.

## Build Engine objects

The build links three pinned OMF objects using
[RDH symbol bindings](../tools/data/enginera-bindings.json).

| Upstream object | LE object | Logical address | Linked bytes | LE fixup sites | Initialized data bytes |
| --- | ---: | ---: | ---: | ---: | ---: |
| `CACHE1D.OBJ` | 1 | `0x307ff` | 5,754 | 291 | 957 |
| `ENGINE.OBJ` | 1 | `0x31e79` | 127,326 | 6,059 | 865 |
| `A.OBJ` | 4 | `0x300000` | 6,995 | 483 | 0 |

The initialized spans are the engine and cache `CONST` and `_DATA`
sections in LE object 3. The 133 self-relative LE records include 131
engine references to object 4. Within an LE object, relative branches
are resolved by the linker and leave no LE relocation. Module-local
bindings preserve two distinct `_cachesize` addresses in the engine and
cache objects.

## Library sections

The [library layout](../tools/data/library-layout.json) records archive and member hashes,
section placements, and RDH symbol bindings. Most code sections are in LE
object 1. MACT's `joystick.asm` member supplies all 93 bytes of LE object 2
and its five relocations, plus 17 bytes of initialized data in object 3.

| Input library | CODE sections | Code bytes | CODE fixups | Initialized data bytes | DATA fixups |
| --- | ---: | ---: | ---: | ---: | ---: |
| Watcom 10.5 DOS `CLIB3R.LIB` | 137 | 29,037 | 348 | 2,194 | 87 |
| Rides Again `AUDIO_WF.LIB` | 49 | 113,385 | 5,054 | 40,115 | 2 |
| Rides Again `MACT386.LIB` | 12 | 22,292 | 882 | 7,231 | 114 |
| Watcom 10.5 `MATH387R.LIB` | 17 | 4,318 | 65 | 459 | 1 |
| Watcom 10.5 DOS `EMU387.LIB` | 1 | 12,838 | 400 | 122 | 0 |

The Watcom sections include the 727-byte startup code at `0x5fe60`.
Discovery compared each complete CODE section outside the OMF operand fields.
The verifier then applies the recorded symbol bindings and checks all emitted
bytes and LE relocation sites, including the absence of unexpected relocations.
The verifier also links and compares 114 initialized data sections in LE
object 3. Placements come from symbol references in matched code or a
unique comparison of the section outside its OMF operand fields. The
relocated sections include the floating-point dispatch table in
`chipd32`, the `strerror` pointer table, and MACT's keyboard tables.
The OMF reader expands 16-bit and 32-bit iterated data records, including
nested repeats used in the audio mixing assembly.
References from matched code locate data-only members such as Watcom's
character classification table and the audio library's General MIDI timbre
bank. Identical `strcpy` and `_fmemcpy` bodies each occur at two distinct
addresses. Both copies are verified and counted.
The `emu387` member fills the complete code gap from `0x82dc4` to
`0x85fea`. Its OMF fixups include explicit displacements for internal
references. The linked section matches all 12,838 bytes and 400 LE fixup sites.
