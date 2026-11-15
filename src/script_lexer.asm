bits 32
org 0x1a044

%define GET_Z_RANGE 0x46fb4
%define BADGUY 0x14814
%define CEILING_SPACE 0x23f74
%define FLOOR_SPACE 0x23f28
%define SET_DEBUG_LOCATION 0x5ab32
%define PRINTF 0x5ac04
%define STRCMP 0x60140
%define LINE_NUMBER 0xc3358
%define SOURCE_NAME 0x1e00
%define TOKEN_BUFFER 0xa6ab0
%define TEXT_CURSOR 0xbd9c4
%define CON_KEYWORDS 0x9730

is_special:
    push ebp
    mov ebp, esp
    push edx
    cmp al, 0xa
    jne short loc_1a05f
    mov dx, word [LINE_NUMBER]
    inc edx
    mov al, 1
    mov word [LINE_NUMBER], dx
    jmp short loc_1a071
loc_1a05f:
    cmp al, 0x20
    je short loc_1a067
    cmp al, 0xd
    jne short loc_1a06f
loc_1a067:
    mov al, 1
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
loc_1a06f:
    xor al, al
loc_1a071:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    nop

is_alt_token:
    push ebp
    mov ebp, esp
    push edx
    mov ah, al
    xor edx, edx
    inc ah
    mov dl, ah
    test byte [edx + 0x9150], 0xe0
    jne short loc_1a0a9
    cmp al, 0x7b
    je short loc_1a0a9
    cmp al, 0x7d
    je short loc_1a0a9
    cmp al, 0x2f
    je short loc_1a0a9
    cmp al, 0x2a
    je short loc_1a0a9
    cmp al, 0x2d
    je short loc_1a0a9
    cmp al, 0x5f
    je short loc_1a0a9
    cmp al, 0x2e
    jne short loc_1a0ad
loc_1a0a9:
    mov al, 1
    jmp short loc_1a0af
loc_1a0ad:
    xor al, al
loc_1a0af:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    lea eax, [byte eax + 0]

get_global_z:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x10
    mov edi, eax
    movsx ebx, ax
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov esi, 0x191368
    shl eax, 2
    add esi, eax
    mov dx, word [esi + 0x1a]
    cmp dx, 0xa
    je short loc_1a106
    cmp dx, 6
    je short loc_1a106
    cmp dx, 2
    je short loc_1a106
    cmp dx, 1
    je short loc_1a106
    cmp dx, 4
    jne near loc_1a2ee
loc_1a106:
    cmp word [esi + 0x1a], 4
    jne short loc_1a114
    mov eax, 4
    jmp short loc_1a119
loc_1a114:
    mov eax, 0x7f
loc_1a119:
    push dword 0x10001
    push eax
    lea eax, [ebp - 0x24]
    push eax
    movsx eax, di
    mov dword [ebp - 0x18], eax
    mov edx, eax
    shl eax, 3
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov dword [ebp - 0x1c], eax
    mov eax, 0x20438
    add eax, dword [ebp - 0x1c]
    mov ecx, dword [esi + 0x16]
    lea edx, [eax + 0x13]
    mov ebx, dword [esi + 8]
    push edx
    lea edx, [ebp - 0x20]
    sar ecx, 0x10
    push edx
    add eax, 0x17
    sub ebx, strict dword 0x100
    push eax
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call GET_Z_RANGE
    mov eax, dword [ebp - 0x24]
    and eax, strict dword 0xc000
    cmp eax, strict dword 0xc000
    jne near loc_1a334
    mov ebx, dword [ebp - 0x24]
    and ebx, strict dword 0xfff
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    shl eax, 2
    test byte [eax + 0x191374], 0x30
    jne near loc_1a334
    add eax, strict dword 0x191368
    mov dword [ebp - 0x24], ebx
    call BADGUY
    test ax, ax
    je short loc_1a1fb
    mov edx, dword [ebp - 0x24]
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    cmp byte [nosplit eax*4 + 0x191379], 1
    je short loc_1a1fb
    cmp word [esi + 0x1a], 4
    je near loc_1a334
    mov eax, dword [ebp - 0x1c]
    mov word [eax + 0x20447], 0xfffc
    mov edx, 0x10001
    mov eax, dword [ebp - 0x18]
    mov word [esi + 0x20], 0xff00
    call 0x24400
    jmp near loc_1a334
loc_1a1fb:
    mov edx, dword [ebp - 0x24]
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    cmp word [nosplit eax*4 + 0x191376], 0xf05
    jne short loc_1a25d
    mov eax, esi
    call BADGUY
    test ax, ax
    je short loc_1a25d
    movsx ebx, di
    lea eax, [ebx*8]
    add eax, ebx
    shl eax, 3
    sub eax, ebx
    mov edi, 0xfffffffc
    mov edx, 0x10001
    mov word [eax + 0x20447], di
    mov eax, ebx
    mov word [esi + 0x20], 0xff00
    call 0x24400
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1a25d:
    cmp word [esi + 0x1a], 4
    jne near loc_1a334
    mov edx, dword [ebp - 0x24]
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    cmp word [nosplit eax*4 + 0x191376], 0xf05
    jne near loc_1a334
    mov eax, dword [esi + 0x1c]
    sar eax, 0x10
    cmp eax, edx
    jne near loc_1a334
    mov edx, dword [esi + 0x16]
    sar edx, 0x10
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    shl ebx, 3
    mov edx, eax
    mov eax, dword [ebx + 0x20a06c]
    mov dword [edx + 0x2044f], eax
    mov ebx, dword [esi + 0x16]
    sar ebx, 0x10
    lea eax, [ebx*4]
    add eax, ebx
    mov eax, dword [nosplit eax*8 + 0x20a070]
    mov dword [edx + 0x2044b], eax
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1a2ee:
    mov edx, dword [esi + 0x16]
    sar edx, 0x10
    lea ecx, [edx*4]
    add ecx, edx
    mov edx, ebx
    shl ebx, 3
    add ebx, edx
    shl ebx, 3
    shl ecx, 3
    sub ebx, edx
    mov eax, dword [ecx + 0x20a06c]
    mov dword [ebx + 0x2044f], eax
    mov edx, dword [esi + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [nosplit eax*8 + 0x20a070]
    mov dword [ebx + 0x2044b], eax
loc_1a334:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

make_it_fall:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    mov word [ebp - 0x18], ax
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    lea esi, [eax*4]
    sub esi, eax
    shl esi, 2
    sub esi, eax
    shl esi, 2
    add esi, strict dword 0x191368
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    call CEILING_SPACE
    test eax, eax
    je short loc_1a37f
    xor edi, edi
    jmp short loc_1a3c3
loc_1a37f:
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    call FLOOR_SPACE
    test eax, eax
    jne short loc_1a3a8
    mov edx, dword [esi + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08a], 2
    jne short loc_1a3bd
loc_1a3a8:
    mov eax, dword [0xbf330]
    mov edx, eax
    mov ebx, 6
    sar edx, 0x1f
    idiv ebx
    mov edi, eax
    jmp short loc_1a3c3
loc_1a3bd:
    mov edi, dword [0xbf330]
loc_1a3c3:
    cmp word [esi + 0xe], 0x1702
    jne short loc_1a3d8
    cmp edi, dword [0xbf330]
    jne short loc_1a3d8
    sar edi, 2
    jmp short loc_1a3eb
loc_1a3d8:
    cmp word [esi + 0xe], 0x1703
    jne short loc_1a3eb
    cmp edi, dword [0xbf330]
    jne short loc_1a3eb
    sar edi, 3
loc_1a3eb:
    mov ax, word [esi + 0x1a]
    cmp ax, strict word 1
    je short loc_1a407
    cmp ax, strict word 0xa
    je short loc_1a407
    cmp ax, strict word 2
    je short loc_1a407
    cmp ax, strict word 6
    jne short loc_1a452
loc_1a407:
    push dword 0x10001
    lea eax, [ebp - 0x20]
    mov edx, dword [ebp - 0x1a]
    push byte 0x7f
    sar edx, 0x10
    push eax
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    add eax, strict dword 0x20438
    mov ecx, dword [esi + 0x16]
    lea edx, [eax + 0x13]
    mov ebx, dword [esi + 8]
    push edx
    lea edx, [ebp - 0x1c]
    sar ecx, 0x10
    push edx
    add eax, 0x17
    sub ebx, strict dword 0x100
    push eax
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call GET_Z_RANGE
    jmp short loc_1a4a2
loc_1a452:
    mov edx, dword [esi + 0x16]
    sar edx, 0x10
    lea ebx, [edx*4]
    add ebx, edx
    mov edx, dword [ebp - 0x1a]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    shl ebx, 3
    mov edx, eax
    mov eax, dword [ebx + 0x20a06c]
    mov dword [edx + 0x2044f], eax
    mov ecx, dword [esi + 0x16]
    sar ecx, 0x10
    lea eax, [ecx*4]
    add eax, ecx
    mov eax, dword [nosplit eax*8 + 0x20a070]
    mov dword [edx + 0x2044b], eax
loc_1a4a2:
    mov edx, dword [ebp - 0x1a]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov eax, dword [eax + 0x2044b]
    mov ecx, dword [esi + 8]
    sub eax, strict dword 0x100
    cmp eax, ecx
    jle short loc_1a519
    mov edx, dword [esi + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08a], 2
    jne short loc_1a4f0
    cmp word [esi + 0x24], 0xc32
    jle short loc_1a4f0
    mov word [esi + 0x24], 0xc48
loc_1a4f0:
    mov cx, word [esi + 0x24]
    cmp cx, 0x1800
    jge short loc_1a505
    mov eax, ecx
    add eax, edi
    mov word [esi + 0x24], ax
    jmp short loc_1a50b
loc_1a505:
    mov word [esi + 0x24], 0x1800
loc_1a50b:
    mov eax, dword [esi + 0x22]
    mov edi, dword [esi + 8]
    sar eax, 0x10
    add edi, eax
    mov dword [esi + 8], edi
loc_1a519:
    mov edx, dword [ebp - 0x1a]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov eax, dword [eax + 0x2044b]
    mov edx, dword [esi + 8]
    sub eax, strict dword 0x100
    cmp eax, edx
    jg short loc_1a548
    mov word [esi + 0x24], 0
    mov dword [esi + 8], eax
loc_1a548:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

get_label:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov edx, dword [TEXT_CURSOR]
    mov bx, word [LINE_NUMBER]
loc_1a56c:
    mov al, byte [edx]
    inc al
    movzx esi, al
    mov ah, byte [esi + 0x9150]
    mov ecx, edx
    test ah, 0xe0
    jne short loc_1a590
    cmp byte [edx], 0xa
    jne short loc_1a586
    inc ebx
loc_1a586:
    mov cl, byte [edx + 1]
    inc edx
    test cl, cl
    je short loc_1a5dd
    jmp short loc_1a56c
loc_1a590:
    xor ecx, edx
loc_1a592:
    mov al, byte [edx]
    cmp al, 0xa
    jne short loc_1a59d
    mov al, 1
    inc ebx
    jmp short loc_1a5ab
loc_1a59d:
    cmp al, 0x20
    je short loc_1a5a5
    cmp al, 0xd
    jne short loc_1a5a9
loc_1a5a5:
    mov al, 1
    jmp short loc_1a5ab
loc_1a5a9:
    xor al, al
loc_1a5ab:
    mov edi, dword [0xbd9b4]
    shl edi, 6
    test al, al
    jne short loc_1a5d2
    mov dword [ebp - 0x18], ecx
    mov esi, edx
    mov eax, dword [ebp - 0x18]
    inc edx
    add eax, edi
    mov edi, dword [0xbd9bc]
    add edi, eax
    mov al, byte [esi]
    inc ecx
    mov byte [edi], al
    jmp short loc_1a592
loc_1a5d2:
    mov eax, dword [0xbd9bc]
    add ecx, edi
    mov byte [ecx + eax], 0
loc_1a5dd:
    mov word [LINE_NUMBER], bx
    mov dword [TEXT_CURSOR], edx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

keyword:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov edx, dword [TEXT_CURSOR]
    xor bl, bl
loc_1a602:
    xor eax, eax
    mov al, byte [edx]
    call is_alt_token
    test al, al
    jne short loc_1a61b
    mov ah, byte [edx + 1]
    inc edx
    cmp bl, ah
    jne short loc_1a602
    xor eax, eax
    jmp short loc_1a66f
loc_1a61b:
    xor ebx, ebx
loc_1a61d:
    xor eax, eax
    mov al, byte [edx]
    call is_alt_token
    test al, al
    je short loc_1a636
    inc ebx
    mov al, byte [edx]
    inc edx
    mov byte [ebx + 0xa6aaf], al
    jmp short loc_1a61d
loc_1a636:
    xor ecx, ecx
    mov byte [ebx + TOKEN_BUFFER], al
    xor ebx, ebx
loc_1a640:
    mov eax, TOKEN_BUFFER
    mov edx, dword [ecx + CON_KEYWORDS]
    call STRCMP
    test eax, eax
    jne short loc_1a65e
    mov eax, ebx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1a65e:
    add ecx, 4
    inc ebx
    cmp ecx, strict dword 0x24c
    jl short loc_1a640
    mov eax, 0xffffffff
loc_1a66f:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

translate_word:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    xor dl, dl
loc_1a681:
    mov eax, dword [TEXT_CURSOR]
    mov al, byte [eax]
    and eax, strict dword 0xff
    call is_alt_token
    test al, al
    jne short loc_1a6c2
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0xa
    jne short loc_1a6a7
    inc word [LINE_NUMBER]
loc_1a6a7:
    mov eax, dword [TEXT_CURSOR]
    cmp dl, byte [eax]
    jne short loc_1a6ba
    mov eax, 0xffffffff
    jmp near loc_1a8b9
loc_1a6ba:
    inc eax
    mov dword [TEXT_CURSOR], eax
    jmp short loc_1a681
loc_1a6c2:
    xor ebx, ebx
loc_1a6c4:
    mov eax, dword [TEXT_CURSOR]
    mov al, byte [ebx + eax]
    and eax, strict dword 0xff
    call is_alt_token
    test al, al
    je short loc_1a6ec
    mov eax, dword [TEXT_CURSOR]
    inc ebx
    mov al, byte [ebx + eax - 1]
    mov byte [ebx + 0xa6aaf], al
    jmp short loc_1a6c4
loc_1a6ec:
    xor esi, esi
    xor ecx, ecx
    mov byte [ebx + TOKEN_BUFFER], al
loc_1a6f6:
    mov eax, TOKEN_BUFFER
    mov edx, dword [ecx + CON_KEYWORDS]
    call STRCMP
    mov edx, dword [TEXT_CURSOR]
    add edx, ebx
    test eax, eax
    jne short loc_1a735
    mov ebx, dword [0xbd9c0]
    add ebx, 4
    mov dword [TEXT_CURSOR], edx
    mov eax, esi
    mov dword [ebx - 4], esi
    mov dword [0xbd9c0], ebx
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1a735:
    add ecx, 4
    inc esi
    cmp ecx, strict dword 0x24c
    jl short loc_1a6f6
    mov ch, byte [TOKEN_BUFFER]
    mov dword [TEXT_CURSOR], edx
    cmp ch, 0x7b
    jne short loc_1a782
    cmp byte [0xa6ab1], 0
    je short loc_1a782
    push dword SOURCE_NAME
    push dword 0x186
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    push dword 0xa6ab1
    sar eax, 0x10
    push eax
    push dword 0x1e0c
    jmp near loc_1a89e
loc_1a782:
    cmp byte [TOKEN_BUFFER], 0x7d
    jne short loc_1a7bb
    cmp byte [0xa6ab1], 0
    je short loc_1a7bb
    push dword SOURCE_NAME
    push dword 0x188
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    push dword 0xa6ab1
    sar eax, 0x10
    push eax
    push dword 0x1e4c
    jmp near loc_1a89e
loc_1a7bb:
    mov dh, byte [TOKEN_BUFFER]
    cmp dh, 0x2f
    jne short loc_1a7fe
    cmp dh, byte [0xa6ab1]
    jne short loc_1a7fe
    cmp byte [0xa6ab2], 0
    je short loc_1a7fe
    push dword SOURCE_NAME
    push dword 0x18a
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    push dword 0xa6ab2
    sar eax, 0x10
    push eax
    push dword 0x1e8c
    jmp near loc_1a89e
loc_1a7fe:
    cmp byte [TOKEN_BUFFER], 0x2f
    jne short loc_1a83d
    cmp byte [0xa6ab1], 0x2a
    jne short loc_1a83d
    cmp byte [0xa6ab2], 0
    je short loc_1a83d
    push dword SOURCE_NAME
    push dword 0x18c
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    push dword 0xa6ab2
    sar eax, 0x10
    push eax
    push dword 0x1ec8
    jmp short loc_1a89e
loc_1a83d:
    cmp byte [TOKEN_BUFFER], 0x2a
    jne short loc_1a87c
    cmp byte [0xa6ab1], 0x2f
    jne short loc_1a87c
    cmp byte [0xa6ab2], 0
    je short loc_1a87c
    push dword SOURCE_NAME
    push dword 0x18e
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    push dword 0xa6ab2
    sar eax, 0x10
    push eax
    push dword 0x1f04
    jmp short loc_1a89e
loc_1a87c:
    push dword SOURCE_NAME
    push dword 0x18f
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    push dword TOKEN_BUFFER
    sar eax, 0x10
    push eax
    push dword 0x1f40
loc_1a89e:
    call PRINTF
    add esp, 0xc
    mov bl, byte [0xc0046]
    inc bl
    mov eax, 0xffffffff
    mov byte [0xc0046], bl
loc_1a8b9:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

translate_number:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    xor dl, dl
loc_1a8ce:
    mov eax, dword [TEXT_CURSOR]
    mov al, byte [eax]
    and eax, strict dword 0xff
    call is_alt_token
    test al, al
    jne short loc_1a90b
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0xa
    jne short loc_1a8f4
    inc word [LINE_NUMBER]
loc_1a8f4:
    mov ebx, dword [TEXT_CURSOR]
    inc ebx
    mov dword [TEXT_CURSOR], ebx
    cmp dl, byte [ebx]
    je near loc_1aab0
    jmp short loc_1a8ce
loc_1a90b:
    xor esi, esi
loc_1a90d:
    mov eax, dword [TEXT_CURSOR]
    mov al, byte [esi + eax]
    and eax, strict dword 0xff
    call is_alt_token
    test al, al
    je short loc_1a935
    mov eax, dword [TEXT_CURSOR]
    inc esi
    mov al, byte [esi + eax - 1]
    mov byte [esi + 0xa6aaf], al
    jmp short loc_1a90d
loc_1a935:
    xor edi, edi
    mov byte [esi + TOKEN_BUFFER], al
loc_1a93d:
    mov eax, dword [0xbd9b4]
    mov ebx, dword [0xbd9bc]
    shl eax, 6
    mov edx, dword [edi + CON_KEYWORDS]
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_1a9ac
    mov cl, byte [0xc0046]
    push dword SOURCE_NAME
    inc cl
    push dword 0x1ae
    mov byte [0xc0046], cl
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x1f78
    call PRINTF
    mov eax, dword [TEXT_CURSOR]
    add eax, esi
    add esp, 0xc
    mov dword [TEXT_CURSOR], eax
loc_1a9ac:
    add edi, 4
    cmp edi, strict dword 0x24c
    jne short loc_1a93d
    mov ecx, dword [0xbd9b4]
    xor edi, edi
    test ecx, ecx
    jle short loc_1aa19
    xor ebx, ebx
loc_1a9c5:
    mov edx, dword [0xbd9bc]
    mov eax, TOKEN_BUFFER
    add edx, ebx
    call STRCMP
    test eax, eax
    jne short loc_1aa0b
    mov eax, dword [0xbd9ac]
    shl edi, 2
    lea edx, [eax + edi]
    mov eax, dword [0xbd9c0]
    mov edi, dword [TEXT_CURSOR]
    add eax, 4
    mov edx, dword [edx]
    add edi, esi
    mov dword [eax - 4], edx
    mov dword [0xbd9c0], eax
    mov dword [TEXT_CURSOR], edi
    jmp near loc_1aab0
loc_1aa0b:
    mov edx, dword [0xbd9b4]
    inc edi
    add ebx, 0x40
    cmp edi, edx
    jl short loc_1a9c5
loc_1aa19:
    mov eax, dword [TEXT_CURSOR]
    mov dl, byte [eax]
    inc dl
    and edx, strict dword 0xff
    test byte [edx + 0x9150], 0x20
    jne short loc_1aa86
    cmp byte [eax], 0x2d
    je short loc_1aa86
    push dword SOURCE_NAME
    push dword 0x1c0
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    push dword TOKEN_BUFFER
    sar eax, 0x10
    push eax
    push dword 0x1fa8
    call PRINTF
    mov dh, byte [0xc0046]
    mov ecx, dword [TEXT_CURSOR]
    add esp, 0xc
    inc dh
    add ecx, esi
    mov byte [0xc0046], dh
    mov dword [TEXT_CURSOR], ecx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1aa86:
    mov eax, dword [TEXT_CURSOR]
    call 0x601e1
    mov ebx, dword [TEXT_CURSOR]
    mov edx, eax
    mov eax, dword [0xbd9c0]
    add ebx, esi
    add eax, 4
    mov dword [TEXT_CURSOR], ebx
    mov dword [eax - 4], edx
    mov dword [0xbd9c0], eax
loc_1aab0:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
