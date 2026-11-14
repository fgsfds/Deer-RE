bits 32
org 0x1e11c

%define MOVE_ACTOR 0x1d43c
%define SPAWN 0x15ee0
%define SET_PLAYER_QUOTE 0x14e68
%define KRAND 0x46fa0
%define BADGUY 0x14814
%define SET_DEBUG_LOCATION 0x5ab32
%define PRINTF 0x5ac04
%define INSTRUCTION_POINTER 0xbd768
%define KILL_FLAG 0xc0048
%define EGS 0x15c74
%define GET_GLOBAL_Z 0x1a0b8
%define DODGE 0x1cee0
%define CAN_SEE 0x41280
%define DELETE_SPRITE 0x40ecd
%define SET_SPRITE 0x40b6d
%define CHANGE_SPRITE_STAT 0x51390
%define GET_INC_ANGLE 0x19ff0
%define GET_ANGLE 0x3b4fc
%define SOURCE_NAME 0x28cc
%define INTEGER_FORMAT 0x28d8

opcode_dispatch:
    dd loc_2028f - 0x10000
    dd loc_1e421 - 0x10000
    dd loc_1e3fc - 0x10000
    dd loc_1e8e6 - 0x10000
    dd loc_1ea59 - 0x10000
    dd loc_1ec22 - 0x10000
    dd loc_1ec6c - 0x10000
    dd loc_1ed32 - 0x10000
    dd loc_1edc0 - 0x10000
    dd loc_1ee0b - 0x10000
    dd loc_1e3fc - 0x10000
    dd loc_23b1e - 0x10000
    dd loc_232b7 - 0x10000
    dd loc_1fa36 - 0x10000
    dd loc_1fb92 - 0x10000
    dd loc_210ce - 0x10000
    dd loc_1e3fc - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_21245 - 0x10000
    dd loc_20476 - 0x10000
    dd loc_20493 - 0x10000
    dd loc_1eb9d - 0x10000
    dd loc_20f4d - 0x10000
    dd loc_1eb28 - 0x10000
    dd loc_1eabc - 0x10000
    dd loc_1f508 - 0x10000
    dd loc_210f4 - 0x10000
    dd loc_20274 - 0x10000
    dd loc_2117b - 0x10000
    dd loc_2110c - 0x10000
    dd loc_211c2 - 0x10000
    dd loc_212b0 - 0x10000
    dd loc_2131b - 0x10000
    dd loc_21381 - 0x10000
    dd loc_213a8 - 0x10000
    dd loc_23607 - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_2158e - 0x10000
    dd loc_21608 - 0x10000
    dd loc_21673 - 0x10000
    dd loc_21d12 - 0x10000
    dd loc_21f87 - 0x10000
    dd loc_1e48f - 0x10000
    dd loc_22030 - 0x10000
    dd loc_22108 - 0x10000
    dd loc_22126 - 0x10000
    dd loc_1e870 - 0x10000
    dd loc_2243d - 0x10000
    dd loc_2246e - 0x10000
    dd loc_2152a - 0x10000
    dd loc_2209a - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_228e2 - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_22950 - 0x10000
    dd loc_22986 - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_22ad1 - 0x10000
    dd loc_22ba2 - 0x10000
    dd loc_22c48 - 0x10000
    dd loc_22cb1 - 0x10000
    dd loc_22d22 - 0x10000
    dd loc_22d7c - 0x10000
    dd loc_22f31 - 0x10000
    dd loc_20597 - 0x10000
    dd loc_205e7 - 0x10000
    dd loc_23020 - 0x10000
    dd loc_2307f - 0x10000
    dd loc_23196 - 0x10000
    dd loc_23226 - 0x10000
    dd loc_22f8e - 0x10000
    dd loc_233b1 - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_22ff5 - 0x10000
    dd loc_2331f - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_23885 - 0x10000
    dd loc_238c4 - 0x10000
    dd loc_23922 - 0x10000
    dd loc_2399f - 0x10000
    dd loc_1fa68 - 0x10000
    dd loc_23a1b - 0x10000
    dd loc_2036f - 0x10000
    dd loc_1f821 - 0x10000
    dd loc_2042c - 0x10000
    dd loc_1f86c - 0x10000
    dd loc_23781 - 0x10000
    dd loc_1e662 - 0x10000
    dd loc_1f8a6 - 0x10000
    dd loc_2044a - 0x10000
    dd loc_1f13f - 0x10000
    dd loc_1f337 - 0x10000
    dd loc_1f466 - 0x10000
    dd loc_1f40c - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_1f603 - 0x10000
    dd loc_1edd4 - 0x10000
    dd loc_21552 - 0x10000
    dd loc_20398 - 0x10000
    dd loc_20404 - 0x10000
    dd loc_1f3bf - 0x10000
    dd loc_203c0 - 0x10000
    dd loc_1f3f7 - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_23a89 - 0x10000
    dd loc_1e770 - 0x10000
    dd loc_1fb10 - 0x10000
    dd loc_1fa9d - 0x10000
    dd loc_20643 - 0x10000
    dd loc_20d3a - 0x10000
    dd loc_20911 - 0x10000
    dd loc_208e9 - 0x10000
    dd loc_207f4 - 0x10000
    dd loc_20871 - 0x10000
    dd loc_1f95a - 0x10000
    dd loc_1f9c8 - 0x10000
    dd loc_22a0a - 0x10000
    dd loc_23b17 - 0x10000
    dd loc_1fb6a - 0x10000
    dd loc_1f903 - 0x10000
    dd loc_1f7b3 - 0x10000
    dd loc_1f772 - 0x10000
    dd loc_1f637 - 0x10000
    dd loc_1f6b5 - 0x10000
    dd loc_21c6a - 0x10000
    dd loc_21c01 - 0x10000
    dd loc_21d83 - 0x10000
    dd loc_21f23 - 0x10000
    dd loc_1ee36 - 0x10000
    dd loc_21dec - 0x10000
    dd loc_21e54 - 0x10000
    dd loc_1eea6 - 0x10000
    dd loc_1ef43 - 0x10000
    dd loc_1ef77 - 0x10000
    dd loc_1efb2 - 0x10000
    dd loc_215b8 - 0x10000
    dd loc_1f92b - 0x10000
    dd loc_215df - 0x10000
    dd loc_1efe7 - 0x10000
    dd loc_1f110 - 0x10000
    dd loc_21ebc - 0x10000
    dd loc_1ef0f - 0x10000

case_dispatch_e360:
    dd loc_1eefc - 0x10000
    dd loc_1eec7 - 0x10000
    dd loc_1eefc - 0x10000
    dd loc_1eedb - 0x10000

case_dispatch_e370:
    dd loc_22143 - 0x10000
    dd loc_22183 - 0x10000
    dd loc_221ee - 0x10000
    dd loc_2222e - 0x10000
    dd loc_2226f - 0x10000
    dd loc_2242a - 0x10000
    dd loc_222af - 0x10000
    dd loc_2237a - 0x10000
    dd loc_2242a - 0x10000
    dd loc_223bb - 0x10000
    dd loc_223fc - 0x10000

case_dispatch_e39c:
    dd loc_222d2 - 0x10000
    dd loc_222fc - 0x10000
    dd loc_22326 - 0x10000
    dd loc_22350 - 0x10000

case_dispatch_e3ac:
    dd loc_233da - 0x10000
    dd loc_23400 - 0x10000
    dd loc_2342a - 0x10000
    dd loc_23453 - 0x10000
    dd loc_23479 - 0x10000
    dd loc_235b8 - 0x10000
    dd loc_234a2 - 0x10000
    dd loc_2354d - 0x10000
    dd loc_235b8 - 0x10000
    dd loc_2356f - 0x10000
    dd loc_23591 - 0x10000

case_dispatch_e3d8:
    dd loc_234c5 - 0x10000
    dd loc_234e6 - 0x10000
    dd loc_23507 - 0x10000
    dd loc_23528 - 0x10000

parse:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x24
    cmp byte [KILL_FLAG], 0
    je short loc_1e403
loc_1e3fc:
    mov al, 1
    jmp near loc_23b20
loc_1e403:
    mov eax, dword [INSTRUCTION_POINTER]
    mov edx, dword [eax]
    sub edx, 2
    cmp edx, strict dword 0x90
    ja near loc_23b17
    jmp dword [cs:nosplit edx*4 + opcode_dispatch - 0x10000]
loc_1e421:
    lea edx, [eax + 4]
    mov dword [INSTRUCTION_POINTER], edx
    call KRAND
    mov edx, eax
    mov eax, dword [INSTRUCTION_POINTER]
    mov ebx, 0xff
    mov ecx, dword [eax]
    mov eax, ebx
    sar edx, 8
    sub eax, ecx
    cmp edx, eax
    setge al
    and eax, ebx
    je short loc_1e45e
    add dword [INSTRUCTION_POINTER], 8
    call parse
    jmp near loc_23b1e
loc_1e45e:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1e48f:
    cmp dword [0xc3368], strict dword 0x400
    jle near loc_1e60c
    mov eax, dword [0xc3364]
    call BADGUY
    test ax, ax
    je short loc_1e4c5
    mov eax, dword [0xc3364]
    cmp byte [eax + 0x14], 0x38
    jbe short loc_1e4c5
    mov esi, 0xc0c
    mov ebx, 0x30
    jmp short loc_1e4cf
loc_1e4c5:
    mov esi, 0x300
    mov ebx, 0x10
loc_1e4cf:
    mov eax, dword [0xc3372]
    lea edx, [ebp - 0x1c]
    sar eax, 0x10
    call 0x296d0
    mov dword [ebp - 0x38], eax
    cmp eax, strict dword 0x40000000
    jne short loc_1e501
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1e501:
    movsx edx, si
    cmp eax, edx
    jle near loc_1e605
    cmp word [ebp - 0x1c], 0
    jl short loc_1e545
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edx, dword [0xc3364]
    mov ax, word [nosplit eax*4 + 0x191376]
    cmp ax, word [edx + 0xe]
    jne short loc_1e545
loc_1e53b:
    xor edi, edi
    mov dword [ebp - 0x38], edi
    jmp near loc_1e613
loc_1e545:
    mov eax, dword [0xc3364]
    add word [eax + 0x1c], bx
    mov eax, dword [0xc3372]
    lea edx, [ebp - 0x1c]
    sar eax, 0x10
    call 0x296d0
    mov ecx, dword [0xc3364]
    mov dword [ebp - 0x38], eax
    sub word [ecx + 0x1c], bx
    movsx eax, si
    cmp eax, dword [ebp - 0x38]
    jge short loc_1e53b
    cmp word [ebp - 0x1c], 0
    jl short loc_1e5a6
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov ax, word [nosplit eax*4 + 0x191376]
    cmp ax, word [ecx + 0xe]
    jne short loc_1e5a6
    xor esi, esi
    mov dword [ebp - 0x38], esi
    jmp near loc_1e613
loc_1e5a6:
    mov eax, dword [0xc3364]
    sub word [eax + 0x1c], bx
    mov eax, dword [0xc3372]
    lea edx, [ebp - 0x1c]
    sar eax, 0x10
    call 0x296d0
    mov edx, dword [0xc3364]
    mov dword [ebp - 0x38], eax
    add word [edx + 0x1c], bx
    cmp dword [ebp - 0x38], strict dword 0x300
    jle short loc_1e605
    cmp word [ebp - 0x1c], 0
    jl short loc_1e60c
    mov ebx, dword [ebp - 0x1e]
    sar ebx, 0x10
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov ax, word [nosplit eax*4 + 0x191376]
    cmp ax, word [edx + 0xe]
    jne short loc_1e60c
    xor ecx, ecx
    mov dword [ebp - 0x38], ecx
    jmp short loc_1e613
loc_1e605:
    xor edx, edx
    mov dword [ebp - 0x38], edx
    jmp short loc_1e613
loc_1e60c:
    mov dword [ebp - 0x38], 1
loc_1e613:
    cmp dword [ebp - 0x38], 0
    je short loc_1e631
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1e631:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1e662:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov eax, dword [nosplit eax*4 + 0x19137e]
    sar eax, 0x10
    push eax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov esi, dword [eax + 0x8c02c]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edi, dword [eax + 0x8c028]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    push esi
    push edi
    mov edx, dword [eax + 0x8c024]
    mov ecx, dword [0xc3364]
    push edx
    mov ecx, dword [ecx + 0x16]
    call KRAND
    and eax, 0x29
    mov ebx, dword [0xc3364]
    shl eax, 8
    mov ebx, dword [ebx + 8]
    mov edx, dword [0xc3364]
    sub ebx, eax
    mov eax, dword [0xc3364]
    sar ecx, 0x10
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    call CAN_SEE
    mov dword [ebp - 0x38], eax
    test eax, eax
    je short loc_1e718
    add dword [INSTRUCTION_POINTER], 8
    jmp short loc_1e735
loc_1e718:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ebx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ebx, 0xa
    jne short loc_1e73a
    lea ecx, [eax + 8]
    mov dword [INSTRUCTION_POINTER], ecx
loc_1e735:
    call parse
loc_1e73a:
    cmp dword [ebp - 0x38], 0
    je near loc_23b1e
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov word [eax + 0x20449], 0x600
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1e770:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov eax, dword [nosplit eax*4 + 0x19137e]
    sar eax, 0x10
    push eax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, dword [eax + 0x8c02c]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ecx, dword [eax + 0x8c028]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    push ebx
    mov edx, dword [0xc3364]
    mov ebx, dword [0xc3364]
    push ecx
    mov ecx, dword [0xc3364]
    mov edx, dword [edx + 4]
    mov ebx, dword [ebx + 8]
    mov ecx, dword [ecx + 0x16]
    mov esi, dword [eax + 0x8c024]
    mov eax, dword [0xc3364]
    push esi
    sar ecx, 0x10
    mov eax, dword [eax]
    call CAN_SEE
    mov dword [ebp - 0x38], eax
    test eax, eax
    je short loc_1e819
    add dword [INSTRUCTION_POINTER], 8
    jmp short loc_1e835
loc_1e819:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edi, 0xa
    jne short loc_1e83a
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
loc_1e835:
    call parse
loc_1e83a:
    cmp dword [ebp - 0x38], 0
    je near loc_23b1e
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov word [eax + 0x20449], 0x600
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1e870:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov eax, dword [eax + 0x20443]
    sar eax, 0x10
    cmp eax, -1
    sete al
    and eax, strict dword 0xff
    je short loc_1e8b5
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1e8b5:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1e8e6:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov ebx, 0x191368
    shl eax, 2
    add ebx, eax
    mov eax, dword [0xc3364]
    mov ax, word [eax + 0x1c]
    and ah, 7
    cwde
    mov edx, dword [0xc3364]
    mov ecx, dword [nosplit eax*2 + 0x1bd566]
    mov edi, dword [edx + 4]
    sar ecx, 0x10
    mov eax, dword [ebx + 4]
    mov edx, ecx
    sub eax, edi
    imul edx, eax
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    sar eax, 0x10
    add eax, strict dword 0x200
    mov ecx, dword [0xc3364]
    and eax, strict dword 0x7ff
    mov edi, dword [ecx]
    mov esi, dword [nosplit eax*2 + 0x1bd566]
    mov eax, dword [ebx]
    sar esi, 0x10
    sub eax, edi
    imul eax, esi
    add eax, edx
    test eax, eax
    jl near loc_1e9fd
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c0a8]
    sar eax, 0x10
    push eax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul esi, eax, strict dword 0x623
    call KRAND
    mov edx, eax
    mov ecx, 0x2000
    sar edx, 0x1f
    idiv ecx
    mov eax, dword [esi + 0x8c050]
    sub eax, edx
    push eax
    mov edx, dword [ebx + 4]
    push edx
    mov ecx, dword [ebx]
    push ecx
    mov ecx, dword [0xc3364]
    mov ecx, dword [ecx + 0x16]
    call KRAND
    mov edx, eax
    mov ebx, 0x3400
    sar edx, 0x1f
    idiv ebx
    mov ebx, dword [0xc3364]
    mov ebx, dword [ebx + 8]
    mov eax, dword [0xc3364]
    sub ebx, edx
    mov edx, dword [0xc3364]
    sar ecx, 0x10
    mov eax, dword [eax]
    mov edx, dword [edx + 4]
    call CAN_SEE
    jmp short loc_1e9ff
loc_1e9fd:
    xor eax, eax
loc_1e9ff:
    mov dword [ebp - 0x38], eax
    cmp dword [ebp - 0x38], 1
    sete al
    and eax, strict dword 0xff
    je short loc_1ea28
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ea28:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ea59:
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call 0x53738
    cmp eax, 1
    sete al
    and eax, strict dword 0xff
    je short loc_1ea8b
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ea8b:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1eabc:
    mov edx, dword [0xc3374]
    mov eax, dword [0xc3372]
    sar edx, 0x10
    sar eax, 0x10
    call 0x24004
    cmp eax, 1
    sete al
    and eax, strict dword 0xff
    je short loc_1eaf7
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1eaf7:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1eb28:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x28]
    sar eax, 0x10
    mov dword [ebp - 0x38], eax
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0xf05
    jne short loc_1eb46
    dec dword [ebp - 0x38]
loc_1eb46:
    cmp dword [ebp - 0x38], 0
    setl al
    and eax, strict dword 0xff
    je short loc_1eb6c
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1eb6c:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1eb9d:
    lea edx, [eax + 4]
    mov eax, dword [0xc3360]
    mov dword [INSTRUCTION_POINTER], edx
    mov edx, dword [edx]
    mov dword [eax + 0x14], edx
    mov eax, edx
    mov edx, dword [0xc3360]
    mov eax, dword [eax]
    mov dword [edx + 0x10], eax
    mov eax, dword [edx + 0x14]
    mov eax, dword [eax + 4]
    mov dword [edx + 4], eax
    mov edx, dword [edx + 0x14]
    mov eax, dword [0xc3364]
    mov dx, word [edx + 8]
    mov word [eax + 0x28], dx
    mov eax, dword [0xc3360]
    mov dword [eax + 0xc], 0
    mov edx, dword [eax + 0xc]
    mov dword [eax + 8], edx
    mov eax, edx
    mov edx, dword [0xc3360]
    mov dword [edx], eax
    mov eax, dword [0xc3364]
    test byte [eax + 0x28], 8
    je short loc_1ec0f
    call KRAND
    mov edx, dword [0xc3364]
    and ah, 7
    mov word [edx + 0x1c], ax
loc_1ec0f:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ec22:
    mov eax, dword [0xc3360]
    mov edx, dword [INSTRUCTION_POINTER]
    mov dword [eax + 8], 0
    add edx, 4
    mov dword [eax + 0xc], 0
    mov dword [INSTRUCTION_POINTER], edx
    mov eax, edx
    mov edx, dword [0xc3360]
    mov ebx, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax]
    add ebx, 4
    mov dword [edx + 0x10], eax
    mov dword [INSTRUCTION_POINTER], ebx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ec6c:
    lea esi, [eax + 4]
    mov dword [INSTRUCTION_POINTER], esi
    call 0x535ec
    test eax, eax
    je short loc_1ecaa
    xor eax, eax
    je short loc_1ec8b
    add dword [INSTRUCTION_POINTER], 8
    jmp short loc_1ece3
loc_1ec8b:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne short loc_1ece8
    lea esi, [eax + 8]
    mov dword [INSTRUCTION_POINTER], esi
    jmp short loc_1ece3
loc_1ecaa:
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3368]
    cmp eax, dword [edx]
    setl al
    and eax, strict dword 0xff
    je short loc_1eccc
    lea ebx, [edx + 8]
    mov dword [INSTRUCTION_POINTER], ebx
    jmp short loc_1ece3
loc_1eccc:
    mov eax, dword [edx + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne short loc_1ece8
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
loc_1ece3:
    call parse
loc_1ece8:
    cmp dword [0xc3368], strict dword 0x4000
    jle near loc_23b1e
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    cmp word [eax + 0x20449], 0
    jne near loc_23b1e
    mov word [eax + 0x20449], 0x600
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ed32:
    lea esi, [eax + 4]
    mov edx, dword [0xc3368]
    mov edi, dword [esi]
    mov dword [INSTRUCTION_POINTER], esi
    cmp edx, edi
    setg al
    and eax, strict dword 0xff
    je short loc_1ed5a
    lea ebx, [esi + 8]
    mov dword [INSTRUCTION_POINTER], ebx
    jmp short loc_1ed71
loc_1ed5a:
    mov eax, dword [esi + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne short loc_1ed76
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
loc_1ed71:
    call parse
loc_1ed76:
    cmp dword [0xc3368], strict dword 0x4000
    jle near loc_23b1e
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    cmp word [eax + 0x20449], 0
    jne near loc_23b1e
    mov word [eax + 0x20449], 0x600
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1edc0:
    mov eax, dword [eax + 4]
    mov dword [INSTRUCTION_POINTER], eax
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1edd4:
    mov ecx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3364]
    mov dx, word [ecx + 4]
    mov si, word [eax + 0x2a]
    add ecx, 4
    add esi, edx
    mov dword [INSTRUCTION_POINTER], ecx
    mov word [eax + 0x2a], si
    lea esi, [ecx + 4]
    mov dword [INSTRUCTION_POINTER], esi
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ee0b:
    lea ebx, [eax + 4]
    mov edx, dword [0xc3364]
    mov dword [INSTRUCTION_POINTER], ebx
    mov ax, word [ebx]
    lea ecx, [ebx + 4]
    mov word [edx + 0x2a], ax
    mov dword [INSTRUCTION_POINTER], ecx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ee36:
    call KRAND
    and eax, 1
    test eax, eax
    jbe short loc_1ee49
    cmp eax, 1
    je short loc_1ee6e
    jmp short loc_1ee93
loc_1ee49:
    mov eax, dword [0xc3364]
    mov dx, word [eax + 0x1c]
    call KRAND
    add dh, 2
    and ah, 1
    add eax, edx
    mov edx, dword [0xc3364]
    and ah, 7
    mov word [edx + 0x1c], ax
    jmp short loc_1ee93
loc_1ee6e:
    mov eax, dword [0xc3364]
    mov dx, word [eax + 0x1c]
    call KRAND
    sub edx, strict dword 0x200
    and ah, 1
    sub edx, eax
    mov eax, dword [0xc3364]
    and dh, 7
    mov word [eax + 0x1c], dx
loc_1ee93:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1eea6:
    mov ax, word [0x93c0]
    inc eax
    mov word [0x93c0], ax
    dec eax
    cmp ax, strict word 3
    ja short loc_1eefc
    and eax, strict dword 0xffff
    jmp dword [cs:nosplit eax*4 + case_dispatch_e360 - 0x10000]
loc_1eec7:
    mov eax, dword [0xc3372]
    mov edx, 0x1400
    sar eax, 0x10
    call SPAWN
    jmp short loc_1eefc
loc_1eedb:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    mov eax, 0x29a
    sar edx, 0x10
    call 0x29410
loc_1eefc:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ef0f:
    call KRAND
    and ah, 7
    mov edx, eax
    mov eax, dword [0xc3364]
    mov word [eax + 0x1c], dx
    mov edx, dword [INSTRUCTION_POINTER]
    add edx, 4
    mov word [eax + 0x20], 0x19
    mov dword [INSTRUCTION_POINTER], edx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ef43:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    mov eax, 0x29b
    sar edx, 0x10
    call 0x29410
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ef77:
    mov cx, word [0x93c2]
    test cx, cx
    je short loc_1ef9f
    mov edx, 0x1c70
    mov esi, ecx
    mov eax, dword [0xc3372]
    dec esi
    sar eax, 0x10
    mov word [0x93c2], si
    call SPAWN
loc_1ef9f:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1efb2:
    mov eax, dword [0xc3364]
    mov ch, byte [eax + 0x11]
    cmp ch, 0x1f
    jne short loc_1efc8
    mov byte [0xc0042], 4
    jmp short loc_1efd4
loc_1efc8:
    cmp ch, 0x20
    jne short loc_1efd4
    mov byte [0xc0042], 6
loc_1efd4:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1efe7:
    cmp word [0x93c4], 0
    jne near loc_1f0cb
    call KRAND
    xor ah, ah
    and al, 3
    inc eax
    cmp ax, strict word 4
    jne short loc_1f029
    mov edx, dword [0xc3372]
    mov eax, 0x106
    sar edx, 0x10
    mov edi, 0x106
    call 0x2c094
    mov word [0x93c4], di
    jmp near loc_1f0fd
loc_1f029:
    cmp ax, strict word 1
    jne short loc_1f061
    mov edx, dword [0xc3372]
    mov eax, 0x110
    sar edx, 0x10
    mov esi, 0x110
    call 0x2c094
    mov word [0x93c4], si
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f061:
    cmp ax, strict word 2
    jne short loc_1f099
    mov edx, dword [0xc3372]
    mov eax, 0x111
    sar edx, 0x10
    mov ecx, 0x111
    call 0x2c094
    mov word [0x93c4], cx
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f099:
    mov edx, dword [0xc3372]
    mov eax, 0x111
    sar edx, 0x10
    mov ebx, 0x111
    call 0x2c094
    mov word [0x93c4], bx
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f0cb:
    mov edx, dword [0x93c2]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    cmp dword [edx + eax*4 + 0xbd9d1], 0
    jne short loc_1f0fd
    xor eax, eax
    mov edx, dword [0xc3372]
    mov ax, word [0x93c4]
    sar edx, 0x10
    call 0x2c094
loc_1f0fd:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f110:
    cmp dword [0xbeeb0], 0
    jne short loc_1f12c
    mov edx, dword [0xc3372]
    mov eax, 0x19b
    sar edx, 0x10
    call 0x2c094
loc_1f12c:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f13f:
    lea ebx, [eax + 4]
    mov ecx, dword [0xbfb4b]
    mov dword [INSTRUCTION_POINTER], ebx
    cmp ecx, 1
    jl near loc_1f306
    cmp dword [0xbffe3], 1
    jle near loc_1f306
    mov edx, dword [ebx]
    test edx, edx
    jne near loc_1f239
    mov dword [ebp - 0x38], edx
    mov eax, edx
    jmp short loc_1f194
loc_1f175:
    lea ebx, [edx + eax]
    mov edx, dword [0xc3364]
    mov bx, word [ebx + 0x8c124]
    cmp bx, word [edx + 0xe]
    je short loc_1f1b3
    lea edi, [esi + 1]
    add eax, 2
    mov dword [ebp - 0x38], edi
loc_1f194:
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov ebx, dword [edx + 0x8c322]
    mov esi, dword [ebp - 0x38]
    sar ebx, 0x10
    cmp ebx, esi
    jg short loc_1f175
loc_1f1b3:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c322]
    mov edx, dword [ebp - 0x38]
    sar eax, 0x10
    cmp eax, edx
    jle short loc_1f1ea
    mov eax, dword [0xc3364]
    mov si, word [0xc3374]
    cmp si, word [eax + 0x1e]
    jne short loc_1f1ea
    mov eax, 1
    jmp short loc_1f1ec
loc_1f1ea:
    xor eax, eax
loc_1f1ec:
    test eax, eax
    je short loc_1f208
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f208:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ebx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ebx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f239:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c324], 0x100
    jge near loc_23b1e
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dx, word [eax + 0x8c324]
    movsx edx, dx
    lea ebx, [nosplit edx*2]
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov si, word [eax + 0x8c324]
    inc esi
    mov ecx, dword [0xc3364]
    mov word [eax + 0x8c324], si
    mov ax, word [ecx + 0xe]
    mov word [edx + ebx + 0x8c124], ax
    mov di, word [0xc3374]
    mov ax, word [ecx + 0x1e]
    cmp ax, di
    sete al
    and eax, strict dword 0xff
    je short loc_1f2d5
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f2d5:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ebx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ebx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f306:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f337:
    mov edx, dword [INSTRUCTION_POINTER]
    add edx, 4
    mov eax, dword [0xc3364]
    mov dword [INSTRUCTION_POINTER], edx
    cmp word [eax + 0xe], 0xf05
    jne short loc_1f36d
    mov eax, dword [eax + 0x20]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [0xc3364]
    mov al, byte [eax + 0x8c384]
    jmp short loc_1f390
loc_1f36d:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, dword [0xc3364]
    mov al, byte [eax + 0x20443]
loc_1f390:
    mov byte [edx + 0x11], al
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    xor ebx, ebx
    mov word [eax + 0x20443], bx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f3bf:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x20]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, dword [INSTRUCTION_POINTER]
    mov edx, 0x8be10
    add ebx, 4
    add eax, edx
    mov dword [INSTRUCTION_POINTER], ebx
    call 0x2a0e4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f3f7:
    lea edi, [eax + 4]
    mov dword [INSTRUCTION_POINTER], edi
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f40c:
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x20]
    sar edx, 0x10
    lea eax, [edx*4]
    mov ebx, dword [INSTRUCTION_POINTER]
    sub eax, edx
    add ebx, 4
    mov ecx, dword [edx + eax*4 + 0xbd9d1]
    mov dword [INSTRUCTION_POINTER], ebx
    test ecx, ecx
    jne near loc_23b1e
    mov edx, dword [0xc3372]
    mov eax, dword [0xc3364]
    sar edx, 0x10
    mov ax, word [eax + 0x22]
    and eax, strict dword 0xffff
    call 0x2c094
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f466:
    lea esi, [eax + 4]
    mov edi, dword [0xbffe3]
    mov dword [INSTRUCTION_POINTER], esi
    cmp edi, 1
    jle short loc_1f4c6
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0xf05
    jne short loc_1f4c6
    mov eax, dword [0xc3396]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c11a], 0
    jne near loc_23b1e
    mov eax, dword [0xc3396]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c11a], 0xe
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f4c6:
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0xf05
    je near loc_23b1e
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c11a], 0
    jne near loc_23b1e
    mov word [eax + 0x8c11a], 0xe
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f508:
    mov eax, dword [0xc3364]
    xor edx, edx
    mov dl, byte [eax + 0x14]
    mov eax, dword [INSTRUCTION_POINTER]
    add eax, 4
    mov dword [INSTRUCTION_POINTER], eax
    mov eax, dword [eax]
    sub eax, edx
    add eax, eax
    mov edx, dword [0xc3364]
    mov ebx, eax
    mov dword [ebp - 0x38], eax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    add byte [edx + 0x14], al
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3364]
    add edx, 4
    mov cx, word [eax + 0xe]
    mov dword [INSTRUCTION_POINTER], edx
    cmp cx, 0xf05
    jne short loc_1f560
    cmp byte [eax + 0x15], 0x24
    jb short loc_1f5ba
loc_1f560:
    mov eax, dword [0xc3364]
    xor ebx, ebx
    mov edx, dword [INSTRUCTION_POINTER]
    mov bl, byte [eax + 0x15]
    cmp ebx, dword [edx]
    jg short loc_1f5ba
    mov eax, dword [eax + 0xc]
    sar eax, 0x10
    mov eax, dword [nosplit eax*2 + 0x1816e6]
    sar eax, 0x10
    add eax, 8
    imul eax, ebx
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea ebx, [eax*4]
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, eax
    mov eax, dword [eax + 0x2044b]
    sub eax, dword [edx + 0x2044f]
    cmp ebx, eax
    jge short loc_1f5f0
loc_1f5ba:
    mov eax, dword [0xc3364]
    xor edx, edx
    mov dl, byte [eax + 0x15]
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax]
    sub eax, edx
    add eax, eax
    mov dword [ebp - 0x38], eax
    test eax, eax
    jns short loc_1f5d8
    neg eax
loc_1f5d8:
    test eax, eax
    je short loc_1f5f0
    mov ebx, dword [ebp - 0x38]
    mov edx, dword [0xc3364]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    add byte [edx + 0x15], al
loc_1f5f0:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f603:
    lea edi, [eax + 4]
    mov edx, dword [0xc3364]
    mov al, byte [edi]
    mov dword [INSTRUCTION_POINTER], edi
    mov byte [edx + 0x14], al
    lea eax, [edi + 4]
    mov dword [INSTRUCTION_POINTER], eax
    mov al, byte [eax]
    mov byte [edx + 0x15], al
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f637:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    mov edi, dword [INSTRUCTION_POINTER]
    sar eax, 0x10
    add edi, 4
    lea edx, [nosplit eax*2]
    mov ax, word [edi]
    mov bx, word [edx + 0xc66d0]
    mov dword [INSTRUCTION_POINTER], edi
    cmp ax, bx
    sete al
    and eax, strict dword 0xff
    je short loc_1f689
    lea ebx, [edi + 8]
    mov dword [INSTRUCTION_POINTER], ebx
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f689:
    mov eax, dword [edi + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f6b5:
    add eax, 4
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    test edx, edx
    jne short loc_1f709
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    sar eax, 0x10
    mov eax, dword [nosplit eax*2 + 0xc67ce]
    mov edx, dword [0xc3368]
    sar eax, 0x10
    cmp eax, edx
    setg al
    and eax, strict dword 0xff
    je short loc_1f6f3
    add dword [INSTRUCTION_POINTER], 8
    jmp short loc_1f75a
loc_1f6f3:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ebx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ebx, 0xa
    jne short loc_1f75f
    jmp short loc_1f752
loc_1f709:
    cmp edx, 1
    jne short loc_1f75f
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    sar eax, 0x10
    mov eax, dword [nosplit eax*2 + 0xc67ce]
    mov ecx, dword [0xc3368]
    sar eax, 0x10
    cmp eax, ecx
    setl al
    and eax, strict dword 0xff
    je short loc_1f73e
    add dword [INSTRUCTION_POINTER], 8
    jmp short loc_1f75a
loc_1f73e:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne short loc_1f75f
loc_1f752:
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
loc_1f75a:
    call parse
loc_1f75f:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f772:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    mov edx, dword [0xc3372]
    sar eax, 0x10
    sar edx, 0x10
    mov ax, word [nosplit eax*2 + 0xc66d0]
    mov ecx, dword [INSTRUCTION_POINTER]
    add ecx, 4
    and eax, strict dword 0xffff
    mov dword [INSTRUCTION_POINTER], ecx
    call 0x51c68
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f7b3:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    sar eax, 0x10
    mov edx, dword [nosplit eax*2 + 0xc66ce]
    sar edx, 0x10
    lea eax, [edx*4]
    mov esi, dword [INSTRUCTION_POINTER]
    sub eax, edx
    add esi, 4
    mov edi, dword [edx + eax*4 + 0xbd9d1]
    mov dword [INSTRUCTION_POINTER], esi
    test edi, edi
    jne near loc_23b1e
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    mov edx, dword [0xc3372]
    sar eax, 0x10
    sar edx, 0x10
    mov ax, word [nosplit eax*2 + 0xc66d0]
    and eax, strict dword 0xffff
    call 0x51c68
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f821:
    add eax, 4
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    lea eax, [edx*4]
    sub eax, edx
    cmp dword [edx + eax*4 + 0xbd9d1], 0
    jne short loc_1f859
    mov edx, dword [0xc3372]
    mov eax, dword [INSTRUCTION_POINTER]
    sar edx, 0x10
    mov ax, word [eax]
    and eax, strict dword 0xffff
    call 0x51c68
loc_1f859:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f86c:
    lea edi, [eax + 4]
    mov edx, dword [edi]
    lea eax, [edx*4]
    sub eax, edx
    mov ebx, dword [edx + eax*4 + 0xbd9d1]
    mov dword [INSTRUCTION_POINTER], edi
    test ebx, ebx
    jle short loc_1f893
    movsx eax, word [edi]
    call 0x2c0fc
loc_1f893:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f8a6:
    lea edx, [eax + 4]
    mov ax, word [0xc3376]
    mov dword [INSTRUCTION_POINTER], edx
    cmp ax, word [0xbf562]
    je short loc_1f8c7
    cmp dword [0xbfb4b], 1
    jne short loc_1f8f0
loc_1f8c7:
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    mov eax, dword [INSTRUCTION_POINTER]
    sar edx, 0x10
    mov ax, word [eax]
    and eax, strict dword 0xffff
    call 0x51c68
loc_1f8f0:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f903:
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3372]
    add edx, 4
    sar eax, 0x10
    mov dword [INSTRUCTION_POINTER], edx
    call 0x593ec
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f92b:
    mov edx, dword [0xcf65c]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    add eax, 4
    mov ebx, 0x96
    mov dword [INSTRUCTION_POINTER], eax
    mov word [edx + 0x8c419], bx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f95a:
    mov esi, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3364]
    add esi, 4
    mov ax, word [eax + 0x2a]
    mov dword [INSTRUCTION_POINTER], esi
    cmp ax, word [esi]
    setg al
    and eax, strict dword 0xff
    je short loc_1f997
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f997:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1f9c8:
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3364]
    add edx, 4
    mov ax, word [eax + 0x2a]
    mov cx, word [edx]
    mov dword [INSTRUCTION_POINTER], edx
    cmp ax, cx
    setl al
    and eax, strict dword 0xff
    je short loc_1fa0a
    lea ecx, [edx + 8]
    mov dword [INSTRUCTION_POINTER], ecx
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fa0a:
    mov eax, dword [edx + 4]
    mov ebx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ebx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fa36:
    mov edx, dword [0xc3372]
    lea ecx, [eax + 4]
    sar edx, 0x10
    mov dword [INSTRUCTION_POINTER], ecx
    mov ax, word [ecx]
    and eax, strict dword 0xffff
    call 0x51c68
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fa68:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edi, dword [INSTRUCTION_POINTER]
    add edi, 4
    mov ecx, 0x1a
    mov dword [INSTRUCTION_POINTER], edi
    mov word [eax + 0x8c0dc], cx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fa9d:
    mov eax, dword [0xc3364]
    cmp byte [eax + 0x13], 1
    jne short loc_1fab4
    mov dword [ebp - 0x38], 1
    inc byte [eax + 0x13]
    jmp short loc_1fab9
loc_1fab4:
    xor eax, eax
    mov dword [ebp - 0x38], eax
loc_1fab9:
    cmp dword [ebp - 0x38], 0
    setg al
    and eax, strict dword 0xff
    je short loc_1fadf
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fadf:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fb10:
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call 0x51864
    test eax, eax
    je short loc_1fb39
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fb39:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fb6a:
    mov ebx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3372]
    add ebx, 4
    sar eax, 0x10
    mov dword [INSTRUCTION_POINTER], ebx
    call 0x578c4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fb92:
    mov eax, dword [0xc3364]
    mov byte [eax + 0x16], 0
    mov byte [eax + 0x17], 0
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [INSTRUCTION_POINTER]
    xor edi, edi
    add edx, 4
    mov bx, word [nosplit eax*8 + 0x20a08a]
    mov dword [INSTRUCTION_POINTER], edx
    cmp bx, 0x321
    jne short loc_1fc15
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0x1f63
    jne near loc_1fed5
    mov eax, dword [0xc3372]
    mov edx, 0x1f64
    sar eax, 0x10
    call SPAWN
    mov eax, dword [0xc3372]
    mov edx, 0x1f64
    sar eax, 0x10
    call SPAWN
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call DELETE_SPRITE
    jmp near loc_1fed5
loc_1fc15:
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08a], 0x322
    jne near loc_1fccb
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0xf05
    je near loc_1fed5
    call BADGUY
    test ax, ax
    je near loc_1fed5
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov eax, dword [eax + 0x2044b]
    mov edx, dword [0xc3364]
    sub eax, strict dword 0x100
    cmp eax, dword [edx + 8]
    jne near loc_1fed5
    mov ebx, 5
    mov edx, 0x5eb
    mov ecx, dword [0xc3374]
    mov eax, dword [0xc3364]
    sar ecx, 0x10
    call 0x2469c
    mov edx, dword [0xc3372]
    mov eax, 0x45
    sar edx, 0x10
    call 0x2c094
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call DELETE_SPRITE
    jmp near loc_1fed5
loc_1fccb:
    mov edx, dword [0xc3364]
    mov edx, dword [edx + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08a], 0x323
    jne short loc_1fd0f
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0x1f64
    jne near loc_1fed5
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call DELETE_SPRITE
    jmp near loc_1fed5
loc_1fd0f:
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08a], 0x320
    jne near loc_1fe45
    mov eax, dword [0xc3364]
    mov cx, word [eax + 0xe]
    cmp cx, 0x28
    jne short loc_1fd5b
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call DELETE_SPRITE
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fd5b:
    cmp cx, 0xf05
    je near loc_1fde1
    call BADGUY
    test ax, ax
    jne short loc_1fd95
    mov eax, dword [0xc3364]
    mov dx, word [eax + 0xe]
    cmp dx, 0x12fd
    je short loc_1fd95
    cmp dx, 0x14c5
    je short loc_1fd95
    cmp dx, 0x10a4
    je short loc_1fd95
    cmp dx, 0x1c70
    jne short loc_1fde1
loc_1fd95:
    mov edx, dword [0xc3364]
    cmp byte [edx + 0x13], 0x80
    jae short loc_1fde1
    mov ebx, dword [0xc3372]
    sar ebx, 0x10
    lea eax, [ebx*8]
    add eax, ebx
    shl eax, 3
    sub eax, ebx
    mov cl, byte [edx + 0x13]
    mov eax, dword [eax + 0x2044b]
    mov word [edx + 0x24], 0x1f40
    inc cl
    mov word [edx + 0x2a], 0
    sub eax, strict dword 0x100
    mov byte [edx + 0x13], cl
    mov edi, 1
    mov dword [edx + 8], eax
    jmp short loc_1fe11
loc_1fde1:
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0xf05
    je short loc_1fe11
    cmp byte [eax + 0x13], 0
    jne near loc_23b1e
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call DELETE_SPRITE
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1fe11:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov ebx, 0x6e4
    mov ecx, 1
    mov word [eax + 0x20439], bx
    mov word [eax + 0x2043d], cx
    jmp near loc_1fed5
loc_1fe45:
    mov edx, dword [0xc3364]
    mov edx, dword [edx + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a080], 0x1e8c
    je short loc_1fe86
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a080], 0x1e58
    jne short loc_1fed5
loc_1fe86:
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0x1400
    je short loc_1fed5
    cmp byte [eax + 0x11], 0x13
    je short loc_1fed5
    call KRAND
    and eax, 3
    cmp eax, 1
    jne short loc_1fed5
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov ebx, 5
    mov edx, 0x6e4
    mov word [eax + 0x2043d], bx
    mov word [eax + 0x20439], dx
loc_1fed5:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x16]
    sar eax, 0x10
    call 0x23f74
    test eax, eax
    je short loc_1feed
    xor ebx, ebx
    jmp short loc_1ff3c
loc_1feed:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x16]
    sar eax, 0x10
    call 0x23f28
    test eax, eax
    jne short loc_1ff21
    mov edx, dword [0xc3364]
    mov edx, dword [edx + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08a], 2
    jne short loc_1ff36
loc_1ff21:
    mov eax, dword [0xbf330]
    mov edx, eax
    mov ebx, 6
    sar edx, 0x1f
    idiv ebx
    mov ebx, eax
    jmp short loc_1ff3c
loc_1ff36:
    mov ebx, dword [0xbf330]
loc_1ff3c:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov ch, byte [eax + 0x20438]
    mov edx, eax
    test ch, ch
    jbe short loc_1ff7d
    mov eax, dword [0xc3364]
    mov ecx, dword [eax + 0x16]
    sar ecx, 0x10
    lea eax, [ecx*4]
    add eax, ecx
    test byte [nosplit eax*8 + 0x20a076], 2
    je short loc_1ffaa
loc_1ff7d:
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call GET_GLOBAL_Z
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov byte [eax + 0x20438], 6
    jmp short loc_1ffb0
loc_1ffaa:
    dec byte [edx + 0x20438]
loc_1ffb0:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, dword [eax + 0x2044b]
    mov eax, dword [0xc3364]
    sub edx, strict dword 0x100
    cmp edx, dword [eax + 8]
    jle short loc_20010
    add word [eax + 0x24], bx
    mov edx, dword [eax + 0x22]
    mov ebx, dword [eax + 8]
    sar edx, 0x10
    add ebx, edx
    mov si, word [eax + 0x24]
    mov dword [eax + 8], ebx
    cmp si, 0x1800
    jle near loc_23b1e
    mov word [eax + 0x24], 0x1800
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20010:
    mov dword [eax + 8], edx
    call BADGUY
    test ax, ax
    jne short loc_20039
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0xf05
    jne near loc_201b9
    cmp word [eax + 0x1e], 0
    jl near loc_201b9
loc_20039:
    mov eax, dword [0xc3364]
    cmp word [eax + 0x24], 0xc0c
    jle near loc_20139
    mov cx, word [eax + 0x2a]
    cmp cx, 1
    jg near loc_20139
    cmp byte [eax + 0x11], 1
    je near loc_200fa
    mov bx, word [eax + 0xe]
    cmp bx, 0x1334
    je near loc_200fa
    cmp bx, 0xf05
    jne short loc_20081
    test cx, cx
    jg near loc_200fa
loc_20081:
    test di, di
    je short loc_200b8
    mov ebx, 5
    mov edx, 0x5eb
    mov ecx, dword [0xc3374]
    mov eax, dword [0xc3364]
    sar ecx, 0x10
    call 0x2469c
    mov edx, dword [0xc3372]
    mov eax, 0x45
    sar edx, 0x10
    call 0x2c094
    jmp short loc_200fa
loc_200b8:
    mov ebx, 0xf
    mov edx, 0x5eb
    mov ecx, dword [0xc3374]
    mov eax, dword [0xc3364]
    sar ecx, 0x10
    call 0x2469c
    mov edx, dword [0xc3372]
    mov eax, 0x45
    sar edx, 0x10
    call 0x2c094
    mov eax, dword [0xc3372]
    mov edx, 0x517
    sar eax, 0x10
    call SPAWN
loc_200fa:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edi, 0x6e4
    mov edx, 1
    mov word [eax + 0x20439], di
    mov word [eax + 0x2043d], dx
    mov eax, dword [0xc3364]
    mov word [eax + 0x24], 0
    jmp near loc_201b9
loc_20139:
    mov edi, dword [0xc3364]
    cmp word [edi + 0x24], 0x800
    jle near loc_201b9
    mov ebx, dword [edi + 0x16]
    sar ebx, 0x10
    lea eax, [ebx*4]
    add eax, ebx
    cmp word [nosplit eax*8 + 0x20a08a], 1
    je short loc_201b9
    push dword 0x10001
    push dword 0x400
    mov dword [ebp - 0x38], ebx
    lea ebx, [edi + 8]
    push dword 0x400
    lea edx, [edi + 4]
    push dword 0x80
    lea ecx, [ebp - 0x38]
    mov eax, edi
    call 0x44c03
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x16]
    mov esi, dword [ebp - 0x38]
    sar eax, 0x10
    cmp eax, esi
    je short loc_201b9
    test esi, esi
    jl short loc_201b9
    cmp esi, strict dword 0x400
    jge short loc_201b9
    mov eax, dword [0xc3372]
    mov edx, esi
    sar eax, 0x10
    call 0x410f9
loc_201b9:
    mov eax, dword [0xc3364]
    mov ebx, dword [eax + 0x16]
    sar ebx, 0x10
    lea edx, [ebx*4]
    add edx, ebx
    cmp word [nosplit edx*8 + 0x20a08a], 1
    jne near loc_20262
    mov dx, word [eax + 0xe]
    cmp dx, 0x1c18
    jb short loc_201fb
    jbe short loc_20224
    cmp dx, 0x1c1f
    jb short loc_2024a
    jbe short loc_20211
    cmp dx, 0x1c41
    je short loc_20237
    jmp short loc_2024a
loc_201fb:
    cmp dx, 0x1334
    jb short loc_2024a
    jbe near loc_23b1e
    cmp dx, 0x176b
    je short loc_2024f
    jmp short loc_2024a
loc_20211:
    add dword [eax + 8], strict dword 0xc00
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20224:
    add dword [eax + 8], strict dword 0x300
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20237:
    add dword [eax + 8], strict dword 0x600
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2024a:
    mov eax, dword [0xc3364]
loc_2024f:
    add dword [eax + 8], strict dword 0x1800
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20262:
    mov word [eax + 0x24], 0
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20274:
    mov esi, dword [INSTRUCTION_POINTER]
    add esi, 4
    mov al, 1
    mov dword [INSTRUCTION_POINTER], esi
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2028f:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [INSTRUCTION_POINTER]
    add edx, 4
    mov dword [INSTRUCTION_POINTER], edx
    mov edx, dword [edx]
    mov edx, dword [eax + edx*2 + 0x8c0ae]
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax]
    sar edx, 0x10
    cmp edx, dword [nosplit eax*4 + 0xbf334]
    jl short loc_202db
    mov byte [KILL_FLAG], 2
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_202db:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, dword [INSTRUCTION_POINTER]
    mov edx, 0x8be10
    mov ebx, dword [ebx + 2]
    add edx, eax
    mov eax, dword [INSTRUCTION_POINTER]
    sar ebx, 0x10
    movsx eax, word [eax]
    call 0x23fc0
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c0d8], 0
    jne short loc_2035c
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul edx, eax, strict dword 0x623
    mov eax, dword [INSTRUCTION_POINTER]
    add edx, dword [eax]
    cmp byte [edx + 0x8c36b], 0
    je short loc_2035c
    movsx edx, word [eax]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, 0x8be10
    add eax, ebx
    call 0x23fd4
loc_2035c:
    add dword [INSTRUCTION_POINTER], 8
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2036f:
    lea esi, [eax + 4]
    mov eax, dword [0xc3364]
    movsx edx, word [esi]
    mov dword [INSTRUCTION_POINTER], esi
    call 0x2451c
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20398:
    lea edi, [eax + 4]
    mov eax, dword [0xc3364]
    mov edx, dword [edi]
    mov dword [INSTRUCTION_POINTER], edi
    call 0x2459c
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_203c0:
    add eax, 4
    mov edx, dword [0xc3372]
    mov dword [INSTRUCTION_POINTER], eax
    sar edx, 0x10
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, eax
    mov ax, word [ebx]
    mov word [edx + 0x20449], ax
    mov edx, ebx
    add edx, 4
    mov dword [INSTRUCTION_POINTER], edx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20404:
    lea ecx, [eax + 4]
    mov eax, dword [0xc3364]
    mov edx, dword [ecx]
    mov dword [INSTRUCTION_POINTER], ecx
    call 0x2461c
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2042c:
    lea esi, [eax + 4]
    mov dword [INSTRUCTION_POINTER], esi
    lea edi, [esi + 4]
    mov dword [INSTRUCTION_POINTER], edi
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2044a:
    lea edi, [eax + 4]
    mov eax, dword [0xc3372]
    movsx edx, word [edi]
    sar eax, 0x10
    mov dword [INSTRUCTION_POINTER], edi
    call 0x19c38
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20476:
    mov ch, 1
    lea edx, [eax + 4]
    mov byte [KILL_FLAG], ch
    mov dword [INSTRUCTION_POINTER], edx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20493:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ecx, dword [INSTRUCTION_POINTER]
    mov esi, dword [ecx + 4]
    add ecx, 4
    add eax, esi
    mov dword [INSTRUCTION_POINTER], ecx
    cmp byte [eax + 0x8c36b], 0
    jne short loc_204e3
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [INSTRUCTION_POINTER]
    mov ebx, 0x8be10
    movsx edx, word [edx]
    add eax, ebx
    call 0x23fd4
    jmp short loc_20525
loc_204e3:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul edx, eax, strict dword 0x623
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax]
    mov edx, dword [edx + eax*2 + 0x8c0ae]
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax]
    sar edx, 0x10
    cmp edx, dword [nosplit eax*4 + 0xbf334]
    jl short loc_20525
    mov byte [KILL_FLAG], 2
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20525:
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov eax, dword [INSTRUCTION_POINTER]
    mov ebx, dword [eax + 2]
    sar ebx, 0x10
    movsx eax, word [eax]
    add edx, strict dword 0x8be10
    call 0x23fc0
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c0d8], 0
    jne short loc_20584
    mov edx, dword [INSTRUCTION_POINTER]
    mov ebx, dword [edx]
    cmp byte [ebx + eax + 0x8c36b], 0
    je short loc_20584
    add eax, strict dword 0x8be10
    movsx edx, word [edx]
    call 0x23fd4
loc_20584:
    add dword [INSTRUCTION_POINTER], 8
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20597:
    mov eax, SOURCE_NAME
    mov ebx, dword [INSTRUCTION_POINTER]
    push eax
    add ebx, 4
    push dword 0x555
    mov dword [INSTRUCTION_POINTER], ebx
    call SET_DEBUG_LOCATION
    mov eax, dword [INSTRUCTION_POINTER]
    mov ecx, dword [eax]
    push ecx
    mov eax, INTEGER_FORMAT
    push eax
    call PRINTF
    mov esi, dword [INSTRUCTION_POINTER]
    add esi, 4
    add esp, 8
    mov dword [INSTRUCTION_POINTER], esi
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_205e7:
    add eax, 4
    mov dword [INSTRUCTION_POINTER], eax
    mov edx, eax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul ebx, eax, strict dword 0x623
    mov ax, word [edx]
    mov word [ebx + 0x8c120], ax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c122], 0xffff
    mov edx, dword [INSTRUCTION_POINTER]
    mov bl, 1
    add edx, 4
    mov byte [0xbf573], bl
    mov dword [INSTRUCTION_POINTER], edx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20643:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edi, dword [INSTRUCTION_POINTER]
    mov dx, word [edi + 4]
    add word [eax + 0x8c3a8], dx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov eax, dword [nosplit eax*4 + 0x191390]
    add edi, 4
    sar eax, 0x10
    mov dword [INSTRUCTION_POINTER], edi
    mov dword [ebp - 0x38], eax
    test eax, eax
    jle short loc_206ab
    mov edx, dword [ebp - 0x38]
    mov eax, dword [edi]
    add edx, eax
    mov dword [ebp - 0x38], edx
loc_206ab:
    mov eax, dword [0xbf378]
    mov ebx, dword [ebp - 0x38]
    add eax, eax
    cmp eax, ebx
    jge short loc_206bc
    mov dword [ebp - 0x38], eax
loc_206bc:
    cmp dword [ebp - 0x38], 0
    jge short loc_206c7
    xor esi, esi
    mov dword [ebp - 0x38], esi
loc_206c7:
    cmp byte [0xbf570], 0
    jne near loc_20764
    mov eax, dword [INSTRUCTION_POINTER]
    mov edi, dword [eax]
    test edi, edi
    jle short loc_2072e
    mov eax, dword [0xbf378]
    mov edx, dword [ebp - 0x38]
    sar eax, 2
    sub edx, edi
    cmp edx, eax
    jge short loc_20716
    cmp eax, dword [ebp - 0x38]
    jg short loc_20716
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    mov eax, 0xe5
    sar edx, 0x10
    call 0x2c094
loc_20716:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul edx, eax, strict dword 0x623
    mov eax, dword [ebp - 0x38]
    mov word [edx + 0x8c0ae], ax
loc_2072e:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    lea edx, [eax*4]
    mov eax, dword [ebp - 0x38]
    mov word [edx + 0x191392], ax
loc_20764:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c3a8], 0x64
    jle short loc_20785
    mov word [eax + 0x8c3a8], 0x64
loc_20785:
    mov ebx, dword [0xc3374]
    sar ebx, 0x10
    imul ebx, ebx, strict dword 0x623
    mov edx, dword [ebx + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    lea edx, [eax*4]
    mov ch, 1
    mov eax, dword [edx + 0x191390]
    mov esi, dword [0xbf378]
    sar eax, 0x10
    mov byte [ebx + 0x8c3b4], ch
    cmp eax, esi
    jl short loc_207e1
    mov ax, word [0xbf378]
    mov word [edx + 0x191392], ax
    mov word [ebx + 0x8c0ae], ax
loc_207e1:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_207f4:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    sar eax, 0x10
    mov ebx, dword [INSTRUCTION_POINTER]
    add eax, strict dword 0x200
    add ebx, 4
    and eax, strict dword 0x7ff
    mov dword [INSTRUCTION_POINTER], ebx
    mov ebx, dword [nosplit eax*2 + 0x1bd566]
    mov eax, dword [0xc3364]
    push dword 0x10001
    mov eax, dword [eax + 0x1a]
    mov ecx, dword [0xc3364]
    sar eax, 0x10
    mov ecx, dword [ecx + 0x22]
    add eax, strict dword 0x400
    sar ecx, 0x10
    and eax, strict dword 0x7ff
    sar ebx, 0x10
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    sar ebx, 0xa
    sar edx, 0x10
    mov eax, dword [0xc3372]
    sar edx, 0xa
    sar eax, 0x10
    call 0x24024
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20871:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    sar eax, 0x10
    sub eax, strict dword 0x200
    push dword 0x10001
    and eax, strict dword 0x7ff
    mov ecx, dword [0xc3364]
    mov edx, dword [INSTRUCTION_POINTER]
    mov ebx, dword [nosplit eax*2 + 0x1bd566]
    mov eax, dword [0xc3364]
    add edx, 4
    mov ecx, dword [ecx + 0x22]
    mov eax, dword [eax + 0x1a]
    sar ecx, 0x10
    sar eax, 0x10
    mov dword [INSTRUCTION_POINTER], edx
    and eax, strict dword 0x7ff
    sar ebx, 0x10
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    sar ebx, 0xa
    sar edx, 0x10
    mov eax, dword [0xc3372]
    sar edx, 0xa
    sar eax, 0x10
    call 0x24024
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_208e9:
    mov ecx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3372]
    add ecx, 4
    sar eax, 0x10
    mov dword [INSTRUCTION_POINTER], ecx
    call 0x574f4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20911:
    mov eax, dword [0xc3364]
    xor edi, edi
    mov esi, dword [INSTRUCTION_POINTER]
    mov dword [ebp - 0x18], edi
    mov eax, dword [eax + 0x16]
    add esi, 4
    sar eax, 0x10
    mov dword [INSTRUCTION_POINTER], esi
    mov dx, word [nosplit eax*2 + 0x21778e]
loc_20938:
    movsx eax, dx
    cmp eax, -1
    je short loc_20976
    mov bx, word [nosplit eax*2 + 0x18af68]
    imul eax, eax, 0x2c
    cmp word [eax + 0x191376], 0x3f
    jne short loc_20972
    mov word [ebp - 0x2c], dx
    mov cx, word [eax + 0x19138e]
    mov dx, word [eax + 0x191390]
    mov dword [ebp - 0x20], ecx
    test dx, dx
    je short loc_20972
    mov dword [ebp - 0x18], edx
loc_20972:
    mov edx, ebx
    jmp short loc_20938
loc_20976:
    mov ax, word [0x217054]
    test ax, ax
    jl near loc_20cd9
loc_20985:
    cwde
    mov dx, word [nosplit eax*2 + 0x18cf68]
    imul eax, eax, 0x2c
    mov edi, 0x191368
    mov ebx, dword [ebp - 0x18]
    mov dword [ebp - 0x24], edx
    add edi, eax
    test bx, bx
    je short loc_209f1
    cmp bx, word [edi + 0x28]
    jne short loc_209f1
    mov eax, dword [edi + 0x16]
    sar eax, 0x10
    mov ecx, 1
    mov ax, word [nosplit eax*2 + 0x21778e]
loc_209bc:
    cwde
    cmp eax, -1
    je short loc_209f1
    imul ebx, eax, 0x2c
    mov si, word [ebx + 0x191376]
    mov dx, word [nosplit eax*2 + 0x18af68]
    cmp si, 0x24
    jne short loc_209ed
    imul eax, eax, 0x47
    mov word [eax + 0x20439], 0x6e4
    mov word [eax + 0x2043d], cx
loc_209ed:
    mov eax, edx
    jmp short loc_209bc
loc_209f1:
    mov eax, dword [ebp - 0x2e]
    sar eax, 0x10
    imul eax, eax, 0x2c
    mov si, word [edi + 0x18]
    cmp si, word [eax + 0x191380]
    je near loc_20ccd
    mov edx, dword [ebp - 0x20]
    cmp dx, word [edi + 0x26]
    jne near loc_20ccd
    mov ax, word [eax + 0x191380]
    mov word [ebp - 0x28], ax
    mov edx, dword [ebp - 0x2a]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov ax, word [edx + 0x20a068]
    mov dx, word [edx + 0x20a06a]
    add edx, eax
    mov dword [ebp - 0x30], edx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov ebx, eax
    mov ecx, dword [ebp - 0x30]
    mov si, word [edx + 0x20a068]
    cmp ax, cx
    jge near loc_20af9
loc_20a5d:
    movsx edx, si
    movsx eax, bx
    shl edx, 5
    shl eax, 5
    mov cx, word [edx + 0x1be578]
    mov word [eax + 0x1be578], cx
    mov cx, word [edx + 0x1be57a]
    mov word [eax + 0x1be57a], cx
    mov cl, byte [edx + 0x1be57c]
    mov byte [eax + 0x1be57c], cl
    mov cl, byte [edx + 0x1be57e]
    mov byte [eax + 0x1be57e], cl
    mov cl, byte [edx + 0x1be57f]
    mov byte [eax + 0x1be57f], cl
    mov cl, byte [edx + 0x1be580]
    mov byte [eax + 0x1be580], cl
    mov dl, byte [edx + 0x1be581]
    mov byte [eax + 0x1be581], dl
    mov edx, dword [eax + 0x1be570]
    sar edx, 0x10
    cmp edx, -1
    je short loc_20aeb
    xor edx, edx
    mov word [eax + 0x1be576], dx
    mov eax, dword [eax + 0x1be570]
    sar eax, 0x10
    shl eax, 5
    mov word [eax + 0x1be576], dx
loc_20aeb:
    mov eax, dword [ebp - 0x30]
    inc ebx
    inc esi
    cmp bx, ax
    jl near loc_20a5d
loc_20af9:
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov eax, dword [ebp - 0x2a]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov edx, dword [edx + 0x20a070]
    mov dword [eax + 0x20a070], edx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov edx, dword [edx + 0x20a06c]
    mov dword [eax + 0x20a06c], edx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dx, word [edx + 0x20a074]
    mov word [eax + 0x20a074], dx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dx, word [edx + 0x20a076]
    mov word [eax + 0x20a076], dx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dx, word [edx + 0x20a078]
    mov word [eax + 0x20a078], dx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dx, word [edx + 0x20a07a]
    mov word [eax + 0x20a07a], dx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dl, byte [edx + 0x20a07c]
    mov byte [eax + 0x20a07c], dl
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dl, byte [edx + 0x20a07d]
    mov byte [eax + 0x20a07d], dl
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dl, byte [edx + 0x20a07e]
    mov byte [eax + 0x20a07e], dl
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dl, byte [edx + 0x20a07f]
    mov byte [eax + 0x20a07f], dl
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dx, word [edx + 0x20a080]
    mov word [eax + 0x20a080], dx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dx, word [edx + 0x20a082]
    mov word [eax + 0x20a082], dx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dl, byte [edx + 0x20a084]
    mov byte [eax + 0x20a084], dl
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dl, byte [edx + 0x20a085]
    mov byte [eax + 0x20a085], dl
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dl, byte [edx + 0x20a086]
    mov byte [eax + 0x20a086], dl
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dl, byte [edx + 0x20a087]
    mov byte [eax + 0x20a087], dl
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dl, byte [edx + 0x20a088]
    mov byte [eax + 0x20a088], dl
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dl, byte [edx + 0x20a089]
    mov byte [eax + 0x20a089], dl
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dx, word [edx + 0x20a08a]
    mov word [eax + 0x20a08a], dx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dx, word [edx + 0x20a08c]
    mov word [eax + 0x20a08c], dx
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    mov dx, word [edx + 0x20a08e]
    mov word [eax + 0x20a08e], dx
loc_20ccd:
    mov eax, dword [ebp - 0x24]
    test ax, ax
    jge near loc_20985
loc_20cd9:
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    mov dx, word [nosplit edx*2 + 0x21778e]
loc_20cec:
    movsx eax, dx
    cmp eax, -1
    je near loc_23b1e
    mov bx, word [nosplit eax*2 + 0x18af68]
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x191376]
    cmp ax, strict word 0x78a
    jb short loc_20d20
    jbe short loc_20d36
    cmp ax, strict word 0xf05
    jb short loc_20d2e
    jbe short loc_20d36
    cmp ax, strict word 0x1500
    jmp short loc_20d2c
loc_20d20:
    cmp ax, strict word 0x24
    jb short loc_20d2e
    jbe short loc_20d36
    cmp ax, strict word 0x3f
loc_20d2c:
    je short loc_20d36
loc_20d2e:
    movsx eax, dx
    call DELETE_SPRITE
loc_20d36:
    mov edx, ebx
    jmp short loc_20cec
loc_20d3a:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edi, dword [INSTRUCTION_POINTER]
    mov dx, word [edi + 4]
    add word [eax + 0x8c3aa], dx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    add edi, 4
    mov cx, word [eax + 0x8c3aa]
    mov dword [INSTRUCTION_POINTER], edi
    cmp cx, 0x64
    jle short loc_20d94
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c3aa], 0x64
loc_20d94:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [INSTRUCTION_POINTER]
    mov dx, word [edx]
    mov di, word [eax + 0x8c3a8]
    sub edi, edx
    mov word [eax + 0x8c3a8], di
    test di, di
    jge short loc_20dc9
    xor ebx, ebx
    mov word [eax + 0x8c3a8], bx
loc_20dc9:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov eax, dword [nosplit eax*4 + 0x191390]
    sar eax, 0x10
    mov dword [ebp - 0x38], eax
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0x15db
    je short loc_20e6b
    mov eax, dword [ebp - 0x38]
    cmp eax, dword [0xbf378]
    jle short loc_20e31
    mov eax, dword [INSTRUCTION_POINTER]
    cmp dword [eax], 0
    jle short loc_20e31
    add eax, 4
    mov dword [INSTRUCTION_POINTER], eax
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20e31:
    mov edi, dword [ebp - 0x38]
    test edi, edi
    jle short loc_20e4f
    mov edx, dword [INSTRUCTION_POINTER]
    mov edx, dword [edx]
    lea eax, [edx*4]
    sub eax, edx
    lea edx, [edi + eax]
    mov dword [ebp - 0x38], edx
loc_20e4f:
    mov eax, dword [ebp - 0x38]
    mov ebx, dword [0xbf378]
    cmp eax, ebx
    jle short loc_20e91
    mov eax, dword [INSTRUCTION_POINTER]
    cmp dword [eax], 0
    jle short loc_20e91
    mov dword [ebp - 0x38], ebx
    jmp short loc_20e91
loc_20e6b:
    cmp dword [ebp - 0x38], 0
    jle short loc_20e80
    mov eax, dword [INSTRUCTION_POINTER]
    mov edx, dword [ebp - 0x38]
    mov eax, dword [eax]
    add edx, eax
    mov dword [ebp - 0x38], edx
loc_20e80:
    mov eax, dword [0xbf378]
    mov ebx, dword [ebp - 0x38]
    add eax, eax
    cmp eax, ebx
    jge short loc_20e91
    mov dword [ebp - 0x38], eax
loc_20e91:
    cmp dword [ebp - 0x38], 0
    jge short loc_20e9c
    xor edi, edi
    mov dword [ebp - 0x38], edi
loc_20e9c:
    cmp byte [0xbf570], 0
    jne near loc_20f3a
    mov eax, dword [INSTRUCTION_POINTER]
    cmp dword [eax], 0
    jle short loc_20f04
    mov edx, dword [ebp - 0x38]
    mov ebx, dword [eax]
    mov eax, dword [0xbf378]
    sub edx, ebx
    sar eax, 2
    cmp edx, eax
    jge short loc_20eec
    cmp eax, dword [ebp - 0x38]
    jg short loc_20eec
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    mov eax, 0xe5
    sar edx, 0x10
    call 0x2c094
loc_20eec:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul edx, eax, strict dword 0x623
    mov eax, dword [ebp - 0x38]
    mov word [edx + 0x8c0ae], ax
loc_20f04:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    lea edx, [eax*4]
    mov eax, dword [ebp - 0x38]
    mov word [edx + 0x191392], ax
loc_20f3a:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20f4d:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov eax, dword [nosplit eax*4 + 0x191390]
    sar eax, 0x10
    mov edx, dword [INSTRUCTION_POINTER]
    mov dword [ebp - 0x38], eax
    mov eax, dword [0xc3364]
    add edx, 4
    mov di, word [eax + 0xe]
    mov dword [INSTRUCTION_POINTER], edx
    cmp di, 0x15db
    je short loc_20ff1
    mov eax, dword [ebp - 0x38]
    cmp eax, dword [0xbf378]
    jle short loc_20fc1
    cmp dword [edx], 0
    jle short loc_20fc1
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_20fc1:
    mov ebx, dword [ebp - 0x38]
    test ebx, ebx
    jle short loc_20fd5
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax]
    lea ecx, [ebx + eax]
    mov dword [ebp - 0x38], ecx
loc_20fd5:
    mov eax, dword [ebp - 0x38]
    mov esi, dword [0xbf378]
    cmp eax, esi
    jle short loc_21011
    mov eax, dword [INSTRUCTION_POINTER]
    cmp dword [eax], 0
    jle short loc_21011
    mov dword [ebp - 0x38], esi
    jmp short loc_21011
loc_20ff1:
    mov ebx, dword [ebp - 0x38]
    test ebx, ebx
    jle short loc_21000
    mov eax, dword [edx]
    lea ecx, [ebx + eax]
    mov dword [ebp - 0x38], ecx
loc_21000:
    mov eax, dword [0xbf378]
    mov esi, dword [ebp - 0x38]
    add eax, eax
    cmp eax, esi
    jge short loc_21011
    mov dword [ebp - 0x38], eax
loc_21011:
    cmp dword [ebp - 0x38], 0
    jge short loc_2101c
    xor edx, edx
    mov dword [ebp - 0x38], edx
loc_2101c:
    cmp byte [0xbf570], 0
    jne near loc_210bb
    mov eax, dword [INSTRUCTION_POINTER]
    mov ebx, dword [eax]
    test ebx, ebx
    jle short loc_21085
    mov eax, dword [0xbf378]
    mov edx, dword [ebp - 0x38]
    sar eax, 2
    sub edx, ebx
    cmp edx, eax
    jge short loc_2106c
    cmp eax, dword [ebp - 0x38]
    jg short loc_2106c
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov edx, dword [edx + 0x8c106]
    mov eax, 0xe5
    sar edx, 0x10
    call 0x2c094
loc_2106c:
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov eax, dword [ebp - 0x38]
    mov word [edx + 0x8c0ae], ax
loc_21085:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    lea edx, [eax*4]
    mov eax, dword [ebp - 0x38]
    mov word [edx + 0x191392], ax
loc_210bb:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_210ce:
    lea edx, [eax + 8]
    mov eax, dword [eax + 4]
    mov dword [INSTRUCTION_POINTER], eax
loc_210d9:
    call parse
    test al, al
    je short loc_210d9
    mov dword [INSTRUCTION_POINTER], edx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_210f4:
    lea edi, [eax + 4]
    mov dword [INSTRUCTION_POINTER], edi
loc_210fd:
    call parse
    test al, al
    jne near loc_23b1e
    jmp short loc_210fd
loc_2110c:
    mov edi, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3360]
    add edi, 4
    mov dword [eax], 0
    mov edx, dword [edi]
    mov dword [INSTRUCTION_POINTER], edi
    mov dword [eax + 4], edx
    lea eax, [edi + 4]
    mov edx, dword [0xc3364]
    mov dword [INSTRUCTION_POINTER], eax
    mov ax, word [eax]
    mov word [edx + 0x28], ax
    mov eax, edx
    mov edx, dword [INSTRUCTION_POINTER]
    add edx, 4
    mov ch, byte [eax + 0x28]
    mov dword [INSTRUCTION_POINTER], edx
    test ch, 8
    je near loc_23b1e
    call KRAND
    mov edx, dword [0xc3364]
    and ah, 7
    mov word [edx + 0x1c], ax
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2117b:
    mov ebx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3364]
    add ebx, 4
    mov dx, word [eax + 0x18]
    mov dword [INSTRUCTION_POINTER], ebx
    test dx, dx
    jl short loc_211af
    cmp dx, 0x400
    jge short loc_211af
    mov eax, dword [0xc3372]
    movsx edx, word [ebx]
    sar eax, 0x10
    call SPAWN
loc_211af:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_211c2:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    mov edi, dword [INSTRUCTION_POINTER]
    sub eax, edx
    add edi, 4
    mov edx, dword [eax + 0x20437]
    mov ebx, dword [edi]
    sar edx, 0x10
    mov dword [INSTRUCTION_POINTER], edi
    cmp edx, ebx
    sete al
    and eax, strict dword 0xff
    je short loc_21219
    lea esi, [edi + 8]
    mov dword [INSTRUCTION_POINTER], esi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21219:
    mov eax, dword [edi + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21245:
    mov ebx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3360]
    add ebx, 4
    mov eax, dword [eax + 0x14]
    mov ecx, dword [ebx]
    mov dword [INSTRUCTION_POINTER], ebx
    cmp eax, ecx
    sete al
    and eax, strict dword 0xff
    je short loc_21284
    lea edi, [ebx + 8]
    mov dword [INSTRUCTION_POINTER], edi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21284:
    mov eax, dword [ebx + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_212b0:
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3360]
    add edx, 4
    mov eax, dword [eax + 0x10]
    mov ebx, dword [edx]
    mov dword [INSTRUCTION_POINTER], edx
    cmp eax, ebx
    sete al
    and eax, strict dword 0xff
    je short loc_212ef
    lea esi, [edx + 8]
    mov dword [INSTRUCTION_POINTER], esi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_212ef:
    mov eax, dword [edx + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2131b:
    mov edx, dword [0xc3360]
    lea ebx, [eax + 4]
    mov edx, dword [edx + 8]
    mov ecx, dword [ebx]
    mov dword [INSTRUCTION_POINTER], ebx
    cmp edx, ecx
    setge al
    and eax, strict dword 0xff
    je short loc_21355
    lea edi, [ebx + 8]
    mov dword [INSTRUCTION_POINTER], edi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21355:
    mov eax, dword [ebx + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21381:
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3360]
    add edx, 4
    mov dword [eax + 8], 0
    mov dword [INSTRUCTION_POINTER], edx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_213a8:
    lea esi, [eax + 4]
    mov dword [INSTRUCTION_POINTER], esi
    mov eax, dword [0xc3364]
    mov edi, dword [INSTRUCTION_POINTER]
    mov si, word [esi]
    add edi, 4
    mov cx, word [eax + 0x18]
    mov dword [INSTRUCTION_POINTER], edi
    test cx, cx
    jl near loc_21517
    cmp cx, 0x400
    jge near loc_21517
    mov eax, dword [edi]
    dec eax
    mov dword [ebp - 0x38], eax
    test eax, eax
    jl near loc_21517
loc_213ee:
    cmp si, 0x645
    jne short loc_213f9
    xor ebx, ebx
    jmp short loc_2140c
loc_213f9:
    call KRAND
    mov edx, eax
    mov ebx, 3
    sar edx, 0x1f
    idiv ebx
    mov ebx, edx
loc_2140c:
    mov eax, dword [0xc3372]
    push byte 5
    sar eax, 0x10
    push eax
    call KRAND
    and eax, strict dword 0x7ff
    neg eax
    push eax
    call KRAND
    xor ah, ah
    and al, 0x7f
    add eax, strict dword 0x20
    cwde
    push eax
    call KRAND
    and ah, 7
    cwde
    push eax
    call KRAND
    and al, 0xf
    add al, 0x20
    movsx eax, al
    push eax
    call KRAND
    and al, 0xf
    add al, 0x20
    movsx eax, al
    push eax
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0xd]
    sar edx, 0x18
    add ebx, esi
    push edx
    movsx edx, bx
    mov ecx, dword [eax + 8]
    push edx
    sub ecx, strict dword 0x800
    call KRAND
    and eax, strict dword 0x1fff
    sub ecx, eax
    call KRAND
    mov edx, dword [0xc3364]
    and eax, strict dword 0xff
    mov ebx, dword [edx + 4]
    add ebx, eax
    call KRAND
    mov edx, eax
    mov eax, dword [0xc3364]
    sub ebx, strict dword 0x80
    and edx, strict dword 0xff
    mov edi, dword [eax]
    mov eax, dword [eax + 0x16]
    add edx, edi
    sar eax, 0x10
    sub edx, strict dword 0x80
    call EGS
    movsx ebx, ax
    imul ecx, ebx, 0x2c
    cmp si, 0x645
    jne short loc_214ee
    mov eax, dword [ebp - 0x38]
    mov edx, eax
    mov edi, 0xe
    sar edx, 0x1f
    idiv edi
    mov ax, word [nosplit edx*2 + 0x937c]
    mov word [ecx + 0x19138a], ax
    jmp short loc_214f7
loc_214ee:
    mov word [ecx + 0x19138a], 0xffff
loc_214f7:
    imul ebx, ebx, 0x2c
    mov edx, dword [ebp - 0x38]
    mov eax, dword [0xc3364]
    dec edx
    mov al, byte [eax + 0x11]
    mov dword [ebp - 0x38], edx
    mov byte [ebx + 0x191379], al
    test edx, edx
    jge near loc_213ee
loc_21517:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2152a:
    lea edi, [eax + 4]
    mov edx, dword [0xc3360]
    movsx eax, word [edi]
    mov dword [INSTRUCTION_POINTER], edi
    mov dword [edx], eax
    lea eax, [edi + 4]
    mov dword [INSTRUCTION_POINTER], eax
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21552:
    mov edx, dword [INSTRUCTION_POINTER]
    add edx, 4
    mov eax, dword [0xc3364]
    mov dword [INSTRUCTION_POINTER], edx
    mov cx, word [eax + 0xc]
    mov ebx, dword [INSTRUCTION_POINTER]
    mov dx, word [edx]
    add ebx, 4
    or ecx, edx
    mov dword [INSTRUCTION_POINTER], ebx
    mov word [eax + 0xc], cx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2158e:
    lea edi, [eax + 4]
    mov edx, dword [0xc3364]
    mov ax, word [edi]
    mov dword [INSTRUCTION_POINTER], edi
    mov word [edx + 0xc], ax
    lea eax, [edi + 4]
    mov dword [INSTRUCTION_POINTER], eax
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_215b8:
    add eax, 4
    mov edx, dword [0xc3364]
    mov bl, byte [eax]
    mov dword [INSTRUCTION_POINTER], eax
    add eax, 4
    mov byte [edx + 0x12], bl
    mov dword [INSTRUCTION_POINTER], eax
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_215df:
    add eax, 4
    mov ebx, dword [0xc3364]
    mov dx, word [eax]
    mov dword [INSTRUCTION_POINTER], eax
    add eax, 4
    mov word [ebx + 0xe], dx
    mov dword [INSTRUCTION_POINTER], eax
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21608:
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3360]
    add edx, 4
    mov eax, dword [eax + 4]
    mov ebx, dword [edx]
    mov dword [INSTRUCTION_POINTER], edx
    cmp eax, ebx
    sete al
    and eax, strict dword 0xff
    je short loc_21647
    lea esi, [edx + 8]
    mov dword [INSTRUCTION_POINTER], esi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21647:
    mov eax, dword [edx + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21673:
    lea ecx, [eax + 4]
    mov esi, dword [0xbffe3]
    mov dword [INSTRUCTION_POINTER], ecx
    cmp esi, 2
    jge short loc_216e5
    cmp word [0x9998], 0
    jl short loc_216c4
    cmp dword [0xbffab], 2
    je short loc_216c4
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dh, 1
    xor bl, bl
    mov byte [eax + 0x8c34c], dh
    mov byte [0x21ec09], bl
    mov eax, 0x3a98
    call 0x25758
    jmp short loc_216d9
loc_216c4:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c34c], 0x20
loc_216d9:
    mov byte [KILL_FLAG], 2
    jmp near loc_21bdd
loc_216e5:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    call 0x2c980
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [edx + 0x8c024]
    mov dword [eax + 0x8c048], edx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, edx
    mov dword [eax + 0x8c040], edx
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov dword [eax + 0x2045b], ebx
    mov eax, dword [0xc3364]
    mov edx, ebx
    mov dword [eax], edx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul edx, eax, strict dword 0x623
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [edx + 0x8c028]
    mov dword [eax + 0x8c04c], edx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, edx
    mov dword [eax + 0x8c044], edx
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov dword [eax + 0x2045f], ebx
    mov eax, dword [0xc3364]
    mov edx, ebx
    mov dword [eax + 4], edx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul edx, eax, strict dword 0x623
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [edx + 0x8c02c]
    mov ebx, edx
    mov dword [eax + 0x8c050], edx
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov dword [eax + 0x2045f], ebx
    mov eax, dword [0xc3364]
    mov edx, ebx
    mov dword [eax + 8], edx
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov eax, 0x8be10
    add eax, edx
    lea ebx, [eax + 0x29a]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c028]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c024]
    call 0x4500f
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ecx, dword [eax + 0x8c02c]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, dword [0xc3374]
    sar ebx, 0x10
    imul ebx, ebx, strict dword 0x623
    mov edx, dword [eax + 0x8c024]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, dword [ebx + 0x8c028]
    mov eax, dword [eax + 0x8c106]
    add ecx, strict dword 0x2800
    sar eax, 0x10
    call SET_SPRITE
    mov eax, dword [0xc3364]
    mov dx, word [0xc3374]
    mov word [eax + 0x1e], dx
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov word [eax + 0xc], 0x101
    mov byte [eax + 0x10], 0xf4
    mov byte [eax + 0x12], 0x20
    mov byte [eax + 0x14], 0x18
    mov byte [eax + 0x15], 0x11
    mov byte [eax + 0x16], 0
    mov dl, byte [edx + 0x8c384]
    mov byte [eax + 0x11], dl
    mov dx, word [0xbf378]
    mov word [eax + 0x2a], dx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c0ae], dx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c0e0], 0xffff
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dword [eax + 0x8c030], 0x64
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c106], 0xffff
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dx, word [0xc3376]
    mov word [eax + 0x8c33c], dx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor ebx, ebx
    mov word [eax + 0x8c0de], bx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor edx, edx
    mov dword [eax + 0x8c058], edx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c0d2], 0xffff
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dx, word [0xbf32c]
    mov word [eax + 0x8c334], dx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c32a], bx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor ebx, ebx
    mov dword [eax + 0x8c084], ebx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor bh, bh
    mov byte [eax + 0x8c34e], bh
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor edi, edi
    mov word [eax + 0x8c324], di
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c0f4], di
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor bl, bl
    mov word [eax + 0x8c0f6], bx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor ecx, ecx
    mov dword [eax + 0x8c060], ecx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dword [eax + 0x8c05c], ecx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [0xc3372]
    xor cl, cl
    sar edx, 0x10
    mov byte [eax + 0x8c369], cl
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, dword [0xc3372]
    mov ecx, 0xffffffff
    sar edx, 0x10
    mov word [eax + 0x2043d], cx
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov dx, word [0xc3374]
    mov word [eax + 0x2043f], dx
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, dword [0xc3372]
    xor ch, ch
    sar edx, 0x10
    mov byte [eax + 0x20438], ch
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, dword [0xc3372]
    sar edx, 0x10
    mov word [eax + 0x20441], di
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, dword [0xc3372]
    sar edx, 0x10
    mov word [eax + 0x20443], di
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov word [eax + 0x20445], 0xffff
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov word [eax + 0x20447], bx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul ebx, eax, strict dword 0x623
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov dx, word [ebx + 0x8c108]
    mov word [eax + 0x2043f], dx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    call 0x2d098
    mov eax, dword [0xc3374]
    sar eax, 0x10
    xor esi, esi
    call 0x2cfa4
    mov dword [0x9524], esi
    mov eax, dword [0x216f7c]
    mov dword [0x9528], eax
loc_21bdd:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    add eax, strict dword 0x8be10
    call 0x29540
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21c01:
    cmp dword [0xbfb4b], 0
    jne short loc_21c14
    cmp word [0xcf65c], 2
    jle short loc_21c1b
loc_21c14:
    mov eax, 1
    jmp short loc_21c1d
loc_21c1b:
    xor eax, eax
loc_21c1d:
    test eax, eax
    je short loc_21c39
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21c39:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21c6a:
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add edx, eax
    mov eax, dword [0xc3364]
    shl edx, 3
    mov eax, dword [eax + 8]
    sub eax, dword [edx + 0x20a070]
    test eax, eax
    jns short loc_21c95
    neg eax
loc_21c95:
    cmp eax, strict dword 0x2000
    jge short loc_21cc3
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a080], 0xc01
    jne short loc_21cc3
    mov eax, 1
    jmp short loc_21cc5
loc_21cc3:
    xor eax, eax
loc_21cc5:
    test eax, eax
    je short loc_21ce1
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21ce1:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21d12:
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08c], 0x7d3
    sete al
    and eax, strict dword 0xff
    je short loc_21d52
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21d52:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21d83:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c3cd], 0x3c
    setg al
    and eax, strict dword 0xff
    je short loc_21dbb
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21dbb:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21dec:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp dword [eax + 0x8c3bd], 1
    sete al
    and eax, strict dword 0xff
    je short loc_21e23
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21e23:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21e54:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp dword [eax + 0x8c3e1], 1
    sete al
    and eax, strict dword 0xff
    je short loc_21e8b
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21e8b:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21ebc:
    mov edx, dword [0xc3364]
    dec byte [edx + 0x14]
    mov bh, byte [edx + 0x15]
    dec bh
    mov cl, byte [edx + 0x14]
    mov byte [edx + 0x15], bh
    cmp cl, 5
    setbe dl
    and edx, strict dword 0xff
    je short loc_21ef7
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21ef7:
    mov eax, dword [eax + 4]
    mov ebx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ebx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21f23:
    mov edx, dword [0xc3374]
    mov eax, dword [0xc3372]
    sar edx, 0x10
    sar eax, 0x10
    call 0x5744c
    test eax, eax
    je short loc_21f55
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21f55:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    lea ebx, [eax + 8]
    mov dword [INSTRUCTION_POINTER], ebx
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21f87:
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08c], 0x7d3
    jne short loc_21fe1
    mov edx, dword [0xc3364]
    mov edx, dword [edx + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add edx, eax
    mov eax, dword [0xc3364]
    shl edx, 3
    mov eax, dword [eax + 8]
    sub eax, dword [edx + 0x20a070]
    test eax, eax
    jns short loc_21fd3
    neg eax
loc_21fd3:
    cmp eax, strict dword 0x2000
    jge short loc_21fe1
    mov eax, 1
    jmp short loc_21fe3
loc_21fe1:
    xor eax, eax
loc_21fe3:
    test eax, eax
    je short loc_21fff
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_21fff:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22030:
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3360]
    add edx, 4
    mov eax, dword [eax]
    mov ebx, dword [edx]
    mov dword [INSTRUCTION_POINTER], edx
    cmp eax, ebx
    setge al
    and eax, strict dword 0xff
    je short loc_2206e
    lea esi, [edx + 8]
    mov dword [INSTRUCTION_POINTER], esi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2206e:
    mov eax, dword [edx + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2209a:
    mov edi, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3364]
    add edi, 4
    mov eax, dword [eax + 0xc]
    mov ebx, dword [edi]
    sar eax, 0x10
    mov dword [INSTRUCTION_POINTER], edi
    cmp eax, ebx
    sete al
    and eax, strict dword 0xff
    je short loc_220dc
    lea esi, [edi + 8]
    mov dword [INSTRUCTION_POINTER], esi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_220dc:
    mov eax, dword [edi + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22108:
    mov eax, dword [0xc3360]
    mov dword [eax], 0
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22126:
    lea ecx, [eax + 8]
    mov eax, dword [ecx - 4]
    mov dword [INSTRUCTION_POINTER], ecx
    cmp eax, 0xa
    ja near loc_2242a
    jmp dword [cs:nosplit eax*4 + case_dispatch_e370 - 0x10000]
loc_22143:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul ebx, eax, strict dword 0x623
    mov ax, word [ecx]
    mov word [ebx + 0x8c332], ax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c360], 2
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22183:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dx, word [ecx]
    add word [eax + 0x8c334], dx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c332]
    mov esi, dword [0xbf378]
    sar eax, 0x10
    cmp eax, esi
    jle near loc_2242a
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul edx, eax, strict dword 0x623
    mov ax, word [0xbf378]
    mov word [edx + 0x8c334], ax
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_221ee:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul ebx, eax, strict dword 0x623
    mov ax, word [ecx]
    mov word [ebx + 0x8c32e], ax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c360], 6
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2222e:
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov ax, word [ecx]
    mov word [edx + 0x8c0e2], ax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c360], 3
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2226f:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dx, word [ecx]
    mov word [eax + 0x8c330], dx
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c360], 4
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_222af:
    mov eax, dword [0xc3364]
    mov ax, word [eax + 0x26]
    sub eax, 0x64
    cmp ax, strict word 3
    ja near loc_2242a
    and eax, strict dword 0xffff
    jmp dword [cs:nosplit eax*4 + case_dispatch_e39c - 0x10000]
loc_222d2:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c392], 1
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_222fc:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c394], 1
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22326:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c396], 1
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22350:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c398], 1
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2237a:
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov ax, word [ecx]
    mov word [edx + 0x8c11c], ax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c360], 5
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_223bb:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov byte [eax + 0x8c360], 1
    mov ax, word [ecx]
    mov word [edx + 0x8c102], ax
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_223fc:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c360], 7
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov ax, word [ecx]
    mov word [edx + 0x8c346], ax
loc_2242a:
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2243d:
    mov ecx, dword [eax + 0x14]
    mov esi, dword [eax + 0x10]
    mov ebx, dword [eax + 8]
    mov edx, dword [eax + 4]
    push ecx
    mov ecx, dword [eax + 0xc]
    mov eax, dword [0xc3372]
    push esi
    sar eax, 0x10
    call 0x24010
    add dword [INSTRUCTION_POINTER], 0x18
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2246e:
    lea edx, [eax + 4]
    xor ebx, ebx
    mov ecx, dword [edx]
    mov dword [ebp - 0x38], ebx
    mov ebx, dword [0xc3364]
    mov ebx, dword [ebx + 0x1e]
    mov dword [INSTRUCTION_POINTER], edx
    sar ebx, 0x10
    test cl, 8
    je short loc_224ce
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp byte [eax + 0x8c352], 0
    je short loc_224ce
    mov edx, dword [0xc3374]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    test byte [nosplit eax*2 + 0xb8bf6], 2
    je short loc_224ce
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_224ce:
    test cl, 0x10
    je short loc_2250c
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c0ec], 0
    jne short loc_2250c
    cmp byte [eax + 0x8c352], 0
    jne short loc_2250c
    cmp dword [eax + 0x8c064], strict dword 0x800
    jle short loc_2250c
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_2250c:
    test cl, 0x20
    je short loc_22536
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c0ec], 0x15c
    jle short loc_22536
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_22536:
    test cl, 1
    je short loc_22550
    test ebx, ebx
    jl short loc_22550
    cmp ebx, 8
    jge short loc_22550
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_22550:
    test cl, 2
    je short loc_22582
    cmp ebx, 8
    jl short loc_22582
    mov edx, dword [0xc3374]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    test byte [nosplit eax*2 + 0xb8bf6], 0x20
    jne short loc_22582
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_22582:
    test cl, 4
    je short loc_225b4
    cmp ebx, 8
    jl short loc_225b4
    mov edx, dword [0xc3374]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    test byte [nosplit eax*2 + 0xb8bf6], 0x20
    je short loc_225b4
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_225b4:
    test cl, 0x40
    je short loc_225ea
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [0xc3364]
    mov edx, dword [edx + 8]
    sub edx, strict dword 0x3000
    cmp edx, dword [eax + 0x8c02c]
    jle short loc_225ea
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_225ea:
    test cl, 0x80
    je short loc_2261c
    cmp ebx, -8
    jg short loc_2261c
    mov edx, dword [0xc3374]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    test byte [nosplit eax*2 + 0xb8bf6], 0x20
    jne short loc_2261c
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_2261c:
    test ch, 1
    je short loc_2264e
    cmp ebx, -8
    jg short loc_2264e
    mov edx, dword [0xc3374]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    test byte [nosplit eax*2 + 0xb8bf6], 0x20
    je short loc_2264e
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_2264e:
    test ch, 2
    je short loc_22676
    mov edx, dword [0xc3374]
    mov eax, dword [0xc3364]
    sar edx, 0x10
    call 0x521d8
    test eax, eax
    je short loc_22676
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_22676:
    test ch, 4
    je short loc_226a7
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp dword [eax + 0x8c41f], 0
    je short loc_226a7
    call 0x535ec
    test eax, eax
    jne short loc_226a7
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_226a7:
    test ch, 8
    je short loc_226cf
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp byte [eax + 0x8c362], 0
    je short loc_226cf
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_226cf:
    test ch, 0x10
    je short loc_226f7
    mov edx, dword [0xc3374]
    mov eax, dword [0xc3364]
    sar edx, 0x10
    call 0x51cac
    test eax, eax
    je short loc_226f7
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_226f7:
    test ch, 0x20
    je short loc_2271f
    mov edx, dword [0xc3374]
    mov eax, dword [0xc3364]
    sar edx, 0x10
    call 0x51bcc
    test eax, eax
    je short loc_2271f
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_2271f:
    test ch, 0x40
    je short loc_22776
    mov ebx, dword [0xc3374]
    sar ebx, 0x10
    imul ebx, ebx, strict dword 0x623
    mov edx, dword [ebx + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    cmp byte [eax + 0x19137c], 8
    jbe short loc_22776
    cmp word [eax + 0x191392], 0
    jle short loc_22776
    cmp word [ebx + 0x8c120], 0
    jne short loc_22776
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_22776:
    test ch, 0x80
    je short loc_227b8
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov edx, dword [edx + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    cmp word [nosplit eax*4 + 0x191392], 0
    jg short loc_227b8
    mov dword [ebp - 0x38], 1
    jmp near loc_22893
loc_227b8:
    test ecx, 0x10000
    je near loc_22893
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0xf05
    jne short loc_22823
    cmp dword [0xbffe3], 1
    jle short loc_22823
    mov ebx, dword [0xc3374]
    sar ebx, 0x10
    imul ebx, ebx, strict dword 0x623
    mov ecx, dword [0xc3396]
    sar ecx, 0x10
    imul ecx, ecx, strict dword 0x623
    mov eax, dword [ebx + 0x8c028]
    mov edx, dword [ecx + 0x8c028]
    sub eax, edx
    mov edx, eax
    mov eax, dword [ebx + 0x8c024]
    sub eax, dword [ecx + 0x8c024]
    call GET_ANGLE
    movsx edx, ax
    mov eax, dword [0xc3396]
    jmp short loc_2285a
loc_22823:
    mov ebx, dword [0xc3374]
    sar ebx, 0x10
    imul ebx, ebx, strict dword 0x623
    mov ecx, dword [0xc3364]
    mov edx, dword [ecx + 4]
    mov eax, dword [ecx]
    mov esi, dword [ebx + 0x8c028]
    mov edi, dword [ebx + 0x8c024]
    sub edx, esi
    sub eax, edi
    call GET_ANGLE
    movsx edx, ax
    mov eax, dword [0xc3374]
loc_2285a:
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c0a2]
    sar eax, 0x10
    call GET_INC_ANGLE
    cwde
    mov dword [ebp - 0x38], eax
    mov ecx, dword [ebp - 0x38]
    cmp ecx, -0x80
    jle short loc_2288e
    cmp ecx, strict dword 0x80
    jge short loc_2288e
    mov dword [ebp - 0x38], 1
    jmp short loc_22893
loc_2288e:
    xor edi, edi
    mov dword [ebp - 0x38], edi
loc_22893:
    cmp dword [ebp - 0x38], 0
    je short loc_228b1
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_228b1:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_228e2:
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3364]
    add edx, 4
    mov eax, dword [eax + 0x28]
    mov ebx, dword [edx]
    sar eax, 0x10
    mov dword [INSTRUCTION_POINTER], edx
    cmp eax, ebx
    setle al
    and eax, strict dword 0xff
    je short loc_22924
    lea esi, [edx + 8]
    mov dword [INSTRUCTION_POINTER], esi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22924:
    mov eax, dword [edx + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22950:
    lea edi, [eax + 8]
    mov ecx, dword [0xc3374]
    mov eax, dword [0xc3364]
    sar ecx, 0x10
    movsx ebx, word [edi]
    movsx edx, word [edi - 4]
    mov dword [INSTRUCTION_POINTER], edi
    call 0x2469c
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22986:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, dword [eax + 0x20437]
    mov eax, dword [INSTRUCTION_POINTER]
    add eax, 4
    sar edx, 0x10
    mov ebx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, ebx
    sete al
    and eax, strict dword 0xff
    je short loc_229d9
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_229d9:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22a0a:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ecx, dword [INSTRUCTION_POINTER]
    mov edx, 0x8be10
    add ecx, 4
    add eax, edx
    mov dword [INSTRUCTION_POINTER], ecx
    call 0x2958c
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [edx + 0x8c0a2]
    sar edx, 0x10
    add edx, strict dword 0x200
    and edx, strict dword 0x7ff
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    mov esi, dword [eax + 0x8c05c]
    shl edx, 7
    sub esi, edx
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov dword [eax + 0x8c05c], esi
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dx, word [edx + 0x8c0a4]
    and dh, 7
    movsx edx, dx
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    mov edi, dword [eax + 0x8c060]
    shl edx, 7
    sub edi, edx
    mov dword [eax + 0x8c060], edi
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22ad1:
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [edx + 0x8c0a2]
    sar edx, 0x10
    add edx, strict dword 0x200
    and edx, strict dword 0x7ff
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    mov esi, dword [eax + 0x8c05c]
    shl edx, 0xa
    sub esi, edx
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov dword [eax + 0x8c05c], esi
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dx, word [edx + 0x8c0a4]
    and dh, 7
    movsx edx, dx
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    mov edi, dword [eax + 0x8c060]
    shl edx, 0xa
    sub edi, edx
    mov dword [eax + 0x8c060], edi
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c0ec], 0x2ff
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    add dword [INSTRUCTION_POINTER], 4
    mov byte [eax + 0x8c350], 1
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22ba2:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea ebx, [edx*8]
    add ebx, edx
    shl ebx, 3
    sub ebx, edx
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, eax
    mov ecx, dword [INSTRUCTION_POINTER]
    mov eax, dword [ebx + 0x2044b]
    mov esi, dword [edx + 0x2044f]
    mov edx, eax
    add ecx, 4
    sub edx, esi
    mov edi, dword [ecx]
    sar edx, 8
    mov dword [INSTRUCTION_POINTER], ecx
    cmp edx, edi
    setl al
    and eax, strict dword 0xff
    je short loc_22c1c
    lea ebx, [ecx + 8]
    mov dword [INSTRUCTION_POINTER], ebx
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22c1c:
    mov eax, dword [ecx + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22c48:
    mov edx, dword [0xc3374]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [nosplit eax*2 + 0xb8bf6]
    and eax, strict dword 0x20000000
    je short loc_22c80
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22c80:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22cb1:
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08c], 0x7d0
    sete al
    and eax, strict dword 0xff
    je short loc_22cf1
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22cf1:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22d22:
    cmp dword [0xbffe3], 1
    setg al
    and eax, strict dword 0xff
    je short loc_22d4b
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22d4b:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22d7c:
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    mov ebx, dword [INSTRUCTION_POINTER]
    lea eax, [edx*4]
    add ebx, 4
    add eax, edx
    mov dword [INSTRUCTION_POINTER], ebx
    cmp word [nosplit eax*8 + 0x20a08a], 0
    jne near loc_23b1e
    push byte 1
    push dword 0x300
    mov eax, 0xbd6f0
    push eax
    mov eax, 0xbf55a
    push eax
    mov eax, 0xbf55e
    mov ecx, dword [0xc3364]
    push eax
    mov eax, 0xbf558
    mov ebx, dword [0xc3364]
    push eax
    mov eax, dword [0xc3364]
    mov edx, dword [0xc3364]
    mov ecx, dword [ecx + 0x16]
    mov eax, dword [eax + 0x1a]
    mov ebx, dword [ebx + 8]
    sar eax, 0x10
    mov edx, dword [edx + 4]
    push eax
    mov eax, dword [0xc3364]
    sar ecx, 0x10
    sub ebx, strict dword 0x2000
    mov eax, dword [eax]
    call 0x42775
    cmp word [0xbf558], 0
    jl near loc_23b1e
    mov edx, dword [0xbf556]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [nosplit eax*8 + 0x20a088]
    sar eax, 0x10
    call 0x28ba8
    test al, al
    je near loc_23b1e
    mov edx, dword [0xbf556]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [nosplit eax*8 + 0x20a08a]
    xor ah, ah
    cmp ax, strict word 0x17
    je short loc_22e9e
    mov edx, dword [0xbf556]
    sar edx, 0x10
    lea ebx, [edx*4]
    add ebx, edx
    mov edx, dword [0xbf556]
    sar edx, 0x10
    lea eax, [edx*4]
    add edx, eax
    shl ebx, 3
    shl edx, 3
    mov eax, dword [ebx + 0x20a070]
    cmp eax, dword [edx + 0x20a06c]
    jne near loc_23b1e
loc_22e9e:
    mov ebx, dword [0xbf556]
    sar ebx, 0x10
    lea eax, [ebx*4]
    add eax, ebx
    shl eax, 3
    test byte [eax + 0x20a08b], 0x40
    jne near loc_23b1e
    mov eax, dword [eax + 0x20a088]
    sar eax, 0x10
    test ah, 0x80
    jne near loc_23b1e
    mov eax, dword [nosplit ebx*2 + 0x21778c]
    sar eax, 0x10
    mov dword [ebp - 0x38], eax
    test eax, eax
    jl short loc_22f05
loc_22ee3:
    imul eax, dword [ebp - 0x38], 0x2c
    cmp word [eax + 0x191376], 2
    je short loc_22f05
    mov eax, dword [ebp - 0x38]
    mov eax, dword [nosplit eax*2 + 0x18af66]
    sar eax, 0x10
    mov dword [ebp - 0x38], eax
    test eax, eax
    jge short loc_22ee3
loc_22f05:
    cmp dword [ebp - 0x38], -1
    jne near loc_23b1e
    mov edx, dword [0xc3372]
    mov eax, dword [0xbf556]
    sar edx, 0x10
    sar eax, 0x10
    call 0x29328
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22f31:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x16]
    sar eax, 0x10
    call 0x23f28
    test eax, eax
    je short loc_22f5d
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22f5d:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22f8e:
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3364]
    add edx, 4
    mov di, word [eax + 0xe]
    mov dword [INSTRUCTION_POINTER], edx
    cmp di, 0xf05
    je short loc_22fd0
    mov edx, dword [0xc3372]
    xor ebx, ebx
    sar edx, 0x10
    mov bl, byte [eax + 0x11]
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov word [eax + 0x20443], bx
loc_22fd0:
    mov eax, dword [INSTRUCTION_POINTER]
    add eax, 4
    mov ebx, dword [0xc3364]
    mov dl, byte [eax - 4]
    mov dword [INSTRUCTION_POINTER], eax
    mov byte [ebx + 0x11], dl
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_22ff5:
    lea ecx, [eax + 4]
    mov edx, dword [0xc3364]
    mov dword [INSTRUCTION_POINTER], ecx
    mov ax, word [ecx]
    lea esi, [ecx + 4]
    mov word [edx + 0xe], ax
    mov dword [INSTRUCTION_POINTER], esi
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23020:
    mov eax, dword [0xc3364]
    call DODGE
    cmp al, 1
    sete al
    and eax, strict dword 0xff
    je short loc_2304e
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2304e:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2307f:
    mov eax, dword [0xc3364]
    call BADGUY
    test ax, ax
    je short loc_230e1
    mov eax, dword [0xbff9f]
    test eax, eax
    je short loc_230af
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_230af:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    lea ebx, [eax + 8]
    mov dword [INSTRUCTION_POINTER], ebx
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_230e1:
    mov eax, dword [0xc3364]
    call 0x14794
    test ax, ax
    je short loc_23143
    mov eax, dword [0xbffa7]
    test eax, eax
    je short loc_23111
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23111:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    lea edi, [eax + 8]
    mov dword [INSTRUCTION_POINTER], edi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23143:
    mov eax, dword [0xbffa3]
    test eax, eax
    je short loc_23164
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23164:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    lea ebx, [eax + 8]
    mov dword [INSTRUCTION_POINTER], ebx
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23196:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    mov ebx, dword [INSTRUCTION_POINTER]
    sub eax, edx
    mov edx, dword [0xc3364]
    add ebx, 4
    mov eax, dword [eax + 0x2044b]
    mov ecx, dword [edx + 8]
    mov edx, eax
    mov eax, dword [ebx]
    sub edx, ecx
    shl eax, 8
    mov dword [INSTRUCTION_POINTER], ebx
    cmp edx, eax
    setle al
    and eax, strict dword 0xff
    je short loc_231fa
    lea edi, [ebx + 8]
    mov dword [INSTRUCTION_POINTER], edi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_231fa:
    mov eax, dword [ebx + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23226:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov ebx, dword [INSTRUCTION_POINTER]
    mov edx, eax
    mov eax, dword [0xc3364]
    add ebx, 4
    mov eax, dword [eax + 8]
    mov ecx, dword [edx + 0x2044f]
    mov edx, eax
    mov eax, dword [ebx]
    sub edx, ecx
    shl eax, 8
    mov dword [INSTRUCTION_POINTER], ebx
    cmp edx, eax
    setle al
    and eax, strict dword 0xff
    je short loc_2328b
    lea edi, [ebx + 8]
    mov dword [INSTRUCTION_POINTER], edi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2328b:
    mov eax, dword [ebx + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_232b7:
    lea edi, [eax + 4]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [edi]
    mov dword [INSTRUCTION_POINTER], edi
    mov dword [eax + 0x8c084], edx
    xor eax, eax
    lea edx, [edi + 4]
    mov dword [ebp - 0x38], eax
    mov dword [INSTRUCTION_POINTER], edx
loc_232e4:
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov ebx, dword [ebp - 0x38]
    mov eax, dword [INSTRUCTION_POINTER]
    add ebx, edx
    mov dl, byte [eax]
    mov byte [ebx + 0x8c388], dl
    mov edx, dword [ebp - 0x38]
    add eax, 4
    inc edx
    mov dword [INSTRUCTION_POINTER], eax
    mov dword [ebp - 0x38], edx
    cmp edx, 3
    jge near loc_23b1e
    jmp short loc_232e4
loc_2331f:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    mov esi, dword [INSTRUCTION_POINTER]
    sub eax, edx
    add esi, 4
    mov edx, dword [nosplit eax*4 + 0x191390]
    mov edi, dword [esi]
    sar edx, 0x10
    mov dword [INSTRUCTION_POINTER], esi
    cmp edx, edi
    setl al
    and eax, strict dword 0xff
    je short loc_23385
    lea ebx, [esi + 8]
    mov dword [INSTRUCTION_POINTER], ebx
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23385:
    mov eax, dword [esi + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_233b1:
    xor edi, edi
    add eax, 4
    mov dword [ebp - 0x38], edi
    mov dword [INSTRUCTION_POINTER], eax
    lea edx, [eax + 4]
    mov eax, dword [eax]
    mov dword [INSTRUCTION_POINTER], edx
    cmp eax, 0xa
    ja near loc_235b8
    jmp dword [cs:nosplit eax*4 + case_dispatch_e3ac - 0x10000]
loc_233da:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c330]
    mov ebx, dword [edx]
    sar eax, 0x10
    cmp eax, ebx
    je near loc_235b8
    jmp near loc_235b1
loc_23400:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c332]
    mov esi, dword [0xbf378]
    sar eax, 0x10
    cmp eax, esi
    je near loc_235b8
    jmp near loc_235b1
loc_2342a:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c32c]
    mov eax, dword [INSTRUCTION_POINTER]
    sar edx, 0x10
    cmp edx, dword [eax]
    je near loc_235b8
    jmp near loc_235b1
loc_23453:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c0e0]
    mov esi, dword [edx]
    sar eax, 0x10
    cmp eax, esi
    je near loc_235b8
    jmp near loc_235b1
loc_23479:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c32e]
    mov eax, dword [INSTRUCTION_POINTER]
    sar edx, 0x10
    cmp edx, dword [eax]
    je near loc_235b8
    jmp near loc_235b1
loc_234a2:
    mov eax, dword [0xc3364]
    mov ax, word [eax + 0x26]
    sub eax, 0x64
    cmp ax, strict word 3
    ja near loc_235b8
    and eax, strict dword 0xffff
    jmp dword [cs:nosplit eax*4 + case_dispatch_e3d8 - 0x10000]
loc_234c5:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c392], 0
    je near loc_235b8
    jmp near loc_235b1
loc_234e6:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c394], 0
    je near loc_235b8
    jmp near loc_235b1
loc_23507:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c396], 0
    je near loc_235b8
    jmp near loc_235b1
loc_23528:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c398], 0
    je near loc_235b8
    mov dword [ebp - 0x38], 1
    jmp short loc_235b8
loc_2354d:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c11a]
    mov eax, dword [INSTRUCTION_POINTER]
    sar edx, 0x10
    cmp edx, dword [eax]
    je short loc_235b8
    jmp short loc_235b1
loc_2356f:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c100]
    mov eax, dword [INSTRUCTION_POINTER]
    sar edx, 0x10
    cmp edx, dword [eax]
    je short loc_235b8
    jmp short loc_235b1
loc_23591:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c344]
    mov eax, dword [INSTRUCTION_POINTER]
    sar edx, 0x10
    cmp edx, dword [eax]
    je short loc_235b8
loc_235b1:
    mov dword [ebp - 0x38], 1
loc_235b8:
    cmp dword [ebp - 0x38], 0
    je short loc_235d6
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_235d6:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edi, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23607:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [INSTRUCTION_POINTER]
    add edx, 4
    mov si, word [eax + 0x8c0f0]
    mov dword [INSTRUCTION_POINTER], edx
    test si, si
    jne near loc_23b1e
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    cmp byte [nosplit eax*4 + 0x19137c], 9
    jb near loc_23b1e
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov eax, dword [nosplit eax*4 + 0x19137e]
    sar eax, 0x10
    push eax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c02c]
    add eax, strict dword 0x1000
    push eax
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, dword [eax + 0x8c028]
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [0xc3364]
    push ebx
    mov ebx, dword [0xc3364]
    mov edx, dword [edx + 4]
    mov ecx, dword [eax + 0x8c024]
    mov ebx, dword [ebx + 8]
    push ecx
    mov ecx, dword [0xc3364]
    mov eax, dword [0xc3364]
    sub ebx, strict dword 0x400
    mov ecx, dword [ecx + 0x16]
    mov eax, dword [eax]
    sar ecx, 0x10
    call CAN_SEE
    test eax, eax
    je near loc_23b1e
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c0f0], 1
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c33a], 0
    jne short loc_23759
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c33a], 0xffff
loc_23759:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dx, word [0xc3374]
    mov word [eax + 0x8c11e], dx
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23781:
    mov eax, dword [0xc3364]
    mov ax, word [eax + 0x18]
    mov dword [ebp - 0x34], eax
    xor eax, eax
    mov dword [ebp - 0x38], eax
    mov eax, dword [0xc3364]
    lea ebx, [ebp - 0x34]
    mov edx, dword [eax + 4]
    mov eax, dword [eax]
    add edx, 0x6c
    add eax, 0x6c
    call 0x4500f
    mov edx, dword [0xc3364]
    mov eax, dword [ebp - 0x34]
    cmp ax, word [edx + 0x18]
    jne near loc_23836
    mov eax, dword [0xc3364]
    lea ebx, [ebp - 0x34]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    sub edx, 0x6c
    sub eax, 0x6c
    call 0x4500f
    mov edx, dword [0xc3364]
    mov eax, dword [ebp - 0x34]
    cmp ax, word [edx + 0x18]
    jne short loc_23836
    mov eax, dword [0xc3364]
    lea ebx, [ebp - 0x34]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    sub edx, 0x6c
    add eax, 0x6c
    call 0x4500f
    mov edx, dword [0xc3364]
    mov eax, dword [ebp - 0x34]
    cmp ax, word [edx + 0x18]
    jne short loc_23836
    mov eax, edx
    lea ebx, [ebp - 0x34]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    add edx, 0x6c
    sub eax, 0x6c
    call 0x4500f
    mov edx, dword [0xc3364]
    mov eax, dword [ebp - 0x34]
    cmp ax, word [edx + 0x18]
    jne short loc_23836
    mov dword [ebp - 0x38], 1
loc_23836:
    cmp dword [ebp - 0x38], 0
    je short loc_23854
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23854:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23885:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, dword [INSTRUCTION_POINTER]
    mov edx, 0x8be10
    add ebx, 4
    add edx, eax
    movsx eax, word [ebx]
    mov dword [INSTRUCTION_POINTER], ebx
    call SET_PLAYER_QUOTE
    add dword [INSTRUCTION_POINTER], 4
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_238c4:
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x16]
    sar eax, 0x10
    call 0x23f74
    test eax, eax
    je short loc_238f0
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_238f0:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov esi, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp esi, 0xa
    jne near loc_23b1e
    lea edi, [eax + 8]
    mov dword [INSTRUCTION_POINTER], edi
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23922:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov eax, dword [eax + 0x2043f]
    sar eax, 0x10
    and eax, strict dword 0xc000
    cmp eax, strict dword 0x4000
    setg al
    and eax, strict dword 0xff
    je short loc_2396e
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2396e:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ebx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ebx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2399f:
    mov edx, dword [INSTRUCTION_POINTER]
    mov eax, dword [0xc3364]
    add edx, 4
    mov ax, word [eax + 0xe]
    mov dword [INSTRUCTION_POINTER], edx
    cmp ax, strict word 0x490
    jb short loc_239c7
    jbe short loc_239cd
    cmp ax, strict word 0x15cd
    je short loc_239cd
    jmp short loc_239f4
loc_239c7:
    cmp ax, strict word 0x45b
    jne short loc_239f4
loc_239cd:
    mov eax, dword [0xc3364]
    cmp word [eax + 0x22], 0
    je near loc_23b1e
    mov eax, dword [eax + 0x20]
    sar eax, 0x10
    call 0x2933c
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_239f4:
    mov eax, dword [0xc3364]
    cmp word [eax + 0x28], 0
    jl near loc_23b1e
    mov eax, dword [eax + 0x26]
    sar eax, 0x10
    call 0x2933c
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23a1b:
    mov eax, dword [0xc3364]
    xor edx, edx
    mov dl, byte [eax + 0x11]
    mov eax, dword [INSTRUCTION_POINTER]
    add eax, 4
    mov ebx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, ebx
    sete al
    and eax, strict dword 0xff
    je short loc_23a58
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23a58:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ecx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ecx, 0xa
    jne near loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23a89:
    xor ecx, ecx
    mov dword [ebp - 0x38], ecx
    cmp ecx, strict dword 0x1f4
    jge short loc_23ac1
    lea eax, [ecx*4]
    mov bx, word [0xc3374]
    shl eax, 3
loc_23aa7:
    cmp bx, word [eax + 0x7f3a0]
    je short loc_23ac1
    mov edi, dword [ebp - 0x38]
    inc edi
    add eax, 0x18
    mov dword [ebp - 0x38], edi
    cmp eax, strict dword 0x2ee0
    jl short loc_23aa7
loc_23ac1:
    cmp dword [ebp - 0x38], strict dword 0x1f4
    sete al
    and eax, strict dword 0xff
    je short loc_23aea
    add dword [INSTRUCTION_POINTER], 8
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23aea:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov ebx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp ebx, 0xa
    jne short loc_23b1e
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
    call parse
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_23b17:
    mov byte [KILL_FLAG], 1
loc_23b1e:
    xor al, al
loc_23b20:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

execute:
    push ebp
    mov ebp, esp
    push ecx
    push edi
    mov dword [0xc3368], ebx
    movsx ebx, ax
    mov word [0xc3374], ax
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    mov word [0xc3376], dx
    sub eax, ebx
    mov edx, 0x191368
    shl eax, 2
    add edx, eax
    lea eax, [ebx*8]
    add eax, ebx
    shl eax, 3
    sub eax, ebx
    add eax, strict dword 0x20438
    add eax, 0x2f
    mov dword [0xc3360], eax
    mov eax, dword [edx + 0xc]
    sar eax, 0x10
    shl eax, 2
    mov ebx, dword [eax + 0x82280]
    mov dword [0xc3364], edx
    test ebx, ebx
    je near loc_23d69
    lea eax, [ebx + 0x10]
    mov dword [INSTRUCTION_POINTER], eax
    xor ah, ah
    mov bx, word [edx + 0x18]
    mov byte [KILL_FLAG], ah
    test bx, bx
    jl short loc_23bb7
    cmp bx, 0x400
    jl short loc_23bed
loc_23bb7:
    mov eax, dword [0xc3364]
    call BADGUY
    test ax, ax
    je short loc_23bdb
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    inc word [eax + 0x8c38d]
loc_23bdb:
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call DELETE_SPRITE
    jmp near loc_23d69
loc_23bed:
    mov eax, dword [0xc3360]
    cmp dword [eax + 0x10], 0
    je short loc_23c58
    add word [edx + 0x26], 4
    mov ebx, dword [edx + 0x24]
    mov ecx, dword [eax + 0x10]
    sar ebx, 0x10
    cmp ebx, dword [ecx + 0x10]
    jle short loc_23c22
    inc dword [eax + 8]
    mov word [edx + 0x26], 0
    mov edx, dword [eax + 0x10]
    mov ebx, dword [eax + 0xc]
    mov edx, dword [edx + 0xc]
    add ebx, edx
    mov dword [eax + 0xc], ebx
loc_23c22:
    mov eax, dword [0xc3360]
    mov eax, dword [eax + 0xc]
    test eax, eax
    jns short loc_23c30
    neg eax
loc_23c30:
    mov edx, dword [0xc3360]
    mov edx, dword [edx + 0x10]
    mov ebx, eax
    mov eax, dword [edx + 4]
    imul eax, dword [edx + 0xc]
    test eax, eax
    jns short loc_23c48
    neg eax
loc_23c48:
    cmp ebx, eax
    jl short loc_23c58
    mov eax, dword [0xc3360]
    mov dword [eax + 0xc], 0
loc_23c58:
    call parse
    test al, al
    je short loc_23c58
    cmp byte [KILL_FLAG], 1
    jne short loc_23ca5
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov bx, word [0xc3374]
    cmp bx, word [eax + 0x8c11e]
    jne short loc_23c91
    mov word [eax + 0x8c11e], 0xffff
loc_23c91:
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call DELETE_SPRITE
    lea esp, [ebp - 8]
    pop edi
    pop ecx
    pop ebp
    ret
loc_23ca5:
    call MOVE_ACTOR
    mov eax, dword [0xc3364]
    mov dx, word [eax + 0x1a]
    cmp dx, 1
    je near loc_23d69
    cmp dx, 6
    jne near loc_23d69
    mov ax, word [eax + 0xe]
    cmp ax, strict word 0x4f4
    jb short loc_23d0b
    jbe short loc_23d26
    cmp ax, strict word 0x51d
    jb short loc_23cf4
    jbe short loc_23d26
    cmp ax, strict word 0x523
    jb near loc_23d69
    jbe short loc_23d26
    cmp ax, strict word 0x525
    je short loc_23d26
    lea esp, [ebp - 8]
    pop edi
    pop ecx
    pop ebp
    ret
loc_23cf4:
    cmp ax, strict word 0x518
    jb near loc_23d69
    cmp ax, strict word 0x51a
    jbe short loc_23d26
    lea esp, [ebp - 8]
    pop edi
    pop ecx
    pop ebp
    ret
loc_23d0b:
    cmp ax, strict word 0x4a3
    jb short loc_23d20
    jbe short loc_23d26
    cmp ax, strict word 0x4e3
    je short loc_23d26
    lea esp, [ebp - 8]
    pop edi
    pop ecx
    pop ebp
    ret
loc_23d20:
    cmp ax, strict word 0x47b
    jne short loc_23d69
loc_23d26:
    mov ebx, dword [0xc3372]
    sar ebx, 0x10
    lea eax, [ebx*8]
    add eax, ebx
    shl eax, 3
    sub eax, ebx
    mov cx, word [eax + 0x20449]
    cmp cx, 1
    jle short loc_23d5b
    mov edi, ecx
    dec edi
    mov word [eax + 0x20449], di
    lea esp, [ebp - 8]
    pop edi
    pop ecx
    pop ebp
    ret
loc_23d5b:
    jne short loc_23d69
    mov edx, 2
    mov eax, ebx
    call CHANGE_SPRITE_STAT
loc_23d69:
    lea esp, [ebp - 8]
    pop edi
    pop ecx
    pop ebp
    ret
