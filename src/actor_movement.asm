bits 32
org 0x1cee0

%define GAME_RANDOM 0x50fe0
%define HITSCAN 0x414ef
%define KRAND 0x46fa0
%define CAN_SEE 0x41280
%define GET_ANGLE 0x3b4fc
%define GET_INC_ANGLE 0x19ff0
%define BADGUY 0x14814
%define PARSE 0x1e3e8
%define SET_SPRITE 0x40b6d
%define DELETE_SPRITE 0x40ecd
%define GET_CEILING_Z_OF_SLOPE 0x4dde9
%define GET_FLOOR_Z_OF_SLOPE 0x4decc
%define MOVE_TRACE_1 0x28ac
%define MOVE_TRACE_2 0x28b4
%define MOVE_TRACE_3 0x28bc
%define MOVE_TRACE_4 0x28c4
%define DODGE_TRACE 0x28a0
%define INSTRUCTION_POINTER 0xbd768
%define SPRITE_X 0x191368
%define SPRITE_Y 0x19136c
%define SPRITE_Z 0x191370

dodge:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov ebx, eax
    mov edx, DODGE_TRACE
    call 0x513e4
    call GAME_RANDOM
    xor ah, ah
    sub eax, 0x7f
    mov dx, word [ebx + 0x1c]
    add eax, eax
    add edx, eax
    mov word [ebx + 0x1c], dx
    and byte [ebx + 0x1d], 7
    xor al, al
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret

furthest_angle:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 0x24
    mov ebx, edx
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov esi, SPRITE_X
    shl eax, 2
    mov edx, 0xc0000000
    add esi, eax
    mov eax, 0x800
    mov dword [ebp - 0x28], edx
    mov edx, eax
    movsx ebx, bx
    sar edx, 0x1f
    idiv ebx
    mov dx, word [esi + 0xe]
    mov dword [ebp - 0x1c], eax
    cmp dx, 0xf05
    je short loc_1cf7b
    mov eax, dword [0xc3360]
    mov eax, dword [eax]
    and eax, 0x3f
    cmp eax, 2
    jle short loc_1cf7b
    mov ax, word [esi + 0x1c]
    add ah, 4
    jmp near loc_1d02c
loc_1cf7b:
    mov di, word [esi + 0x1c]
    jmp near loc_1d00f
loc_1cf84:
    push dword 0x1000040
    lea edx, [ebp - 0x34]
    push edx
    lea edx, [ebp - 0x30]
    push edx
    lea edx, [ebp - 0x2c]
    push edx
    lea edx, [ebp - 0x24]
    push edx
    lea edx, [ebp - 0x18]
    add eax, strict dword 0x200
    push edx
    lea edx, [ebp - 0x14]
    mov ecx, dword [esi + 0x16]
    push edx
    mov edx, edi
    mov ebx, dword [esi + 8]
    and dh, 7
    and eax, strict dword 0x7ff
    movsx edx, dx
    sar ecx, 0x10
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    push byte 0
    sar edx, 0x10
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    push edx
    sar eax, 0x10
    sub ebx, strict dword 0x800
    push eax
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call HITSCAN
    mov eax, dword [ebp - 0x2c]
    sub eax, dword [esi]
    test eax, eax
    jns short loc_1cfef
    neg eax
loc_1cfef:
    mov edx, eax
    mov ecx, dword [esi + 4]
    mov eax, dword [ebp - 0x30]
    sub eax, ecx
    test eax, eax
    jns short loc_1cfff
    neg eax
loc_1cfff:
    add eax, edx
    cmp eax, dword [ebp - 0x28]
    jle short loc_1d00c
    mov dword [ebp - 0x28], eax
    mov dword [ebp - 0x20], edi
loc_1d00c:
    add edi, dword [ebp - 0x1c]
loc_1d00f:
    mov edx, dword [esi + 0x1a]
    sar edx, 0x10
    movsx eax, di
    add edx, strict dword 0x800
    cmp eax, edx
    jl near loc_1cf84
    mov eax, dword [ebp - 0x20]
    and ah, 7
loc_1d02c:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

furthest_can_see_point:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x28
    mov esi, edx
    mov dword [ebp - 0x24], ebx
    mov dword [ebp - 0x20], ecx
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edi, SPRITE_X
    shl eax, 2
    add edi, eax
    mov eax, dword [0xc3360]
    test byte [eax], 0x3f
    jne near loc_1d1d8
    cmp dword [0xbffe3], 2
    jge short loc_1d08c
    cmp dword [0xbffe7], 3
    jge short loc_1d08c
    mov dword [ebp - 0x18], 0x400
    jmp short loc_1d0a6
loc_1d08c:
    call KRAND
    and eax, 1
    lea ebx, [eax + 1]
    mov eax, 0x800
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov dword [ebp - 0x18], eax
loc_1d0a6:
    mov ax, word [esi + 0x1c]
    mov word [ebp - 0x14], ax
    jmp near loc_1d1bf
loc_1d0b3:
    push dword 0x1000040
    lea eax, [ebp - 0x30]
    push eax
    lea eax, [ebp - 0x2c]
    push eax
    lea eax, [ebp - 0x28]
    push eax
    lea eax, [ebp - 0x10]
    push eax
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0xc]
    push eax
    mov ebx, 0x4000
    call KRAND
    and eax, strict dword 0x7fff
    sub ebx, eax
    mov eax, dword [ebp - 0x14]
    and ah, 7
    add edx, strict dword 0x200
    cwde
    and edx, strict dword 0x7ff
    mov ecx, dword [esi + 0x16]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    push ebx
    sar eax, 0x10
    sar ecx, 0x10
    push eax
    mov eax, dword [nosplit edx*2 + 0x1bd566]
    mov ebx, dword [esi + 8]
    sar eax, 0x10
    sub ebx, strict dword 0x1000
    push eax
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call HITSCAN
    mov eax, dword [ebp - 0x28]
    sub eax, dword [esi]
    test eax, eax
    jns short loc_1d12f
    neg eax
loc_1d12f:
    mov edx, eax
    mov ebx, dword [esi + 4]
    mov eax, dword [ebp - 0x2c]
    sub eax, ebx
    test eax, eax
    jns short loc_1d13f
    neg eax
loc_1d13f:
    mov ecx, dword [edi]
    lea ebx, [edx + eax]
    mov eax, dword [ebp - 0x28]
    sub eax, ecx
    test eax, eax
    jns short loc_1d14f
    neg eax
loc_1d14f:
    mov edx, eax
    mov ecx, dword [edi + 4]
    mov eax, dword [ebp - 0x2c]
    sub eax, ecx
    test eax, eax
    jns short loc_1d15f
    neg eax
loc_1d15f:
    add eax, edx
    cmp ebx, eax
    jge short loc_1d1a9
    mov eax, dword [edi + 0x16]
    sar eax, 0x10
    push eax
    mov eax, dword [edi + 8]
    mov ecx, dword [ebp - 0xe]
    sub eax, strict dword 0x1000
    mov ebx, dword [ebp - 0x30]
    push eax
    mov eax, dword [edi + 4]
    mov edx, dword [edi]
    push eax
    sar ecx, 0x10
    push edx
    mov eax, dword [ebp - 0x28]
    mov edx, dword [ebp - 0x2c]
    call CAN_SEE
    test eax, eax
    je short loc_1d1a9
    mov edx, dword [ebp - 0x24]
    mov eax, dword [ebp - 0x28]
    mov dword [edx], eax
    mov edx, dword [ebp - 0x20]
    mov eax, dword [ebp - 0x2c]
    mov dword [edx], eax
    mov eax, dword [ebp - 0xc]
    jmp short loc_1d1dd
loc_1d1a9:
    call KRAND
    mov edx, dword [ebp - 0x18]
    and ah, 1
    mov ebx, dword [ebp - 0x14]
    sub edx, eax
    add ebx, edx
    mov word [ebp - 0x14], bx
loc_1d1bf:
    mov eax, dword [esi + 0x1a]
    mov edx, dword [ebp - 0x16]
    sar eax, 0x10
    sar edx, 0x10
    add eax, strict dword 0x800
    cmp edx, eax
    jl near loc_1d0b3
loc_1d1d8:
    mov eax, 0xffffffff
loc_1d1dd:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret

alter_angle:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    mov ecx, eax
    mov eax, dword [0xc3360]
    mov ebx, dword [0xc3364]
    mov edx, dword [eax + 4]
    mov esi, dword [eax]
    mov edi, dword [ebx + 0x1e]
    mov dword [ebp - 0x20], edx
    mov ax, word [ebx + 0x1c]
    sar edi, 0x10
    mov word [ebp - 0x18], ax
    mov edx, dword [edx]
    mov eax, 5
    sub edx, edi
    mov dword [ebp - 0x1c], eax
    mov eax, edx
    sar edx, 0x1f
    idiv dword [ebp - 0x1c]
    and esi, 0x1f
    add eax, edi
    mov dx, word [ebx + 0x24]
    mov word [ebx + 0x20], ax
    cmp dx, 0x288
    jge short loc_1d261
    mov edx, dword [ebp - 0x20]
    mov edi, dword [ebx + 0x22]
    mov edx, dword [edx + 4]
    sar edi, 0x10
    shl edx, 4
    mov eax, 5
    sub edx, edi
    mov dword [ebp - 0x1c], eax
    mov eax, edx
    sar edx, 0x1f
    idiv dword [ebp - 0x1c]
    add eax, edi
    mov word [ebx + 0x24], ax
loc_1d261:
    test ch, 0x40
    je short loc_1d27b
    mov eax, dword [0xc3364]
    mov dx, word [0x93bc]
    mov word [eax + 0x1c], dx
    jmp near loc_1d3cd
loc_1d27b:
    test ch, 2
    je near loc_1d3cd
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [0xc3364]
    mov ax, word [eax + 0x8c108]
    mov word [edx + 0x1e], ax
    mov ebx, dword [edx + 0x1c]
    sar ebx, 0x10
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    shl eax, 2
    cmp word [eax + 0x191376], 0xf05
    jne short loc_1d2f9
    mov ebx, dword [0xc3372]
    sar ebx, 0x10
    lea eax, [ebx*8]
    add eax, ebx
    shl eax, 3
    sub eax, ebx
    mov edi, dword [edx + 4]
    mov ebx, eax
    mov eax, dword [eax + 0x20457]
    sub eax, edi
    mov edi, eax
    mov eax, dword [ebx + 0x20453]
    mov ebx, dword [edx]
    mov edx, edi
    sub eax, ebx
    jmp short loc_1d310
loc_1d2f9:
    mov ebx, dword [eax + SPRITE_Y]
    mov edi, dword [edx + 4]
    mov eax, dword [eax + SPRITE_X]
    sub ebx, edi
    mov edi, dword [edx]
    mov edx, ebx
    sub eax, edi
loc_1d310:
    call GET_ANGLE
    mov ebx, eax
    mov eax, dword [0xc3364]
    cmp word [eax + 0x20], 0
    je near loc_1d3c4
    cmp word [eax + 0xe], 0x1334
    je near loc_1d3c4
    mov eax, dword [ebp - 0x1a]
    movsx edx, bx
    sar eax, 0x10
    call GET_INC_ANGLE
    cmp esi, 2
    jge short loc_1d391
    cwde
    test eax, eax
    jns short loc_1d34d
    neg eax
loc_1d34d:
    cmp eax, strict dword 0x100
    jge near loc_1d3cd
    call KRAND
    xor al, al
    mov edx, 0x80
    and ah, 1
    sub edx, eax
    mov eax, dword [0xc3364]
    add word [eax + 0x1c], dx
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call 0x295e8
    cmp eax, strict dword 0x34c
    jge short loc_1d3cd
    mov eax, dword [0xc3364]
    sub word [eax + 0x1c], dx
    jmp short loc_1d3cd
loc_1d391:
    cmp esi, 0x12
    jle short loc_1d3cd
    cmp esi, 0x1a
    jge short loc_1d3cd
    movsx edx, ax
    sar edx, 2
    mov eax, edx
    test eax, eax
    jns short loc_1d3a9
    neg eax
loc_1d3a9:
    cmp eax, strict dword 0x80
    jl short loc_1d3c4
    mov ebx, dword [0xc3364]
    mov eax, dword [ebx + 0x1a]
    sar eax, 0x10
    add eax, edx
    mov word [ebx + 0x1c], ax
    jmp short loc_1d3cd
loc_1d3c4:
    mov eax, dword [0xc3364]
    mov word [eax + 0x1c], bx
loc_1d3cd:
    cmp esi, 1
    jge short loc_1d432
    mov ebx, 2
    test ch, 4
    je short loc_1d413
    mov eax, dword [0xc3372]
    mov edx, 2
    sar eax, 0x10
    call furthest_angle
    mov edx, eax
    mov eax, dword [0xc3364]
    mov word [eax + 0x1c], dx
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov dx, word [edx + 0x8c108]
    mov word [eax + 0x1e], dx
loc_1d413:
    test cl, 0x80
    je short loc_1d432
    mov eax, dword [0xc3372]
    movsx edx, bx
    sar eax, 0x10
    call furthest_angle
    mov edx, dword [0xc3364]
    mov word [edx + 0x1c], ax
loc_1d432:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

move_actor:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    mov ecx, dword [0xc3364]
    mov cx, word [ecx + 0x28]
    movsx eax, cx
    cmp eax, -1
    jne short loc_1d45b
    xor ecx, ecx
loc_1d45b:
    mov eax, dword [0xc3360]
    inc dword [eax]
    test cl, 1
    je near loc_1d4ea
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c0e4], 0
    jl short loc_1d49a
    mov ebx, dword [0xc3364]
    mov edx, dword [eax + 0x8c04c]
    mov esi, dword [ebx + 4]
    mov eax, dword [eax + 0x8c048]
    jmp short loc_1d4af
loc_1d49a:
    mov ebx, dword [0xc3364]
    mov edx, dword [eax + 0x8c028]
    mov esi, dword [ebx + 4]
    mov eax, dword [eax + 0x8c024]
loc_1d4af:
    mov edi, dword [ebx]
    sub edx, esi
    sub eax, edi
    call GET_ANGLE
    movsx edx, ax
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    sar eax, 0x10
    call GET_INC_ANGLE
    cwde
    sar eax, 2
    movsx edx, ax
    cmp edx, -8
    jle short loc_1d4e0
    test ax, ax
    jge short loc_1d4e0
    xor eax, eax
loc_1d4e0:
    mov edx, dword [0xc3364]
    add word [edx + 0x1c], ax
loc_1d4ea:
    test cl, 0x20
    je short loc_1d51f
    mov ebx, dword [0xc3360]
    mov ebx, dword [ebx]
    shl ebx, 3
    and ebx, strict dword 0x7ff
    mov edx, dword [0xc3364]
    mov ebx, dword [nosplit ebx*2 + 0x1bd566]
    mov eax, dword [edx + 0x1a]
    sar ebx, 0x10
    sar eax, 0x10
    sar ebx, 6
    add eax, ebx
    mov word [edx + 0x1c], ax
loc_1d51f:
    test cl, 0x10
    je near loc_1d5bd
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c0e4], 0
    jl short loc_1d557
    mov ebx, dword [0xc3364]
    mov edx, dword [eax + 0x8c04c]
    mov esi, dword [ebx + 4]
    mov eax, dword [eax + 0x8c048]
    jmp short loc_1d56c
loc_1d557:
    mov ebx, dword [0xc3364]
    mov edx, dword [eax + 0x8c028]
    mov esi, dword [ebx + 4]
    mov eax, dword [eax + 0x8c024]
loc_1d56c:
    mov edi, dword [ebx]
    sub edx, esi
    sub eax, edi
    call GET_ANGLE
    mov esi, eax
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    movsx edx, si
    sar eax, 0x10
    call GET_INC_ANGLE
    movsx ebx, ax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    shl eax, 5
    movsx edx, ax
    cmp edx, -0x20
    jle short loc_1d5b3
    test ax, ax
    jge short loc_1d5b3
    mov edx, dword [0xc3364]
    xor eax, eax
    mov word [edx + 0x1c], si
loc_1d5b3:
    mov edx, dword [0xc3364]
    add word [edx + 0x1c], ax
loc_1d5bd:
    movsx eax, cx
    test ah, 0x80
    je near loc_1d664
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp word [eax + 0x8c0e4], 0
    jl short loc_1d5f8
    mov ebx, dword [0xc3364]
    mov edx, dword [eax + 0x8c04c]
    mov esi, dword [ebx + 4]
    mov eax, dword [eax + 0x8c048]
    jmp short loc_1d60d
loc_1d5f8:
    mov ebx, dword [0xc3364]
    mov edx, dword [eax + 0x8c028]
    mov esi, dword [ebx + 4]
    mov eax, dword [eax + 0x8c024]
loc_1d60d:
    mov edi, dword [ebx]
    sub edx, esi
    sub eax, edi
    call GET_ANGLE
    add ah, 4
    and ah, 7
    mov esi, eax
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    movsx edx, si
    sar eax, 0x10
    call GET_INC_ANGLE
    movsx ebx, ax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    shl eax, 5
    movsx edx, ax
    cmp edx, -0x20
    jle short loc_1d65a
    test ax, ax
    jge short loc_1d65a
    mov edx, dword [0xc3364]
    xor eax, eax
    mov word [edx + 0x1c], si
loc_1d65a:
    mov edx, dword [0xc3364]
    add word [edx + 0x1c], ax
loc_1d664:
    mov eax, ecx
    and eax, strict dword 0x101
    cmp ax, strict word 0x101
    jne short loc_1d6ab
    mov eax, dword [0xc3360]
    cmp dword [eax], 0x10
    jge short loc_1d6ab
    mov ebx, dword [eax]
    shl ebx, 4
    add ebx, strict dword 0x200
    and ebx, strict dword 0x7ff
    mov edx, dword [0xc3364]
    mov ebx, dword [nosplit ebx*2 + 0x1bd566]
    mov eax, dword [edx + 0x22]
    sar ebx, 0x10
    sar eax, 0x10
    sar ebx, 5
    sub eax, ebx
    mov word [edx + 0x24], ax
loc_1d6ab:
    test ch, 1
    je near loc_1d737
    mov esi, dword [0xc3364]
    mov di, word [esi + 0xe]
    cmp di, 0x1c70
    jne short loc_1d6f1
    mov eax, dword [0xc3360]
    mov edi, dword [eax]
    cmp edi, 8
    jge short loc_1d737
    mov eax, edi
    shl eax, 4
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    mov ebx, 0x1e
    jmp short loc_1d722
loc_1d6f1:
    cmp di, 0x2201
    jne short loc_1d737
    mov eax, dword [0xc3360]
    mov ebx, dword [eax]
    cmp ebx, 8
    jge short loc_1d737
    mov eax, ebx
    shl eax, 4
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    mov ebx, 0x23
loc_1d722:
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    mov eax, dword [esi + 0x22]
    sar eax, 0x10
    sub eax, edx
    mov word [esi + 0x24], ax
loc_1d737:
    test ch, 0x20
    je near loc_1d7c3
    mov esi, dword [0xc3364]
    mov dx, word [esi + 0xe]
    cmp dx, 0x1c70
    jne short loc_1d77d
    mov eax, dword [0xc3360]
    mov ebx, dword [eax]
    cmp ebx, 8
    jge short loc_1d7c3
    mov eax, ebx
    shl eax, 4
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    mov ebx, 0x18
    jmp short loc_1d7ae
loc_1d77d:
    cmp dx, 0x2201
    jne short loc_1d7c3
    mov eax, dword [0xc3360]
    mov edx, dword [eax]
    cmp edx, 8
    jge short loc_1d7c3
    mov eax, edx
    shl eax, 4
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    mov ebx, 0x1c
loc_1d7ae:
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    mov eax, dword [esi + 0x22]
    sar eax, 0x10
    sub eax, edx
    mov word [esi + 0x24], ax
loc_1d7c3:
    test ch, 0x40
    je short loc_1d80d
    mov eax, dword [0xc3360]
    mov esi, dword [eax]
    cmp esi, 8
    jge short loc_1d80d
    mov eax, esi
    shl eax, 4
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    mov esi, 0x18
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov ebx, dword [0xc3364]
    mov edx, eax
    mov eax, dword [ebx + 0x22]
    sar eax, 0x10
    sub eax, edx
    mov word [ebx + 0x24], ax
loc_1d80d:
    test cl, 0x40
    je near loc_1d89e
    mov esi, dword [0xc3374]
    sar esi, 0x10
    imul esi, esi, strict dword 0x623
    mov eax, dword [esi + 0x8c05c]
    mov edx, eax
    mov ebx, 0x300
    sar edx, 0x1f
    idiv ebx
    mov ebx, dword [esi + 0x8c024]
    add ebx, eax
    mov eax, dword [esi + 0x8c060]
    mov edx, eax
    mov edi, 0x300
    sar edx, 0x1f
    idiv edi
    mov edx, dword [esi + 0x8c028]
    add edx, eax
    mov eax, dword [0xc3364]
    mov edi, dword [eax + 4]
    mov esi, dword [eax]
    mov eax, ebx
    sub edx, edi
    sub eax, esi
    call GET_ANGLE
    movsx edx, ax
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x1a]
    sar eax, 0x10
    call GET_INC_ANGLE
    cwde
    sar eax, 2
    movsx edx, ax
    cmp edx, -8
    jle short loc_1d894
    test ax, ax
    jge short loc_1d894
    xor eax, eax
loc_1d894:
    mov edx, dword [0xc3364]
    add word [edx + 0x1c], ax
loc_1d89e:
    mov eax, dword [0xc3360]
    mov edi, dword [eax + 4]
    test edi, edi
    je short loc_1d8b3
    test cx, cx
    jne near loc_1d9db
loc_1d8b3:
    mov eax, dword [0xc3364]
    call BADGUY
    test ax, ax
    je short loc_1d8ce
    mov eax, dword [0xc3364]
    cmp word [eax + 0x2a], 0
    jle short loc_1d900
loc_1d8ce:
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, dword [0xc3364]
    mov ebx, dword [eax + 0x2045b]
    cmp ebx, dword [edx]
    jne short loc_1d900
    mov eax, dword [eax + 0x2045f]
    cmp eax, dword [edx + 4]
    je short loc_1d93c
loc_1d900:
    mov edi, dword [0xc3372]
    sar edi, 0x10
    lea eax, [edi*8]
    add eax, edi
    shl eax, 3
    mov esi, dword [0xc3364]
    sub eax, edi
    mov edx, dword [esi]
    mov dword [eax + 0x2045b], edx
    mov edx, dword [esi + 4]
    mov ebx, edx
    mov dword [eax + 0x2045f], edx
    mov eax, edi
    mov ecx, dword [esi + 8]
    mov edx, dword [esi]
    call SET_SPRITE
loc_1d93c:
    mov eax, dword [0xc3364]
    call BADGUY
    test ax, ax
    je near loc_1e0da
    mov eax, dword [0xc3364]
    cmp word [eax + 0x2a], 0
    jg near loc_1e0da
    mov ebx, dword [eax + 0x16]
    sar ebx, 0x10
    lea esi, [ebx*4]
    add esi, ebx
    shl esi, 3
    test byte [esi + 0x20a074], 1
    je short loc_1d9b9
    cmp byte [ebx + 0xc6850], 1
    jne short loc_1d99c
    mov edx, dword [eax + 0xd]
    mov ebx, 0x10
    sar edx, 0x18
    sub ebx, edx
    sar ebx, 1
    add edx, ebx
    mov byte [eax + 0x10], dl
    jmp near loc_1e0da
loc_1d99c:
    mov ebx, dword [esi + 0x20a079]
    mov edx, dword [eax + 0xd]
    sar ebx, 0x18
    sar edx, 0x18
    sub ebx, edx
    sar ebx, 1
    add edx, ebx
    mov byte [eax + 0x10], dl
    jmp near loc_1e0da
loc_1d9b9:
    mov ebx, dword [esi + 0x20a081]
    mov edx, dword [eax + 0xd]
    sar ebx, 0x18
    sar edx, 0x18
    sub ebx, edx
    sar ebx, 1
    add edx, ebx
    mov byte [eax + 0x10], dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1d9db:
    mov ebx, edi
    test cl, 2
    je short loc_1d9f9
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x1e]
    mov esi, dword [edi]
    sar edx, 0x10
    sub esi, edx
    sar esi, 1
    add edx, esi
    mov word [eax + 0x20], dx
loc_1d9f9:
    test cl, 4
    je short loc_1da19
    mov eax, dword [0xc3364]
    mov ebx, dword [ebx + 4]
    mov edx, dword [eax + 0x22]
    shl ebx, 4
    sar edx, 0x10
    sub ebx, edx
    sar ebx, 1
    add edx, ebx
    mov word [eax + 0x24], dx
loc_1da19:
    test ch, 0x10
    je short loc_1da28
    mov eax, dword [0xc3364]
    call dodge
loc_1da28:
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0xf05
    je short loc_1da3d
    movsx eax, cx
    call alter_angle
loc_1da3d:
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x1e]
    sar edx, 0x10
    cmp edx, -6
    jle short loc_1da5a
    cmp word [eax + 0x20], 6
    jge short loc_1da5a
    mov word [eax + 0x20], 0
loc_1da5a:
    mov eax, dword [0xc3364]
    call BADGUY
    mov edi, eax
    mov eax, dword [0xc3364]
    cmp word [eax + 0x20], 0
    jne short loc_1da7d
    cmp word [eax + 0x24], 0
    je near loc_1e050
loc_1da7d:
    test di, di
    je near loc_1dbd5
    mov eax, dword [0xc3364]
    cmp word [eax + 0xe], 0x1334
    jne near loc_1db3a
    cmp word [eax + 0x2a], 0
    jle near loc_1db3a
    cmp word [eax + 0x24], 0
    jle short loc_1daea
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    mov eax, dword [eax + 0x16]
    sar eax, 0x10
    call GET_FLOOR_Z_OF_SLOPE
    mov esi, dword [0xc3372]
    sar esi, 0x10
    mov edx, eax
    lea eax, [esi*8]
    add eax, esi
    shl eax, 3
    sub eax, esi
    mov dword [eax + 0x2044b], edx
    mov eax, dword [0xc3364]
    sub edx, strict dword 0x1c00
    cmp edx, dword [eax + 8]
    jge short loc_1db3a
    jmp short loc_1db37
loc_1daea:
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    mov eax, dword [eax + 0x16]
    sar eax, 0x10
    call GET_CEILING_Z_OF_SLOPE
    mov esi, dword [0xc3372]
    sar esi, 0x10
    mov edx, eax
    lea eax, [esi*8]
    add eax, esi
    shl eax, 3
    sub eax, esi
    mov dword [eax + 0x2044f], edx
    mov eax, dword [0xc3364]
    mov ebx, dword [eax + 8]
    sub ebx, edx
    cmp ebx, strict dword 0x3200
    jge short loc_1db3a
    add edx, strict dword 0x3200
    mov word [eax + 0x24], 0
loc_1db37:
    mov dword [eax + 8], edx
loc_1db3a:
    mov esi, dword [0xc3364]
    cmp word [esi + 0x24], 0
    jle short loc_1db6e
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov ebx, dword [esi + 8]
    mov edx, dword [eax + 0x2044b]
    cmp edx, ebx
    jge short loc_1db6e
    mov dword [esi + 8], edx
loc_1db6e:
    mov eax, dword [0xc3364]
    cmp word [eax + 0x24], 0
    jge near loc_1dc17
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    mov eax, dword [eax + 0x16]
    sar eax, 0x10
    call GET_CEILING_Z_OF_SLOPE
    mov esi, dword [0xc3364]
    mov edx, eax
    mov eax, dword [esi + 8]
    sub eax, edx
    cmp eax, strict dword 0x4200
    jge near loc_1dc17
    mov ebx, dword [esi + 0x16]
    sar ebx, 0x10
    lea eax, [ebx*4]
    add eax, ebx
    test byte [nosplit eax*8 + 0x20a074], 1
    jne short loc_1dc17
    mov bx, word [esi + 0x24]
    add edx, strict dword 0x4200
    sar bx, 1
    mov dword [esi + 8], edx
    mov word [esi + 0x24], bx
    jmp short loc_1dc17
loc_1dbd5:
    mov esi, dword [0xc3364]
    cmp word [esi + 0xe], 0xf05
    jne short loc_1dc17
    mov edx, dword [0xc3372]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, eax
    mov eax, dword [esi + 8]
    mov ebx, dword [edx + 0x2044f]
    sub eax, ebx
    cmp eax, strict dword 0x2000
    jge short loc_1dc17
    lea eax, [ebx + 0x2000]
    mov dword [esi + 8], eax
loc_1dc17:
    mov eax, dword [0xc3364]
    mov esi, dword [eax + 0x1e]
    mov bx, word [eax + 0x1c]
    sar esi, 0x10
    test di, di
    je near loc_1ddf1
    cmp dword [0xc3368], strict dword 0x3c0
    jge near loc_1dd2a
    cmp byte [eax + 0x14], 0x10
    jbe near loc_1dd2a
    mov ecx, dword [0xc3374]
    sar ecx, 0x10
    imul ecx, ecx, strict dword 0x623
    mov esi, 0x400
    sub esi, dword [0xc3368]
    mov ebx, dword [eax + 4]
    mov edx, dword [ecx + 0x8c028]
    sub edx, ebx
    mov ebx, edx
    mov edx, dword [ecx + 0x8c024]
    mov ecx, dword [eax]
    mov eax, edx
    mov edx, ebx
    sub eax, ecx
    call GET_ANGLE
    mov ebx, eax
    mov eax, dword [0xc3368]
    neg esi
    cmp eax, strict dword 0x200
    jge short loc_1dcb4
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor edx, edx
    mov dword [eax + 0x8c05c], edx
    mov dword [eax + 0x8c060], edx
    jmp near loc_1ddf1
loc_1dcb4:
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [0x939c]
    mov ecx, 0x10
    sub edx, strict dword 0x2000
    mov eax, dword [eax + 0x8c05c]
    imul edx
    shrd eax, edx, cl
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov dword [edx + 0x8c05c], eax
    mov eax, dword [0x939c]
    mov edx, dword [edx + 0x8c060]
    sub eax, strict dword 0x2000
    mov dword [ebp - 0x20], edx
    mov edx, eax
    mov eax, dword [ebp - 0x20]
    imul edx
    shrd eax, edx, cl
    mov edx, dword [0xc3374]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov dword [edx + 0x8c060], eax
    jmp near loc_1ddf1
loc_1dd2a:
    mov edx, dword [0xc3364]
    mov cx, word [edx + 0xe]
    cmp cx, 0x1334
    je near loc_1ddf1
    cmp cx, 0x157d
    je near loc_1ddf1
    cmp cx, 0x148c
    je near loc_1ddf1
    mov eax, dword [0xc3372]
    sar eax, 0x10
    mov dword [ebp - 0x20], eax
    mov ecx, dword [ebp - 0x20]
    shl eax, 3
    add eax, ecx
    shl eax, 3
    sub eax, ecx
    mov eax, dword [eax + 0x20463]
    cmp eax, dword [edx + 8]
    jne short loc_1dd8a
    cmp dword [0xbffe3], 2
    jge short loc_1ddbe
    cmp dword [0xbffe7], 2
    jge short loc_1ddbe
loc_1dd8a:
    mov eax, dword [0xc3360]
    test byte [eax], 1
    jne near loc_1e0da
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov cx, word [0xc3374]
    cmp cx, word [eax + 0x8c11e]
    je near loc_1e0da
    add esi, esi
    jmp short loc_1ddf1
loc_1ddbe:
    mov eax, dword [0xc3360]
    test byte [eax], 3
    jne near loc_1e0da
    mov eax, dword [0xc3374]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dx, word [0xc3374]
    cmp dx, word [eax + 0x8c11e]
    je near loc_1e0da
    shl esi, 2
loc_1ddf1:
    mov edx, dword [0xc3364]
    mov eax, dword [edx + 0x16]
    sar eax, 0x10
    mov dword [ebp - 0x20], eax
    mov ecx, dword [ebp - 0x20]
    shl eax, 2
    add eax, ecx
    shl eax, 3
    mov cx, word [eax + 0x20a08a]
    cmp cx, 1
    je short loc_1de2c
    mov ax, word [edx + 0xe]
    cmp ax, strict word 0x1c18
    jb short loc_1de43
    jbe short loc_1de41
    cmp ax, strict word 0x1c1f
    jne short loc_1de43
    jmp short loc_1de41
loc_1de2c:
    cmp cx, cx
    jne short loc_1de43
    mov ax, word [edx + 0xe]
    cmp ax, strict word 0x1702
    jb short loc_1de43
    cmp ax, strict word 0x1703
    ja short loc_1de43
loc_1de41:
    sar esi, 1
loc_1de43:
    mov eax, ebx
    and ah, 7
    cwde
    add eax, eax
    mov dword [ebp - 0x1c], eax
    mov eax, dword [eax + 0x1bd566]
    sar eax, 0x10
    imul eax, esi
    movsx ebx, bx
    lea edx, [ebx + 0x200]
    and edx, strict dword 0x7ff
    add edx, edx
    mov dword [ebp - 0x18], edx
    mov edx, dword [edx + 0x1bd566]
    sar edx, 0x10
    imul edx, esi
    mov ecx, dword [0xc3364]
    push dword 0x10001
    mov ebx, dword [0xc3372]
    mov ecx, dword [ecx + 0x22]
    sar ebx, 0x10
    sar ecx, 0x10
    mov dword [ebp - 0x20], ebx
    sar eax, 0xe
    sar edx, 0xe
    mov ebx, eax
    mov eax, dword [ebp - 0x20]
    call 0x24024
    mov edx, dword [0xc3372]
    sar edx, 0x10
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, dword [0xc3364]
    mov word [eax + 0x20441], bx
    mov eax, ebx
    cmp word [edx + 0xe], 0x10a4
    je near loc_1e050
    movsx edx, ax
    and edx, strict dword 0xc000
    cmp edx, strict dword 0x8000
    jne near loc_1df94
    and ah, 0x1f
    cwde
    call 0x516f0
    test eax, eax
    je near loc_1e050
    mov edx, dword [0xc3364]
    mov ebx, dword [edx + 0x16]
    sar ebx, 0x10
    lea eax, [ebx*4]
    add eax, ebx
    mov eax, dword [nosplit eax*8 + 0x20a06c]
    mov ebx, dword [ebp - 0x1c]
    mov dword [edx + 8], eax
    mov ebx, dword [ebx + 0x1bd566]
    sar ebx, 0x10
    imul ebx, esi
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x1bd566]
    sar eax, 0x10
    mov ecx, dword [edx + 0x22]
    mov edx, eax
    imul edx, esi
    push dword 0x10001
    mov eax, dword [0xc3372]
    sar ecx, 0x10
    sar eax, 0x10
    sar ebx, 0xe
    sar edx, 0xe
    call 0x24024
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x16]
    mov edx, MOVE_TRACE_1
    sar eax, 0x10
    call 0x514c0
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    shl eax, 3
    mov edx, MOVE_TRACE_2
    jmp near loc_1e027
loc_1df94:
    cmp edx, strict dword 0x4000
    jne near loc_1e050
    and ah, 3
    cwde
    call 0x51760
    test eax, eax
    je near loc_1e050
    mov ebx, dword [ebp - 0x1c]
    mov ebx, dword [ebx + 0x1bd566]
    sar ebx, 0x10
    imul ebx, esi
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x1bd566]
    sar eax, 0x10
    mov edx, eax
    imul edx, esi
    mov ecx, dword [0xc3364]
    push dword 0x10001
    mov ecx, dword [ecx + 0x22]
    mov eax, dword [0xc3372]
    sar ecx, 0x10
    sar eax, 0x10
    sar ebx, 0xe
    sar edx, 0xe
    call 0x24024
    mov eax, dword [0xc3364]
    mov eax, dword [eax + 0x16]
    mov edx, MOVE_TRACE_3
    sar eax, 0x10
    call 0x514c0
    mov edx, dword [0xc3364]
    mov edx, dword [edx + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    shl eax, 3
    mov edx, MOVE_TRACE_4
loc_1e027:
    add eax, strict dword 0x20a068
    call 0x514ec
    mov ebx, dword [0xc3364]
    mov edx, dword [ebx + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [nosplit eax*8 + 0x20a070]
    mov dword [ebx + 8], eax
loc_1e050:
    test di, di
    je near loc_1e0da
    mov esi, dword [0xc3364]
    mov edx, dword [esi + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    shl eax, 3
    test byte [eax + 0x20a074], 1
    je short loc_1e095
    cmp byte [edx + 0xc6850], 1
    jne short loc_1e08d
    mov eax, dword [esi + 0xd]
    mov edx, 0x10
    jmp short loc_1e0a1
loc_1e08d:
    mov edx, dword [eax + 0x20a079]
    jmp short loc_1e09b
loc_1e095:
    mov edx, dword [eax + 0x20a081]
loc_1e09b:
    mov eax, dword [esi + 0xd]
    sar edx, 0x18
loc_1e0a1:
    sar eax, 0x18
    sub edx, eax
    sar edx, 1
    add eax, edx
    mov byte [esi + 0x10], al
    mov eax, dword [0xc3364]
    mov edx, dword [eax + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a080], 0x441
    jne short loc_1e0da
    mov eax, dword [0xc3372]
    sar eax, 0x10
    call DELETE_SPRITE
loc_1e0da:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

parse_if_else:
    push ebp
    mov ebp, esp
    push edx
    test eax, eax
    je short loc_1e0f5
    add dword [INSTRUCTION_POINTER], 8
    jmp short loc_1e111
loc_1e0f5:
    mov eax, dword [INSTRUCTION_POINTER]
    mov eax, dword [eax + 4]
    mov edx, dword [eax]
    mov dword [INSTRUCTION_POINTER], eax
    cmp edx, 0xa
    jne short loc_1e116
    add eax, 8
    mov dword [INSTRUCTION_POINTER], eax
loc_1e111:
    call PARSE
loc_1e116:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
