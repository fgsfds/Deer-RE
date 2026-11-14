bits 32
org 0x298ac

%define PRINT_NOTICE 0x5130c
%define ROTATE_SPRITE 0x47f83
%define KRAND 0x46fa0
%define CLIP_MOVE 0x430f3
%define PUSH_MOVE 0x44c03
%define SET_SPRITE 0x40b6d

shoot_dispatch:
    dd loc_298f0 - 0x10000
    dd loc_298f9 - 0x10000
    dd loc_298f9 - 0x10000
    dd loc_29903 - 0x10000
    dd loc_2990c - 0x10000

shoot:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov ecx, eax
    movsx ebx, ax
    mov edx, 0x3204
    mov eax, ebx
    call 0x51408
    imul eax, ebx, strict dword 0x623
    mov eax, dword [eax + 0x8c42f]
    cmp eax, 4
    ja short loc_29913
    jmp dword [cs:nosplit eax*4 + shoot_dispatch - 0x10000]
loc_298f0:
    mov eax, ebx
    call 0x563c8
    jmp short loc_29913
loc_298f9:
    movsx eax, cx
    call 0x55c94
    jmp short loc_29913
loc_29903:
    mov eax, ebx
    call 0x55370
    jmp short loc_29913
loc_2990c:
    mov eax, ebx
    call 0x56a1c
loc_29913:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 5 db 0    ; Object alignment

display_masks:
    push ebp
    mov ebp, esp
    mov eax, 0x3210
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

weapon_display_dispatch:
    dd loc_29980 - 0x10000
    dd loc_2998b - 0x10000
    dd loc_29998 - 0x10000
    dd loc_299a8 - 0x10000
    dd loc_299b3 - 0x10000

display_weapon:
    push ebp
    mov ebp, esp
    push edx
    test ax, ax
    jl short loc_2995a
    cmp ax, word [0xcf65c]
    jl short loc_29966
loc_2995a:
    mov eax, 0x322c
    call PRINT_NOTICE
    jmp short loc_299b8
loc_29966:
    cwde
    imul edx, eax, strict dword 0x623
    mov edx, dword [edx + 0x8c42f]
    cmp edx, 4
    ja short loc_299b8
    jmp dword [cs:nosplit edx*4 + weapon_display_dispatch - 0x10000]
loc_29980:
    call 0x567a4
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
loc_2998b:
    xor edx, edx
    call 0x56084
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
loc_29998:
    mov edx, 1
    call 0x56084
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
loc_299a8:
    call 0x559ec
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
loc_299b3:
    call 0x56b60
loc_299b8:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    add byte [eax], al
    push ebp
    mov ebp, esp
    push edx
    xor edx, edx
    mov dword [0x99d8], edx
    mov dword [0x99dc], edx
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    mov eax, dword [0x216f7c]
    sub eax, dword [0x99d8]
    cmp eax, 0x1e
    jl short loc_29a08
    mov eax, dword [0x21f304]
    shr eax, 0xa
    test al, 1
    je short loc_29a08
    mov eax, dword [0x216f7c]
    mov dword [0x99d8], eax
    xor byte [0x99dc], 1
loc_29a08:
    mov eax, dword [0x99dc]
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

get_input:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x38
    cwde
    imul eax, eax, strict dword 0x623
    mov ebx, 0x8be10
    add ebx, eax
    lea eax, [ebp - 0x4c]
    call 0x5d3f4
    mov ah, byte [ebx + 0x53c]
    test ah, 1
    jne short loc_29a60
    test ah, 0x10
    jne short loc_29a60
    cmp word [0xbfaf7], 0
    je short loc_29ab6
    cmp byte [0x21ec29], 0
    sete al
    and eax, strict dword 0xff
    je short loc_29ab6
loc_29a60:
    xor ecx, ecx
    xor eax, eax
    xor esi, esi
    xor edi, edi
    xor bl, bl
    mov dword [0xbd700], ecx
    mov word [0xbf532], ax
    mov dword [0xbd6fc], esi
    mov word [0xbf534], ax
    mov dword [0xbd708], edi
    mov byte [0xbf530], bl
    mov dword [0xbd704], ecx
    mov dword [ebp - 0x40], ecx
    xor eax, eax
    mov dword [ebp - 0x44], ecx
    mov al, byte [0x93a3]
    xor bh, bh
    shl eax, 0x1a
    mov byte [0xbf531], bh
    mov dword [0xbf536], eax
    jmp near loc_2a0b0
loc_29ab6:
    mov eax, dword [0x216f7c]
    mov edx, dword [0xc4620]
    sub eax, edx
    mov dword [ebp - 0x28], eax
    mov eax, dword [0x216f7c]
    mov ecx, dword [0xbfb3b]
    mov dword [0xc4620], eax
    mov eax, dword [0x21f304]
    mov esi, dword [0x21f304]
    shr eax, 7
    shr esi, 4
    and eax, 1
    and esi, 1
    or ecx, eax
    mov eax, dword [0x216f7c]
    sub eax, dword [0x99d8]
    cmp eax, 0x1e
    jl short loc_29b1c
    mov eax, dword [0x21f304]
    shr eax, 0xa
    test al, 1
    je short loc_29b1c
    mov eax, dword [0x216f7c]
    mov dword [0x99d8], eax
    xor byte [0x99dc], 1
loc_29b1c:
    mov eax, dword [0x99dc]
    mov dword [ebp - 0x18], eax
    test eax, eax
    je short loc_29b2a
    xor ecx, ecx
loc_29b2a:
    mov eax, dword [0x21f304]
    and eax, 1
    mov dword [ebp - 0x1c], eax
    mov eax, dword [0x21f304]
    shr eax, 1
    mov edx, dword [ebx + 0x298]
    and eax, 1
    sar edx, 0x10
    mov dword [ebp - 0x20], eax
    lea eax, [edx*4]
    mov edi, dword [0x21f304]
    add eax, edx
    shr edi, 9
    mov dx, word [nosplit eax*8 + 0x20a08c]
    and edi, 1
    cmp dx, 0x7d3
    jne short loc_29b71
    xor edi, edi
loc_29b71:
    mov eax, dword [ebp - 0x18]
    add eax, eax
    or edi, eax
    mov dword [0xbf536], edi
    mov ah, byte [0xbf536]
    test ah, 2
    je short loc_29b94
    mov dl, ah
    and dl, 0xfe
    mov byte [0xbf536], dl
loc_29b94:
    mov eax, dword [0x21f304]
    shr eax, 5
    and eax, 1
    mov edx, dword [0xbf536]
    shl eax, 2
    or edx, eax
    mov eax, dword [0x21f304]
    shr eax, 0x11
    and eax, 1
    mov edi, edx
    shl eax, 3
    or edi, eax
    mov eax, dword [0x21f304]
    shr eax, 0x12
    mov dword [0xbf536], edx
    and eax, 1
    mov edx, edi
    shl eax, 4
    mov dword [0xbf536], edi
    or edx, eax
    mov eax, ecx
    mov edi, edx
    shl eax, 5
    or edi, eax
    mov eax, dword [0x21f304]
    shr eax, 0xc
    mov dword [0xbf536], edx
    and eax, 1
    mov edx, edi
    shl eax, 0xe
    or edx, eax
    mov eax, dword [0x21f304]
    shr eax, 0xb
    mov dword [0xbf536], edi
    and eax, 1
    mov edi, edx
    shl eax, 0xd
    mov dword [0xbf536], edx
    or edi, eax
    mov dh, byte [0xc0037]
    mov dword [0xbf536], edi
    cmp dh, 1
    jne short loc_29c79
    mov dl, byte [0xbf538]
    mov eax, dword [0xc0039]
    or dl, 2
    sar eax, 0x18
    mov byte [0xbf538], dl
    shl eax, 0x12
    mov edx, dword [0xbf536]
    or edx, eax
    mov eax, dword [0xc003a]
    mov dword [0xbf536], edx
    sar eax, 0x18
    mov ebx, edx
    shl eax, 0x13
    xor dh, dh
    or ebx, eax
    mov byte [0xc0037], dh
    mov dword [0xbf536], ebx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_29c79:
    mov eax, dword [0x21f308]
    shr eax, 9
    and eax, 1
    mov edx, edi
    shl eax, 0x12
    or edx, eax
    mov dword [0xbf536], edx
    cmp byte [0x21ec29], 0
    setne al
    and eax, strict dword 0xff
    mov edi, edx
    shl eax, 0x15
    or edi, eax
    mov dword [0xbf536], edi
    mov eax, dword [0x21f308]
    mov dl, byte [0xbf538]
    shr eax, 4
    xor edi, edi
    or dl, 0x80
    and eax, 1
    mov dword [0xbd704], edi
    mov dword [0xbd708], edi
    mov byte [0xbf538], dl
    shl eax, 0x1c
    mov edx, dword [0xbf536]
    mov dword [0xbd6fc], edi
    or edx, eax
    mov edi, dword [0xb0a8]
    mov dword [0xbf536], edx
    test edi, edi
    je short loc_29d02
    test ecx, ecx
    je short loc_29d02
    mov eax, dword [ebp - 0x44]
    add eax, eax
    mov dword [ebp - 0x44], eax
loc_29d02:
    test esi, esi
    je short loc_29d1f
    mov edx, dword [ebp - 0x40]
    neg edx
    mov eax, edx
    sar edx, 0x1f
    shl edx, 3
    db 0x1b, 0xc2    ; Watcom encoding of sbb eax, edx
    sar eax, 3
    mov dword [0xbd6fc], eax
    jmp short loc_29d34
loc_29d1f:
    mov eax, dword [ebp - 0x40]
    mov edx, eax
    sar edx, 0x1f
    shl edx, 6
    db 0x1b, 0xc2    ; Watcom encoding of sbb eax, edx
    sar eax, 6
    mov dword [0xbd708], eax
loc_29d34:
    mov eax, dword [ebp - 0x44]
    mov edx, eax
    mov edi, 0xba
    sar edx, 0x1f
    idiv edi
    cmp dword [0xbfffb], 0
    je short loc_29d54
    sub dword [0xbd704], eax
    jmp short loc_29d5a
loc_29d54:
    add dword [0xbd704], eax
loc_29d5a:
    mov eax, dword [ebp - 0x4c]
    xor edi, edi
    mov edx, dword [0xbd6fc]
    mov dword [ebp - 0x44], edi
    mov dword [0xbd700], edi
    sub edx, eax
    mov eax, dword [ebp - 0x18]
    mov dword [0xbd6fc], edx
    test eax, eax
    je short loc_29d89
    mov edi, 2
    mov eax, 3
    jmp short loc_29da3
loc_29d89:
    test ecx, ecx
    je short loc_29d99
    mov edi, 0x10
    mov eax, 0x18
    jmp short loc_29da3
loc_29d99:
    mov edi, 8
    mov eax, 0xc
loc_29da3:
    mov edx, dword [0x21f304]
    shr edx, 2
    mov dword [ebp - 0x24], edx
    test esi, esi
    je short loc_29ddc
    test byte [ebp - 0x24], 1
    je short loc_29dbf
    add dword [0xbd6fc], eax
loc_29dbf:
    mov edx, dword [0x21f304]
    shr edx, 3
    test dl, 1
    je near loc_29e3f
    sub dword [0xbd6fc], eax
    jmp near loc_29e3f
loc_29ddc:
    mov edx, dword [ebp - 0x28]
    mov esi, dword [0xc4624]
    add esi, edx
    test byte [ebp - 0x24], 1
    je short loc_29e09
    mov dword [0xc4624], esi
    cmp esi, 0xf
    jl short loc_29e00
    sub dword [0xbd708], edi
    jmp short loc_29e3f
loc_29e00:
    sub dword [0xbd708], 5
    jmp short loc_29e3f
loc_29e09:
    mov edx, dword [0x21f304]
    shr edx, 3
    mov dword [ebp - 0x34], edx
    test byte [ebp - 0x34], 1
    je short loc_29e37
    mov dword [0xc4624], esi
    cmp esi, 0xf
    jl short loc_29e2e
    add dword [0xbd708], edi
    jmp short loc_29e3f
loc_29e2e:
    add dword [0xbd708], 5
    jmp short loc_29e3f
loc_29e37:
    xor esi, esi
    mov dword [0xc4624], esi
loc_29e3f:
    cmp dword [ebp - 0x1c], 0
    je short loc_29e4b
    add dword [0xbd700], eax
loc_29e4b:
    cmp dword [ebp - 0x20], 0
    je short loc_29e61
    mov edx, dword [0xbd700]
    sar eax, 1
    sub edx, eax
    mov dword [0xbd700], edx
loc_29e61:
    mov edx, dword [ebx + 0x298]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08c], 0x7d3
    jne short loc_29e85
    sar dword [0xbd700], 1
loc_29e85:
    cmp dword [0xbd700], -0x22
    jge short loc_29e98
    mov dword [0xbd700], 0xffffffde
loc_29e98:
    cmp dword [0xbd700], 0x22
    jle short loc_29eab
    mov dword [0xbd700], 0x22
loc_29eab:
    cmp dword [0xbd6fc], -0xc
    jge short loc_29ebe
    mov dword [0xbd6fc], 0xfffffff4
loc_29ebe:
    cmp dword [0xbd6fc], 0xc
    jle short loc_29ed1
    mov dword [0xbd6fc], 0xc
loc_29ed1:
    cmp dword [0xbd708], -0x7f
    jge short loc_29ee4
    mov dword [0xbd708], 0xffffff81
loc_29ee4:
    cmp dword [0xbd708], 0x7f
    jle short loc_29ef7
    mov dword [0xbd708], 0x7f
loc_29ef7:
    cmp dword [0xbd704], -0x7f
    jge short loc_29f0a
    mov dword [0xbd704], 0xffffff81
loc_29f0a:
    cmp dword [0xbd704], 0x7f
    jle short loc_29f1d
    mov dword [0xbd704], 0x7f
loc_29f1d:
    test ecx, ecx
    je short loc_29f31
    call 0x535ec
    test eax, eax
    je short loc_29f31
    shl dword [0xbd700], 3
loc_29f31:
    cmp word [0xcf65c], 1
    jle short loc_29f43
    mov ax, word [0xbf552]
    jmp short loc_29f4a
loc_29f43:
    mov ax, word [ebx + 0x294]
loc_29f4a:
    cwde
    mov dword [ebp - 0x34], eax
    add eax, strict dword 0xa00
    and eax, strict dword 0x7ff
    mov ax, word [nosplit eax*2 + 0x1bd568]
    mov esi, dword [0xbd700]
    movsx edx, ax
    mov eax, esi
    mov esi, dword [ebp - 0x34]
    add esi, strict dword 0x800
    and esi, strict dword 0x7ff
    imul edx
    shrd eax, edx, 9
    mov dword [ebp - 0x30], eax
    mov ax, word [nosplit esi*2 + 0x1bd568]
    mov edi, dword [0xbd700]
    movsx edx, ax
    mov eax, edi
    imul edx
    shrd eax, edx, 9
    mov dword [ebp - 0x2c], eax
    mov dx, word [nosplit esi*2 + 0x1bd568]
    mov eax, dword [0xbd6fc]
    movsx edx, dx
    mov esi, dword [ebp - 0x30]
    imul edx
    shrd eax, edx, 9
    add esi, eax
    mov eax, dword [ebp - 0x34]
    add eax, strict dword 0x600
    and eax, strict dword 0x7ff
    mov dx, word [nosplit eax*2 + 0x1bd568]
    mov eax, dword [0xbd6fc]
    movsx edx, dx
    mov edi, dword [ebp - 0x2c]
    imul edx
    shrd eax, edx, 9
    mov edx, dword [0xbf394]
    mov dword [ebx + 0x60f], 0
    add edi, eax
    mov eax, dword [0xbf398]
    add edi, edx
    add esi, eax
    mov al, byte [0xbd708]
    mov word [0xbf534], di
    mov byte [0xbf530], al
    mov al, byte [0xbd704]
    mov word [0xbf532], si
    mov byte [0xbf531], al
    test si, si
    jne short loc_2a047
    test di, di
    jne short loc_2a047
    cmp byte [0xbf530], 0
    jne short loc_2a047
    test byte [0xbf536], 4
    jne short loc_2a047
    mov esi, dword [0x99e0]
    cmp esi, dword [ebx + 0x21c]
    je short loc_2a051
loc_2a047:
    mov dword [ebx + 0x60f], 1
loc_2a051:
    mov edi, dword [0xbd700]
    mov eax, dword [ebx + 0x21c]
    mov dword [ebx + 0x617], ecx
    mov dword [0x99e0], eax
    test edi, edi
    jne short loc_2a072
    mov dword [ebx + 0x617], edi
loc_2a072:
    mov eax, dword [ebp - 0x1c]
    or eax, dword [ebp - 0x20]
    mov ecx, dword [ebx + 0x60f]
    mov dword [ebx + 0x613], eax
    test ecx, ecx
    je short loc_2a092
    mov eax, 0x100
    call 0x5a250
loc_2a092:
    mov esi, dword [0x99d4]
    inc esi
    mov dword [0x99d4], esi
    cmp esi, 2
    jne short loc_2a0b0
    call 0x53304
    xor eax, eax
    mov dword [0x99d4], eax
loc_2a0b0:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

get_motorcycle_input:
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop

get_boat_input:
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    times 5 db 0    ; Object alignment

process_input:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x50
    mov edi, eax
    movsx ebx, ax
    mov eax, ebx
    imul ecx, ebx, strict dword 0x623
    mov edx, 0x324c
    call 0x51408
    add ecx, strict dword 0x8be10
    mov edx, 0x325c
    mov eax, ecx
    call 0x5144c
    mov ax, word [ecx + 0x2f8]
    mov word [ebp - 0x24], ax
    mov eax, dword [ebp - 0x26]
    sar eax, 0x10
    mov edx, 0x326c
    mov dword [ebp - 0x50], eax
    call 0x513b8
    mov eax, dword [ebp - 0x50]
    mov dword [ebp - 0x50], eax
    mov edx, dword [ebp - 0x50]
    shl eax, 2
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edx, 0x191368
    shl eax, 2
    add edx, eax
    mov word [edx + 0xc], 0
    mov dword [ebp - 0x2c], edx
    mov dx, word [ecx + 0x304]
    mov esi, ecx
    test dx, dx
    jg short loc_2a18b
    lea eax, [ebx*4]
    add eax, ebx
    mov eax, dword [nosplit eax*2 + 0xb8bf6]
    mov dword [ebp - 0x28], eax
    jmp short loc_2a190
loc_2a18b:
    xor ebx, ebx
    mov dword [ebp - 0x28], ebx
loc_2a190:
    mov ax, word [esi + 0x29a]
    mov word [ebp - 0x20], ax
    test ax, ax
    jl short loc_2a1ac
    mov cx, word [0x217fce]
    cmp ax, cx
    jl short loc_2a1c1
loc_2a1ac:
    mov edx, dword [ebp - 0x22]
    mov eax, 0x327c
    sar edx, 0x10
    call 0x51350
    jmp near loc_2b411
loc_2a1c1:
    test ax, ax
    jl short loc_2a1cb
    cmp ax, cx
    jl short loc_2a1e5
loc_2a1cb:
    mov edx, dword [ebp - 0x22]
    mov eax, 0x32a8
    sar edx, 0x10
    call 0x51350
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2a1e5:
    mov eax, dword [ebp - 0x22]
    sar eax, 0x10
    mov dword [ebp - 0x50], eax
    mov edx, eax
    shl eax, 2
    add eax, edx
    mov ax, word [nosplit eax*8 + 0x20a08a]
    push dword 0x10001
    mov dword [ebp - 0x18], eax
    mov eax, dword [ebp - 0x2c]
    push dword 0xa3
    mov byte [eax + 0x12], 0x40
    lea eax, [ebp - 0x64]
    push eax
    lea eax, [ebp - 0x58]
    mov ecx, dword [ebp - 0x50]
    push eax
    lea eax, [ebp - 0x60]
    mov ebx, dword [esi + 0x21c]
    push eax
    lea eax, [ebp - 0x5c]
    mov edx, dword [esi + 0x218]
    push eax
    mov eax, dword [esi + 0x214]
    mov byte [esi + 0x553], 0
    call 0x46fb4
    mov eax, dword [ebp - 0x50]
    mov ebx, dword [esi + 0x218]
    mov edx, dword [esi + 0x214]
    call 0x4decc
    mov ecx, eax
    mov ebx, dword [esi + 0x218]
    mov edx, dword [esi + 0x214]
    mov dword [esi + 0x25c], eax
    mov eax, dword [ebp - 0x50]
    call 0x4dde9
    mov dword [esi + 0x260], eax
    mov eax, dword [esi + 0x21c]
    sub eax, ecx
    test eax, eax
    jns short loc_2a286
    neg eax
loc_2a286:
    mov edx, dword [ebp - 0x64]
    and edx, strict dword 0xc000
    cmp edx, strict dword 0x4000
    jne short loc_2a2aa
    cmp word [ebp - 0x18], 1
    jne short loc_2a2aa
    cmp eax, strict dword 0x3800
    jle short loc_2a2aa
    xor ecx, ecx
    mov dword [ebp - 0x18], ecx
loc_2a2aa:
    mov edx, dword [ebp - 0x26]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, eax
    mov eax, dword [ebp - 0x58]
    mov dword [edx + 0x2044b], eax
    mov eax, dword [ebp - 0x5c]
    mov dword [edx + 0x2044f], eax
    mov eax, dword [esi + 0x220]
    mov dword [esi + 0x224], eax
    mov eax, dword [esi + 0x2cc]
    sar eax, 0x10
    mov dword [esi + 0x228], eax
    mov ax, word [esi + 0x2ce]
    test ax, ax
    jle short loc_2a30c
    mov eax, dword [esi + 0x2cc]
    sar eax, 0x10
    mov edx, eax
    sar edx, 3
    inc edx
    sub eax, edx
    jmp short loc_2a321
loc_2a30c:
    jge short loc_2a328
    mov eax, dword [esi + 0x2cc]
    sar eax, 0x10
    mov edx, eax
    neg edx
    sar edx, 3
    inc edx
    add eax, edx
loc_2a321:
    mov word [esi + 0x2ce], ax
loc_2a328:
    mov ecx, dword [ebp - 0x60]
    test ecx, ecx
    jl short loc_2a378
    mov eax, ecx
    and eax, strict dword 0xc000
    cmp eax, strict dword 0xc000
    jne short loc_2a378
    mov eax, ecx
    and eax, strict dword 0xfff
    mov dword [ebp - 0x60], eax
    mov edx, eax
    shl eax, 2
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    cmp word [eax + 0x191382], 1
    jne short loc_2a378
    cmp word [eax + 0x191392], 0
    jl short loc_2a378
    xor edx, edx
    mov dword [ebp - 0x60], edx
    mov eax, dword [esi + 0x260]
    mov dword [ebp - 0x5c], eax
loc_2a378:
    mov ebx, dword [ebp - 0x64]
    test ebx, ebx
    jl near loc_2a483
    mov eax, ebx
    and eax, strict dword 0xc000
    cmp eax, strict dword 0xc000
    jne near loc_2a483
    and ebx, strict dword 0xfff
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov ax, word [nosplit eax*4 + 0x191374]
    xor ah, ah
    and al, 0x21
    cmp ax, strict word 0x21
    jne short loc_2a3cd
    xor al, al
    mov byte [esi + 0x553], 1
    mov dword [ebp - 0x18], eax
    mov byte [esi + 0x53e], ah
loc_2a3cd:
    lea ecx, [ebx*4]
    sub ecx, ebx
    shl ecx, 2
    sub ecx, ebx
    mov eax, 0x191368
    shl ecx, 2
    add eax, ecx
    call 0x14814
    test ax, ax
    je near loc_2a483
    cmp byte [ecx + 0x19137c], 0x18
    jbe near loc_2a483
    mov eax, dword [ebp - 0x2c]
    mov edx, dword [ecx + 0x191370]
    mov eax, dword [eax + 8]
    sub eax, edx
    test eax, eax
    jns short loc_2a414
    neg eax
loc_2a414:
    cmp eax, strict dword 0x5400
    jge short loc_2a483
    mov edx, dword [ecx + 0x19136c]
    mov ebx, dword [esi + 0x218]
    mov eax, dword [ecx + 0x191368]
    mov ecx, dword [esi + 0x214]
    sub edx, ebx
    sub eax, ecx
    call 0x3b4fc
    lea edx, [eax + 0x200]
    and edx, strict dword 0x7ff
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    mov ebx, dword [esi + 0x24c]
    shl edx, 4
    sub ebx, edx
    and eax, strict dword 0x7ff
    mov dword [esi + 0x24c], ebx
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    mov ecx, dword [esi + 0x250]
    shl eax, 4
    sub ecx, eax
    mov dword [esi + 0x250], ecx
loc_2a483:
    mov eax, dword [ebp - 0x2c]
    mov word [eax + 0x2a], 0x20
    mov word [esi + 0x524], 0
    mov ax, word [eax + 0x2a]
    mov word [esi + 0x29e], ax
    mov eax, dword [esi + 0x210]
    test eax, eax
    jle short loc_2a4b5
    lea edx, [eax - 1]
    mov dword [esi + 0x210], edx
    jmp short loc_2a4bf
loc_2a4b5:
    mov dword [esi + 0x210], 0
loc_2a4bf:
    mov dx, word [esi + 0x310]
    cmp dx, 1
    jle near loc_2a56a
    cmp word [esi + 0x29e], 0
    jle near loc_2a56a
    mov ecx, edx
    dec ecx
    mov word [esi + 0x310], cx
    cmp cx, 0x82
    jne short loc_2a51f
    call 0x5f464
    call 0x2c650
    cmp word [esi + 0x312], 0
    jl short loc_2a56a
    mov eax, dword [esi + 0x310]
    sar eax, 0x10
    mov edx, esi
    call 0x2be24
    mov eax, 0x66
    call 0x14e68
    jmp short loc_2a56a
loc_2a51f:
    cmp cx, 1
    jne short loc_2a56a
    mov eax, dword [0xcf656]
    sar eax, 0x10
    test eax, eax
    jl short loc_2a54d
    mov dh, 8
loc_2a533:
    imul esi, eax, strict dword 0x623
    mov eax, dword [nosplit eax*2 + 0xcf53e]
    sar eax, 0x10
    mov byte [esi + 0x8c34c], dh
    test eax, eax
    jge short loc_2a533
loc_2a54d:
    mov edx, dword [0xbffeb]
    inc edx
    mov dword [0xbffeb], edx
    mov dword [0xbffdb], edx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2a56a:
    mov ebx, dword [esi + 0x274]
    test ebx, ebx
    jle short loc_2a57d
    lea ecx, [ebx - 1]
    mov dword [esi + 0x274], ecx
loc_2a57d:
    mov cx, word [esi + 0x2e4]
    test cx, cx
    jle short loc_2a5ab
    mov eax, ecx
    dec ax
    mov word [esi + 0x2e4], ax
    jne short loc_2a5ab
    mov dl, 1
    mov word [esi + 0x2e6], ax
    mov byte [0xc003a], dl
    mov byte [0xc003b], dl
loc_2a5ab:
    cmp word [esi + 0x2d4], 0
    jl near loc_2a643
    mov edx, dword [esi + 0x2d2]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edx, dword [nosplit eax*4 + 0x191368]
    mov dword [esi + 0x214], edx
    mov edx, dword [nosplit eax*4 + 0x19136c]
    mov dword [esi + 0x218], edx
    mov edx, dword [nosplit eax*4 + 0x191370]
    mov dword [esi + 0x21c], edx
    mov ax, word [nosplit eax*4 + 0x191384]
    mov word [esi + 0x294], ax
    mov eax, dword [ebp - 0x2c]
    mov word [eax + 0x20], 0
    mov ax, word [eax + 0x20]
    cwde
    mov word [esi + 0x29c], 0
    mov dword [esi + 0x250], eax
    mov dword [esi + 0x24c], eax
    mov eax, esi
    mov word [esi + 0x518], 0
    call 0x2a0d8
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2a643:
    mov ax, word [esi + 0x518]
    mov ecx, 4
    test ax, ax
    jle short loc_2a666
    mov eax, dword [esi + 0x516]
    sar eax, 0x10
    mov edx, eax
    sar edx, 1
    inc edx
    sub eax, edx
    jmp short loc_2a67a
loc_2a666:
    jge short loc_2a681
    mov eax, dword [esi + 0x516]
    sar eax, 0x10
    mov edx, eax
    neg edx
    sar edx, 1
    inc edx
    add eax, edx
loc_2a67a:
    mov word [esi + 0x518], ax
loc_2a681:
    mov eax, dword [esi + 0x29a]
    sar eax, 0x10
    mov edx, eax
    sar edx, 2
    sub eax, edx
    mov bl, byte [ebp - 0x28]
    mov word [esi + 0x29c], ax
    test bl, 0x40
    je short loc_2a6d0
    cmp dword [esi + 0x5ad], 0
    jne short loc_2a6d0
    mov bx, word [esi + 0x29c]
    mov ax, word [esi + 0x518]
    sub ebx, strict dword 0x98
    add eax, strict dword 0x18
    mov word [esi + 0x29c], bx
    mov word [esi + 0x518], ax
loc_2a6d0:
    test byte [ebp - 0x28], 0x80
    je short loc_2a704
    cmp dword [esi + 0x5ad], 0
    jne short loc_2a704
    mov dx, word [esi + 0x29c]
    mov bx, word [esi + 0x518]
    add edx, strict dword 0x98
    sub ebx, 0x18
    mov word [esi + 0x29c], dx
    mov word [esi + 0x518], bx
loc_2a704:
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [nosplit eax*2 + 0xb8bf0]
    movsx ebx, al
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    mov eax, dword [ebp - 0x2c]
    cmp word [eax + 0x20], 0x20
    jl short loc_2a743
    cmp byte [esi + 0x542], 0
    je short loc_2a743
    mov ebx, dword [esi + 0x26c]
    cmp ebx, strict dword 0x400
    jne short loc_2a77a
loc_2a743:
    mov eax, dword [esi + 0x270]
    and eax, strict dword 0x7ff
    cmp eax, strict dword 0x460
    jle short loc_2a75e
    sub dword [esi + 0x270], 0x60
    jmp short loc_2a780
loc_2a75e:
    cmp eax, strict dword 0x3a0
    jge short loc_2a76e
    add dword [esi + 0x270], 0x60
    jmp short loc_2a780
loc_2a76e:
    mov dword [esi + 0x270], 0x400
    jmp short loc_2a780
loc_2a77a:
    mov dword [esi + 0x270], ebx
loc_2a780:
    mov edx, dword [esi + 0x214]
    sub edx, dword [esi + 0x230]
    imul edx, edx
    mov eax, dword [esi + 0x218]
    sub eax, dword [esi + 0x234]
    imul eax, eax
    add eax, edx
    mov edx, dword [ebp - 0x2c]
    call 0x3b610
    mov word [edx + 0x20], ax
    cmp byte [esi + 0x542], 0
    je short loc_2a7e6
    mov edx, dword [esi + 0x2f6]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov eax, dword [nosplit eax*4 + 0x191386]
    sar eax, 0x10
    mov edx, dword [esi + 0x26c]
    sar eax, 1
    add edx, eax
    mov dword [esi + 0x26c], edx
loc_2a7e6:
    mov bx, word [esi + 0x29a]
    test bx, bx
    jl short loc_2a7f9
    cmp bx, 0x400
    jl short loc_2a813
loc_2a7f9:
    mov eax, dword [esi + 0x238]
    mov dword [esi + 0x214], eax
    mov eax, dword [esi + 0x23c]
    mov dword [esi + 0x218], eax
    jmp short loc_2a82b
loc_2a813:
    mov eax, dword [esi + 0x214]
    mov dword [esi + 0x238], eax
    mov eax, dword [esi + 0x218]
    mov dword [esi + 0x23c], eax
loc_2a82b:
    mov eax, dword [esi + 0x214]
    mov dword [esi + 0x230], eax
    mov eax, dword [esi + 0x218]
    mov dword [esi + 0x234], eax
    mov eax, dword [esi + 0x21c]
    mov dword [esi + 0x240], eax
    mov eax, dword [esi + 0x244]
    mov dword [esi + 0x248], eax
    mov ax, word [esi + 0x294]
    mov dx, word [esi + 0x302]
    mov word [esi + 0x296], ax
    test dx, dx
    jge short loc_2a897
    mov ebx, edx
    mov ax, word [esi + 0x294]
    add ebx, strict dword 0x80
    add eax, strict dword 0x80
    mov word [esi + 0x302], bx
    mov word [esi + 0x294], ax
loc_2a897:
    mov edx, dword [ebp - 0x18]
    mov ebx, 0x28
    cmp dx, 2
    je near loc_2ac38
    mov byte [esi + 0x555], 0
    mov eax, dword [ebp - 0x58]
    sub eax, strict dword 0x2800
    mov dword [ebp - 0x54], eax
    mov edx, dword [ebp - 0x54]
    cmp edx, dword [esi + 0x21c]
    jle near loc_2a994
    test byte [ebp - 0x28], 3
    jne short loc_2a914
    cmp byte [esi + 0x542], 0
    je short loc_2a914
    mov eax, dword [ebp - 0x22]
    sar eax, 0x10
    mov dword [ebp - 0x50], eax
    mov edx, dword [ebp - 0x50]
    shl eax, 2
    add eax, edx
    test byte [nosplit eax*8 + 0x20a076], 2
    je short loc_2a914
    mov eax, dword [ebp - 0x54]
    mov edx, dword [esi + 0x21c]
    sub eax, strict dword 0x1000
    cmp eax, edx
    jg short loc_2a914
    mov eax, dword [ebp - 0x54]
    mov dword [esi + 0x21c], eax
    jmp near loc_2ab11
loc_2a914:
    mov eax, dword [0xbf330]
    mov edx, dword [esi + 0x254]
    add eax, 0x50
    mov byte [esi + 0x542], 0
    add edx, eax
    mov dword [esi + 0x254], edx
    cmp edx, strict dword 0x1800
    jl short loc_2a943
    mov dword [esi + 0x254], 0x1800
loc_2a943:
    cmp dword [esi + 0x254], strict dword 0x960
    jle short loc_2a964
    mov dh, byte [esi + 0x559]
    cmp dh, 0xff
    jae short loc_2a964
    mov al, dh
    inc al
    mov byte [esi + 0x559], al
loc_2a964:
    mov eax, dword [esi + 0x21c]
    mov edx, dword [esi + 0x254]
    shl ebx, 8
    add edx, eax
    mov eax, dword [ebp - 0x58]
    sub eax, ebx
    cmp edx, eax
    jl near loc_2ab11
    mov edx, 1
    movsx eax, di
    call 0x52308
    jmp near loc_2ab11
loc_2a994:
    mov eax, dword [ebp - 0x18]
    mov byte [esi + 0x559], 0
    cmp ax, strict word 1
    je short loc_2a9c9
    cmp ax, strict word 2
    je short loc_2a9c9
    cmp byte [esi + 0x542], 0
    jne short loc_2a9c9
    mov eax, dword [esi + 0x254]
    cmp eax, strict dword 0xc00
    jle short loc_2a9c9
    sar eax, 0xa
    mov byte [esi + 0x575], al
loc_2a9c9:
    mov byte [esi + 0x542], 1
    cmp ebx, 0x28
    jne short loc_2aa2a
    mov eax, dword [ebp - 0x58]
    shl ebx, 8
    sub eax, ebx
    mov edx, dword [esi + 0x21c]
    mov ebx, eax
    sub ebx, edx
    sar ebx, 1
    mov eax, ebx
    test eax, eax
    jns short loc_2a9f1
    neg eax
loc_2a9f1:
    cmp eax, strict dword 0x100
    jge short loc_2a9fa
    xor ebx, ebx
loc_2a9fa:
    mov eax, dword [esi + 0x21c]
    mov edx, dword [esi + 0x254]
    add eax, ebx
    sub edx, strict dword 0x300
    mov dword [esi + 0x21c], eax
    mov dword [esi + 0x254], edx
    test edx, edx
    jge short loc_2aa7d
    mov dword [esi + 0x254], 0
    jmp short loc_2aa7d
loc_2aa2a:
    cmp word [esi + 0x2dc], 0
    jne short loc_2aa7d
    mov eax, ebx
    mov edx, dword [ebp - 0x58]
    shl eax, 7
    sub edx, eax
    mov eax, edx
    mov edx, dword [esi + 0x21c]
    sub eax, edx
    sar eax, 1
    lea ebx, [edx + eax]
    mov dh, byte [esi + 0x53d]
    mov dword [esi + 0x21c], ebx
    test dh, dh
    jne short loc_2aa7d
    mov eax, dword [ebp - 0x58]
    sub eax, strict dword 0x1000
    cmp eax, ebx
    jge short loc_2aa7d
    mov ebx, dword [esi + 0x254]
    mov dword [esi + 0x21c], eax
    sar ebx, 1
    mov dword [esi + 0x254], ebx
loc_2aa7d:
    mov bl, byte [ebp - 0x28]
    mov byte [esi + 0x53d], 0
    test bl, 2
    je short loc_2aab1
    cmp dword [esi + 0x5ad], 0
    jne short loc_2aab1
    mov edx, dword [esi + 0x21c]
    mov dword [esi + 0x27c], 0x309
    add edx, strict dword 0xb00
    mov dword [esi + 0x21c], edx
loc_2aab1:
    test byte [ebp - 0x28], 1
    jne short loc_2aad2
    cmp dword [esi + 0x5ad], 0
    jne short loc_2aad2
    cmp byte [esi + 0x540], 1
    jne short loc_2aad2
    mov byte [esi + 0x540], 0
    jmp short loc_2ab11
loc_2aad2:
    test byte [ebp - 0x28], 1
    je short loc_2ab11
    cmp dword [esi + 0x5ad], 0
    jne short loc_2ab11
    cmp byte [esi + 0x540], 0
    jne short loc_2ab11
    cmp word [esi + 0x2dc], 0
    jne short loc_2ab11
    mov eax, dword [ebp - 0x58]
    sub eax, dword [ebp - 0x5c]
    cmp eax, strict dword 0x3800
    jle short loc_2ab11
    mov word [esi + 0x2dc], 1
    mov byte [esi + 0x540], 1
loc_2ab11:
    cmp word [esi + 0x2dc], 0
    je near loc_2abd7
    test byte [ebp - 0x28], 1
    jne short loc_2ab3e
    cmp dword [esi + 0x5ad], 0
    jne short loc_2ab3e
    cmp byte [esi + 0x540], 1
    jne short loc_2ab3e
    mov byte [esi + 0x540], 0
loc_2ab3e:
    mov ax, word [esi + 0x2dc]
    cmp ax, strict word 0x300
    jge near loc_2abc4
    cmp word [ebp - 0x18], 1
    jne short loc_2ab71
    cmp ax, strict word 0x300
    jle short loc_2ab71
    mov word [esi + 0x2dc], 0
    mov dword [esi + 0x254], 0xfffffe00
    jmp short loc_2abd7
loc_2ab71:
    mov eax, dword [esi + 0x2da]
    sar eax, 0x10
    add eax, strict dword 0x780
    and eax, strict dword 0x7ff
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    mov ebx, 0xc
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov edx, dword [esi + 0x254]
    mov byte [esi + 0x542], 0
    sub edx, eax
    mov ax, word [esi + 0x2dc]
    mov dword [esi + 0x254], edx
    add eax, strict dword 0xb4
    mov word [esi + 0x2dc], ax
    jmp short loc_2abd7
loc_2abc4:
    mov word [esi + 0x2dc], 0
    mov dword [esi + 0x254], 0
loc_2abd7:
    mov eax, dword [esi + 0x254]
    mov ebx, dword [esi + 0x21c]
    add ebx, eax
    mov dword [esi + 0x21c], ebx
    mov eax, dword [ebp - 0x5c]
    add eax, strict dword 0x400
    cmp eax, ebx
    jle short loc_2ac38
    mov ebx, dword [esi + 0x254]
    mov word [esi + 0x2dc], 0
    test ebx, ebx
    jge short loc_2ac20
    mov dword [esi + 0x250], 0
    mov eax, dword [esi + 0x250]
    mov dword [esi + 0x24c], eax
loc_2ac20:
    mov dword [esi + 0x254], 0x80
    mov eax, dword [ebp - 0x5c]
    add eax, strict dword 0x400
    mov dword [esi + 0x21c], eax
loc_2ac38:
    cmp word [esi + 0x300], 0
    jne short loc_2ac69
    cmp word [esi + 0x530], 2
    jg short loc_2ac69
    cmp byte [esi + 0x575], 0
    jne short loc_2ac69
    cmp word [esi + 0x2e2], 0
    jg short loc_2ac69
    cmp word [esi + 0x2e0], 0
    jle short loc_2ac7c
loc_2ac69:
    xor ecx, ecx
    mov dword [esi + 0x24c], ecx
    mov dword [esi + 0x250], ecx
    jmp near loc_2ad01
loc_2ac7c:
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    add eax, eax
    cmp byte [eax + 0xb8bf0], 0
    je short loc_2ad01
    mov edx, dword [eax + 0xb8bed]
    sar edx, 0x18
    mov ebx, dword [ebp - 0x18]
    add edx, edx
    cmp bx, 2
    jne short loc_2acc5
    mov eax, edx
    sar eax, 3
    mov ebx, ecx
    sub edx, eax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, edx
    mov word [esi + 0x298], ax
    jmp short loc_2acda
loc_2acc5:
    mov ebx, ecx
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul edx, eax
    mov word [esi + 0x298], dx
loc_2acda:
    mov ax, word [esi + 0x298]
    add word [esi + 0x294], ax
    mov bh, byte [esi + 0x295]
    mov dword [esi + 0x27c], 0x309
    and bh, 7
    mov byte [esi + 0x295], bh
loc_2ad01:
    cmp dword [esi + 0x24c], 0
    jne short loc_2ad39
    cmp dword [esi + 0x250], 0
    jne short loc_2ad39
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    add eax, eax
    cmp word [eax + 0xb8bf2], 0
    jne short loc_2ad39
    cmp word [eax + 0xb8bf4], 0
    je near loc_2ae02
loc_2ad39:
    movsx edx, di
    lea eax, [edx*4]
    mov dword [esi + 0x27c], 0x309
    add eax, edx
    mov dword [esi + 0x5d5], 1
    mov edx, dword [nosplit eax*2 + 0xb8bf0]
    sar edx, 0x10
    imul edx, ecx
    mov ebx, dword [esi + 0x24c]
    shl edx, 6
    add ebx, edx
    mov dword [esi + 0x24c], ebx
    mov eax, dword [nosplit eax*2 + 0xb8bf2]
    sar eax, 0x10
    imul eax, ecx
    shl eax, 6
    mov ecx, dword [esi + 0x250]
    mov edx, dword [0x939c]
    add ecx, eax
    mov eax, dword [esi + 0x24c]
    mov dword [esi + 0x250], ecx
    mov ecx, 0x10
    imul edx
    shrd eax, edx, cl
    mov dword [esi + 0x24c], eax
    mov edx, dword [0x939c]
    mov eax, dword [esi + 0x250]
    imul edx
    shrd eax, edx, cl
    mov dword [esi + 0x250], eax
    mov eax, dword [esi + 0x24c]
    cdq
    xor eax, edx
    sub eax, edx
    cmp eax, strict dword 0x800
    jge short loc_2ae02
    mov eax, dword [esi + 0x250]
    cdq
    xor eax, edx
    sub eax, edx
    cmp eax, strict dword 0x800
    jge short loc_2ae02
    mov dword [esi + 0x250], 0
    mov eax, dword [esi + 0x250]
    mov dword [esi + 0x24c], eax
loc_2ae02:
    cmp word [ebp - 0x18], 1
    je short loc_2ae12
    cmp byte [esi + 0x553], 1
    jne short loc_2ae1b
loc_2ae12:
    mov dword [ebp - 0x38], 0x400
    jmp short loc_2ae22
loc_2ae1b:
    mov dword [ebp - 0x38], 0x1400
loc_2ae22:
    mov edx, dword [esi + 0x298]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov cx, word [nosplit eax*8 + 0x20a08a]
    mov eax, esi
    cmp cx, 2
    add eax, strict dword 0x29a
    mov ch, byte [0xbf577]
    mov dword [ebp - 0x30], eax
    test ch, ch
    je short loc_2aeae
    mov eax, dword [esi + 0x24c]
    mov ecx, dword [esi + 0x214]
    mov edx, dword [esi + 0x218]
    xor ebx, ebx
    sar eax, 0xe
    mov dword [ebp - 0x4c], ebx
    add ecx, eax
    mov eax, dword [esi + 0x250]
    mov ebx, dword [ebp - 0x30]
    sar eax, 0xe
    mov dword [esi + 0x214], ecx
    add edx, eax
    mov eax, dword [esi + 0x214]
    mov dword [esi + 0x218], edx
    call 0x4500f
    mov edx, dword [esi + 0x298]
    mov eax, dword [ebp - 0x26]
    sar edx, 0x10
    sar eax, 0x10
    call 0x410f9
    jmp near loc_2afb5
loc_2aeae:
    push dword 0x10001
    mov ebx, dword [ebp - 0x38]
    push ebx
    push dword 0x400
    push dword 0xa4
    mov ecx, dword [esi + 0x250]
    mov ax, word [esi + 0x29a]
    push ecx
    mov dword [ebp - 0x1c], eax
    mov eax, dword [esi + 0x24c]
    push eax
    lea eax, [esi + 0x21c]
    mov ecx, dword [ebp - 0x30]
    mov dword [ebp - 0x40], eax
    lea eax, [esi + 0x218]
    mov ebx, dword [ebp - 0x40]
    mov dword [ebp - 0x44], eax
    lea eax, [esi + 0x214]
    mov edx, dword [ebp - 0x44]
    mov dword [ebp - 0x48], eax
    call CLIP_MOVE
    mov dword [ebp - 0x4c], eax
    mov ax, word [esi + 0x29a]
    test ax, ax
    jl near loc_2afb5
    cmp ax, word [0x217fce]
    jge near loc_2afb5
    mov edx, dword [esi + 0x298]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08c], 0x7d2
    jne short loc_2afb5
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, 0x8be10
    add edx, eax
    mov eax, 0x98
    call 0x14e68
    push dword 0x10001
    mov edx, dword [ebp - 0x38]
    mov eax, dword [esi + 0x238]
    push edx
    mov ecx, dword [ebp - 0x30]
    mov dword [esi + 0x214], eax
    push dword 0x400
    mov ebx, dword [ebp - 0x40]
    mov eax, dword [esi + 0x23c]
    push dword 0xa4
    mov dword [esi + 0x218], eax
    mov edx, dword [ebp - 0x44]
    mov eax, dword [esi + 0x240]
    push byte 0
    mov dword [esi + 0x21c], eax
    mov eax, dword [ebp - 0x1c]
    push byte 0
    mov word [esi + 0x29a], ax
    mov eax, dword [ebp - 0x48]
    call CLIP_MOVE
loc_2afb5:
    mov edx, dword [esi + 0x298]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    xor ebx, ebx
    mov cx, word [nosplit eax*8 + 0x20a08c]
    mov dword [ebp - 0x34], ebx
    cmp cx, 0x7d3
    jne short loc_2aff4
    mov eax, dword [esi + 0x21c]
    mov ecx, 1
    add eax, strict dword 0x800
    mov dword [ebp - 0x34], ecx
    mov dword [esi + 0x21c], eax
loc_2aff4:
    mov eax, dword [ebp - 0x4c]
    and eax, strict dword 0xc000
    cmp eax, strict dword 0x8000
    mov eax, dword [ebp - 0x4c]
    and eax, strict dword 0xc000
    cmp eax, strict dword 0xc000
    jne short loc_2b031
    mov ebx, dword [ebp - 0x4c]
    and ebx, strict dword 0xfff
    movsx ecx, di
    movsx ebx, bx
    mov edx, ecx
    mov eax, ebx
    call 0x526a4
    mov edx, ecx
    mov eax, ebx
    call 0x59b70
loc_2b031:
    cmp byte [esi + 0x552], 0
    jne near loc_2b15c
    movsx ebx, di
    lea eax, [ebx*4]
    add eax, ebx
    add eax, eax
    cmp word [eax + 0xb8bf2], 0
    je near loc_2b152
    cmp byte [esi + 0x542], 0
    je near loc_2b152
    add word [esi + 0x528], 0x40
    and byte [esi + 0x529], 7
    mov cl, byte [eax + 0xb8bf6]
    test cl, 2
    je short loc_2b0b4
    mov eax, dword [esi + 0x526]
    sar eax, 0x10
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    sar eax, 6
    mov edx, 2
    test eax, eax
    jns short loc_2b0a2
    neg eax
loc_2b0a2:
    mov dword [esi + 0x244], eax
    mov eax, ebx
    call 0x52308
    jmp near loc_2b15c
loc_2b0b4:
    test cl, 0x20
    je short loc_2b108
    mov eax, dword [esi + 0x526]
    sar eax, 0x10
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    sar eax, 5
    test eax, eax
    jns short loc_2b0d5
    neg eax
loc_2b0d5:
    mov dword [esi + 0x244], eax
    add eax, strict dword 0x100
    mov edx, dword [ebp - 0x34]
    mov dword [esi + 0x244], eax
    test edx, edx
    je short loc_2b0f9
    lea ebx, [eax + 0x200]
    mov dword [esi + 0x244], ebx
loc_2b0f9:
    mov edx, 1
    movsx eax, di
    call 0x52308
    jmp short loc_2b15c
loc_2b108:
    mov eax, dword [esi + 0x526]
    sar eax, 0x10
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    sar eax, 6
    test eax, eax
    jns short loc_2b124
    neg eax
loc_2b124:
    mov dword [esi + 0x244], eax
    lea edx, [eax + 0x10]
    mov ebx, dword [ebp - 0x34]
    mov dword [esi + 0x244], edx
    test ebx, ebx
    je short loc_2b146
    lea ecx, [edx + 0x200]
    mov dword [esi + 0x244], ecx
loc_2b146:
    movsx eax, di
    xor edx, edx
    call 0x52308
    jmp short loc_2b15c
loc_2b152:
    mov dword [esi + 0x244], 0
loc_2b15c:
    mov eax, dword [ebp - 0x26]
    mov ecx, dword [esi + 0x21c]
    mov ebx, dword [esi + 0x218]
    mov edx, dword [esi + 0x214]
    sar eax, 0x10
    add ecx, strict dword 0x2800
    mov dword [ebp - 0x3c], eax
    call SET_SPRITE
    mov edx, dword [ebp - 0x2c]
    mov ax, word [esi + 0x29a]
    cmp ax, word [edx + 0x18]
    je short loc_2b1a3
    mov edx, dword [esi + 0x298]
    mov eax, dword [ebp - 0x3c]
    sar edx, 0x10
    call 0x410f9
loc_2b1a3:
    cmp byte [0xbf577], 0
    jne short loc_2b1f5
    push dword 0x10001
    lea ecx, [esi + 0x29a]
    push dword 0x400
    lea ebx, [esi + 0x21c]
    push dword 0x400
    lea edx, [esi + 0x218]
    push dword 0x80
    lea eax, [esi + 0x214]
    call PUSH_MOVE
    test eax, eax
    jge short loc_2b1f5
    mov eax, dword [ebp - 0x26]
    mov edx, 8
    sar eax, 0x10
    call 0x1cf14
    cmp ax, strict word 0x200
loc_2b1f5:
    test byte [ebp - 0x26], 4
    jne short loc_2b204
    cmp byte [esi + 0x575], 0
    je short loc_2b20b
loc_2b204:
    mov byte [esi + 0x57f], 9
loc_2b20b:
    mov dh, byte [ebp - 0x27]
    test dh, 0x20
    je short loc_2b235
    mov dl, byte [ebp - 0x28]
    mov byte [esi + 0x57f], 9
    test dl, 0x20
    je short loc_2b229
    add dword [esi + 0x220], 0xc
loc_2b229:
    add dword [esi + 0x220], 0xc
    jmp near loc_2b2a3
loc_2b235:
    test dh, 0x40
    je short loc_2b259
    mov ah, byte [ebp - 0x28]
    mov byte [esi + 0x57f], 9
    test ah, 0x20
    je short loc_2b250
    sub dword [esi + 0x220], 0xc
loc_2b250:
    sub dword [esi + 0x220], 0xc
    jmp short loc_2b2a3
loc_2b259:
    mov bh, byte [ebp - 0x28]
    test bh, 8
    je short loc_2b27f
    cmp dword [esi + 0x5ad], 0
    jne short loc_2b27f
    test bh, 0x20
    je short loc_2b276
    add dword [esi + 0x220], 6
loc_2b276:
    add dword [esi + 0x220], 2
    jmp short loc_2b2a3
loc_2b27f:
    mov cl, byte [ebp - 0x28]
    test cl, 0x10
    je short loc_2b2a3
    cmp dword [esi + 0x5ad], 0
    jne short loc_2b2a3
    test cl, 0x20
    je short loc_2b29c
    sub dword [esi + 0x220], 6
loc_2b29c:
    sub dword [esi + 0x220], 2
loc_2b2a3:
    cmp word [esi + 0x5a9], 0
    je short loc_2b2ed
    cmp word [esi + 0x2ec], 0
    jne short loc_2b2ed
    mov eax, dword [esi + 0x5a7]
    sar eax, 0x10
    sar eax, 1
    test ax, ax
    jne short loc_2b2cc
    mov eax, 1
loc_2b2cc:
    mov dx, word [esi + 0x5a9]
    mov ebx, dword [esi + 0x220]
    sub edx, eax
    cwde
    mov word [esi + 0x5a9], dx
    sub ebx, eax
    mov dword [esi + 0x220], ebx
    jmp short loc_2b337
loc_2b2ed:
    mov dh, byte [esi + 0x57f]
    test dh, dh
    jbe short loc_2b337
    mov bl, byte [ebp - 0x27]
    test bl, 0x20
    jne short loc_2b337
    test bl, 0x40
    jne short loc_2b337
    mov eax, dword [esi + 0x220]
    mov cl, dh
    mov edx, eax
    mov ebx, 3
    sar edx, 0x1f
    idiv ebx
    mov edx, 0x21
    sub edx, eax
    dec cl
    mov eax, edx
    mov edx, dword [esi + 0x220]
    mov byte [esi + 0x57f], cl
    add edx, eax
    mov dword [esi + 0x220], edx
loc_2b337:
    mov ch, byte [esi + 0x575]
    test ch, ch
    jbe short loc_2b364
    mov al, ch
    dec al
    mov byte [esi + 0x575], al
    xor eax, eax
    mov al, byte [esi + 0x575]
    mov ecx, dword [esi + 0x220]
    shl eax, 4
    sub ecx, eax
    mov dword [esi + 0x220], ecx
loc_2b364:
    cmp byte [esi + 0x55a], 0
    je short loc_2b395
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [nosplit eax*2 + 0xb8bee]
    sar eax, 0x18
    mov ebx, dword [esi + 0x220]
    sar eax, 1
    add ebx, eax
    mov dword [esi + 0x220], ebx
    jmp short loc_2b3da
loc_2b395:
    cmp word [esi + 0x5a9], 0
    jne short loc_2b3da
    mov eax, dword [esi + 0x220]
    cmp eax, 0x5f
    jle short loc_2b3b9
    cmp eax, 0x69
    jge short loc_2b3b9
    mov dword [esi + 0x220], 0x64
loc_2b3b9:
    mov eax, dword [esi + 0x2cc]
    sar eax, 0x10
    cmp eax, -5
    jle short loc_2b3da
    cmp word [esi + 0x2ce], 5
    jge short loc_2b3da
    mov word [esi + 0x2ce], 0
loc_2b3da:
    mov ecx, dword [esi + 0x220]
    cmp ecx, strict dword 0xfa
    jle short loc_2b3f4
    mov dword [esi + 0x220], 0xfa
    jmp short loc_2b403
loc_2b3f4:
    cmp ecx, -0x5a
    jge short loc_2b403
    mov dword [esi + 0x220], 0xffffffa6
loc_2b403:
    test byte [ebp - 0x28], 4
    je short loc_2b411
    movsx eax, di
    call shoot
loc_2b411:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

has_key:
    push ebp
    mov ebp, esp
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    times 11 db 0    ; Object alignment

computer_get_input:
    push ebp
    mov ebp, esp
    mov eax, 0x32cc
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 15 db 0    ; Padding before the next menu routine
