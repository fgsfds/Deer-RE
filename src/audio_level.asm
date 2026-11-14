bits 32
org 0x2b450

%define PRINT_NOTICE 0x5130c
%define GAME_EXIT 0x14f28
%define SPAWN 0x15ee0
%define KRAND 0x46fa0
%define ROTATE_SPRITE 0x47f83

sound_startup:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    mov edx, dword [0xc00b8]
    cmp edx, 0xd
    je near loc_2b563
    test edx, edx
    je short loc_2b473
    cmp edx, 6
    jne short loc_2b499
loc_2b473:
    lea eax, [ebp - 0x20]
    push eax
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0x18]
    push eax
    mov ecx, 7
    sub esp, 0x1c
    mov esi, 0xc0084
    mov edi, esp
    rep movsd
    call 0x5ee20
    mov ecx, eax
    jmp short loc_2b49b
loc_2b499:
    xor ecx, ecx
loc_2b49b:
    test ecx, ecx
    jne near loc_2b52b
    cmp byte [0x952c], 0
    je short loc_2b4db
    cmp word [0xcf65c], 1
    jle short loc_2b4db
    push dword 0x1f40
    mov ecx, 8
    mov edi, dword [0xc00a8]
    mov ebx, 1
    cmp edi, 4
    jge short loc_2b4d4
    mov edx, edi
    jmp short loc_2b4f4
loc_2b4d4:
    mov edx, 4
    jmp short loc_2b4f4
loc_2b4db:
    mov esi, dword [0xc0068]
    mov ecx, dword [0xc00b0]
    mov ebx, dword [0xc00ac]
    push esi
    mov edx, dword [0xc00a8]
loc_2b4f4:
    mov eax, dword [0xc00b8]
    call 0x5eef0
    mov ecx, eax
    test ecx, ecx
    jne short loc_2b52b
    mov eax, dword [0xc00a0]
    call 0x5f0e8
    cmp dword [0xc007c], 1
    jne short loc_2b52b
    call 0x5f1ac
    test eax, eax
    sete al
    and eax, strict dword 0xff
    call 0x5f1a4
loc_2b52b:
    test ecx, ecx
    je short loc_2b542
    mov eax, 0xffffffff
    call 0x5eb14
    push eax
    call 0x5a77c
    add esp, 4
loc_2b542:
    mov eax, 0x1c4ec
    call 0x5f080
    test eax, eax
    je short loc_2b563
    mov eax, 0xffffffff
    call 0x5eb14
    push eax
    call 0x5a77c
    add esp, 4
loc_2b563:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

sound_shutdown:
    push ebp
    mov ebp, esp
    cmp dword [0xc00b8], 0xd
    je short loc_2b598
    call 0x5efe8
    test eax, eax
    je short loc_2b598
    mov eax, 0xffffffff
    call 0x5eb14
    push eax
    call 0x5a77c
    add esp, 4
loc_2b598:
    mov esp, ebp
    pop ebp
    ret

music_startup:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    cmp dword [0xc00b4], 0xd
    je near loc_2b635
    cmp byte [0x952c], 0
    je short loc_2b5c7
    cmp word [0xcf65c], 1
    jg short loc_2b635
loc_2b5c7:
    mov eax, dword [0xc0074]
    mov ebx, dword [0xc00b8]
    mov dword [0xc0098], eax
    test ebx, ebx
    je short loc_2b5e0
    cmp ebx, 6
    jne short loc_2b602
loc_2b5e0:
    lea eax, [ebp - 0x20]
    push eax
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0x18]
    push eax
    mov ecx, 7
    sub esp, 0x1c
    mov esi, 0xc0084
    mov edi, esp
    rep movsd
    call 0x5ee20
loc_2b602:
    mov edx, dword [0xc0074]
    mov eax, dword [0xc00b4]
    call 0x60ba5
    test eax, eax
    jne short loc_2b622
    mov eax, dword [0xc00a4]
    call 0x60d1c
    jmp short loc_2b635
loc_2b622:
    mov eax, dword [0xb224]
    call 0x60b03
    push eax
    call 0x5a77c
    add esp, 4
loc_2b635:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

music_shutdown:
    push ebp
    mov ebp, esp
    cmp dword [0xc00b4], 0xd
    je short loc_2b67b
    cmp byte [0x952c], 0
    je short loc_2b65f
    cmp word [0xcf65c], 1
    jg short loc_2b67b
loc_2b65f:
    call 0x60c9b
    test eax, eax
    je short loc_2b67b
    mov eax, dword [0xb224]
    call 0x60b03
    push eax
    call 0x5a77c
    add esp, 4
loc_2b67b:
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, eax
    mov eax, edx
    call 0x5aac4
    mov dword [ebx], eax
    test eax, eax
    setne al
    and eax, strict dword 0xff
    dec eax
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    call 0x5ab14
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp ax, strict word 0x1f4
    jae short loc_2b6d7
    cmp dword [0xc0058], 0
    jne short loc_2b6de
loc_2b6d7:
    xor al, al
    jmp near loc_2b780
loc_2b6de:
    cmp dword [0xc00b8], 0xd
    jne short loc_2b6f3
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2b6f3:
    xor ebx, ebx
    mov bx, ax
    lea eax, [ebx*8]
    sub eax, ebx
    xor edx, edx
    add eax, eax
    mov dl, byte [0xc0043]
    add eax, strict dword 0x67478
    call 0x310bf
    mov ecx, eax
    cmp eax, -1
    jne short loc_2b734
    mov eax, 0x32f0
    mov edx, ebx
    call 0x51350
    xor al, al
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2b734:
    lea edi, [ebx*4]
    sub edi, ebx
    call 0x31383
    shl edi, 2
    mov esi, eax
    add edi, ebx
    mov dword [nosplit ebx*4 + 0x1f350], eax
    mov byte [edi + 0xbd9cc], 0xc8
    mov eax, 0xbd9c8
    add eax, edi
    mov edx, esi
    lea ebx, [eax + 4]
    call 0x3085c
    mov ebx, esi
    mov eax, ecx
    mov edx, dword [edi + 0xbd9c8]
    call 0x31201
    mov eax, ecx
    call 0x313c4
    mov al, 1
loc_2b780:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

play_music:
    push ebp
    mov ebp, esp
    movsx edx, ax
    mov eax, 0x330c
    call 0x51350
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret 4

xyz_sound:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x34
    mov edi, eax
    mov word [ebp - 0x14], dx
    mov dword [ebp - 0x34], ebx
    mov dword [ebp - 0x24], ecx
    test dx, dx
    jl short loc_2b7c4
    cmp dx, 0x1000
    jl short loc_2b7d8
loc_2b7c4:
    mov eax, 0x3320
    call PRINT_NOTICE
    mov eax, 0xffffffff
    jmp near loc_2be19
loc_2b7d8:
    cmp ax, strict word 0x1f4
    jge near loc_2b86f
    cmp dword [0xc00b8], 0xd
    je near loc_2b86f
    cwde
    test byte [eax + 0xbcd5c], 8
    je short loc_2b806
    cmp dword [0xbfb53], 0
    jne near loc_2b86f
loc_2b806:
    cmp dword [0xc0058], 0
    je short loc_2b86f
    movsx ebx, di
    mov edx, ebx
    lea eax, [ebx*4]
    sub eax, ebx
    cmp dword [edx + eax*4 + 0xbd9d1], 3
    jg short loc_2b86f
    xor eax, eax
    mov al, byte [ebx + 0xbcf50]
    call 0x5f1dc
    test eax, eax
    je short loc_2b86f
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov cx, word [eax + 0x8c120]
    test cx, cx
    jle short loc_2b858
    cmp cx, 0x4e
    jle short loc_2b86f
loc_2b858:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 1
    je short loc_2b87d
loc_2b86f:
    mov eax, 0xffffffff
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_2b87d:
    movsx eax, di
    test byte [eax + 0xbcd5c], 4
    je near loc_2b92f
    cmp dword [0xc005c], 0
    je short loc_2b8da
    cmp dword [0xbffe3], 1
    jle short loc_2b8e8
    mov edx, dword [ebp - 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    cmp word [eax + 0x191376], 0xf05
    jne short loc_2b8e8
    mov bx, word [0xbf562]
    cmp bx, word [eax + 0x19138a]
    je short loc_2b8e8
    cmp dword [0xbfb4b], 1
    je short loc_2b8e8
loc_2b8da:
    mov eax, 0xffffffff
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_2b8e8:
    xor ebx, ebx
    xor esi, esi
loc_2b8ec:
    mov edx, esi
    mov ecx, dword [esi + 0xbd9d1]
    xor eax, eax
    test ecx, ecx
    jle short loc_2b923
loc_2b8fa:
    cmp dword [edx + 0xbd9d1], 0
    jle short loc_2b91a
    test byte [ebx + 0xbcd5c], 4
    je short loc_2b91a
    mov eax, 0xffffffff
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_2b91a:
    inc eax
    cmp eax, dword [edx + 0xbd9d1]
    jl short loc_2b8fa
loc_2b923:
    inc ebx
    add esi, 0xd
    cmp ebx, strict dword 0x1f4
    jl short loc_2b8ec
loc_2b92f:
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c04c]
    mov esi, dword [ebp + 8]
    mov dword [ebp - 0x1c], edx
    mov edx, dword [eax + 0x8c050]
    mov ecx, dword [eax + 0x8c048]
    mov dword [ebp - 0x2c], edx
    mov dx, word [eax + 0x8c0aa]
    mov ebx, dword [ebp - 0x2c]
    mov word [ebp - 0x10], dx
    mov edx, dword [eax + 0x8c0a2]
    mov eax, dword [eax + 0x8c0aa]
    sar edx, 0x10
    sar eax, 0x10
    sub ebx, esi
    add edx, eax
    mov eax, dword [ebp - 0x24]
    mov dword [ebp - 0x3c], edx
    mov edx, dword [ebp - 0x1c]
    mov esi, dword [ebp - 0x34]
    sub edx, eax
    mov eax, ecx
    sar ebx, 4
    sub eax, esi
    mov ecx, dword [ebp - 0x14]
    call 0x608fc
    mov edx, eax
    mov esi, eax
    test cx, cx
    jl near loc_2ba1e
    movsx eax, di
    test byte [eax + 0xbcd5c], 0x10
    jne short loc_2ba1e
    mov ebx, dword [ebp - 0x16]
    sar ebx, 0x10
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    lea ebx, [eax*4]
    cmp word [ebx + 0x191376], 5
    jne short loc_2ba1e
    cmp word [ebx + 0x19138e], 0x3e7
    jge short loc_2ba1e
    mov eax, dword [ebx + 0x19137e]
    sar eax, 0x10
    mov dword [ebp - 0x38], eax
    mov ecx, dword [ebp - 0x38]
    shl eax, 2
    add eax, ecx
    mov ax, word [nosplit eax*8 + 0x20a08a]
    xor ah, ah
    cmp ax, strict word 9
    jge short loc_2ba1e
    mov ebx, dword [ebx + 0x19138e]
    sar ebx, 0x10
    mov eax, edx
    inc ebx
    mov edx, eax
    sar edx, 0x12
    shl eax, 0xe
    idiv ebx
    mov esi, eax
loc_2ba1e:
    movsx edx, di
    mov ax, word [nosplit edx*2 + 0x1ef68]
    mov word [ebp - 0xc], ax
    mov dx, word [nosplit edx*2 + 0x1eb80]
    mov ecx, dword [ebp - 0xe]
    movsx eax, dx
    sar ecx, 0x10
    mov dword [ebp - 0x28], eax
    sub eax, ecx
    test eax, eax
    jns short loc_2ba49
    neg eax
loc_2ba49:
    mov ebx, eax
    mov dword [ebp - 0x20], eax
    test eax, eax
    je short loc_2ba7e
    cmp dx, word [ebp - 0xc]
    jle short loc_2ba68
    call 0x611ef
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    add ecx, edx
    jmp short loc_2ba7e
loc_2ba68:
    call 0x611ef
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [ebp - 0x28]
    add eax, edx
    mov dword [ebp - 0x18], eax
    jmp short loc_2ba81
loc_2ba7e:
    mov dword [ebp - 0x18], ecx
loc_2ba81:
    movsx eax, di
    mov eax, dword [nosplit eax*2 + 0x1fb1e]
    sar eax, 0x10
    add esi, eax
    je short loc_2bafd
    mov edx, dword [ebp - 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    cmp word [eax + 0x191376], 5
    je short loc_2bafd
    mov edx, dword [eax + 0x19137e]
    sar edx, 0x10
    push edx
    mov edx, dword [eax + 0x191370]
    sub edx, strict dword 0x1800
    mov ecx, dword [ebp - 0x12]
    push edx
    mov edx, dword [eax + 0x19136c]
    mov ebx, dword [eax + 0x191368]
    push edx
    sar ecx, 0x10
    mov eax, dword [ebp - 0x20]
    push ebx
    mov ebx, dword [ebp - 0x2c]
    mov edx, dword [ebp - 0x1c]
    sub ebx, strict dword 0x1800
    call 0x41280
    test eax, eax
    jne short loc_2bafd
    mov eax, esi
    sar eax, 2
    add esi, eax
loc_2bafd:
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c0a8]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08a], 2
    jne short loc_2bb3b
    movsx eax, di
    test byte [eax + 0xbcd5c], 4
    jne short loc_2bb3b
    mov dword [ebp - 0x18], 0xfffffd00
loc_2bb3b:
    cmp esi, strict dword 0x7ad4
    jle short loc_2bb70
    mov edx, dword [ebp - 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    cmp word [nosplit eax*4 + 0x191376], 5
    je short loc_2bb70
    mov eax, 0xffffffff
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_2bb70:
    movsx edx, di
    lea ecx, [edx*4]
    sub ecx, edx
    shl ecx, 2
    add ecx, edx
    cmp dword [ecx + 0xbd9d1], 0
    jle short loc_2bbf1
    mov ebx, dword [ebp - 0x16]
    sar ebx, 0x10
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    lea ebx, [eax*4]
    cmp word [ebx + 0x191376], 5
    je short loc_2bbf1
    lea eax, [edx*4]
    sub eax, edx
    mov ax, word [nosplit eax*8 + 0x7f3a0]
    cmp ax, word [ebp - 0x14]
    je short loc_2bbea
    cmp dword [ecx + 0xbd9d1], 1
    jg short loc_2bbea
    mov eax, 0x191368
    add eax, ebx
    call 0x14814
    test ax, ax
    je short loc_2bbf1
    cmp word [ebx + 0x191392], 0
    jg short loc_2bbf1
loc_2bbea:
    mov eax, edx
    call stop_env_sound
loc_2bbf1:
    mov edx, dword [ebp - 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    cmp word [eax + 0x191376], 0xf05
    jne short loc_2bc29
    mov bx, word [0xbf562]
    cmp bx, word [eax + 0x19138a]
    jne short loc_2bc29
    xor ebx, ebx
    xor esi, esi
    jmp short loc_2bc4f
loc_2bc29:
    mov edx, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x24]
    mov eax, dword [ebp - 0x20]
    mov ecx, dword [ebp - 0x34]
    sub edx, ebx
    mov ebx, dword [ebp - 0x3c]
    sub eax, ecx
    add ebx, strict dword 0x800
    call 0x3b4fc
    sub ebx, eax
    and ebx, strict dword 0x7ff
loc_2bc4f:
    movsx edx, di
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    add eax, edx
    cmp dword [eax + 0xbd9c8], 0
    jne short loc_2bc82
    xor eax, eax
    mov ax, di
    call 0x2b6c0
    test al, al
    jne short loc_2bca0
    xor eax, eax
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_2bc82:
    cmp byte [eax + 0xbd9cc], 0xc8
    jae short loc_2bc94
    mov byte [eax + 0xbd9cc], 0xc8
    jmp short loc_2bca0
loc_2bc94:
    mov dl, byte [eax + 0xbd9cc]
    inc byte [eax + 0xbd9cc]
loc_2bca0:
    movsx eax, di
    test byte [eax + 0xbcd5c], 0x10
    je short loc_2bcae
    xor esi, esi
loc_2bcae:
    cmp esi, strict dword 0x1a40
    jge short loc_2bcbb
    mov esi, 0x1a40
loc_2bcbb:
    movsx edx, di
    lea eax, [edx*4]
    sub eax, edx
    mov ecx, esi
    shl eax, 2
    sar ecx, 6
    add eax, edx
    test byte [edx + 0xbcd5c], 1
    je near loc_2bd6c
    cmp dword [eax + 0xbd9d1], 0
    jle short loc_2bcf5
    mov eax, 0xffffffff
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_2bcf5:
    lea esi, [edx*4]
    mov eax, dword [eax + 0xbd9c8]
    mov dword [ebp - 0x30], esi
    mov bx, word [eax + 0x14]
    cmp byte [eax], 0x43
    jne short loc_2bd3d
    movsx esi, di
    mov dl, byte [edx + 0xbcf50]
    push esi
    and edx, strict dword 0xff
    push edx
    push byte 0
    xor edx, edx
    push ecx
    mov dx, bx
    mov ebx, dword [ebp - 0x30]
    push ecx
    mov ebx, dword [ebx + 0x1f350]
    mov ecx, dword [ebp - 0x18]
    add ebx, edx
    call 0x5f278
    jmp short loc_2bdae
loc_2bd3d:
    movsx esi, di
    mov dl, byte [edx + 0xbcf50]
    push esi
    and edx, strict dword 0xff
    push edx
    push byte 0
    xor edx, edx
    push ecx
    mov dx, bx
    mov ebx, dword [ebp - 0x30]
    push ecx
    mov ebx, dword [ebx + 0x1f350]
    mov ecx, dword [ebp - 0x18]
    add ebx, edx
    call 0x5f2ec
    jmp short loc_2bdae
loc_2bd6c:
    mov eax, dword [eax + 0xbd9c8]
    sar ebx, 6
    cmp byte [eax], 0x43
    jne short loc_2bd95
    movsx esi, di
    mov dl, byte [edx + 0xbcf50]
    push esi
    and edx, strict dword 0xff
    push edx
    mov edx, dword [ebp - 0x18]
    call 0x5f32c
    jmp short loc_2bdae
loc_2bd95:
    movsx esi, di
    mov dl, byte [edx + 0xbcf50]
    push esi
    and edx, strict dword 0xff
    push edx
    mov edx, dword [ebp - 0x18]
    call 0x5f35c
loc_2bdae:
    mov ecx, eax
    test ecx, ecx
    jle short loc_2bdfa
    movsx esi, di
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    lea edx, [esi + eax]
    mov ebx, dword [edx + 0xbd9d1]
    lea edi, [ebx*4]
    lea eax, [esi*4]
    sub edi, ebx
    sub eax, esi
    add edi, edi
    mov ebx, dword [ebp - 0x14]
    mov word [edi + eax*8 + 0x7f3a0], bx
    mov dword [edi + eax*8 + 0x7f3a2], ecx
    inc dword [edx + 0xbd9d1]
    jmp short loc_2be17
loc_2bdfa:
    movsx edx, di
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    add eax, edx
    mov dl, byte [eax + 0xbd9cc]
    dec byte [eax + 0xbd9cc]
loc_2be17:
    mov eax, ecx
loc_2be19:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    db 0x8b, 0xc0            ; mov eax, eax alignment

sound:
    push ebp
    mov ebp, esp
    push edx
    movsx edx, ax
    mov eax, 0x3348
    call 0x51350
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    mov esi, eax
    cmp ax, strict word 0x1f4
    jge near loc_2c08a
    mov edx, dword [0xc0058]
    test edx, edx
    je near loc_2c08a
    cmp dword [0xc00b8], 0xd
    je near loc_2c08a
    test edx, edx
    je near loc_2c08a
    cmp dword [0xc005c], 0
    jne short loc_2be8d
    cwde
    test byte [eax + 0xbcd5c], 4
    jne near loc_2c08a
loc_2be8d:
    movsx eax, si
    test byte [eax + 0xbcd5c], 8
    je short loc_2bea6
    cmp dword [0xbfb53], 0
    jne near loc_2c08a
loc_2bea6:
    movsx edx, si
    xor eax, eax
    mov al, byte [edx + 0xbcf50]
    call 0x5f1dc
    test eax, eax
    je near loc_2c08a
    lea edi, [nosplit edx*2]
    mov dx, word [edi + 0x1ef68]
    movsx eax, dx
    mov di, word [edi + 0x1eb80]
    mov dword [ebp - 0x18], eax
    movsx ebx, di
    mov ecx, dword [ebp - 0x18]
    mov eax, ebx
    sub eax, ecx
    test eax, eax
    jns short loc_2bee9
    neg eax
loc_2bee9:
    mov ecx, eax
    test ax, ax
    je short loc_2bf1a
    cmp dx, di
    jge short loc_2bf09
    call 0x611ef
    mov edx, eax
    movsx ebx, cx
    sar edx, 0x1f
    idiv ebx
    add edx, dword [ebp - 0x18]
    jmp short loc_2bf1a
loc_2bf09:
    call 0x611ef
    mov edx, eax
    movsx ecx, cx
    sar edx, 0x1f
    idiv ecx
    add edx, ebx
loc_2bf1a:
    mov ecx, edx
    movsx edx, si
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    add eax, edx
    cmp dword [eax + 0xbd9c8], 0
    jne short loc_2bf4a
    xor eax, eax
    mov ax, si
    call 0x2b6c0
    test al, al
    je near loc_2c08a
    jmp short loc_2bf68
loc_2bf4a:
    cmp byte [eax + 0xbd9cc], 0xc8
    jae short loc_2bf5c
    mov byte [eax + 0xbd9cc], 0xc8
    jmp short loc_2bf68
loc_2bf5c:
    mov dl, byte [eax + 0xbd9cc]
    inc byte [eax + 0xbd9cc]
loc_2bf68:
    movsx edx, si
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    mov bl, byte [edx + 0xbcd5c]
    add eax, edx
    test bl, 1
    je near loc_2c01c
    lea ebx, [edx*4]
    mov eax, dword [eax + 0xbd9c8]
    mov dword [ebp - 0x1c], ebx
    cmp byte [eax], 0x43
    jne short loc_2bfdd
    movsx ebx, si
    mov dl, byte [edx + 0xbcf50]
    xor edi, edi
    push ebx
    mov di, word [eax + 0x14]
    and edx, strict dword 0xff
    push edx
    push dword 0x96
    mov ebx, dword [ebp - 0x1c]
    push dword 0x96
    movsx ecx, cx
    mov ebx, dword [ebx + 0x1f350]
    push dword 0x96
    mov edx, edi
    add ebx, edi
    call 0x5f278
    jmp near loc_2c069
loc_2bfdd:
    movsx ebx, si
    mov dl, byte [edx + 0xbcf50]
    xor edi, edi
    push ebx
    mov di, word [eax + 0x14]
    and edx, strict dword 0xff
    push edx
    push dword 0x96
    mov edx, dword [ebp - 0x1c]
    push dword 0x96
    mov edx, dword [edx + 0x1f350]
    movsx ecx, cx
    add edx, edi
    push dword 0x96
    mov ebx, edx
    mov edx, edi
    call 0x5f2ec
    jmp short loc_2c069
loc_2c01c:
    mov eax, dword [eax + 0xbd9c8]
    cmp byte [eax], 0x43
    jne short loc_2c049
    movsx ebx, si
    mov dl, byte [edx + 0xbcf50]
    push ebx
    and edx, strict dword 0xff
    xor ebx, ebx
    push edx
    movsx edx, cx
    mov ecx, 0x69
    call 0x5f32c
    jmp short loc_2c069
loc_2c049:
    movsx ebx, si
    mov dl, byte [edx + 0xbcf50]
    push ebx
    and edx, strict dword 0xff
    xor ebx, ebx
    push edx
    movsx edx, cx
    mov ecx, 0x69
    call 0x5f35c
loc_2c069:
    test eax, eax
    jg short loc_2c08a
    movsx edx, si
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    add eax, edx
    mov dl, byte [eax + 0xbd9cc]
    dec byte [eax + 0xbd9cc]
loc_2c08a:
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
    xor edx, edx
    mov dx, ax
    mov eax, 0x3358
    call 0x51350
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret

stop_sound:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    mov ebx, eax
    cmp ax, strict word 0x1f4
    jb short loc_2c0c1
    mov eax, 0xffffffff
    jmp short loc_2c0f4
loc_2c0c1:
    movsx esi, dx
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    sub eax, esi
    mov edx, dword [nosplit eax*4 + 0x191370]
    mov ecx, dword [nosplit eax*4 + 0x19136c]
    push edx
    mov edx, dword [nosplit eax*4 + 0x191368]
    movsx eax, bx
    mov ebx, edx
    mov edx, esi
    call xyz_sound
loc_2c0f4:
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret

stop_env_sound:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    test ax, ax
    jl short loc_2c10d
    cmp ax, strict word 0x1f4
    jl short loc_2c119
loc_2c10d:
    mov eax, 0x3370
    call PRINT_NOTICE
    jmp short loc_2c15c
loc_2c119:
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    add eax, edx
    mov ebx, dword [eax + 0xbd9d1]
    test ebx, ebx
    jle short loc_2c15c
    dec ebx
    lea ecx, [ebx*4]
    lea eax, [edx*4]
    sub ecx, ebx
    sub eax, edx
    add ecx, ecx
    mov eax, dword [ecx + eax*8 + 0x7f3a2]
    call 0x5f448
    mov eax, edx
    call 0x2c4ec
loc_2c15c:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov ecx, eax
    mov edi, edx
    test ax, ax
    jl short loc_2c17a
    cmp ax, strict word 0x1f4
    jl short loc_2c186
loc_2c17a:
    mov eax, 0x3384
    call PRINT_NOTICE
    jmp short loc_2c1df
loc_2c186:
    movsx ebx, ax
    lea edx, [ebx*4]
    sub edx, ebx
    shl edx, 2
    add edx, ebx
    cmp dword [edx + 0xbd9d1], 0
    jle short loc_2c1df
    mov si, word [edx + 0xbd9d1]
    xor eax, eax
    test si, si
    jle short loc_2c1df
loc_2c1ae:
    movsx edx, cx
    imul edx, edx, 0x18
    movsx ebx, ax
    imul ebx, ebx, 6
    add edx, ebx
    cmp di, word [edx + 0x7f3a0]
    jne short loc_2c1d9
    mov eax, dword [edx + 0x7f3a2]
    call 0x5f448
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2c1d9:
    inc eax
    cmp ax, si
    jl short loc_2c1ae
loc_2c1df:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret

pan_3d_sound:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x30
    xor edx, edx
    mov dword [0xc5874], edx
    mov edx, dword [0xbfaf9]
    sar edx, 0x10
    cmp edx, -1
    jne short loc_2c24f
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c048]
    mov dword [ebp - 0x40], edx
    mov edx, dword [eax + 0x8c04c]
    mov dword [ebp - 0x30], edx
    mov edx, dword [eax + 0x8c050]
    mov dword [ebp - 0x44], edx
    mov dx, word [eax + 0x8c0aa]
    mov bx, word [eax + 0x8c0ac]
    mov word [ebp - 0x1c], dx
    mov dx, word [eax + 0x8c0a4]
    add edx, ebx
    jmp short loc_2c28f
loc_2c24f:
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edx, dword [nosplit eax*4 + 0x191368]
    mov dword [ebp - 0x40], edx
    mov edx, dword [nosplit eax*4 + 0x19136c]
    mov dword [ebp - 0x30], edx
    mov edx, dword [nosplit eax*4 + 0x191370]
    mov dword [ebp - 0x44], edx
    mov dx, word [nosplit eax*4 + 0x191380]
    mov word [ebp - 0x1c], dx
    mov dx, word [nosplit eax*4 + 0x191384]
loc_2c28f:
    mov eax, dword [ebp - 0x44]
    add dh, 8
    xor edi, edi
    sub eax, strict dword 0x1800
    mov dword [ebp - 0x20], edx
    mov dword [ebp - 0x38], eax
loc_2c2a2:
    xor ecx, ecx
    mov word [ebp - 0x28], cx
    jmp near loc_2c4bd
loc_2c2ad:
    imul eax, eax, 0x18
    imul edx, edx, 6
    mov ax, word [edx + eax + 0x7f3a0]
    mov word [ebp - 0x24], ax
    mov esi, dword [ebp - 0x26]
    sar esi, 0x10
    imul esi, esi, 0x2c
    mov eax, dword [esi + 0x191368]
    mov dword [ebp - 0x2c], eax
    mov eax, dword [esi + 0x19136c]
    mov dword [ebp - 0x34], eax
    mov eax, dword [esi + 0x191370]
    mov dword [ebp - 0x3c], eax
    cmp word [esi + 0x191376], 0xf05
    jne short loc_2c30b
    mov dx, word [0xbf562]
    cmp dx, word [esi + 0x19138a]
    jne short loc_2c30b
    xor ecx, ecx
    xor esi, esi
    mov word [ebp - 0x18], cx
    jmp near loc_2c3b1
loc_2c30b:
    mov esi, dword [ebp - 0x30]
    mov eax, dword [ebp - 0x34]
    mov ecx, dword [ebp - 0x40]
    mov edx, dword [ebp - 0x2c]
    sub esi, eax
    sub ecx, edx
    mov edx, esi
    mov eax, ecx
    call 0x3b4fc
    mov edx, dword [ebp - 0x20]
    sub edx, eax
    mov word [ebp - 0x18], dx
    mov ah, byte [ebp - 0x17]
    and ah, 7
    mov ebx, dword [ebp - 0x44]
    mov byte [ebp - 0x17], ah
    sub ebx, dword [ebp - 0x3c]
    mov edx, esi
    sar ebx, 4
    mov eax, ecx
    call 0x608fc
    mov ebx, dword [ebp - 0x24]
    mov edx, eax
    mov esi, eax
    test bx, bx
    jl short loc_2c3b1
    movsx eax, di
    test byte [eax + 0xbcd5c], 0x10
    jne short loc_2c3b1
    mov eax, dword [ebp - 0x26]
    sar eax, 0x10
    imul eax, eax, 0x2c
    cmp word [eax + 0x191376], 5
    jne short loc_2c3b1
    cmp word [eax + 0x19138e], 0x3e7
    jge short loc_2c3b1
    mov ebx, dword [eax + 0x19137e]
    sar ebx, 0x10
    imul ebx, ebx, 0x28
    mov bx, word [ebx + 0x20a08a]
    xor bh, bh
    cmp bx, 9
    jge short loc_2c3b1
    mov ebx, dword [eax + 0x19138e]
    sar ebx, 0x10
    mov eax, edx
    inc ebx
    mov edx, eax
    sar edx, 0x12
    shl eax, 0xe
    idiv ebx
    mov esi, eax
loc_2c3b1:
    movsx eax, di
    mov eax, dword [nosplit eax*2 + 0x1fb1e]
    sar eax, 0x10
    add esi, eax
    je short loc_2c40f
    mov eax, dword [ebp - 0x26]
    sar eax, 0x10
    imul eax, eax, 0x2c
    cmp word [eax + 0x191376], 5
    je short loc_2c40f
    mov eax, dword [eax + 0x19137e]
    sar eax, 0x10
    push eax
    mov eax, dword [ebp - 0x3c]
    sub eax, strict dword 0x1800
    mov edx, dword [ebp - 0x34]
    push eax
    mov ebx, dword [ebp - 0x2c]
    mov ecx, dword [ebp - 0x1e]
    push edx
    sar ecx, 0x10
    mov eax, dword [ebp - 0x40]
    push ebx
    mov edx, dword [ebp - 0x30]
    mov ebx, dword [ebp - 0x38]
    call 0x41280
    test eax, eax
    jne short loc_2c40f
    mov eax, esi
    sar eax, 2
    add esi, eax
loc_2c40f:
    mov eax, dword [ebp - 0x26]
    sar eax, 0x10
    imul eax, eax, 0x2c
    cmp word [eax + 0x191376], 5
    jne short loc_2c433
    cmp word [eax + 0x19138e], 0x3e7
    jge short loc_2c433
    inc dword [0xc5874]
loc_2c433:
    cmp esi, strict dword 0x7ad4
    jle short loc_2c458
    mov eax, dword [ebp - 0x26]
    sar eax, 0x10
    imul eax, eax, 0x2c
    cmp word [eax + 0x191376], 5
    je short loc_2c458
    movsx eax, di
    call stop_env_sound
    jmp short loc_2c4b9
loc_2c458:
    movsx eax, di
    imul eax, eax, 0xd
    cmp dword [eax + 0xbd9c8], 0
    jne short loc_2c475
    xor eax, eax
    mov ax, di
    call 0x2b6c0
    test al, al
    je short loc_2c4b9
loc_2c475:
    movsx eax, di
    test byte [eax + 0xbcd5c], 0x10
    je short loc_2c483
    xor esi, esi
loc_2c483:
    cmp esi, strict dword 0x1a40
    jge short loc_2c490
    mov esi, 0x1a40
loc_2c490:
    movsx eax, di
    imul ecx, eax, 0x18
    mov eax, dword [ebp - 0x2a]
    sar eax, 0x10
    imul eax, eax, 6
    mov edx, dword [ebp - 0x1a]
    mov ebx, esi
    sar edx, 0x10
    sar ebx, 6
    sar edx, 6
    mov eax, dword [ecx + eax + 0x7f3a2]
    call 0x5f418
loc_2c4b9:
    inc word [ebp - 0x28]
loc_2c4bd:
    movsx eax, di
    imul ebx, eax, 0xd
    mov edx, dword [ebp - 0x2a]
    sar edx, 0x10
    cmp edx, dword [ebx + 0xbd9d1]
    jl near loc_2c2ad
    inc edi
    cmp di, 0x1f4
    jl near loc_2c2a2
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
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    mov dword [ebp - 0x18], eax
    test eax, eax
    jl near loc_2c645
    cmp eax, strict dword 0x1f4
    jge near loc_2c645
    mov edx, eax
    shl eax, 2
    sub eax, edx
    shl eax, 2
    add eax, edx
    mov ecx, dword [eax + 0xbd9d1]
    test ecx, ecx
    jle near loc_2c628
    mov eax, edx
    mov dl, byte [eax + 0xbcd5c]
    mov dword [ebp - 0x20], ecx
    test dl, 0x10
    jne near loc_2c5e7
    xor ebx, ebx
    test ecx, ecx
    jle near loc_2c5e7
    mov edx, eax
    shl eax, 2
    sub eax, edx
    shl eax, 3
    mov dword [ebp - 0x1c], eax
    mov edx, eax
loc_2c554:
    mov ecx, dword [edx + 0x7f39e]
    sar ecx, 0x10
    imul eax, ecx, 0x2c
    cmp word [eax + 0x191376], 5
    jne short loc_2c5d8
    mov esi, dword [eax + 0x19137e]
    sar esi, 0x10
    imul esi, esi, 0x28
    cmp word [esi + 0x20a08a], 3
    jge short loc_2c5d8
    cmp word [eax + 0x19138e], 0x3e7
    jge short loc_2c5d8
    lea eax, [ecx*8]
    add eax, ecx
    shl eax, 3
    mov esi, dword [ebp - 0x20]
    sub eax, ecx
    xor ecx, ecx
    inc ebx
    mov dword [eax + 0x20467], ecx
    cmp ebx, esi
    jge short loc_2c5e7
    lea ebx, [esi - 1]
    lea eax, [ebx*4]
    sub eax, ebx
    mov edi, dword [ebp - 0x1c]
    add eax, eax
    add eax, edi
    mov ebx, dword [eax + 0x7f3a2]
    mov dword [edx + 0x7f3a2], ebx
    mov ax, word [eax + 0x7f3a0]
    mov word [edx + 0x7f3a0], ax
    jmp short loc_2c5e7
loc_2c5d8:
    mov edi, dword [ebp - 0x20]
    inc ebx
    add edx, 6
    cmp ebx, edi
    jl near loc_2c554
loc_2c5e7:
    mov edx, dword [ebp - 0x18]
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    mov ebx, dword [ebp - 0x18]
    add edx, eax
    lea eax, [ebx*4]
    sub eax, ebx
    lea ebx, [eax*8]
    dec dword [edx + 0xbd9d1]
    mov edx, dword [ebp - 0x20]
    dec edx
    lea eax, [edx*4]
    sub eax, edx
    mov word [ebx + eax*2 + 0x7f3a0], 0xffff
loc_2c628:
    mov edx, dword [ebp - 0x18]
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    add eax, edx
    mov dl, byte [eax + 0xbd9cc]
    dec byte [eax + 0xbd9cc]
loc_2c645:
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
    push edx
    mov dh, 0xc7
    xor eax, eax
loc_2c658:
    cmp byte [eax + 0xbd9cc], 0xc8
    jb short loc_2c667
    mov byte [eax + 0xbd9cc], dh
loc_2c667:
    add eax, 0xd
    cmp eax, strict dword 0x1964
    jne short loc_2c658
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    times 9 db 0    ; Object alignment

do_torch:
    push ebp
    mov ebp, esp
    mov eax, 0x339c
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

do_jail_door:
    push ebp
    mov ebp, esp
    mov eax, 0x33b4
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

move_mine_cart:
    push ebp
    mov ebp, esp
    mov eax, 0x33d0
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 7 db 0    ; Object alignment

thunder:
    push ebp
    mov ebp, esp
    mov eax, 0x33ec
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 15 db 0    ; Object alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    mov ecx, eax
    mov eax, edx
    mov ebx, 0x25
    mov edx, 0x3404
    call 0x61223
    test eax, eax
    jne short loc_2c703
    mov eax, 0xffffffff
    jmp short loc_2c707
loc_2c703:
    mov dword [ecx], eax
    xor eax, eax
loc_2c707:
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push ebx
    push edx
    test eax, eax
    jne short loc_2c720
    mov eax, 0xffffffff
    jmp short loc_2c731
loc_2c720:
    mov ebx, 0x42
    mov edx, 0x3404
    call 0x6123f
    xor eax, eax
loc_2c731:
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    times 8 db 0    ; Object alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    movsx eax, dx
    cmp dword [nosplit eax*4 + 0x169e68], 0
    jne short loc_2c75b
    call 0x3a5f3
loc_2c75b:
    movsx edi, dx
    mov eax, edi
    mov ebx, dword [nosplit edi*2 + 0x17cee6]
    mov edx, dword [nosplit edi*2 + 0x1816e6]
    sar ebx, 0x10
    sar edx, 0x10
    movsx esi, si
    call 0x4d6c1
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    sub eax, esi
    lea esi, [eax*4]
    mov eax, dword [esi + 0x19137e]
    sar eax, 0x10
    push eax
    mov eax, dword [esi + 0x191375]
    mov ecx, dword [esi + 0x191382]
    sar eax, 0x18
    mov ebx, dword [esi + 0x191370]
    add eax, 0x64
    mov edx, dword [esi + 0x19136c]
    push eax
    sar ecx, 0x10
    mov eax, dword [esi + 0x191368]
    call 0x336b2
    mov ah, 1
    mov ecx, 0x10000
    mov ebx, dword [esi + 0x191382]
    mov edx, dword [esi + 0x19136c]
    mov byte [0xc0044], ah
    sar ebx, 0x10
    mov eax, dword [esi + 0x191368]
    call 0x1675c
    xor dl, dl
    mov byte [0xc0044], dl
    call 0x3b895
    call 0x4d86f
    mov eax, edi
    call 0x4d9e1
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
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    mov edx, dword [0xbfb4f]
    test edx, edx
    jge short loc_2c833
    xor edi, edi
    mov dword [0xbfb4f], edi
    jmp short loc_2c842
loc_2c833:
    cmp edx, 0x3f
    jle short loc_2c842
    mov dword [0xbfb4f], 0x40
loc_2c842:
    cmp dword [0xbfb4f], 0
    jne short loc_2c850
    call 0x47f72
loc_2c850:
    mov edx, dword [0xbfb4f]
    cmp edx, 0xc
    jne short loc_2c86a
    lea eax, [edx - 0xa]
    test eax, eax
    jg short loc_2c864
    xor eax, eax
loc_2c864:
    mov esi, eax
    xor ebx, ebx
    jmp short loc_2c873
loc_2c86a:
    lea esi, [edx - 8]
    test esi, esi
    jg short loc_2c873
    xor esi, esi
loc_2c873:
    cmp dword [0xbfb4f], 0xc
    jne short loc_2c88b
    mov ecx, 0xa0
    mov edx, dword [0x216f88]
    mov eax, ebx
    jmp short loc_2c898
loc_2c88b:
    mov ecx, 0xa0
    mov edx, dword [0x216f88]
    mov eax, esi
loc_2c898:
    imul edx
    idiv ecx
    mov dword [ebp - 0x18], eax
    mov edi, dword [ebp - 0x18]
    mov eax, dword [0x216f88]
    sub eax, edi
    mov dword [ebp - 0x1c], eax
    cmp dword [0xbfb4f], 0xc
    jne short loc_2c8bb
    xor esi, esi
    xor ebx, ebx
    jmp short loc_2c8bd
loc_2c8bb:
    mov ebx, esi
loc_2c8bd:
    mov edx, dword [0xbfb4f]
    mov edi, 0xc8
    test edx, edx
    jle short loc_2c920
    cmp dword [0xbfb4b], 1
    je short loc_2c920
    cmp dword [0xbffe3], 1
    jle short loc_2c920
    mov eax, dword [0xcf656]
    sar eax, 0x10
    xor edx, edx
    test eax, eax
    jl short loc_2c900
loc_2c8ec:
    cmp eax, edx
    jle short loc_2c8f2
    mov edx, eax
loc_2c8f2:
    mov eax, dword [nosplit eax*2 + 0xcf53e]
    sar eax, 0x10
    test eax, eax
    jge short loc_2c8ec
loc_2c900:
    cmp edx, 1
    jl short loc_2c908
    add ebx, 8
loc_2c908:
    cmp edx, 4
    jl short loc_2c910
    add ebx, 8
loc_2c910:
    cmp edx, 8
    jl short loc_2c918
    add ebx, 8
loc_2c918:
    cmp edx, 0xc
    jl short loc_2c920
    add ebx, 8
loc_2c920:
    mov edx, dword [0xbfb4f]
    cmp edx, 8
    jne short loc_2c930
    add esi, 0x22
    jmp short loc_2c935
loc_2c930:
    jle short loc_2c937
    add esi, 0x2a
loc_2c935:
    sub edi, esi
loc_2c937:
    mov ecx, 0xc8
    mov edx, dword [0x216f84]
    mov eax, ebx
    imul edx
    idiv ecx
    mov edx, dword [0x216f84]
    mov esi, eax
    mov eax, edi
    mov ebx, dword [ebp - 0x1c]
    imul edx
    idiv ecx
    dec ebx
    lea ecx, [eax - 1]
    mov edx, esi
    mov eax, dword [ebp - 0x18]
    call 0x47b92
    mov ah, 1
    mov byte [0xc003a], ah
    mov byte [0xc003b], ah
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
    mov eax, 0x3410
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ecx
    push edx
    movsx edx, ax
    mov cl, al
    mov al, 1
    and cl, 7
    sar edx, 3
    shl al, cl
    or byte [edx + 0x1699e8], al
    lea esp, [ebp - 8]
    pop edx
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
    xor ebx, ebx
    xor edx, edx
    xor esi, esi
loc_2c9c6:
    mov eax, edx
    mov ecx, edx
    sar eax, 3
    and ecx, 7
    movzx edi, byte [eax + 0x1699e8]
    mov eax, 1
    shl eax, cl
    test edi, eax
    je short loc_2c9fe
    cmp dword [esi + 0x169e68], 0
    jne short loc_2c9fe
    movsx eax, dx
    inc ebx
    call 0x3a5f3
    test bl, 7
    jne short loc_2c9fe
    call 0x11fb0
loc_2c9fe:
    inc edx
    add esi, 4
    cmp edx, strict dword 0x2400
    jl short loc_2c9c6
    mov ecx, 0x480
    mov edi, 0x1699e8
    xor eax, eax
    cmp ecx, 4
    jae short loc_2ca28
    test cl, 1
    je short loc_2ca21
    stosb
loc_2ca21:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2ca53
loc_2ca28:
    test edi, 1
    je short loc_2ca32
    stosb
    dec ecx
loc_2ca32:
    test edi, 2
    je short loc_2ca3f
    stosw
    sub ecx, 2
loc_2ca3f:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2ca4d
    stosw
loc_2ca4d:
    test bl, 1
    je short loc_2ca53
    stosb
loc_2ca53:
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
    movsx edx, ax
    imul edx, edx, strict dword 0x623
    add edx, strict dword 0x8be10
    mov word [edx + 0x51a], 0
    mov word [edx + 0x2c2], 0xffff
    mov word [edx + 0x30a], 0
    mov word [edx + 0x52e], 0
    mov word [edx + 0x532], 0
    mov word [edx + 0x2e6], 0
    mov word [edx + 0x2e4], 0
    mov word [edx + 0x2cc], 0
    mov word [edx + 0x30e], 0xffff
    mov dword [edx + 0x22c], 0
    mov dword [edx + 0x258], 0
    mov word [edx + 0x528], 0
    mov dword [edx + 0x244], 0
    mov dword [edx + 0x248], 0
    mov dword [edx + 0x210], 0
    mov word [edx + 0x298], 0
    mov dword [edx + 0x270], 0
    mov word [edx + 0x308], 0
    mov word [edx + 0x51c], 0
    mov word [edx + 0x306], 0xffff
    mov dword [edx + 0x27c], 0
    mov word [edx + 0x2da], 0
    mov word [edx + 0x530], 0
    mov word [edx + 0x2d0], 0xffff
    mov word [edx + 0x2d6], 0
    mov word [edx + 0x2d8], 0
    mov word [edx + 0x534], 0
    mov dword [edx + 0x220], 0x8c
    mov word [edx + 0x2ce], 0
    mov dword [edx + 0x26c], 0
    mov dword [edx + 0x264], 0
    mov byte [edx + 0x57f], 9
    mov word [edx + 0x2de], 0x186
    xor ah, ah
    mov word [edx + 0x2ea], 0xffff
    mov byte [edx + 0x559], ah
    mov byte [edx + 0x551], ah
    mov byte [edx + 0x56c], ah
    mov byte [edx + 0x558], ah
    mov byte [edx + 0x53e], ah
    mov byte [edx + 0x556], ah
    xor bl, bl
    mov byte [edx + 0x540], ah
    mov byte [edx + 0x542], bl
    mov byte [edx + 0x541], bl
    mov byte [0xbf575], ah
    mov byte [edx + 0x571], bl
    mov byte [0xbf574], ah
    mov eax, dword [edx + 0x220]
    mov ebx, dword [0xbffe3]
    mov dword [edx + 0x224], eax
    cmp ebx, 1
    jle short loc_2cc28
    cmp dword [0xbfb4b], 1
    je short loc_2cc28
    mov word [edx + 0x2ee], 7
    jmp short loc_2cc31
loc_2cc28:
    mov word [edx + 0x2ee], 0
loc_2cc31:
    mov word [edx + 0x2fe], 0
    mov byte [edx + 0x53d], 0
    mov bh, 1
    mov byte [edx + 0x553], 0
    mov byte [0xc003b], bh
    mov bx, word [edx + 0x522]
    mov dword [edx + 0x56d], 0x209d68
    cmp bx, 0x190
    jge short loc_2cc78
    mov word [edx + 0x522], 0
    mov byte [edx + 0x550], 0
loc_2cc78:
    mov byte [edx + 0x557], 0
    mov byte [edx + 0x552], 0
    mov word [edx + 0x526], 0xffff
    mov word [edx + 0x518], 0
    mov word [edx + 0x2d4], 0xffff
    mov word [edx + 0x2dc], 0
    mov byte [edx + 0x575], 0
    mov dword [edx + 0x24c], 0
    mov dword [edx + 0x250], 0
    mov dword [edx + 0x254], 0
    mov word [edx + 0x2f4], 0xffff
    mov word [edx + 0x302], 0
    mov word [edx + 0x304], 0
    mov word [edx + 0x2f6], 0xffff
    mov word [edx + 0x2c8], 1
    mov word [edx + 0x2ec], 0
    mov word [edx + 0x52a], 6
    mov byte [edx + 0x573], 0
    mov word [edx + 0x2f0], 0
    mov byte [edx + 0x572], 1
    mov ebx, 0x200
    mov word [edx + 0x300], 0
    mov ax, word [0xbffeb]
    mov word [edx + 0x2e0], 0
    xor esi, esi
    xor ah, ah
    mov dword [0xbf398], esi
    and al, 1
    mov dword [0xbf394], esi
    shl eax, 0xa
    mov byte [edx + 0x552], 0
    sub ebx, eax
    mov eax, edx
    mov word [edx + 0x29c], bx
    call 0x29540
    mov word [edx + 0x28e], 0
    mov dword [edx + 0x280], esi
    mov dword [edx + 0x286], esi
    mov dword [edx + 0x28a], esi
    mov eax, dword [0xbffe3]
    mov dword [edx + 0x290], esi
    cmp eax, 1
    jle short loc_2cdd1
    cmp dword [0xbfb4b], 1
    je short loc_2cdd1
    mov word [edx + 0x580], 1
    mov word [edx + 0x582], 1
    mov word [edx + 0x584], 1
    mov word [edx + 0x586], 1
    mov word [edx + 0x588], 1
    jmp short loc_2cdfe
loc_2cdd1:
    mov word [edx + 0x580], 0
    mov word [edx + 0x582], 0
    mov word [edx + 0x584], 0
    mov word [edx + 0x586], 0
    mov word [edx + 0x588], 0
loc_2cdfe:
    mov word [edx + 0x594], 0x66f
    mov word [edx + 0x596], 0x66f
    mov word [edx + 0x598], 0
    mov word [edx + 0x59a], 0
    mov dword [edx + 0x59c], 0x1000
    mov dword [edx + 0x5a0], 0x1000
    mov byte [edx + 0x5a4], 1
    mov byte [edx + 0x5a5], 1
    mov byte [edx + 0x5a6], 0
    mov byte [edx + 0x5a7], 0
    mov byte [edx + 0x5a8], 0
    mov word [edx + 0x58a], 0
    mov word [edx + 0x5a9], 0
    mov word [edx + 0x5ab], 0
    mov word [edx + 0x605], 0
    mov dword [edx + 0x5b1], 1
    mov word [edx + 0x5bd], 0
    mov word [edx + 0x5bf], 0
    mov word [edx + 0x5c1], 0
    mov word [edx + 0x5c3], 0
    mov word [edx + 0x5c5], 0
    mov word [edx + 0x5cb], 0
    mov word [edx + 0x5cd], 0
    mov word [edx + 0x5cf], 0
    mov word [edx + 0x5f1], 0
    mov word [edx + 0x5f3], 0
    xor ecx, ecx
    mov dword [edx + 0x590], ecx
    mov dword [edx + 0x58c], ecx
    mov dword [edx + 0x60b], ecx
    mov dword [edx + 0x5b5], ecx
    mov dword [edx + 0x5b9], ecx
    mov dword [edx + 0x5c7], ecx
    mov dword [edx + 0x5d5], ecx
    mov dword [edx + 0x5d9], ecx
    mov dword [edx + 0x5e5], ecx
    mov dword [edx + 0x5e1], ecx
    mov dword [edx + 0x5e9], ecx
    mov dword [edx + 0x5ed], ecx
    mov dword [0x99cc], ecx
    mov dword [edx + 0x5f7], ecx
    mov cx, word [0xcf65c]
    mov word [edx + 0x5f5], 0
    cmp cx, 2
    jge short loc_2cf55
    xor esi, esi
    mov dword [0x9e24], esi
loc_2cf55:
    cmp word [0xcf65c], 2
    jge short loc_2cf83
    mov ebx, 3
    mov ax, word [0xbffd7]
    xor ecx, ecx
    mov word [0xbf540], bx
    inc eax
    mov word [0xbf542], cx
    mov word [0xbf546], ax
    jmp short loc_2cf9a
loc_2cf83:
    xor edi, edi
    mov word [0xbf540], di
    mov word [0xbf542], di
    mov word [0xbf546], di
loc_2cf9a:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

reset_weapons:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    movsx edx, ax
    imul edx, edx, strict dword 0x623
    mov eax, 1
    add edx, strict dword 0x8be10
loc_2cfbd:
    movsx ebx, ax
    inc eax
    mov byte [edx + ebx + 0x55b], 0
    cmp ax, strict word 0x11
    jl short loc_2cfbd
    mov eax, 1
loc_2cfd4:
    movsx ebx, ax
    inc eax
    mov word [edx + ebx*2 + 0x2a0], 0
    cmp ax, strict word 0x11
    jl short loc_2cfd4
    mov word [edx + 0x605], 0
    mov word [edx + 0x52a], 6
    mov word [edx + 0x2ec], 5
    mov word [edx + 0x2c8], 1
    mov byte [edx + 0x55c], 1
    mov byte [edx + 0x55b], 1
    mov word [edx + 0x2a2], 0x30
    mov word [edx + 0x2a0], 1
    mov byte [edx + 0x56a], 1
    mov word [edx + 0x2be], 1
    mov byte [edx + 0x565], 1
    mov word [edx + 0x2ca], 0xffff
    mov word [edx + 0x51c], 0
    mov dword [edx + 0x258], 0
    mov byte [edx + 0x558], 0
    mov dword [edx + 0x5ad], 0
    mov dword [edx + 0x5b9], 0
    mov dword [edx + 0x5d1], 0
    mov dword [edx + 0x60b], 0
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

reset_inventory:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    cwde
    imul eax, eax, strict dword 0x623
    add eax, strict dword 0x8be10
    mov byte [eax + 0x550], 0
    mov word [eax + 0x536], 0
    mov byte [eax + 0x555], 0
    mov word [eax + 0x51e], 0
    mov word [eax + 0x30c], 0
    mov byte [eax + 0x557], 0
    mov byte [eax + 0x552], 0
    mov word [eax + 0x520], 0
    mov word [eax + 0x526], 0xffff
    mov word [eax + 0x2d2], 0
    mov word [eax + 0x2f2], 0
    mov dx, word [0xbf32c]
    mov word [eax + 0x522], 0
    mov word [eax + 0x524], dx
    mov edx, dword [0xbffe3]
    mov byte [eax + 0x550], 0
    cmp edx, 1
    jle short loc_2d167
    cmp dword [0xbfb4b], 1
    je short loc_2d167
    mov word [eax + 0x580], 1
    mov word [eax + 0x582], 1
    mov word [eax + 0x584], 1
    mov word [eax + 0x586], 1
    mov word [eax + 0x588], 1
    jmp short loc_2d194
loc_2d167:
    mov word [eax + 0x580], 0
    mov word [eax + 0x582], 0
    mov word [eax + 0x584], 0
    mov word [eax + 0x586], 0
    mov word [eax + 0x588], 0
loc_2d194:
    mov dword [eax + 0x590], 0
    mov word [eax + 0x594], 0x66f
    mov word [eax + 0x596], 0x66f
    mov word [eax + 0x598], 0
    mov word [eax + 0x59a], 0
    mov dword [eax + 0x59c], 0
    mov dword [eax + 0x5a0], 0
    mov byte [eax + 0x5a4], 1
    mov byte [eax + 0x5a5], 1
    mov byte [eax + 0x5a6], 0
    mov byte [eax + 0x5a7], 0
    mov byte [eax + 0x5a8], 0
    mov word [eax + 0x58a], 0
    mov dword [eax + 0x58c], 0
    mov word [eax + 0x5a9], 0
    mov dx, word [0xcf65c]
    mov word [eax + 0x5ab], 0
    cmp dx, 2
    jge short loc_2d259
    mov dx, word [0xbffd7]
    shl edx, 2
    inc edx
    cmp dx, 0x20
    jle short loc_2d241
    mov edx, 0x20
loc_2d241:
    mov ax, word [0xbffd7]
    xor esi, esi
    inc eax
    mov word [0xbf542], si
    mov word [0xbf546], ax
    jmp short loc_2d273
loc_2d259:
    mov edx, 0x20
    xor ebx, ebx
    mov ecx, 2
    mov word [0xbf542], bx
    mov word [0xbf546], cx
loc_2d273:
    mov word [0xbf540], dx
    lea esp, [ebp - 0x10]
    pop esi
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
    push esi
    push edi
    sub esp, 4
    mov cx, word [0x9370]
    mov esi, eax
    mov byte [ebp - 0x14], dl
    movsx edx, ax
    imul edx, edx, strict dword 0x623
    xor ebx, ebx
    mov word [0xbf56a], bx
    xor eax, eax
    add edx, strict dword 0x8be10
    test cx, cx
    jle short loc_2d2cf
    mov edi, 0xffffffff
loc_2d2be:
    movsx ebx, ax
    inc eax
    mov word [nosplit ebx*2 + 0x8b280], di
    cmp ax, cx
    jl short loc_2d2be
loc_2d2cf:
    mov byte [edx + 0x53f], 0
    mov word [edx + 0x304], 0
    mov dword [edx + 0x274], 0
    mov byte [edx + 0x571], 0
    mov byte [edx + 0x577], 0
    mov byte [edx + 0x576], 0
    mov word [edx + 0x57d], 0
    mov word [edx + 0x57b], 0
    mov byte [edx + 0x554], 0
    mov word [edx + 0x52a], 6
    mov word [edx + 0x2ec], 5
    mov word [edx + 0x2ca], 0xffff
    mov word [edx + 0x514], 0
    mov edi, 0x11
    mov word [edx + 0x51c], 0
    mov ebx, dword [0xbfb03]
    mov byte [edx + 0x558], 0
    mov ax, word [0xcf65e]
    mov dword [edx + 0x258], 0
    mov word [0x9370], cx
    mov word [edx + 0x2fa], 0xffff
    mov word [0xbf562], ax
    mov dword [0x216f68], edi
    mov dword [edx + 0x268], ebx
    xor eax, eax
    xor ebx, ebx
    xor edi, edi
    mov word [0xbf56e], ax
    mov word [0xbf56c], ax
    mov dword [0xbd760], ebx
    mov word [0xbfaf7], ax
    mov dword [0xc30a0], ebx
    mov eax, 0xffffffff
    mov ebx, 0xffffffff
    mov word [0xbfafb], ax
    mov word [0xbf560], bx
    xor ah, ah
    xor bl, bl
    mov byte [0xbf573], ah
    xor eax, eax
    mov byte [0xc0042], bl
    mov dword [0x93b8], eax
    mov dword [0x93bc], eax
    xor edi, eax
    xor eax, eax
    mov bh, byte [ebp - 0x14]
    mov word [0x93ca], ax
    mov word [0x93c6], ax
    mov word [0x93c8], ax
    xor eax, eax
    mov word [0x93c0], di
    mov dword [0x93b0], eax
    mov dword [0x93b4], eax
    test bh, 8
    jne short loc_2d41a
    cmp word [0xcf65c], 2
    jl short loc_2d42d
loc_2d41a:
    cmp dword [0xbfb4b], 1
    je short loc_2d440
    cmp word [0xcf65c], 1
    jle short loc_2d440
loc_2d42d:
    movsx ebx, si
    mov eax, ebx
    call reset_weapons
    mov eax, ebx
    call reset_inventory
    jmp short loc_2d462
loc_2d440:
    cmp word [edx + 0x2c8], 0xa
    jne short loc_2d462
    mov di, word [edx + 0x2a8]
    mov word [edx + 0x2c8], 4
    inc edi
    mov word [edx + 0x2a8], di
loc_2d462:
    mov word [edx + 0x310], 0
    mov word [edx + 0x312], 0
    mov dword [edx + 0x280], 0
    mov dword [edx + 0x286], 0x20000
    mov dword [edx + 0x28a], 0x20000
    mov cx, word [0x9370]
    mov word [edx + 0x28e], 0
    mov eax, dword [0xbffe3]
    mov dword [edx + 0x290], 0
    cmp eax, 1
    jle short loc_2d4ee
    cmp dword [0xbfb4b], 1
    je short loc_2d4ee
    mov word [edx + 0x580], 1
    mov word [edx + 0x582], 1
    mov word [edx + 0x584], 1
    mov word [edx + 0x586], 1
    mov word [edx + 0x588], 1
    jmp short loc_2d51b
loc_2d4ee:
    mov word [edx + 0x580], 0
    mov word [edx + 0x582], 0
    mov word [edx + 0x584], 0
    mov word [edx + 0x586], 0
    mov word [edx + 0x588], 0
loc_2d51b:
    mov dword [edx + 0x590], 0
    mov word [edx + 0x594], 0x66f
    mov word [edx + 0x596], 0x66f
    mov word [edx + 0x598], 0
    mov word [edx + 0x59a], 0
    mov dword [edx + 0x59c], 0
    mov dword [edx + 0x5a0], 0
    mov byte [edx + 0x5a4], 1
    mov byte [edx + 0x5a5], 1
    mov byte [edx + 0x5a6], 0
    mov byte [edx + 0x5a7], 0
    mov byte [edx + 0x5a8], 0
    mov word [edx + 0x58a], 0
    mov dword [edx + 0x58c], 0
    mov word [edx + 0x5a9], 0
    mov ax, word [0xcf65c]
    mov word [edx + 0x5ab], 0
    cmp ax, strict word 2
    jge short loc_2d5e8
    mov ax, word [0xbffd7]
    shl eax, 2
    inc eax
    mov word [0xbf540], ax
    cmp ax, strict word 0x20
    jle short loc_2d5d0
    mov word [0xbf540], 0x20
loc_2d5d0:
    mov ax, word [0xbffd7]
    xor edx, edx
    inc eax
    mov word [0xbf542], dx
    mov word [0xbf546], ax
    jmp short loc_2d609
loc_2d5e8:
    mov edx, 0x20
    mov esi, 2
    xor ebx, ebx
    mov word [0xbf540], dx
    mov word [0xbf542], bx
    mov word [0xbf546], si
loc_2d609:
    mov word [0x9370], cx
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
    mov eax, 0x3430
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    movsx ebx, ax
    lea edx, [ebx*4]
    sub edx, ebx
    shl edx, 2
    sub edx, ebx
    mov ax, word [nosplit edx*4 + 0x191376]
    cmp ax, strict word 0x1351
    jb short loc_2d672
    jbe short loc_2d67d
    cmp ax, strict word 0x1603
    jb near loc_2d729
    jbe short loc_2d6ae
    cmp ax, strict word 0x1a02
    je near loc_2d703
    jmp near loc_2d729
loc_2d672:
    cmp ax, strict word 0x10a4
    je short loc_2d6db
    jmp near loc_2d729
loc_2d67d:
    mov eax, 0x1351
loc_2d682:
    movsx edx, ax
    cmp dword [nosplit edx*4 + 0x169e68], 0
    jne short loc_2d6a1
    mov cl, al
    mov bl, 1
    and cl, 7
    sar edx, 3
    shl bl, cl
    or byte [edx + 0x1699e8], bl
loc_2d6a1:
    inc eax
    cmp ax, strict word 0x1395
    jg near loc_2d729
    jmp short loc_2d682
loc_2d6ae:
    mov eax, 0x1603
loc_2d6b3:
    movsx edx, ax
    cmp dword [nosplit edx*4 + 0x169e68], 0
    jne short loc_2d6d2
    mov cl, al
    mov bl, 1
    and cl, 7
    sar edx, 3
    shl bl, cl
    or byte [edx + 0x1699e8], bl
loc_2d6d2:
    inc eax
    cmp ax, strict word 0x16ad
    jg short loc_2d729
    jmp short loc_2d6b3
loc_2d6db:
    movsx edx, ax
    cmp dword [nosplit edx*4 + 0x169e68], 0
    jne short loc_2d6fa
    mov cl, al
    mov bl, 1
    and cl, 7
    sar edx, 3
    shl bl, cl
    or byte [edx + 0x1699e8], bl
loc_2d6fa:
    inc eax
    cmp ax, strict word 0x111d
    jg short loc_2d729
    jmp short loc_2d6db
loc_2d703:
    movsx edx, ax
    cmp dword [nosplit edx*4 + 0x169e68], 0
    jne short loc_2d722
    mov cl, al
    mov bl, 1
    and cl, 7
    sar edx, 3
    shl bl, cl
    or byte [edx + 0x1699e8], bl
loc_2d722:
    inc eax
    cmp ax, strict word 0x1ab4
    jle short loc_2d703
loc_2d729:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov byte [ebp - 0x18], al
    mov esi, dword [0xbf560]
    sar esi, 0x10
    imul esi, esi, strict dword 0x623
    mov edx, 0xf
    xor eax, eax
    add esi, strict dword 0x8be10
    mov ecx, 0x80
    call 0x2f3c0
    mov word [esi + 0x284], 0
    mov edi, 0x1694e8
    mov dword [esi + 0x5dd], 0
    xor ebx, ebx
    mov dword [esi + 0x5fd], 0
    mov word [0x93c2], dx
    mov dword [esi + 0x601], 0
    mov word [0x93c4], bx
    mov word [esi + 0x5fb], 0
    mov word [0x93ca], bx
    mov word [esi + 0x607], 0
    xor eax, eax
    mov word [esi + 0x609], 0
    cmp ecx, 4
    jae short loc_2d7e2
    test cl, 1
    je short loc_2d7db
    stosb
loc_2d7db:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2d80d
loc_2d7e2:
    test edi, 1
    je short loc_2d7ec
    stosb
    dec ecx
loc_2d7ec:
    test edi, 2
    je short loc_2d7f9
    stosw
    sub ecx, 2
loc_2d7f9:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2d807
    stosw
loc_2d807:
    test bl, 1
    je short loc_2d80d
    stosb
loc_2d80d:
    mov ecx, 0x400
    mov edi, 0x169568
    xor eax, eax
    cmp ecx, 4
    jae short loc_2d82b
    test cl, 1
    je short loc_2d824
    stosb
loc_2d824:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2d856
loc_2d82b:
    test edi, 1
    je short loc_2d835
    stosb
    dec ecx
loc_2d835:
    test edi, 2
    je short loc_2d842
    stosw
    sub ecx, 2
loc_2d842:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2d850
    stosw
loc_2d850:
    test bl, 1
    je short loc_2d856
    stosb
loc_2d856:
    mov ecx, 0x200
    mov edi, 0x172e68
    xor eax, eax
    cmp ecx, 4
    jae short loc_2d874
    test cl, 1
    je short loc_2d86d
    stosb
loc_2d86d:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2d89f
loc_2d874:
    test edi, 1
    je short loc_2d87e
    stosb
    dec ecx
loc_2d87e:
    test edi, 2
    je short loc_2d88b
    stosw
    sub ecx, 2
loc_2d88b:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2d899
    stosw
loc_2d899:
    test bl, 1
    je short loc_2d89f
    stosb
loc_2d89f:
    xor eax, eax
loc_2d8a1:
    movsx edx, ax
    xor bl, bl
    inc eax
    mov byte [edx + 0xc6850], bl
    cmp ax, strict word 0x400
    jl short loc_2d8a1
    xor eax, eax
    mov ebx, 0xffffffff
loc_2d8ba:
    movsx edx, ax
    inc eax
    mov word [nosplit edx*2 + 0xc5fb0], bx
    mov word [nosplit edx*2 + 0xc5f30], bx
    cmp ax, strict word 0x40
    jl short loc_2d8ba
    xor eax, eax
    mov ebx, 0xffffffff
loc_2d8db:
    movsx edx, ax
    inc eax
    mov word [nosplit edx*2 + 0xc67d0], bx
    mov word [nosplit edx*2 + 0xc66d0], bx
    mov word [nosplit edx*2 + 0xc6750], bx
    cmp ax, strict word 0x40
    jl short loc_2d8db
    xor edx, edx
    xor eax, eax
    xor edi, edi
    xor ebx, ebx
    mov dl, byte [ebp - 0x18]
    xor ecx, ecx
    call 0x2d284
    mov word [0xc5f28], di
    mov word [0xc5f2a], di
    mov word [0xc66c8], di
    mov word [0xc5f2e], di
    mov word [0xc5f2c], di
    mov word [0xc6c58], di
    mov word [0xbf53e], di
    mov word [0xbf53c], di
    mov word [0x93ca], di
    xor eax, eax
    xor edx, edx
    mov edi, 0xf
    mov dword [0xc3094], edx
    mov dword [0x93b8], edx
    mov dword [0x93bc], edx
    mov word [0x93c6], ax
    xor ebx, edx
    xor ecx, edx
    mov word [0x93c0], bx
    mov word [0x93c2], di
    mov word [0x93c8], cx
loc_2d988:
    movsx ebx, cx
    imul eax, ebx, 0x2c
    mov dl, byte [eax + 0x191379]
    cmp dl, 0x64
    jne short loc_2d9b6
    cmp word [0xcf65c], 1
    jle short loc_2d9ac
    mov eax, ebx
    call 0x40ecd
    jmp short loc_2d9e4
loc_2d9ac:
    xor dh, dh
    mov byte [eax + 0x191379], dh
    jmp short loc_2d9e4
loc_2d9b6:
    cmp dl, 0x65
    jne short loc_2d9e4
    xor edi, edi
    mov edx, 1
    mov word [eax + 0x191392], di
    mov word [eax + 0x191390], dx
    xor dl, dl
    mov byte [eax + 0x191379], dl
    mov edx, 0x76
    mov eax, ebx
    call 0x51390
loc_2d9e4:
    inc ecx
    cmp cx, 0x1000
    jl short loc_2d988
    xor bh, bh
    mov byte [0x21805c], bh
    xor bl, bl
    mov ecx, 0xffffffff
loc_2d9fb:
    movsx edx, bx
    imul eax, edx, 0x2c
    cmp word [eax + 0x191382], 0x400
    jge short loc_2da13
    mov eax, ecx
    call SPAWN
loc_2da13:
    inc ebx
    cmp bx, 0x1000
    jl short loc_2d9fb
    mov bx, word [0x217fcc]
    xor eax, eax
    xor edx, edx
    mov word [0xbf55c], ax
    test bx, bx
    jle short loc_2da7f
loc_2da31:
    movsx eax, dx
    mov ecx, 0x1be568
    shl eax, 5
    add ecx, eax
    cmp word [0xbf56e], 0x200
    jl short loc_2da53
    mov eax, 0x3450
    call GAME_EXIT
loc_2da53:
    mov eax, dword [0xbf56c]
    sar eax, 0x10
    imul eax, eax, 6
    xor edi, edi
    xor ebx, ebx
    mov dword [eax + 0x9b2b2], edi
    mov word [eax + 0x9b2b0], bx
    inc edx
    mov word [ecx + 0x1e], 0xffff
    cmp dx, word [0x217fcc]
    jl short loc_2da31
loc_2da7f:
    mov di, word [0xbf55c]
    xor ecx, ecx
    test di, di
    jle short loc_2dae0
    mov edi, 0x441
loc_2da92:
    movsx eax, cx
    mov eax, dword [nosplit eax*2 + 0x20036]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov dx, word [eax + 0x20a068]
    mov bx, word [eax + 0x20a06a]
    add ebx, edx
    mov eax, edx
    cmp dx, bx
    jge short loc_2dad3
loc_2dab9:
    movsx edx, ax
    shl edx, 5
    mov word [edx + 0x1be578], di
    inc eax
    mov word [edx + 0x1be57a], di
    cmp ax, bx
    jl short loc_2dab9
loc_2dad3:
    mov dx, word [0xbf55c]
    inc ecx
    cmp cx, dx
    jl short loc_2da92
loc_2dae0:
    cmp word [0xbf53e], 0
    jne short loc_2db0c
    mov eax, dword [0xbffb3]
    sar eax, 2
    mov edx, 0x209d68
    and eax, strict dword 0xff
    call 0x4aa2a
    mov eax, dword [esi + 0x268]
    mov dword [0x215c9c], eax
loc_2db0c:
    xor eax, eax
    mov word [0x1816e8], ax
    mov word [0x17cee8], ax
    call 0x52ba8
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
