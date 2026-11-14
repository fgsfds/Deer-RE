bits 32
org 0x2f2e0

%define PRINT_NOTICE 0x5130c
%define GAME_EXIT 0x14f28
%define SPAWN 0x15ee0
%define KRAND 0x46fa0
%define ROTATE_SPRITE 0x47f83
    push ebp
    mov ebp, esp
    push edx
    cwde
    imul eax, eax, strict dword 0x623
    add eax, strict dword 0x8be10
    mov word [eax + 0x28e], 1
    mov edx, dword [eax + 0x214]
    mov dword [eax + 0x286], edx
    mov edx, dword [eax + 0x218]
    mov dword [eax + 0x28a], edx
    mov eax, 1
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    movsx edx, dx
    imul edx, edx, strict dword 0x623
    add edx, strict dword 0x8be10
    cmp word [edx + 0x28e], 0
    je near loc_2f3b4
    movsx ebx, ax
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    shl eax, 2
    mov bl, byte [eax + 0x191379]
    cmp bl, 0x1e
    je short loc_2f3b4
    cmp bl, 0x20
    je short loc_2f3b4
    cmp bl, 0x21
    je short loc_2f3b4
    cmp bl, 8
    je short loc_2f3b4
    mov ebx, dword [edx + 0x290]
    mov ecx, dword [edx + 0x286]
    mov esi, dword [eax + 0x191368]
    sub ecx, ebx
    cmp ecx, esi
    jge short loc_2f3b4
    mov ecx, dword [edx + 0x286]
    add ecx, ebx
    cmp ecx, esi
    jle short loc_2f3b4
    mov ecx, dword [edx + 0x28a]
    mov esi, dword [eax + 0x19136c]
    sub ecx, ebx
    cmp ecx, esi
    jge short loc_2f3b4
    add ebx, dword [edx + 0x28a]
    cmp ebx, esi
    jle short loc_2f3b4
    mov eax, 1
    jmp short loc_2f3b6
loc_2f3b4:
    xor eax, eax
loc_2f3b6:
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    times 2 db 0    ; Object alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    sub esp, strict dword 0x300
    mov esi, eax
    mov ah, byte [0x9df2]
    test ah, ah
    jne near loc_2f48f
    mov byte [0x9df2], 1
    mov edx, dword [0x190f68]
    mov dword [0xc6e88], edx
    mov edx, dword [0x190fe0]
    mov dword [0xc6e84], edx
    mov edx, dword [0x190fec]
    mov dword [0xc6e80], edx
    mov edx, dword [0x190fc4]
    mov dword [0xc6e7c], edx
    mov edx, dword [0x190f88]
    xor al, al
    mov dword [0xc6e78], edx
loc_2f422:
    movsx edx, ax
    mov byte [edx + ebp - 0x310], al
    inc eax
    cmp ax, strict word 0x100
    jl short loc_2f422
    push byte 1
    mov eax, 0x32
    mov edx, dword [0x9ddf]
    mov ecx, dword [0x9dde]
    mov ebx, dword [0x9ddd]
    sar edx, 0x18
    sar ecx, 0x18
    push edx
    sar ebx, 0x18
    lea edx, [ebp - 0x310]
    call 0x4a387
    push byte 1
    mov eax, 0x33
    mov edx, dword [0x9ddf]
    mov ecx, dword [0x9dde]
    mov ebx, dword [0x9ddd]
    sar edx, 0x18
    sar ecx, 0x18
    push edx
    sar ebx, 0x18
    lea edx, [ebp - 0x310]
    call 0x4a387
loc_2f48f:
    test si, si
    jne short loc_2f4cc
    mov edx, dword [0xc6e88]
    mov dword [0x190f68], edx
    mov edx, dword [0xc6e84]
    mov dword [0x190fe0], edx
    mov edx, dword [0xc6e80]
    mov dword [0x190fec], edx
    mov edx, dword [0xc6e7c]
    mov dword [0x190fc4], edx
    mov edx, dword [0xc6e78]
    jmp short loc_2f4fc
loc_2f4cc:
    cmp si, 2
    jne short loc_2f502
    mov edx, dword [0x191030]
    mov dword [0x190f68], edx
    mov edx, dword [0x191034]
    mov dword [0x190fe0], edx
    mov dword [0x190fec], edx
    mov dword [0x190fc4], edx
    mov edx, dword [0x191040]
loc_2f4fc:
    mov dword [0x190f88], edx
loc_2f502:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 5 db 0    ; Object alignment

check_anim_started:
    push ebp
    mov ebp, esp
    cmp dword [0x9df8], 0
    jne short loc_2f52a
    push eax
    push dword 0x3a00
    call 0x5a77c
    add esp, 8
loc_2f52a:
    mov esp, ebp
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

find_page:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov ebx, eax
    mov eax, 0x3a2c
    call check_anim_started
    xor eax, eax
    jmp short loc_2f57a
loc_2f547:
    xor ecx, ecx
    mov cx, ax
    imul ecx, ecx, 6
    add edx, ecx
    mov si, word [edx + 0x82]
    cmp bx, si
    jb short loc_2f579
    xor ecx, ecx
    mov cx, word [edx + 0x84]
    mov edx, esi
    and edx, strict dword 0xffff
    add ecx, edx
    xor edx, edx
    mov dx, bx
    cmp ecx, edx
    jg short loc_2f586
loc_2f579:
    inc eax
loc_2f57a:
    mov edx, dword [0x9df4]
    cmp ax, word [edx + 8]
    jb short loc_2f547
loc_2f586:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

load_page:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov ebx, eax
    mov edi, edx
    mov eax, 0x3a38
    call check_anim_started
    mov eax, dword [0x9df4]
    mov dx, word [eax + 0x682]
    mov esi, dword [eax + 0x2068a]
    cmp bx, dx
    je short loc_2f620
    mov word [eax + 0x682], bx
    mov edx, ebx
    push byte 4
    and edx, strict dword 0xffff
    mov ecx, 0x3a44
    shl edx, 0x10
    add eax, strict dword 0x684
    add edx, strict dword 0xb00
    push byte 0x58
    add esi, edx
    mov ebx, 6
    mov edx, esi
    call 0x5e9ab
    push byte 4
    mov ecx, 0x3a44
    mov eax, dword [0x9df4]
    add esi, 8
    xor edx, edx
    xor ebx, ebx
    push byte 0x5a
    mov dx, word [eax + 0x686]
    mov bx, word [eax + 0x688]
    add edx, edx
    mov eax, edi
    add ebx, edx
    mov edx, esi
    call 0x5e9ab
loc_2f620:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

play_run_skip_dump:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
loc_2f631:
    mov bl, byte [eax]
    inc eax
    test bl, bl
    jg short loc_2f646
    je short loc_2f653
    sub bl, 0x80
    je short loc_2f667
    movsx ebx, bl
    add edx, ebx
    jmp short loc_2f631
loc_2f646:
    inc edx
    mov bh, byte [eax]
    inc eax
    mov byte [edx - 1], bh
    dec bl
    je short loc_2f631
    jmp short loc_2f646
loc_2f653:
    inc eax
    inc eax
    xor bh, bh
    mov cl, byte [eax - 1]
    mov bl, byte [eax - 2]
loc_2f65d:
    inc edx
    mov byte [edx - 1], cl
    dec bx
    je short loc_2f631
    jmp short loc_2f65d
loc_2f667:
    mov bx, word [eax]
    add eax, 2
    test bx, bx
    jle short loc_2f67c
    and ebx, strict dword 0xffff
    add edx, ebx
    jmp short loc_2f631
loc_2f67c:
    je short loc_2f6a9
    add bh, 0x80
    cmp bx, 0x4000
    jae short loc_2f695
loc_2f688:
    inc edx
    mov cl, byte [eax]
    inc eax
    mov byte [edx - 1], cl
    dec bx
    je short loc_2f631
    jmp short loc_2f688
loc_2f695:
    inc eax
    sub ebx, strict dword 0x4000
    mov cl, byte [eax - 1]
loc_2f69f:
    inc edx
    mov byte [edx - 1], cl
    dec bx
    je short loc_2f631
    jmp short loc_2f69f
loc_2f6a9:
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret

render_frame:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov ecx, edx
    mov eax, 0x3a50
    call check_anim_started
    mov eax, dword [0x9df4]
    mov bx, word [eax + 0x684]
    xor edx, edx
    sub esi, ebx
    xor eax, eax
    test si, si
    jbe short loc_2f6ed
loc_2f6dc:
    xor ebx, ebx
    mov bx, ax
    mov di, word [ecx + ebx*2]
    inc eax
    add edx, edi
    cmp ax, si
    jb short loc_2f6dc
loc_2f6ed:
    mov eax, dword [0x9df4]
    mov ax, word [eax + 0x686]
    and eax, strict dword 0xffff
    lea ebx, [nosplit eax*2]
    xor eax, eax
    mov ax, dx
    add eax, ebx
    add eax, ecx
    cmp byte [eax + 1], 0
    je short loc_2f731
    mov dx, word [eax + 2]
    xor dh, dh
    xor ebx, ebx
    and dl, 1
    mov bx, dx
    xor edx, edx
    mov dx, word [eax + 2]
    add edx, ebx
    add edx, 4
    add eax, edx
    jmp short loc_2f734
loc_2f731:
    add eax, 4
loc_2f734:
    mov edx, dword [0x9df4]
    add edx, strict dword 0x1068a
    call play_run_skip_dump
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

draw_frame:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov ebx, eax
    mov eax, 0x3a5c
    call check_anim_started
    mov edx, dword [0x9df4]
    add edx, strict dword 0x68a
    and ebx, strict dword 0xffff
    mov eax, ebx
    call find_page
    and eax, strict dword 0xffff
    call load_page
    mov edx, dword [0x9df4]
    mov eax, ebx
    add edx, strict dword 0x68a
    call render_frame
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

anim_load:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov esi, eax
    cmp dword [0x9df8], 0
    jne short loc_2f7bd
    mov dword [0x9df8], 1
loc_2f7bd:
    push byte 4
    mov edx, dword [0x9df4]
    mov ecx, 0x3a44
    mov ebx, 0x80
    mov word [edx + 0x682], 0xffff
    push dword 0xf4
    mov dword [edx + 0x2098e], 0xffffffff
    lea eax, [edx + 2]
    mov dword [edx + 0x2068a], esi
    mov edx, esi
    call 0x5e9ab
    add esi, strict dword 0x100
    xor eax, eax
loc_2f7ff:
    mov edi, esi
    xor edx, edx
    mov ebx, dword [0x9df4]
    mov dx, ax
    mov cl, byte [edi]
    inc esi
    mov byte [edx + ebx + 0x20690], cl
    mov ecx, esi
    mov cl, byte [ecx]
    inc esi
    mov byte [edx + ebx + 0x2068f], cl
    mov ecx, esi
    add eax, strict dword 3
    mov cl, byte [ecx]
    add esi, 2
    mov byte [edx + ebx + 0x2068e], cl
    cmp ax, strict word 0x300
    jb short loc_2f7ff
    push byte 4
    mov ecx, 0x3a44
    lea eax, [ebx + 0x82]
    push dword 0x100
    mov edx, esi
    mov ebx, 0x600
    call 0x5e9ab
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

anim_free:
    push ebp
    mov ebp, esp
    push ebx
    cmp dword [0x9df8], 0
    je short loc_2f879
    xor ebx, ebx
    mov dword [0x9df8], ebx
loc_2f879:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    nop

anim_num_frames:
    push ebp
    mov ebp, esp
    mov eax, 0x3a68
    call check_anim_started
    mov eax, dword [0x9df4]
    mov eax, dword [eax + 0xa]
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

anim_draw_frame:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov ebx, eax
    mov eax, 0x3a74
    call check_anim_started
    mov edx, dword [0x9df4]
    mov ecx, dword [edx + 0x2098e]
    cmp ecx, -1
    je short loc_2f8da
    cmp ebx, ecx
    jl short loc_2f8da
    mov edx, ecx
    cmp ecx, ebx
    jge short loc_2f8ef
loc_2f8c9:
    xor eax, eax
    mov ax, dx
    inc edx
    call draw_frame
    cmp edx, ebx
    jge short loc_2f8ef
    jmp short loc_2f8c9
loc_2f8da:
    xor edx, edx
    test ebx, ebx
    jle short loc_2f8ef
loc_2f8e0:
    xor eax, eax
    mov ax, dx
    inc edx
    call draw_frame
    cmp edx, ebx
    jl short loc_2f8e0
loc_2f8ef:
    mov eax, dword [0x9df4]
    add eax, strict dword 0x1068a
    mov dword [eax + 0x10304], ebx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

anim_get_palette:
    push ebp
    mov ebp, esp
    mov eax, 0x3a80
    call check_anim_started
    mov eax, dword [0x9df4]
    add eax, strict dword 0x2068e
    mov esp, ebp
    pop ebp
    ret
    times 13 db 0    ; Object alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    sub esp, 0x1c
    push byte 4
    mov ecx, 0x3a8c
    mov ebx, 0x1c
    push byte 0x27
    lea eax, [ebp - 0x28]
    xor edx, edx
    call 0x5bf59
    mov edx, 0x100
    mov ebx, 0xffff
    mov eax, 0x31
    mov dword [ebp - 0x28], edx
    mov dword [ebp - 0x24], ebx
    lea ebx, [ebp - 0x28]
    lea edx, [ebp - 0x28]
    call 0x6125b
    cmp dword [ebp - 0x10], 0
    je short loc_2f984
    mov eax, dword [ebp - 0x24]
    and eax, strict dword 0xffff
    shl eax, 4
    jmp short loc_2f989
loc_2f984:
    mov eax, 0xa0000
loc_2f989:
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
    push esi
    push edi
    sub esp, 0x1c
    mov edi, eax
    mov esi, edx
    push byte 4
    mov ecx, 0x3a8c
    mov ebx, 0x1c
    lea eax, [ebp - 0x2c]
    push byte 0x39
    xor edx, edx
    add edi, 0xf
    call 0x5bf59
    sar edi, 4
    mov edx, 0x100
    lea ebx, [ebp - 0x2c]
    mov eax, 0x31
    mov dword [ebp - 0x2c], edx
    lea edx, [ebp - 0x2c]
    mov dword [ebp - 0x28], edi
    call 0x6125b
    cmp dword [ebp - 0x14], 0
    je short loc_2f9e5
    xor eax, eax
    jmp short loc_2f9fa
loc_2f9e5:
    test esi, esi
    je short loc_2f9ef
    mov eax, dword [ebp - 0x20]
    mov word [esi], ax
loc_2f9ef:
    mov eax, dword [ebp - 0x2c]
    and eax, strict dword 0xffff
    shl eax, 4
loc_2f9fa:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
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
    sub esp, 0x1c
    mov esi, eax
    push byte 4
    mov ecx, 0x3a8c
    mov ebx, 0x1c
    push byte 0x4d
    lea eax, [ebp - 0x2c]
    xor edx, edx
    call 0x5bf59
    mov edx, 0x101
    lea ebx, [ebp - 0x2c]
    xor eax, eax
    mov dword [ebp - 0x2c], edx
    mov ax, si
    lea edx, [ebp - 0x2c]
    mov dword [ebp - 0x28], eax
    mov eax, 0x31
    call 0x6125b
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
    push esi
    sub esp, 0x2c
    mov byte [ebp - 0x10], al
    mov esi, edx
    push byte 4
    mov ecx, 0x3a8c
    mov ebx, 0x1c
    push byte 0x5c
    lea eax, [ebp - 0x38]
    xor edx, edx
    call 0x5bf59
    push byte 4
    mov ecx, 0x3a8c
    mov ebx, 0xc
    push byte 0x5d
    lea eax, [ebp - 0x1c]
    xor edx, edx
    call 0x5bf59
    mov edx, 0x300
    mov al, byte [ebp - 0x10]
    xor ebx, ebx
    mov word [ebp - 0x38], dx
    mov byte [ebp - 0x34], al
    xor ah, ah
    mov edx, ds
    mov byte [ebp - 0x33], ah
    mov eax, esi
    mov word [ebp - 0x30], bx
    mov eax, dword [0x9e00]
    mov word [ebp - 0x1c], dx
    shr eax, 4
    mov dword [ebp - 0x24], esi
    and eax, strict dword 0xffff
    mov word [esi + 0x30], ax
    mov ax, word [0x9e00]
    lea ecx, [ebp - 0x1c]
    xor ah, ah
    lea ebx, [ebp - 0x38]
    and al, 0xf
    lea edx, [ebp - 0x38]
    mov word [esi + 0x2e], ax
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
    push ecx
    push esi
    push edi
    sub esp, 0x20
    mov edi, eax
    mov esi, edx
    push byte 4
    mov ecx, 0x3a8c
    mov ebx, 0x1c
    mov edx, dword [0x9e08]
    mov dword [ebp - 0x14], eax
    push byte 0x7a
    sub edx, esi
    lea eax, [ebp - 0x30]
    mov dword [0x9e08], edx
    xor edx, edx
    shr edi, 0x10
    call 0x5bf59
    mov edx, 0x601
    mov eax, dword [ebp - 0x14]
    lea ebx, [ebp - 0x30]
    mov word [ebp - 0x2c], di
    mov word [ebp - 0x28], ax
    mov eax, esi
    mov word [ebp - 0x30], dx
    shr eax, 0x10
    lea edx, [ebp - 0x30]
    mov word [ebp - 0x20], ax
    mov eax, 0x31
    mov word [ebp - 0x1c], si
    call 0x6125b
    cmp dword [ebp - 0x18], 0
    sete al
    and eax, strict dword 0xff
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
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
    sub esp, 0x20
    mov edi, eax
    mov esi, edx
    push byte 4
    mov ecx, 0x3a8c
    mov ebx, 0x1c
    mov edx, dword [0x9e08]
    mov dword [ebp - 0x14], eax
    push dword 0x91
    add edx, esi
    lea eax, [ebp - 0x30]
    mov dword [0x9e08], edx
    xor edx, edx
    shr edi, 0x10
    call 0x5bf59
    mov edx, 0x600
    mov eax, dword [ebp - 0x14]
    lea ebx, [ebp - 0x30]
    mov word [ebp - 0x2c], di
    mov word [ebp - 0x28], ax
    mov eax, esi
    mov word [ebp - 0x30], dx
    shr eax, 0x10
    lea edx, [ebp - 0x30]
    mov word [ebp - 0x20], ax
    mov eax, 0x31
    mov word [ebp - 0x1c], si
    call 0x6125b
    cmp dword [ebp - 0x18], 0
    sete al
    and eax, strict dword 0xff
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
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
    sub esp, 0x58
    call 0x2f930
    mov edx, 0x9e10
    mov dword [0x9e20], eax
    mov eax, 0x400
    call 0x2f994
    mov dword [0x9e0c], eax
    test eax, eax
    jne short loc_2fc32
    xor edx, edx
    mov word [0x9e10], dx
    jmp near loc_2fd63
loc_2fc32:
    push byte 4
    mov ecx, 0x3a8c
    mov ebx, 0x1c
    push dword 0xcc
    lea eax, [ebp - 0x38]
    xor edx, edx
    call 0x5bf59
    mov edx, 0x400
    lea ebx, [ebp - 0x38]
    mov eax, 0x31
    mov dword [ebp - 0x38], edx
    lea edx, [ebp - 0x38]
    call 0x6125b
    cmp dword [ebp - 0x20], 0
    jne short loc_2fc7b
    test byte [ebp - 0x34], 4
    je short loc_2fc7b
    mov dword [0x9e14], 1
loc_2fc7b:
    push byte 4
    mov ecx, 0x3a8c
    mov ebx, 0x1c
    push dword 0xda
    lea eax, [ebp - 0x38]
    xor edx, edx
    call 0x5bf59
    push byte 4
    mov ecx, 0x3a8c
    mov ebx, 0xc
    lea eax, [ebp - 0x1c]
    push dword 0xdb
    xor edx, edx
    mov esi, 0x500
    call 0x5bf59
    lea eax, [ebp - 0x68]
    lea ecx, [ebp - 0x1c]
    lea ebx, [ebp - 0x38]
    mov edx, ds
    mov dword [ebp - 0x38], esi
    lea eax, [ebp - 0x68]
    mov word [ebp - 0x1c], dx
    lea edx, [ebp - 0x38]
    mov dword [ebp - 0x24], eax
    mov eax, 0x31
    call 0x61278
    cmp dword [ebp - 0x20], 0
    jne short loc_2fcf4
    mov eax, dword [ebp - 0x50]
    shl eax, 0xc
    mov dword [0x9e1c], eax
    mov eax, dword [ebp - 0x5c]
    shl eax, 0xc
    jmp short loc_2fcfe
loc_2fcf4:
    mov eax, 0x1000000
    mov dword [0x9e1c], eax
loc_2fcfe:
    mov dword [0x9e18], eax
    mov edx, 0x1000
    mov eax, 0x5012c
    call 0x2fb74
    test eax, eax
    je short loc_2fd63
    mov edx, 0x1000
    mov eax, 0x4fe60
    call 0x2fb74
    test eax, eax
    je short loc_2fd63
    mov edx, 0x1000
    mov eax, 0x51292
    call 0x2fb74
    test eax, eax
    je short loc_2fd63
    mov edx, 0x9e04
    mov eax, 0x800
    call 0x2f994
    mov dword [0x9dfc], eax
    test eax, eax
    je short loc_2fd63
    add eax, strict dword 0x800
    mov dword [0x9e00], eax
    mov eax, 1
loc_2fd63:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push edx
    cmp word [0x9e10], 0
    je short loc_2fd8c
    xor edx, edx
    xor ebx, ebx
    mov dword [0x9e0c], edx
    mov word [0x9e10], bx
loc_2fd8c:
    xor eax, eax
    mov ax, word [0x9e04]
    call 0x2fa04
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push edx
    mov edx, dword [0x9e0c]
    test edx, edx
    jne short loc_2fdb2
    xor eax, eax
    jmp short loc_2fdc3
loc_2fdb2:
    cmp eax, strict dword 0x400
    jle short loc_2fdc1
    xor eax, eax
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
loc_2fdc1:
    mov eax, edx
loc_2fdc3:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    times 7 db 0    ; Object alignment

shutdown_cdrom:
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop

startup_cdrom:
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
    mov esp, ebp
    pop ebp
    ret
    db 0
    dd 0x2f2d5c    ; Alignment word before the multiplayer module

init_multiplayers:
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    sub esp, 4
    mov si, word [0xcf65c]
    mov eax, dword [0x1fdf0]
    xor ebx, ebx
    mov dword [ebp - 0x10], eax
    call 0x2ff34
    xor eax, eax
    mov ecx, 0xffffffff
    xor edx, edx
loc_2fe1c:
    add ebx, 4
    add eax, strict dword 0x200
    mov dword [ebx + 0xcf55c], edx
    mov dword [ebx + 0xcf5ac], edx
    mov dword [ebx + 0xcf5ec], edx
    mov word [eax + 0xc6e9e], cx
    cmp ebx, 0x40
    jne short loc_2fe1c
    mov ebx, dword [0xabc4]
    dec ebx
    test ebx, ebx
    jle short loc_2fe80
    lea ecx, [ebx*4]
loc_2fe54:
    mov eax, dword [0xabc8]
    lea edx, [ebp - 0x10]
    mov eax, dword [ecx + eax]
    call 0x612ab
    test eax, eax
    je short loc_2fe78
    mov edx, eax
    mov eax, 0x3a94
    call 0x5ac26
    test eax, eax
    je short loc_2fe80
loc_2fe78:
    sub ecx, 4
    dec ebx
    test ecx, ecx
    jg short loc_2fe54
loc_2fe80:
    mov si, word [0xcf65c]
    test ebx, ebx
    jne short loc_2feb2
    mov esi, 1
    mov ebx, 0xffffffff
    xor eax, eax
    xor edx, edx
    mov word [0xcf65e], ax
    mov word [0xcf658], dx
    mov word [0xcf540], bx
    jmp near loc_2ff25
loc_2feb2:
    mov eax, dword [0xabc8]
    mov eax, dword [eax + ebx*4 + 4]
    xor edi, edi
    call 0x601e1
    mov dword [0xcf64c], eax
    mov si, word [eax + 0xa]
    mov ax, word [eax + 8]
    mov word [0xcf658], di
    dec eax
    xor ebx, ebx
    mov word [0xcf65e], ax
    xor eax, eax
    jmp short loc_2fef1
loc_2fee3:
    mov edx, ebx
    add eax, 2
    inc edx
    inc ebx
    mov word [eax + 0xcf53e], dx
loc_2fef1:
    movsx edx, si
    lea ecx, [edx - 1]
    cmp ebx, ecx
    jl short loc_2fee3
    mov ecx, 0xffffffff
    xor ebx, ebx
    xor eax, eax
    mov word [nosplit edx*2 + 0xcf53e], cx
    jmp short loc_2ff1e
loc_2ff0e:
    add eax, 4
    mov edx, dword [0x216f7c]
    inc ebx
    mov dword [eax + 0xcf4fc], edx
loc_2ff1e:
    movsx edx, si
    cmp ebx, edx
    jl short loc_2ff0e
loc_2ff25:
    mov word [0xcf65c], si
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    sub esp, 4
    xor esi, esi
    mov dword [ebp - 0x14], esi
loc_2ff43:
    mov ebx, 7
    mov edx, esi
    xor eax, eax
    shl edx, 8
loc_2ff4f:
    mov ecx, edx
    xor ecx, eax
    add eax, eax
    and ecx, strict dword 0x8000
    and eax, strict dword 0xffff
    test ecx, ecx
    jle short loc_2ff68
    xor ax, 0x1021
loc_2ff68:
    add edx, edx
    dec ebx
    and edx, strict dword 0xffff
    test ebx, ebx
    jge short loc_2ff4f
    mov edx, dword [ebp - 0x14]
    and eax, strict dword 0xffff
    inc esi
    lea ebx, [edx + 4]
    mov dword [edx + 0xceeb0], eax
    mov dword [ebp - 0x14], ebx
    cmp esi, strict dword 0x100
    jl short loc_2ff43
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
    push ecx
    mov ecx, dword [0x216f7c]
    mov dword [0x9e34], eax
    mov eax, dword [0xcf656]
    sar eax, 0x10
    mov dword [0x9e38], edx
    test eax, eax
    jl short loc_2ffd2
loc_2ffbd:
    mov dword [nosplit eax*4 + 0xcf500], ecx
    mov eax, dword [nosplit eax*2 + 0xcf53e]
    sar eax, 0x10
    test eax, eax
    jge short loc_2ffbd
loc_2ffd2:
    mov dword [0x216f7c], ecx
    lea esp, [ebp - 4]
    pop ecx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    mov ecx, eax
    mov eax, edx
    cwde
    dec eax
    xor edx, edx
    test eax, eax
    jl short loc_30023
    lea ebx, [eax + ecx]
loc_2fff5:
    xor ecx, ecx
    mov cx, dx
    mov esi, ecx
    sar esi, 8
    xor ecx, ecx
    and esi, strict dword 0xffff
    mov cl, byte [ebx]
    shl edx, 8
    xor ecx, esi
    dec ebx
    and edx, strict dword 0xffff
    mov esi, dword [nosplit ecx*4 + 0xceeb0]
    dec eax
    xor edx, esi
    test eax, eax
    jge short loc_2fff5
loc_30023:
    mov eax, edx
    and eax, strict dword 0xffff
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

uninit_multiplayers:
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
    sub esp, 4
    mov ah, 0xff
    mov ecx, dword [0xcf656]
    mov byte [ebp - 0x10], ah
    mov al, byte [0xcf65e]
    sar ecx, 0x10
    mov byte [ebp - 0xf], al
    test ecx, ecx
    jl short loc_30091
loc_30067:
    mov edx, dword [0xcf65c]
    sar edx, 0x10
    cmp ecx, edx
    je short loc_30083
    mov ebx, 2
    lea edx, [ebp - 0x10]
    mov eax, ecx
    call send_packet
loc_30083:
    mov ecx, dword [nosplit ecx*2 + 0xcf53e]
    sar ecx, 0x10
    test ecx, ecx
    jge short loc_30067
loc_30091:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop

send_packet:
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    sub esp, 0xc
    mov dword [ebp - 0x10], eax
    mov dword [ebp - 0x18], edx
    mov edi, ebx
    cmp word [0xcf65c], 2
    jl near loc_301d3
    mov edx, dword [ebp - 0x10]
    mov edx, dword [nosplit edx*4 + 0xcf5f0]
    dec edx
    and edx, strict dword 0xff
    lea ebx, [nosplit edx*2]
    mov edx, dword [ebp - 0x10]
    shl edx, 9
    add edx, ebx
    mov ebx, dword [edx + 0xc6e9e]
    sar ebx, 0x10
    xor eax, eax
    cmp ebx, edi
    jne short loc_30134
    mov eax, dword [edx + 0xc8e9e]
    sar eax, 0x10
    mov dword [ebp - 0x14], eax
    lea eax, [edi - 1]
    test eax, eax
    jl short loc_30134
    mov edx, dword [ebp - 0x18]
    mov ebx, dword [ebp - 0x14]
    add edx, eax
    add ebx, eax
loc_3011b:
    mov esi, ebx
    and esi, strict dword 0x3fff
    mov cl, byte [esi + 0xcaea0]
    cmp cl, byte [edx]
    jne short loc_30134
    dec edx
    dec eax
    dec ebx
    test eax, eax
    jge short loc_3011b
loc_30134:
    mov edx, dword [ebp - 0x10]
    mov edx, dword [nosplit edx*4 + 0xcf5f0]
    and edx, strict dword 0xff
    lea ebx, [nosplit edx*2]
    mov edx, dword [ebp - 0x10]
    shl edx, 9
    add edx, ebx
    mov word [edx + 0xc6ea0], di
    test eax, eax
    jge short loc_3016a
    mov eax, dword [ebp - 0x14]
    mov word [edx + 0xc8ea0], ax
    jmp short loc_301af
loc_3016a:
    mov ax, word [0x9e3c]
    mov word [edx + 0xc8ea0], ax
    xor eax, eax
    test edi, edi
    jle short loc_3019d
    mov ebx, dword [ebp - 0x18]
    mov edx, dword [0x9e3c]
loc_30186:
    mov esi, edx
    inc eax
    mov cl, byte [ebx]
    and esi, strict dword 0x3fff
    inc ebx
    inc edx
    mov byte [esi + 0xcaea0], cl
    cmp eax, edi
    jl short loc_30186
loc_3019d:
    add edi, dword [0x9e3c]
    and edi, strict dword 0x3fff
    mov dword [0x9e3c], edi
loc_301af:
    mov eax, dword [ebp - 0x10]
    mov ebx, dword [nosplit eax*4 + 0xcf5f0]
    mov edx, dword [0x216f7c]
    inc ebx
    mov dword [nosplit eax*4 + 0xcf500], edx
    mov dword [nosplit eax*4 + 0xcf5f0], ebx
    call 0x301dc
loc_301d3:
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
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
    sub esp, 0x10
    mov dword [ebp - 0x18], eax
    shl eax, 2
    mov edx, dword [eax + 0xcf5b0]
    mov ebx, dword [eax + 0xcf5f0]
    cmp edx, ebx
    je near loc_3041d
    mov esi, dword [ebp - 0x18]
    inc edx
    shl esi, 9
    cmp edx, ebx
    jne near loc_302a5
    mov edx, dword [0xcf64c]
    mov cl, byte [eax + 0xcf5b0]
    mov ebx, dword [ebp - 0x18]
    mov byte [edx + 0x10], cl
    mov bl, byte [ebx + 0xceea0]
    mov ecx, dword [ebp - 0x18]
    and bl, 7
    mov cl, byte [ecx + 0xcf5a0]
    shl bl, 3
    and cl, 7
    add cl, bl
    lea ebx, [edx + 1]
    mov byte [ebx + 0x10], cl
    mov cl, byte [eax + 0xcf560]
    mov byte [edx + 0x12], cl
    mov eax, dword [eax + 0xcf5b0]
    and eax, strict dword 0xff
    add edx, 2
    mov ebx, 3
    mov edx, dword [esi + eax*2 + 0xc8e9e]
    mov eax, dword [esi + eax*2 + 0xc6e9e]
    sar edx, 0x10
    sar eax, 0x10
    xor esi, esi
    test eax, eax
    jle near loc_303c0
loc_3027c:
    mov edi, dword [0xcf64c]
    mov ecx, edx
    mov dword [ebp - 0x20], ebx
    inc esi
    and ecx, strict dword 0x3fff
    inc ebx
    inc edx
    add edi, dword [ebp - 0x20]
    mov cl, byte [ecx + 0xcaea0]
    mov byte [edi + 0x10], cl
    cmp esi, eax
    jl short loc_3027c
    jmp near loc_303c0
loc_302a5:
    mov edx, dword [0xcf64c]
    mov cl, byte [eax + 0xcf5b0]
    mov ebx, dword [ebp - 0x18]
    mov byte [edx + 0x10], cl
    mov bl, byte [ebx + 0xceea0]
    and bl, 7
    mov ecx, dword [ebp - 0x18]
    shl bl, 3
    mov bh, byte [ecx + 0xcf5a0]
    and bh, 7
    mov cl, bl
    add cl, bh
    lea ebx, [edx + 1]
    add cl, 0x80
    mov byte [ebx + 0x10], cl
    lea ebx, [edx + 2]
    mov cl, byte [eax + 0xcf560]
    mov byte [ebx + 0x10], cl
    mov eax, dword [eax + 0xcf5b0]
    and eax, strict dword 0xff
    mov ebx, dword [esi + eax*2 + 0xc8e9e]
    sar ebx, 0x10
    mov eax, dword [esi + eax*2 + 0xc6e9e]
    mov dword [ebp - 0x24], ebx
    lea ebx, [edx + 3]
    sar eax, 0x10
    mov byte [ebx + 0x10], al
    mov ebx, eax
    xor esi, esi
    sar ebx, 8
    add edx, 4
    mov cl, bl
    mov ebx, 5
    mov byte [edx + 0x10], cl
    test eax, eax
    jle short loc_30359
    mov edx, dword [ebp - 0x24]
loc_3032b:
    mov ecx, edx
    and ecx, strict dword 0x3fff
    mov dword [ebp - 0x20], ecx
    mov ecx, dword [0xcf64c]
    mov dword [ebp - 0x1c], ecx
    mov edi, dword [ebp - 0x1c]
    mov ecx, ebx
    inc esi
    add edi, ecx
    mov ecx, dword [ebp - 0x20]
    inc edx
    inc ebx
    mov cl, byte [ecx + 0xcaea0]
    mov byte [edi + 0x10], cl
    cmp esi, eax
    jl short loc_3032b
loc_30359:
    mov eax, dword [ebp - 0x18]
    mov esi, dword [nosplit eax*4 + 0xcf5b0]
    inc esi
    mov dword [nosplit eax*4 + 0xcf5b0], esi
    mov eax, esi
    mov edx, dword [ebp - 0x18]
    and eax, strict dword 0xff
    shl edx, 9
    add eax, eax
    add eax, edx
    mov edx, dword [eax + 0xc8e9e]
    mov eax, dword [eax + 0xc6e9e]
    xor esi, esi
    sar eax, 0x10
    sar edx, 0x10
    test eax, eax
    jle short loc_303c0
loc_30394:
    mov ecx, edx
    mov dword [ebp - 0x20], ebx
    and ecx, strict dword 0x3fff
    mov edi, dword [ebp - 0x20]
    mov dword [ebp - 0x1c], ecx
    mov ecx, dword [0xcf64c]
    inc esi
    add edi, ecx
    mov ecx, dword [ebp - 0x1c]
    inc ebx
    inc edx
    mov cl, byte [ecx + 0xcaea0]
    mov byte [edi + 0x10], cl
    cmp esi, eax
    jl short loc_30394
loc_303c0:
    mov eax, dword [ebp - 0x18]
    inc dword [nosplit eax*4 + 0xcf5b0]
    mov eax, dword [0xcf64c]
    movsx edx, bx
    add eax, 0x10
    mov ecx, ebx
    call 0x2ffe0
    mov edx, eax
    mov eax, dword [0xcf64c]
    lea esi, [eax + ecx]
    mov cl, dl
    inc ebx
    mov byte [esi + 0x10], cl
    and edx, strict dword 0xffff
    mov ecx, ebx
    sar edx, 8
    mov byte [ecx + eax + 0x10], dl
    inc ebx
    mov word [eax + 2], 1
    mov edx, dword [ebp - 0x18]
    mov word [eax + 6], bx
    inc edx
    mov ebx, 0xcf630
    mov word [eax + 4], dx
    mov edx, ebx
    movsx eax, word [eax]
    call 0x6125b
loc_3041d:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

get_packet:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 4
    mov esi, eax
    mov dword [ebp - 0x14], edx
    cmp word [0xcf65c], 2
    jge short loc_30448
    xor ebx, ebx
    jmp near loc_30782
loc_30448:
    mov edx, dword [0xcf656]
    sar edx, 0x10
    test edx, edx
    jl near loc_30500
loc_30459:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    cmp edx, eax
    je near loc_304ee
    lea eax, [edx*4]
    mov ebx, dword [0x216f7c]
    cmp ebx, dword [eax + 0xcf500]
    jge short loc_30484
    mov dword [eax + 0xcf500], ebx
loc_30484:
    lea eax, [edx*4]
    mov edi, dword [0x9e34]
    mov ebx, dword [eax + 0xcf500]
    mov ecx, dword [0x216f7c]
    add ebx, edi
    cmp ebx, ecx
    jge short loc_304ee
    mov bl, byte [edx + 0xcf4f0]
    inc bl
    mov edi, dword [eax + 0xcf5f0]
    mov byte [edx + 0xcf5a0], bl
    cmp edi, dword [eax + 0xcf5b0]
    jne short loc_304da
    mov ebx, dword [eax + 0xcf5b0]
    test ebx, ebx
    jle short loc_304da
    lea edi, [ebx - 1]
    mov dword [eax + 0xcf500], ecx
    mov dword [eax + 0xcf5b0], edi
    jmp short loc_304e7
loc_304da:
    mov ebx, dword [0x9e38]
    add dword [nosplit edx*4 + 0xcf500], ebx
loc_304e7:
    mov eax, edx
    call 0x301dc
loc_304ee:
    mov edx, dword [nosplit edx*2 + 0xcf53e]
    sar edx, 0x10
    test edx, edx
    jge near loc_30459
loc_30500:
    cmp byte [0x9e30], 0
    je short loc_3054e
    push byte 4
    mov ecx, 0x3a98
    mov ax, word [0xcf660]
    mov ebx, dword [0xcf658]
    xor dl, dl
    push dword 0x13a
    mov byte [0x9e30], dl
    sar ebx, 0x10
    mov word [esi], ax
    mov edx, 0xcf2b0
    mov eax, dword [ebp - 0x14]
    call 0x5e9ab
    mov bx, word [0xcf65a]
    mov eax, ebx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_3054e:
    mov eax, dword [0xcf64c]
    mov ebx, 0xcf630
    mov word [eax + 2], 2
    mov edx, ebx
    movsx eax, word [eax]
    call 0x6125b
    mov eax, dword [0xcf64c]
    mov bx, word [eax + 4]
    test bx, bx
    jge short loc_30583
    xor ebx, ebx
    mov eax, ebx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_30583:
    mov edx, ebx
    dec edx
    mov word [esi], dx
    mov edx, dword [eax + 4]
    sar edx, 0x10
    xor bh, bh
    mov bl, byte [edx + eax + 0xe]
    mov cl, byte [edx + eax + 0xf]
    sub edx, 2
    add eax, 0x10
    xor ch, ch
    movsx edx, dx
    shl ecx, 8
    call 0x2ffe0
    add ebx, ecx
    xor edx, edx
    mov dx, bx
    cmp edx, eax
    je short loc_305d5
    movsx eax, word [esi]
    mov dl, byte [eax + 0xcf4f0]
    inc dl
    xor ebx, ebx
    mov byte [eax + 0xcf5a0], dl
    mov eax, ebx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_305d5:
    movsx eax, word [esi]
    mov dl, byte [eax + 0xcf4f0]
    xor ebx, ebx
    and dl, 7
    mov bl, dl
    mov edx, dword [0xcf64c]
    xor ecx, ecx
    mov cl, byte [edx + 0x11]
    sar ecx, 3
    and ecx, 7
    cmp ebx, ecx
    je short loc_30602
    inc byte [eax + 0xcf4f0]
    jmp short loc_305d5
loc_30602:
    mov bl, byte [eax + 0xceea0]
    xor ecx, ecx
    and bl, 7
    mov cl, bl
    mov bl, byte [edx + 0x11]
    and bl, 7
    and ebx, strict dword 0xff
    cmp ebx, ecx
    je short loc_30663
    inc byte [eax + 0xceea0]
    movsx eax, word [esi]
    mov ebx, dword [nosplit eax*4 + 0xcf5f0]
    mov dl, byte [edx + 0x12]
    xor bl, bl
    and edx, strict dword 0xff
    add ebx, edx
    mov dword [nosplit eax*4 + 0xcf5b0], ebx
    movsx eax, word [esi]
    shl eax, 2
    mov edx, dword [eax + 0xcf5b0]
    cmp edx, dword [eax + 0xcf5f0]
    jle short loc_30663
    lea ecx, [edx - 0x100]
    mov dword [eax + 0xcf5b0], ecx
loc_30663:
    movsx ebx, word [esi]
    lea ecx, [ebx*4]
    mov eax, dword [0xcf64c]
    xor edx, edx
    mov edi, dword [ecx + 0xcf560]
    mov dl, byte [eax + 0x10]
    and edi, strict dword 0xff
    cmp edx, edi
    je short loc_306b4
    mov eax, dword [ecx + 0xcf560]
    sub eax, edx
    and eax, strict dword 0xff
    cmp eax, 0x20
    jle short loc_306a7
    mov al, byte [ebx + 0xcf4f0]
    inc al
    mov byte [ebx + 0xcf5a0], al
loc_306a7:
    xor ebx, ebx
    mov eax, ebx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_306b4:
    test byte [eax + 0x11], 0x80
    jne short loc_306f3
    push byte 4
    mov ecx, 0x3a98
    mov edi, dword [eax + 4]
    lea edx, [eax + 0x13]
    sar edi, 0x10
    push dword 0x190
    sub edi, 5
    mov eax, dword [ebp - 0x14]
    mov ebx, edi
    call 0x5e9ab
    movsx eax, word [esi]
    mov ebx, edi
    inc dword [nosplit eax*4 + 0xcf560]
    mov eax, ebx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_306f3:
    xor edx, edi
    mov dl, byte [eax + 0x14]
    movzx edi, byte [eax + 0x13]
    shl edx, 8
    push byte 4
    add edi, edx
    mov dx, word [eax + 6]
    mov cl, 1
    sub edx, 7
    push dword 0x19f
    sub edx, edi
    mov byte [0x9e30], cl
    mov word [0xcf65a], dx
    mov dx, word [esi]
    mov ecx, 0x3a98
    mov word [0xcf660], dx
    lea edx, [eax + 0x15]
    mov ebx, edi
    mov eax, dword [ebp - 0x14]
    call 0x5e9ab
    push dword 0x240
    mov ecx, 0x3a98
    mov ebx, dword [0xcf658]
    mov edx, dword [0xcf64c]
    lea eax, [edi + 5]
    push dword 0x1a0
    add edx, 0x10
    sar ebx, 0x10
    add edx, eax
    mov eax, 0xcf2b0
    call 0x5e9ab
    movsx eax, word [esi]
    mov esi, dword [nosplit eax*4 + 0xcf560]
    add esi, 2
    mov ebx, edi
    mov dword [nosplit eax*4 + 0xcf560], esi
loc_30782:
    mov eax, ebx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

load_board:
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push esi
    push edi
    cmp word [0xcf65c], 2
    jl short loc_307f8
    mov edi, dword [0xcf64c]
    mov word [edi + 2], cx
    cmp ebx, strict dword 0x800
    jl short loc_307be
    mov ebx, 0x800
loc_307be:
    mov ecx, ebx
    mov ebx, dword [0xcf64c]
    mov word [ebx + 6], cx
    mov ecx, dword [ebx + 4]
    sar ecx, 0x10
    mov esi, edx
    add ecx, 3
    lea edi, [ebx + 0x10]
    sar ecx, 2
    mov edx, eax
    rep movsd
    mov eax, dword [0xcf64c]
    inc edx
    mov ebx, 0xcf630
    mov word [eax + 4], dx
    mov edx, ebx
    movsx eax, word [eax]
    call 0x6125b
loc_307f8:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
