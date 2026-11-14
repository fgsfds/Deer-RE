bits 32
org 0x58c00

%define PRINT_NOTICE 0x5130c
%define LOG_NUMBER 0x51350
%define KRAND 0x46fa0
%define ROTATE_SPRITE 0x47f83
%define HITSCAN 0x414ef
%define INSERT_SPRITE 0x40d50
%define CHANGE_SPRITE_SECT 0x410f9

register_kill_info:
    push ebp
    mov ebp, esp
    push ecx
    mov cx, word [0xab10]
    test ax, ax
    jl short loc_58c16
    cmp ax, strict word 0x2400
    jl short loc_58c25
loc_58c16:
    mov eax, 0x4f7c
    call PRINT_NOTICE
    jmp near loc_58d04
loc_58c25:
    test edx, edx
    jge short loc_58c40
    mov eax, 0x4fac
    call PRINT_NOTICE
    mov cx, word [0xab10]
    lea esp, [ebp - 4]
    pop ecx
    pop ebp
    ret
loc_58c40:
    cmp ax, strict word 0x1a02
    jb short loc_58c74
    jbe near loc_58cb6
    cmp ax, strict word 0x1bc7
    jb short loc_58c69
    jbe short loc_58ca1
    cmp ax, strict word 0x1bc8
    jbe near loc_58cbd
    cmp ax, strict word 0x1bc9
    je short loc_58caf
    jmp near loc_58cc4
loc_58c69:
    cmp ax, strict word 0x1bc6
    je short loc_58c93
    jmp near loc_58cc4
loc_58c74:
    cmp ax, strict word 0x1351
    jb short loc_58c84
    jbe short loc_58c9a
    cmp ax, strict word 0x1603
    je short loc_58c8c
    jmp short loc_58cc4
loc_58c84:
    cmp ax, strict word 0x10a4
    je short loc_58ca8
    jmp short loc_58cc4
loc_58c8c:
    mov ecx, 0x6b8
    jmp short loc_58ce2
loc_58c93:
    mov ecx, 0x1bca
    jmp short loc_58ce2
loc_58c9a:
    mov ecx, 0x6b7
    jmp short loc_58ce2
loc_58ca1:
    mov ecx, 0x1bcb
    jmp short loc_58ce2
loc_58ca8:
    mov ecx, 0x6b9
    jmp short loc_58ce2
loc_58caf:
    mov ecx, 0x1bcc
    jmp short loc_58ce2
loc_58cb6:
    mov ecx, 0x6ba
    jmp short loc_58ce2
loc_58cbd:
    mov ecx, 0x1bcd
    jmp short loc_58ce2
loc_58cc4:
    xor ecx, ecx
    xor edx, edx
    mov word [0xab10], cx
    mov dword [0xab14], edx
    mov cx, word [0xab10]
    lea esp, [ebp - 4]
    pop ecx
    pop ebp
    ret
loc_58ce2:
    mov ah, byte [0xab08]
    mov dword [0xab14], edx
    mov dword [0xab18], ebx
    or ah, 8
    mov word [0xab10], cx
    mov byte [0xab08], ah
loc_58d04:
    mov cx, word [0xab10]
    lea esp, [ebp - 4]
    pop ecx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp word [0xab10], 0
    jle near loc_58f34
    cmp dword [0xab14], 0
    jl near loc_58f34
    cmp dword [0xab18], 0
    jl near loc_58f34
    mov ecx, dword [0x216f84]
    push ecx
    mov esi, dword [0x216f88]
    push esi
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    mov ebx, 0x8000
    mov edx, dword [0xab0e]
    push byte 0
    sar edx, 0x10
    mov eax, 0x270000
    push edx
    xor ecx, ecx
    mov edx, 0xb90000
    call ROTATE_SPRITE
    cmp dword [0xbffeb], 4
    jge near loc_58f34
    mov eax, dword [0xab14]
    mov edx, eax
    mov ebx, 0xa
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [0xab14]
    mov ebx, edx
    mov edx, eax
    mov esi, 0x64
    sar edx, 0x1f
    idiv esi
    mov esi, 0xa
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov edi, eax
    mov eax, dword [0xab14]
    mov edx, eax
    mov esi, 0x3e8
    sar edx, 0x1f
    idiv esi
    mov esi, 0x64
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov esi, eax
    mov eax, dword [0x216f84]
    push eax
    mov edx, dword [0x216f88]
    push edx
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    xor ecx, ecx
    push byte 0
    add ebx, strict dword 0x679
    mov eax, 0x400000
    push ebx
    mov edx, 0xb40000
    mov ebx, 0x4800
    call ROTATE_SPRITE
    test esi, esi
    jne short loc_58e1c
    test edi, edi
    jbe short loc_58e54
loc_58e1c:
    mov ebx, dword [0x216f84]
    push ebx
    mov ecx, dword [0x216f88]
    push ecx
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    mov edx, 0xb40000
    push byte 0
    add edi, strict dword 0x679
    mov eax, 0x3a0000
    push edi
    mov ebx, 0x4800
    xor ecx, ecx
    call ROTATE_SPRITE
loc_58e54:
    test esi, esi
    jbe short loc_58e8f
    mov edi, dword [0x216f84]
    push edi
    mov eax, dword [0x216f88]
    push eax
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    mov ebx, 0x4800
    push byte 0
    add esi, strict dword 0x679
    mov edx, 0xb40000
    push esi
    xor ecx, ecx
    mov eax, 0x340000
    call ROTATE_SPRITE
loc_58e8f:
    mov eax, dword [0xab18]
    mov edx, eax
    mov ebx, 0xa
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [0xab18]
    mov ebx, edx
    mov edx, eax
    mov esi, 0x64
    sar edx, 0x1f
    idiv esi
    mov esi, 0xa
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov edx, dword [0x216f84]
    push edx
    mov ecx, dword [0x216f88]
    push ecx
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    add ebx, strict dword 0x679
    mov esi, eax
    push byte 0
    mov eax, 0x400000
    mov edx, 0xbe0000
    push ebx
    xor ecx, ecx
    mov ebx, 0x4800
    call ROTATE_SPRITE
    test esi, esi
    jbe short loc_58f34
    mov edi, dword [0x216f84]
    push edi
    mov eax, dword [0x216f88]
    push eax
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    mov ebx, 0x4800
    push byte 0
    add esi, strict dword 0x679
    mov edx, 0xbe0000
    push esi
    xor ecx, ecx
    mov eax, 0x3a0000
    call ROTATE_SPRITE
loc_58f34:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    mov esi, eax
    call 0x59b44
    mov dword [ebp - 0x18], eax
    test esi, esi
    jbe short loc_58f60
    cmp esi, 3
    jbe short loc_58f72
    jmp short loc_58fce
loc_58f60:
    mov ecx, 0x6bb
    mov esi, 0x6000
    mov dword [ebp - 0x20], ecx
    mov dword [ebp - 0x1c], esi
    jmp short loc_58f82
loc_58f72:
    mov edx, 0x6bc
    mov ebx, 0x6000
    mov dword [ebp - 0x20], edx
    mov dword [ebp - 0x1c], ebx
loc_58f82:
    mov eax, dword [ebp - 0x18]
    xor edi, edi
    test eax, eax
    jle short loc_58fce
    mov esi, 0xd80000
loc_58f90:
    mov edx, dword [0x216f84]
    push edx
    mov ebx, dword [0x216f88]
    push ebx
    push byte 0
    push byte 0
    push dword 0x8a
    push byte 0
    mov ecx, dword [ebp - 0x20]
    mov eax, esi
    push byte 0
    mov edx, 0xb80000
    mov ebx, dword [ebp - 0x1c]
    push ecx
    xor ecx, ecx
    inc edi
    call ROTATE_SPRITE
    mov eax, dword [ebp - 0x18]
    add esi, strict dword 0xd0000
    cmp edi, eax
    jl short loc_58f90
loc_58fce:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

status_dispatch:
    dd loc_59027 - 0x10000
    dd loc_5902e - 0x10000
    dd loc_5902e - 0x10000
    dd loc_59035 - 0x10000
    dd loc_5903c - 0x10000
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov eax, dword [0xcf65c]
    mov edx, 0x4fd8
    sar eax, 0x10
    call 0x51408
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c42f]
    xor ebx, ebx
    cmp eax, 4
    ja short loc_59043
    jmp dword [cs:nosplit eax*4 + status_dispatch - 0x10000]
loc_59027:
    call 0x56718
    jmp short loc_59041
loc_5902e:
    call 0x55fc0
    jmp short loc_59041
loc_59035:
    call 0x55928
    jmp short loc_59041
loc_5903c:
    call 0x56ad8
loc_59041:
    mov ebx, eax
loc_59043:
    mov edx, dword [0x216f84]
    push edx
    mov ecx, dword [0x216f88]
    push ecx
    push byte 0
    push byte 0
    push dword 0x8a
    push byte 0
    mov eax, 0x610000
    push byte 0
    add ebx, strict dword 0x6af
    mov edx, 0xbb0000
    push ebx
    xor ecx, ecx
    mov ebx, 0x8000
    call ROTATE_SPRITE
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

render_status_bar:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov eax, dword [0xcf65c]
    mov edx, 0x4ff4
    sar eax, 0x10
    call 0x51408
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 4
    je short loc_590c8
    call 0x267b0
    cmp eax, strict dword 0x12c
    je near loc_592e6
loc_590c8:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c0a2]
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c0a4]
    sar edx, 0x10
    sar eax, 0x10
    sub edx, eax
    mov eax, edx
    test eax, eax
    jns short loc_59100
    neg eax
loc_59100:
    cmp eax, 0x10
    jle short loc_5910f
    mov dword [0xab08], 2
loc_5910f:
    call 0x5743c
    mov edx, eax
    mov word [ebp - 0x18], ax
    call 0x50fe0
    and eax, strict dword 0x3ff
    cmp eax, 0x40
    jge short loc_59146
    sub eax, 0x20
    add edx, eax
    mov word [ebp - 0x18], dx
    mov dh, byte [ebp - 0x17]
    mov ebx, 4
    and dh, 7
    mov dword [0xab08], ebx
    mov byte [ebp - 0x17], dh
loc_59146:
    cmp dword [0xab08], 0
    je near loc_592e6
    mov edx, dword [0xab1c]
    lea eax, [edx + 1]
    mov dword [0xab1c], eax
    mov eax, 3
    call 0x51028
    cmp dword [0xbffeb], 4
    jge short loc_591a4
    mov edx, dword [0x216f84]
    push edx
    mov ebx, dword [0x216f88]
    push ebx
    push byte 0
    push byte 0
    push dword 0xda
    push byte 0
    push byte 4
    xor ecx, ecx
    xor eax, eax
    push dword 0x66f
    mov edx, 0xa60000
    mov ebx, 0x8000
    jmp short loc_591d1
loc_591a4:
    mov edi, dword [0x216f84]
    push edi
    mov eax, dword [0x216f88]
    push eax
    push byte 0
    push byte 0
    push dword 0xda
    push byte 0
    push byte 4
    mov ebx, 0x8000
    mov edx, 0xa60000
    push dword 0x6ae
    xor ecx, ecx
    xor eax, eax
loc_591d1:
    call ROTATE_SPRITE
    call 0x58d14
    mov ecx, dword [0xbffeb]
    test ecx, ecx
    jle short loc_5921f
    cmp ecx, 4
    jge short loc_5921f
    mov edi, dword [0x216f84]
    push edi
    mov eax, dword [0x216f88]
    push eax
    push byte 0
    push byte 0
    push dword 0xda
    push byte 0
    push byte 4
    mov ebx, 0x8000
    mov edx, 0xa60000
    push dword 0x6bd
    xor ecx, ecx
    mov eax, 0xd80000
    call ROTATE_SPRITE
loc_5921f:
    call 0x58fec
    mov edx, dword [0x216f84]
    push edx
    mov ebx, dword [0x216f88]
    push ebx
    push byte 0
    push byte 0
    push dword 0x8a
    push byte 0
    mov ecx, dword [ebp - 0x1a]
    mov eax, 0x9b0000
    push byte 0
    sar ecx, 0x10
    push dword 0x665
    mov edx, 0xb90000
    mov ebx, 0x8000
    call ROTATE_SPRITE
    cmp dword [0xbffeb], 4
    jge short loc_592b3
    mov ecx, dword [0xbf560]
    sar ecx, 0x10
    imul ecx, ecx, strict dword 0x623
    mov esi, dword [0x216f84]
    push esi
    mov edi, dword [0x216f88]
    push edi
    push byte 0
    push byte 0
    push dword 0x8a
    push byte 0
    mov ebx, 0x8000
    mov edx, 0xb70000
    push byte 0
    mov eax, 0x12d0000
    mov ecx, dword [ecx + 0x8c0a2]
    push dword 0x666
    sar ecx, 0x10
    call ROTATE_SPRITE
loc_592b3:
    cmp dword [0xbffeb], 3
    jle short loc_592c1
    call 0x580c8
loc_592c1:
    mov eax, dword [0xbffeb]
    call 0x58f40
    cmp dword [0xbffeb], 3
    jle short loc_592de
    mov eax, dword [0xab0c]
    call 0x58a5c
loc_592de:
    xor ebx, ebx
    mov dword [0xab08], ebx
loc_592e6:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    mov dword [0xab08], 1
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    or dword [0xab08], eax
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov ecx, 1
    xor edx, edx
    xor ebx, ebx
    mov dword [0xab0c], edx
    mov dword [0xab14], ebx
    xor edx, edx
    mov dword [0xab08], ecx
    mov word [0xab10], dx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 10 db 0    ; Alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    mov ecx, edx
    movsx ebx, ax
    mov edx, 0x5008
    mov eax, ebx
    movsx ecx, cx
    call 0x513b8
    mov edx, 0x5020
    mov eax, ecx
    call 0x513b8
    lea edx, [ebx*4]
    sub edx, ebx
    shl edx, 2
    sub edx, ebx
    lea ebx, [ecx*4]
    sub ebx, ecx
    shl ebx, 2
    sub ebx, ecx
    shl edx, 2
    shl ebx, 2
    mov eax, dword [edx + 0x19136c]
    sub eax, dword [ebx + 0x19136c]
    mov esi, dword [ebx + 0x191368]
    mov ecx, eax
    mov eax, dword [edx + 0x191368]
    mov edx, ecx
    sub eax, esi
    call 0x3b4fc
    and ah, 7
    mov edx, eax
    call 0x5743c
    movsx ebx, ax
    movsx eax, dx
    sub ebx, eax
    mov eax, ebx
    test eax, eax
    jns short loc_593d5
    neg eax
loc_593d5:
    cmp eax, strict dword 0x200
    setl al
    and eax, strict dword 0xff
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x14
    mov word [ebp - 0x18], ax
    mov ebx, dword [ebp - 0x1a]
    sar ebx, 0x10
    mov edx, 0x5038
    mov eax, ebx
    call 0x513b8
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    shl eax, 2
    mov edx, 0x504c
    add eax, strict dword 0x191368
    mov ecx, 0x12c00
    call 0x513e4
    mov ebx, dword [0x2175e0]
    mov edx, 0xffffffff
    sar ebx, 0x10
    mov word [ebp - 0x1c], dx
    test ebx, ebx
    jl near loc_59591
loc_5944c:
    movsx esi, bx
    imul edi, ebx, 0x2c
    mov eax, dword [nosplit ebx*2 + 0x18cf66]
    sar eax, 0x10
    mov edx, 0x5060
    mov dword [ebp - 0x20], eax
    mov eax, esi
    call 0x513b8
    cmp word [edi + 0x191392], 0
    jle near loc_59586
    cmp word [edi + 0x191376], 0x1ba1
    jne short loc_594d9
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    mov edx, esi
    mov dword [ebp - 0x24], eax
    call 0x59350
    test eax, eax
    je short loc_594d9
    imul esi, dword [ebp - 0x24], 0x2c
    mov eax, dword [edi + 0x191368]
    mov edx, dword [esi + 0x191368]
    sub edx, eax
    mov eax, edx
    test eax, eax
    jns short loc_594b2
    neg eax
loc_594b2:
    mov dword [ebp - 0x28], eax
    mov eax, dword [esi + 0x19136c]
    sub eax, dword [edi + 0x19136c]
    mov edi, dword [ebp - 0x28]
    test eax, eax
    jns short loc_594ca
    neg eax
loc_594ca:
    add eax, edi
    cmp eax, ecx
    jge near loc_59586
    jmp near loc_59580
loc_594d9:
    imul edx, ebx, 0x2c
    cmp word [edx + 0x191376], 0x1ba0
    jne short loc_5953d
    call 0x50fe0
    and eax, strict dword 0xff
    cmp eax, 0x20
    jle near loc_59586
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul eax, eax, 0x2c
    mov edi, dword [edx + 0x191368]
    mov dword [ebp - 0x28], eax
    mov eax, dword [eax + 0x191368]
    sub eax, edi
    mov esi, dword [ebp - 0x28]
    test eax, eax
    jns short loc_5951d
    neg eax
loc_5951d:
    mov edi, eax
    mov esi, dword [esi + 0x19136c]
    mov eax, dword [edx + 0x19136c]
    sub esi, eax
    mov eax, esi
    test eax, eax
    jns short loc_59535
    neg eax
loc_59535:
    add eax, edi
    cmp eax, ecx
    jge short loc_59586
    jmp short loc_59580
loc_5953d:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul eax, eax, 0x2c
    mov dword [ebp - 0x28], eax
    mov esi, dword [eax + 0x191368]
    mov eax, dword [edx + 0x191368]
    sub esi, eax
    mov eax, esi
    mov esi, dword [ebp - 0x28]
    test eax, eax
    jns short loc_59562
    neg eax
loc_59562:
    mov edi, eax
    mov esi, dword [esi + 0x19136c]
    mov eax, dword [edx + 0x19136c]
    sub esi, eax
    mov eax, esi
    test eax, eax
    jns short loc_5957a
    neg eax
loc_5957a:
    add eax, edi
    cmp eax, ecx
    jge short loc_59586
loc_59580:
    mov ecx, eax
    mov word [ebp - 0x1c], bx
loc_59586:
    mov ebx, dword [ebp - 0x20]
    test ebx, ebx
    jge near loc_5944c
loc_59591:
    cmp ecx, strict dword 0x12c00
    jge short loc_59605
    mov ebx, dword [ebp - 0x1e]
    sar ebx, 0x10
    cmp ebx, -1
    je short loc_59605
    mov edx, 0x5074
    mov eax, ebx
    lea ecx, [ebx*4]
    call 0x513b8
    sub ecx, ebx
    mov edx, dword [ebp - 0x1a]
    shl ecx, 2
    sar edx, 0x10
    sub ecx, ebx
    lea ebx, [edx*4]
    sub ebx, edx
    shl ebx, 2
    shl ecx, 2
    sub ebx, edx
    mov eax, dword [ecx + 0x191368]
    shl ebx, 2
    mov edx, dword [ecx + 0x19136c]
    mov esi, dword [ebx + 0x19136c]
    mov edi, dword [ebx + 0x191368]
    sub edx, esi
    sub eax, edi
    call 0x3b4fc
    and ah, 7
    mov word [ebx + 0x191384], ax
    jmp short loc_5962b
loc_59605:
    call 0x50fe0
    mov edx, dword [ebp - 0x1a]
    and ah, 7
    sar edx, 0x10
    mov ebx, eax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov word [nosplit eax*4 + 0x191384], bx
loc_5962b:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x1c
    xor edx, edx
    mov edi, dword [0x2175e0]
    mov dword [ebp - 0x1c], edx
    mov dword [ebp - 0x20], edx
    mov dword [ebp - 0x24], edx
    sar edi, 0x10
    mov dword [ebp - 0x28], edx
    test edi, edi
    jl near loc_59721
loc_59662:
    movsx eax, di
    imul ebx, edi, 0x2c
    mov edx, 0x5088
    add ebx, strict dword 0x191368
    mov ecx, dword [nosplit edi*2 + 0x18cf66]
    call 0x513b8
    mov dx, word [ebx + 0x18]
    sar ecx, 0x10
    test dx, dx
    jl short loc_59694
    cmp dx, word [0x217fce]
    jl short loc_596ad
loc_59694:
    mov edx, dword [ebx + 0x16]
    mov eax, 0x509c
    sar edx, 0x10
    call LOG_NUMBER
    mov eax, edi
    call 0x40ecd
    jmp short loc_596ff
loc_596ad:
    mov edx, dword [ebx + 0x16]
    sar edx, 0x10
    imul edx, edx, 0x28
    cmp word [edx + 0x20a08c], 0x7d3
    jne short loc_596ff
    mov ax, word [ebx + 0x24]
    test ax, ax
    jl short loc_596d0
    cmp ax, strict word 0x20
    jl short loc_596d8
loc_596d0:
    mov word [ebx + 0x24], 0
    jmp short loc_596ff
loc_596d8:
    mov edx, dword [edx + 0x20a070]
    mov eax, dword [ebx + 0x22]
    mov di, word [ebx + 0x24]
    sar eax, 0x10
    add edx, strict dword 0x100
    mov eax, dword [nosplit eax*4 + 0xab24]
    inc edi
    add edx, eax
    mov word [ebx + 0x24], di
    mov dword [ebx + 8], edx
loc_596ff:
    cmp word [ebx + 0xe], 0x1ba1
    jne short loc_59717
    mov dx, word [ebx + 0x2a]
    test dx, dx
    jle short loc_59717
    mov esi, edx
    dec esi
    mov word [ebx + 0x2a], si
loc_59717:
    mov edi, ecx
    test ecx, ecx
    jge near loc_59662
loc_59721:
    mov edi, dword [0x2175de]
    sar edi, 0x10
    test edi, edi
    jl near loc_598b3
loc_59732:
    mov eax, dword [nosplit edi*2 + 0x18cf66]
    sar eax, 0x10
    mov dword [ebp - 0x30], eax
    movsx eax, di
    mov edx, 0x50bc
    mov dword [ebp - 0x18], eax
    call 0x513b8
    imul eax, edi, 0x2c
    mov esi, 0x191368
    add esi, eax
    mov dword [ebp - 0x2c], eax
    mov ax, word [esi + 0x18]
    test ax, ax
    jl short loc_5976e
    cmp ax, word [0x217fce]
    jl short loc_5978a
loc_5976e:
    mov edx, dword [esi + 0x16]
    mov eax, 0x50d0
    sar edx, 0x10
    call LOG_NUMBER
    mov eax, edi
    call 0x40ecd
    jmp near loc_598a8
loc_5978a:
    push dword 0x1000040
    mov eax, dword [ebp - 0x18]
    mov ebx, dword [esi + 0x20]
    mov edx, dword [esi + 0x1e]
    xor ecx, ecx
    sar ebx, 0x10
    sar edx, 0x10
    call 0x24024
    push dword 0x10001
    push byte 0x20
    lea eax, [ebp - 0x28]
    push eax
    lea eax, [ebp - 0x24]
    mov ecx, dword [esi + 0x16]
    push eax
    lea eax, [ebp - 0x20]
    mov ebx, dword [esi + 8]
    push eax
    lea eax, [ebp - 0x1c]
    mov edx, dword [esi + 4]
    push eax
    sar ecx, 0x10
    mov eax, dword [esi]
    call 0x46fb4
    mov ebx, dword [ebp - 0x24]
    mov edx, dword [ebp - 0x2c]
    lea eax, [ebx - 0x800]
    mov ecx, dword [edx + 0x191370]
    cmp eax, ecx
    jge near loc_59885
    mov edx, 0x32b
    mov eax, edi
    call 0x41158
    mov word [esi + 0x2a], 0x2580
    mov dword [esi + 8], ebx
    mov bx, word [esi + 0xe]
    mov word [esi + 0x24], 0
    cmp bx, 0x1ba0
    jne near loc_598a8
    mov eax, dword [0xcf65c]
    mov edx, 0x50ec
    sar eax, 0x10
    mov word [esi + 0xc], 1
    call 0x51408
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    imul eax, eax, 0x28
    cmp word [eax + 0x20a08c], 0x7d3
    jne short loc_59862
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    mov eax, 0x5a
    sar edx, 0x10
    call 0x51c68
    jmp short loc_598a8
loc_59862:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    mov eax, 0x59
    sar edx, 0x10
    call 0x51c68
    jmp short loc_598a8
loc_59885:
    mov eax, dword [edx + 0x19138a]
    sar eax, 0x10
    lea esi, [ecx + eax]
    mov dword [edx + 0x191370], esi
    mov eax, edx
    mov dl, byte [edx + 0x19138d]
    add dl, 2
    mov byte [eax + 0x19138d], dl
loc_598a8:
    mov edi, dword [ebp - 0x30]
    test edi, edi
    jge near loc_59732
loc_598b3:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 4
    mov esi, edx
    mov ebx, dword [0x216f7c]
    sub ebx, dword [0xab20]
    cmp ebx, 0x78
    jb near loc_59b38
    cmp dword [0xaba4], 0
    jne short loc_59907
    cwde
    imul eax, eax, strict dword 0x623
    mov edx, 0x8be10
    add edx, eax
    mov eax, 0x95
    call 0x14e68
    jmp near loc_59b38
loc_59907:
    cmp esi, 3
    jg near loc_59b38
    movsx ebx, ax
    mov eax, ebx
    imul edi, ebx, strict dword 0x623
    mov edx, 0x5100
    mov ecx, 0x8be10
    call 0x51408
    add ecx, edi
    mov edx, 0x5114
    mov eax, ecx
    call 0x5144c
    mov dx, word [ecx + 0x29a]
    mov ebx, ecx
    test dx, dx
    jl short loc_59951
    mov eax, edx
    cmp ax, word [0x217fce]
    jl short loc_5996d
loc_59951:
    mov edx, dword [ebx + 0x298]
    mov eax, 0x5128
    sar edx, 0x10
    call LOG_NUMBER
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_5996d:
    mov eax, dword [ecx + 0x298]
    mov edx, 0x32a
    sar eax, 0x10
    call INSERT_SPRITE
    test ax, ax
    jl short loc_5998b
    cmp ax, strict word 0x1000
    jl short loc_5999e
loc_5998b:
    mov eax, 0x514c
    call PRINT_NOTICE
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_5999e:
    cwde
    lea ebx, [eax*4]
    sub ebx, eax
    shl ebx, 2
    sub ebx, eax
    shl ebx, 2
    add ebx, strict dword 0x191368
    jne short loc_599cb
    mov eax, 0x5170
    call PRINT_NOTICE
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_599cb:
    mov edx, dword [ecx + 0x292]
    sar edx, 0x10
    add edx, strict dword 0x200
    and edx, strict dword 0x7ff
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    mov eax, dword [ecx + 0x214]
    sar edx, 7
    add eax, edx
    mov dword [ebx], eax
    mov ax, word [ecx + 0x294]
    and ah, 7
    cwde
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    mov edx, eax
    sar edx, 7
    mov eax, dword [ecx + 0x218]
    add eax, edx
    mov dword [ebx + 4], eax
    mov eax, dword [ecx + 0x21c]
    add eax, strict dword 0x1000
    mov dword [ebx + 8], eax
    mov ax, word [ecx + 0x294]
    and ah, 7
    mov word [ebx + 0x1c], ax
    mov eax, dword [ecx + 0x292]
    sar eax, 0x10
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    mov edx, eax
    shl eax, 2
    add eax, edx
    sar eax, 8
    mov word [ebx + 0x20], ax
    mov ax, word [ecx + 0x294]
    and ah, 7
    cwde
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    mov dword [ebp - 0x14], eax
    mov edx, dword [ebp - 0x14]
    shl eax, 2
    add eax, edx
    sar eax, 8
    mov word [ebx + 0x22], ax
    mov eax, 0x50
    sub ax, word [ecx + 0x220]
    shl eax, 6
    mov word [ebx + 0x24], ax
    test esi, esi
    jne short loc_59abb
    mov eax, 0x92
    mov word [ebx + 0xe], 0x1ba0
    mov edx, ecx
    mov word [ebx + 0xc], 0
    call 0x14e68
    jmp short loc_59aef
loc_59abb:
    mov word [ebx + 0xc], 0
    mov ah, byte [ebx + 0xd]
    or ah, 0x80
    mov edx, ecx
    mov byte [ebx + 0xd], ah
    mov eax, 0x94
    mov word [ebx + 0xe], 0x1ba1
    call 0x14e68
    mov edx, dword [edi + 0x8c106]
    mov eax, 0x58
    sar edx, 0x10
    call 0x51c68
loc_59aef:
    mov word [ebx + 0x1e], 0
    mov byte [ebx + 0x12], 4
    mov byte [ebx + 0x14], 0xa
    mov byte [ebx + 0x15], 0xa
    mov byte [ebx + 0x10], 0
    mov byte [ebx + 0x16], 0
    mov byte [ebx + 0x17], 0
    mov word [ebx + 0x26], 0
    mov word [ebx + 0x28], 0
    mov word [ebx + 0x2a], 0
    mov byte [ebx + 0x11], 0
    dec dword [0xaba4]
    call 0x592f0
    mov eax, dword [0x216f7c]
    mov dword [0xab20], eax
loc_59b38:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, dword [0xaba4]
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov edx, 4
    xor ebx, ebx
    mov dword [0xaba4], edx
    mov dword [0xab20], ebx
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    mov esi, eax
    movsx ebx, dx
    mov eax, ebx
    imul ebx, ebx, strict dword 0x623
    mov edx, 0x518c
    mov ecx, 0x8be10
    call 0x51408
    add ecx, ebx
    mov edx, 0x51ac
    mov eax, ecx
    movsx ebx, si
    call 0x5144c
    mov eax, ebx
    lea esi, [ebx*4]
    sub esi, ebx
    mov edx, 0x51cc
    shl esi, 2
    call 0x513b8
    sub esi, ebx
    mov eax, 0x191368
    shl esi, 2
    mov edx, 0x51ec
    add eax, esi
    call 0x513e4
    cmp word [esi + 0x191382], 0x32b
    jne short loc_59c11
    cmp word [esi + 0x191376], 0x1ba1
    je short loc_59c11
    mov eax, ebx
    call 0x40ecd
    mov edx, dword [0xaba4]
    inc edx
    mov eax, 0x40
    mov dword [0xaba4], edx
    call 0x59304
    mov eax, 0x93
    mov edx, ecx
    call 0x14e68
loc_59c11:
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    times 7 db 0    ; Alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov di, word [0x217fce]
    xor esi, esi
    xor eax, eax
    xor edx, edx
    mov word [0x18060e], si
    mov word [0x184e0e], si
    jmp short loc_59c6f
loc_59c45:
    mov ecx, 0x100
    mov bx, word [edx + 0x20a080]
    mov word [edx + 0x20a08e], cx
    cmp bx, 0x1b93
    jne short loc_59c6b
    movsx ecx, si
    inc esi
    mov word [nosplit ecx*2 + 0x21e990], ax
loc_59c6b:
    add edx, 0x28
    inc eax
loc_59c6f:
    movsx ebx, di
    cmp eax, ebx
    jl short loc_59c45
    xor eax, eax
loc_59c78:
    mov byte [eax + 0x21e350], al
    inc eax
    cmp eax, strict dword 0x100
    jl short loc_59c78
    push byte 1
    mov ecx, 0xa
    mov edx, 0x21e350
    mov eax, 2
    mov word [0x21ea18], si
    push byte 0x18
    mov ebx, ecx
    mov word [0x217fce], di
    call 0x4a387
    mov si, word [0x21ea18]
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x30
    mov dword [ebp - 0x28], eax
    mov dword [ebp - 0x2c], edx
    mov dword [ebp - 0x38], ebx
    mov word [ebp - 0xc], cx
    mov al, byte [0x169d5a]
    and al, 8
    test al, al
    jbe near loc_59f73
    xor edx, edx
    mov dword [ebp - 0x30], edx
    mov edx, dword [0x21ea16]
    sar edx, 0x10
    dec edx
    mov esi, 0x7fffffff
    test edx, edx
    jl short loc_59d6a
    lea ecx, [nosplit edx*2]
loc_59d03:
    mov eax, dword [ecx + 0x21e98e]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov eax, dword [eax + 0x20a066]
    sar eax, 0x10
    shl eax, 5
    mov edi, dword [ebp - 0x28]
    mov eax, dword [eax + 0x1be568]
    sub eax, edi
    test eax, eax
    jns short loc_59d2c
    neg eax
loc_59d2c:
    mov ebx, eax
    mov eax, dword [ecx + 0x21e98e]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov eax, dword [eax + 0x20a066]
    sar eax, 0x10
    shl eax, 5
    mov edi, dword [ebp - 0x2c]
    mov eax, dword [eax + 0x1be56c]
    sub eax, edi
    test eax, eax
    jns short loc_59d57
    neg eax
loc_59d57:
    add eax, ebx
    cmp eax, esi
    jge short loc_59d62
    mov esi, eax
    mov dword [ebp - 0x30], edx
loc_59d62:
    dec edx
    sub ecx, 2
    test edx, edx
    jge short loc_59d03
loc_59d6a:
    mov edx, dword [ebp - 0x30]
    mov edi, dword [ebp - 0xe]
    mov edx, dword [nosplit edx*2 + 0x21e98e]
    mov eax, 0xc9
    sar edx, 0x10
    sar edi, 0x10
    push edx
    sub eax, edi
    mov esi, dword [ebp + 6]
    push eax
    lea eax, [edx*4]
    mov ecx, dword [ebp - 0x38]
    add eax, edx
    sar esi, 0x10
    mov ebx, dword [nosplit eax*8 + 0x20a070]
    mov edx, dword [ebp - 0x2c]
    add ebx, ebx
    mov eax, dword [ebp - 0x28]
    sub ebx, ecx
    mov ecx, esi
    call 0x336b2
    mov ecx, dword [ebp + 0xc]
    mov edx, dword [ebp - 0x2c]
    mov eax, dword [ebp - 0x28]
    mov ebx, esi
    call 0x1675c
    call 0x3b895
    mov ecx, 0x140
    mov eax, dword [0x215c8c]
    mov edx, dword [0x215c90]
    mov ebx, dword [0x215c88]
    sub eax, edx
    mov esi, dword [0x215c84]
    mov edx, eax
    lea eax, [edi - 0x64]
    add ebx, esi
    imul edx
    idiv ecx
    mov edx, dword [0x215c88]
    sar ebx, 1
    mov dword [ebp - 0x20], edx
    mov edx, dword [0x215c84]
    add eax, ebx
    mov dword [ebp - 0x18], edx
    mov edx, dword [ebp - 0x20]
    mov ebx, dword [ebp - 0x18]
    cmp edx, ebx
    jge near loc_59f6c
    mov edx, eax
    mov eax, dword [ebp - 0x20]
    neg edx
    add eax, edx
    lea edi, [ebx*4]
    mov dword [ebp - 0x1c], eax
    mov eax, dword [ebp - 0x20]
    add edx, ebx
    shl eax, 2
    mov dword [ebp - 0x34], edx
    mov dword [ebp - 0x24], eax
loc_59e33:
    mov edx, dword [ebp - 0x24]
    mov esi, dword [0x215c4c]
    mov eax, dword [0x190f70]
    mov ebx, dword [edi + 0x215ca0]
    mov dword [ebp - 0x14], eax
    mov ecx, dword [edx + 0x215ca0]
    mov eax, dword [ebp - 0x1c]
    add esi, ecx
    mov ecx, dword [0x215c4c]
    test eax, eax
    jns short loc_59e61
    neg eax
loc_59e61:
    sar eax, 2
    add ecx, ebx
    cmp eax, 0x1f
    jge short loc_59e79
    mov eax, dword [ebp - 0x1c]
    test eax, eax
    jns short loc_59e74
    neg eax
loc_59e74:
    sar eax, 2
    jmp short loc_59e7e
loc_59e79:
    mov eax, 0x1f
loc_59e7e:
    mov edx, dword [ebp - 0x14]
    shl eax, 8
    add edx, eax
    mov eax, dword [0x190f70]
    mov dword [ebp - 0x10], eax
    mov eax, dword [ebp - 0x34]
    test eax, eax
    jns short loc_59e97
    neg eax
loc_59e97:
    sar eax, 2
    mov dword [ebp - 0x14], edx
    cmp eax, 0x1f
    jge short loc_59eb0
    mov eax, dword [ebp - 0x34]
    test eax, eax
    jns short loc_59eab
    neg eax
loc_59eab:
    sar eax, 2
    jmp short loc_59eb5
loc_59eb0:
    mov eax, 0x1f
loc_59eb5:
    mov ebx, dword [ebp - 0x10]
    shl eax, 8
    mov edx, dword [0x216f64]
    add ebx, eax
    mov eax, dword [ebp - 0x18]
    mov dword [ebp - 0x10], ebx
    mov ebx, dword [0x216f64]
    add eax, edx
    mov edx, dword [ebp - 0x18]
    sub edx, ebx
    shl eax, 7
    shl edx, 8
    and eax, strict dword 0x7ff
    and edx, strict dword 0x7ff
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar eax, 0x10
    sar edx, 0x10
    add eax, edx
    sar eax, 0xe
    mov ebx, dword [0x215c90]
    add ecx, eax
    cmp ebx, dword [0x215c8c]
    jg short loc_59f3c
    lea eax, [ebx + ecx]
    lea edx, [ebx + esi]
loc_59f16:
    movzx esi, byte [eax]
    add esi, dword [ebp - 0x14]
    mov cl, byte [edx]
    mov ch, byte [esi]
    movzx esi, cl
    mov byte [edx], ch
    mov ecx, dword [ebp - 0x10]
    inc eax
    add esi, ecx
    inc edx
    inc ebx
    mov cl, byte [esi]
    mov esi, dword [0x215c8c]
    mov byte [eax - 1], cl
    cmp ebx, esi
    jle short loc_59f16
loc_59f3c:
    mov eax, dword [ebp - 0x1c]
    mov edx, dword [ebp - 0x24]
    mov ebx, dword [ebp - 0x20]
    mov ecx, dword [ebp - 0x34]
    mov esi, dword [ebp - 0x18]
    sub edi, 4
    inc eax
    add edx, 4
    inc ebx
    dec ecx
    dec esi
    mov dword [ebp - 0x1c], eax
    mov dword [ebp - 0x24], edx
    mov dword [ebp - 0x20], ebx
    mov dword [ebp - 0x34], ecx
    mov dword [ebp - 0x18], esi
    cmp ebx, esi
    jl near loc_59e33
loc_59f6c:
    and byte [0x169d5a], 0xf7
loc_59f73:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 8
    times 4 db 0    ; Alignment
    push ebp
    mov ebp, esp
    push ebx
    push edx
    xor edx, edx
    mov dword [0x21ea20], edx
    mov edx, dword [0x216f7c]
    mov dword [0xaba8], edx
    mov edx, dword [0x216f7c]
    mov dword [0xabac], edx
    xor ebx, ebx
    mov dword [0x21ea24], eax
    mov dword [0xabb0], ebx
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    mov ebx, eax
    mov ecx, edx
    test eax, eax
    jl short loc_59fd0
    cmp eax, strict dword 0x1f4
    jl short loc_59fdc
loc_59fd0:
    mov eax, 0x5208
    call PRINT_NOTICE
    jmp short loc_5a025
loc_59fdc:
    mov eax, dword [0xcf65c]
    mov edx, 0x5228
    sar eax, 0x10
    call 0x51408
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp byte [eax + 0x8c34c], 4
    jne short loc_5a025
    call 0x50fe0
    and eax, strict dword 0xff
    cmp eax, ecx
    jg short loc_5a025
    movsx eax, bx
    call 0x51c58
    mov eax, dword [0x216f7c]
    mov dword [0xabb0], eax
loc_5a025:
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push edx
    push esi
    cmp dword [0x21ea24], 3
    jle short loc_5a072
    cmp dword [0x21ea20], strict dword 0x200
    jne short loc_5a065
    call 0x50fe0
    mov edx, eax
    mov ebx, 2
    sar edx, 0x1f
    idiv ebx
    lea eax, [edx + 0x69]
    mov edx, 0xa4
    call 0x59fbc
loc_5a065:
    xor esi, esi
    mov dword [0x21ea20], esi
    jmp near loc_5a245
loc_5a072:
    mov edx, dword [0x216f7c]
    sub edx, dword [0xabb0]
    cmp edx, strict dword 0x1e0
    jge short loc_5a096
    xor ebx, ebx
    mov dword [0x21ea20], ebx
    lea esp, [ebp - 0xc]
    pop esi
    pop edx
    pop ebx
    pop ebp
    ret
loc_5a096:
    cmp dword [0x21ea20], 0
    jne short loc_5a0d0
    mov edx, dword [0x216f7c]
    sub edx, dword [0xaba8]
    cmp edx, strict dword 0x960
    jle near loc_5a23d
    call 0x50fe0
    mov edx, eax
    mov ebx, 4
    sar edx, 0x1f
    idiv ebx
    lea eax, [edx + 0x5b]
    jmp near loc_5a21f
loc_5a0d0:
    mov ah, byte [0x21ea20]
    test ah, 8
    je short loc_5a0f9
    call 0x50fe0
    mov edx, eax
    mov ebx, 2
    sar edx, 0x1f
    idiv ebx
    lea eax, [edx + 0x64]
    mov edx, 0xff
    jmp near loc_5a224
loc_5a0f9:
    test ah, 4
    je short loc_5a12a
    test ah, 0x20
    je near loc_5a229
    call 0x50fe0
    mov edx, eax
    mov ebx, 2
    sar edx, 0x1f
    idiv ebx
    lea eax, [edx + 0x62]
    mov edx, 0xd8
    call 0x59fbc
    jmp near loc_5a229
loc_5a12a:
    test ah, 0x10
    je short loc_5a14c
    test ah, 0x20
    je near loc_5a229
    mov edx, 0xd8
    mov eax, 0x66
    call 0x59fbc
    jmp near loc_5a229
loc_5a14c:
    mov bl, byte [0x21ea21]
    test bl, 8
    je short loc_5a175
    mov edx, 0xfa
    mov eax, 0x6c
    call 0x59fbc
    mov eax, dword [0x216f7c]
    mov dword [0xaba8], eax
    jmp near loc_5a23d
loc_5a175:
    test bl, 0x10
    je short loc_5a1a3
    mov edx, 0x50
    mov eax, 0x6d
    call 0x59fbc
    mov eax, dword [0x216f7c]
    mov dword [0xaba8], eax
    xor edx, edx
    mov dword [0x21ea20], edx
    lea esp, [ebp - 0xc]
    pop esi
    pop edx
    pop ebx
    pop ebp
    ret
loc_5a1a3:
    test bl, 0x40
    je short loc_5a1d1
    mov edx, 0xff
    mov eax, 0x6b
    call 0x59fbc
    mov eax, dword [0x216f7c]
    mov dword [0xaba8], eax
    xor edx, edx
    mov dword [0x21ea20], edx
    lea esp, [ebp - 0xc]
    pop esi
    pop edx
    pop ebx
    pop ebp
    ret
loc_5a1d1:
    test bl, 1
    je short loc_5a23d
    test ah, 0x40
    jne short loc_5a23d
    mov edx, dword [0x216f7c]
    sub edx, dword [0xabac]
    cmp edx, strict dword 0x1c20
    jle short loc_5a23d
    mov eax, 0x5240
    call PRINT_NOTICE
    call 0x50fe0
    mov edx, eax
    mov ebx, 3
    sar edx, 0x1f
    idiv ebx
    cmp edx, 2
    jne short loc_5a21c
    cmp ebx, dword [0x21ea24]
    je short loc_5a21c
    mov edx, 1
loc_5a21c:
    lea eax, [edx + 0x5f]
loc_5a21f:
    mov edx, 0xc8
loc_5a224:
    call 0x59fbc
loc_5a229:
    mov eax, dword [0x216f7c]
    mov dword [0xaba8], eax
    mov eax, dword [0x216f7c]
    mov dword [0xabac], eax
loc_5a23d:
    xor edx, edx
    mov dword [0x21ea20], edx
loc_5a245:
    lea esp, [ebp - 0xc]
    pop esi
    pop edx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

random_say_it:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov edx, dword [0x21ea20]
    cmp eax, strict dword 0x10000
    jae near loc_5a2d5
    cmp eax, 0x10
    jb short loc_5a28b
    mov ebx, edx
    or ebx, eax
    cmp eax, 0x10
    jbe short loc_5a2c3
    cmp eax, 0x40
    jb short loc_5a284
    jbe short loc_5a2c7
    cmp eax, strict dword 0x100
    je short loc_5a2b5
    jmp short loc_5a2d3
loc_5a284:
    cmp eax, 0x20
    je short loc_5a2c7
    jmp short loc_5a2d3
loc_5a28b:
    cmp eax, 1
    jb short loc_5a2d3
    jbe short loc_5a299
    cmp eax, 2
    je short loc_5a29d
    jmp short loc_5a2d3
loc_5a299:
    xor edx, edx
    jmp short loc_5a2d5
loc_5a29d:
    xor edx, edx
    mov eax, dword [0x216f7c]
    mov dword [0xaba8], eax
    mov eax, dword [0x216f7c]
    mov dword [0xabac], eax
    jmp short loc_5a2d5
loc_5a2b5:
    mov edx, ebx
    mov eax, dword [0x216f7c]
    mov dword [0xaba8], eax
    jmp short loc_5a2d5
loc_5a2c3:
    mov edx, ebx
    jmp short loc_5a2d5
loc_5a2c7:
    mov ebx, dword [0x216f7c]
    mov dword [0xabac], ebx
loc_5a2d3:
    or edx, eax
loc_5a2d5:
    mov dword [0x21ea20], edx
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    times 14 db 0    ; Alignment
    mov eax, 0x5254
    call PRINT_NOTICE
    mov eax, 0x5260
    jmp near 0x14f28
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push dword 0x4a2f0
    call 0x61ee1
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 4 db 0    ; Alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    sub esp, 0x28
    mov esi, eax
    mov ecx, edx
    mov ebx, 0x1c
    lea eax, [ebp - 0x34]
    xor edx, edx
    call 0x61915
    lea eax, [ebp - 0x18]
    mov edx, 0x300
    call 0x6195f
    xor ebx, ebx
    movsx eax, si
    mov dword [ebp - 0x34], edx
    mov dword [ebp - 0x30], eax
    mov edx, ds
    mov eax, ecx
    mov dword [ebp - 0x2c], ebx
    mov word [ebp - 0x18], dx
    mov dword [ebp - 0x20], ecx
    mov word [ecx + 0x2e], 0
    mov word [ecx + 0x20], 0
    lea ebx, [ebp - 0x34]
    mov ax, word [ecx + 0x2e]
    lea edx, [ebp - 0x34]
    mov word [ecx + 0x30], ax
    lea ecx, [ebp - 0x18]
    mov eax, 0x31
    call 0x61278
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    sub esp, 0x1c
    mov dword [ebp - 0x20], 0x100
    movsx edx, ax
    add edx, 0x10
    mov eax, edx
    sar edx, 0x1f
    shl edx, 4
    db 0x1b, 0xc2    ; Watcom encoding of sbb eax, edx
    sar eax, 4
    lea ebx, [ebp - 0x20]
    lea edx, [ebp - 0x20]
    mov dword [ebp - 0x1c], eax
    mov eax, 0x31
    call 0x6125b
    cmp dword [ebp - 8], 0
    jne short loc_5a3ed
    mov eax, dword [ebp - 0x20]
    xor edx, edx
    mov word [0x21ea9a], ax
    xor eax, eax
    mov word [0x21ea96], dx
    mov ax, word [ebp - 0x20]
    mov edx, ds
    shl eax, 4
    jmp short loc_5a3f1
loc_5a3ed:
    xor edx, edx
    xor eax, eax
loc_5a3f1:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push edx
    sub esp, 0x1c
    mov ebx, 0x1c
    lea eax, [ebp - 0x24]
    xor edx, edx
    call 0x61915
    mov edx, 0x101
    xor eax, eax
    lea ebx, [ebp - 0x24]
    mov ax, word [0x21ea98]
    mov dword [ebp - 0x24], edx
    lea edx, [ebp - 0x24]
    mov dword [ebp - 0x18], eax
    mov eax, 0x31
    call 0x6125b
    cmp dword [ebp - 0xc], 0
    jne short loc_5a44f
    xor edx, edx
    mov word [0x21ea9a], dx
    mov word [0x21ea96], dx
    mov word [0x21ea98], dx
loc_5a44f:
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push edi
    mov ebx, 0x32
    mov eax, 0x21ea64
    xor edx, edx
    xor ecx, ecx
    mov dword [0xabb8], edx
    call 0x61915
    mov ebx, 0x1500
    mov edx, 0x21ea64
    mov eax, 0x2f
    mov dword [0x21ea74], ecx
    mov dword [0x21ea80], ebx
    call 0x5a320
    cmp dword [0x21ea80], 0
    je short loc_5a4e4
    mov ebx, 0x32
    mov eax, 0x21ea64
    xor edx, edx
    mov edi, 0x150c
    call 0x61915
    mov edx, 0x21ea64
    mov eax, 0x2f
    mov dword [0x21ea80], edi
    call 0x5a320
    mov eax, dword [0x21ea74]
    shr eax, 8
    cmp al, 2
    jb short loc_5a4e4
    mov eax, 1
    mov dword [0xabb8], eax
    jmp short loc_5a4e6
loc_5a4e4:
    xor eax, eax
loc_5a4e6:
    lea esp, [ebp - 0x10]
    pop edi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov ecx, eax
    mov eax, 0x800
    call 0x5a394
    test eax, eax
    jne short loc_5a50f
    test dx, dx
    je near loc_5a588
loc_5a50f:
    mov ebx, 0x32
    mov eax, 0x21ea64
    xor edx, edx
    call 0x61915
    xor eax, eax
    mov ax, cx
    mov edx, 0x1505
    mov dword [0x21ea7c], eax
    mov ax, word [0x21ea9a]
    xor ebx, ebx
    mov word [0x21ea86], ax
    xor eax, eax
    mov dword [0x21ea80], edx
    mov ax, word [0x21ea96]
    mov edx, 0x21ea64
    mov dword [0x21ea74], eax
    mov eax, 0x2f
    mov dword [0x21ea78], ebx
    call 0x5a320
    call 0x5a3f8
    cmp word [0x21ea84], 0
    je short loc_5a588
    mov ecx, dword [0x21ea80]
    cmp ecx, 0xf
    je short loc_5a584
    cmp ecx, 0x15
    jne short loc_5a588
loc_5a584:
    xor eax, eax
    jmp short loc_5a58d
loc_5a588:
    mov eax, 1
loc_5a58d:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    cmp dword [0xabb8], 0
    jne short loc_5a5ac
    xor eax, eax
    jmp short loc_5a5f4
loc_5a5ac:
    mov esi, 0x21ea64
    xor ecx, ecx
loc_5a5b3:
    mov ebx, 0x32
    mov eax, esi
    xor edx, edx
    call 0x61915
    mov ebx, 0x150b
    mov eax, 0x2f
    mov dword [0x21ea7c], ecx
    mov edx, esi
    mov dword [0x21ea80], ebx
    inc ecx
    call 0x5a320
    mov al, byte [0x21ea80]
    mov byte [ecx + 0x21ea47], al
    cmp ecx, 0x1a
    jl short loc_5a5b3
    mov eax, 1
loc_5a5f4:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    sub esp, 8
    mov esi, eax
    lea eax, [ebp - 0x14]
    xor edx, edx
    xor ebx, ebx
    xor ecx, ecx
    mov dword [ebp - 0x14], edx
    mov dword [ebp - 0x18], edx
    call 0x61f9c
loc_5a620:
    cmp byte [ebx + 0x21ea48], 0
    je short loc_5a65b
    xor eax, eax
    mov ax, bx
    call 0x5a4f0
    test eax, eax
    je short loc_5a65b
    lea edx, [ebp - 0x18]
    lea eax, [ebx + 1]
    call 0x61fb0
    push byte 0
    push esi
    call 0x61340
    add esp, 8
    test eax, eax
    jl short loc_5a65b
    call 0x616ad
    mov ecx, 1
loc_5a65b:
    inc ebx
    cmp ebx, 0x1a
    jl short loc_5a620
    lea edx, [ebp - 0x18]
    mov eax, dword [ebp - 0x14]
    call 0x61fb0
    mov eax, ecx
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

check_game_cd:
    push ebp
    mov ebp, esp
    call 0x5a458
    call 0x5a598
    mov eax, 0x52a0
    call 0x5a600
    mov edx, eax
    test eax, eax
    jne short loc_5a6f4
loc_5a695:
    call 0x61fc4
    test eax, eax
    je short loc_5a6a5
    call 0x61fdb
    jmp short loc_5a695
loc_5a6a5:
    push dword 0x52b0
    call 0x5ac04
    add esp, 4
    push dword 0x52c0
    call 0x5ac04
    add esp, 4
    push dword 0x52f8
    call 0x5ac04
    add esp, 4
    push dword 0x531c
    call 0x5ac04
    add esp, 4
    call 0x61ead
loc_5a6de:
    call 0x61fc4
    test eax, eax
    je short loc_5a6de
    push dword 0x5334
    call 0x5ac04
    add esp, 4
loc_5a6f4:
    mov eax, edx
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, eax
    mov esi, edx
    push ecx
    push dword [ebp + 8]
    push ebx
    call 0x5d8a9
    push byte 0x17
    call 0x62160
    call 0x6211f
    test al, al
    je short loc_5a748
    push esi
    push dword [0xb71b]
    push byte 0
    call 0x6224c
    test eax, eax
    jne short loc_5a748
    push edi
    push esi
    mov eax, esi
    call 0x61c2a
    inc eax
    push eax
    push byte 4
    push dword 0x8017
    push byte 0
    call 0x6236d
loc_5a748:
    mov edx, esi
    mov eax, edi
    call 0x62682
    mov esi, eax
    call 0x621c6
    mov eax, esi
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    times 13 db 0    ; Object alignment
