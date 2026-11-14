bits 32
org 0x25874

%define ROTATE_SPRITE 0x47f83
%define TO_UPPER 0x5e8c3
%define PRINT_NOTICE 0x5130c
%define END_LEVEL_TEXT_NOTICE 0x2b9c
%define MENU_TEXT_C_NOTICE 0x2bbc
%define DISPLAY_NAMES_NOTICE 0x2bd8
%define GET_FILENAMES_NOTICE 0x2bf4
%define SORT_FILENAMES_NOTICE 0x2c10

probe:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 8
    mov dword [ebp - 0xc], eax
    mov esi, edx
    mov edi, ebx
    call 0x5c000
    cmp dword [0xc0078], 1
    jne short loc_258b1
    cmp dword [0x21f300], 0
    je short loc_258b1
    mov eax, 0xc3480
    call 0x5d3f4
    mov eax, dword [0xc3488]
    add dword [0xc4598], eax
    jmp short loc_258bd
loc_258b1:
    xor eax, eax
    mov dword [0xc348c], eax
    mov dword [0xc3488], eax
loc_258bd:
    cmp dword [ebp - 0xc], strict dword 0xa0
    jne short loc_258cd
    mov ebx, 0x50
    jmp short loc_258cf
loc_258cd:
    xor ebx, ebx
loc_258cf:
    cmp word [0xc45c0], 0
    jne near loc_25b3a
    cmp byte [0x21ec2a], 0
    jne short loc_258fb
    cmp byte [0x21ec18], 0
    jne short loc_258fb
    cmp dword [0xc4598], strict dword 0xffffe000
    jge short loc_2593d
loc_258fb:
    xor eax, eax
    xor dh, dh
    mov dword [0xc4598], eax
    mov byte [0x21ec2a], dh
    mov byte [0x21ec18], dh
    mov eax, 0xd
    call 0x51c58
    mov ax, word [0x9988]
    dec eax
    mov word [0x9988], ax
    test ax, ax
    jge short loc_25935
    mov eax, ecx
    dec eax
    mov word [0x9988], ax
loc_25935:
    xor edx, edx
    mov dword [0xc3488], edx
loc_2593d:
    cmp byte [0x21ec3a], 0
    jne short loc_2595b
    cmp byte [0x21ec20], 0
    jne short loc_2595b
    cmp dword [0xc4598], strict dword 0x2000
    jle short loc_25989
loc_2595b:
    xor edx, edx
    mov dword [0xc4598], edx
    xor dh, dh
    mov byte [0x21ec3a], dh
    mov byte [0x21ec20], dh
    mov eax, 0xd
    call 0x51c58
    xor eax, eax
    mov dword [0xc3488], eax
    inc word [0x9988]
loc_25989:
    cmp dword [ebp + 8], 3
    jne near loc_25b3a
    cmp byte [0x21ec3b], 0
    jne short loc_259a6
    mov dl, byte [0x21ec1b]
    test dl, dl
    je short loc_259e6
loc_259a6:
    xor dh, dh
    mov byte [0x21ec3b], dh
    mov byte [0x21ec1b], dh
    mov eax, 0xd
    call 0x51c58
    mov ax, word [0x9988]
    dec eax
    mov word [0x9988], ax
    test ax, ax
    jge short loc_259d9
    mov eax, ecx
    dec eax
    mov word [0x9988], ax
loc_259d9:
    xor edx, edx
    mov dword [0xc3488], edx
    jmp near loc_25b3a
loc_259e6:
    mov dh, byte [0x21ec3c]
    test dh, dh
    jne short loc_259f9
    cmp byte [0x21ec1d], 0
    je short loc_25a25
loc_259f9:
    xor ah, ah
    mov byte [0x21ec3c], ah
    mov byte [0x21ec1d], ah
    mov eax, 0xd
    call 0x51c58
    mov dx, word [0x9988]
    xor eax, eax
    inc edx
    mov dword [0xc3488], eax
    jmp near loc_25b33
loc_25a25:
    mov ah, byte [0x21ebd2]
    test ah, ah
    je short loc_25a4c
    mov byte [0x21ebd2], dl
    mov eax, 0xd
    call 0x51c58
    xor eax, eax
    mov word [0x9988], ax
    jmp near loc_25b3a
loc_25a4c:
    mov dl, byte [0x21ebd3]
    test dl, dl
    je short loc_25a6b
    mov byte [0x21ebd3], dh
    mov eax, 0xd
    mov edx, 1
    jmp near loc_25b2e
loc_25a6b:
    mov dh, byte [0x21ebd4]
    test dh, dh
    je short loc_25a93
    mov byte [0x21ebd4], dl
    mov eax, 0xd
    call 0x51c58
    mov word [0x9988], 2
    jmp near loc_25b3a
loc_25a93:
    mov al, byte [0x21ebd5]
    test al, al
    je short loc_25ab1
    mov byte [0x21ebd5], ah
    mov eax, 0xd
    mov edx, 3
    jmp near loc_25b2e
loc_25ab1:
    mov ah, byte [0x21ebd6]
    test ah, ah
    je short loc_25ad5
    mov byte [0x21ebd6], al
    mov eax, 0xd
    call 0x51c58
    mov word [0x9988], 4
    jmp short loc_25b3a
loc_25ad5:
    mov dl, byte [0x21ebd7]
    test dl, dl
    je short loc_25af1
    mov byte [0x21ebd7], dh
    mov eax, 0xd
    mov edx, 5
    jmp short loc_25b2e
loc_25af1:
    cmp byte [0x21ebd8], 0
    je short loc_25b15
    mov byte [0x21ebd8], dl
    mov eax, 0xd
    call 0x51c58
    mov word [0x9988], 6
    jmp short loc_25b3a
loc_25b15:
    cmp byte [0x21ebd9], 0
    je short loc_25b3a
    mov byte [0x21ebd9], ah
    mov eax, 0xd
    mov edx, 7
loc_25b2e:
    call 0x51c58
loc_25b33:
    mov word [0x9988], dx
loc_25b3a:
    mov eax, dword [0x9986]
    sar eax, 0x10
    cmp eax, ecx
    jl short loc_25b4f
    xor ecx, ecx
    mov word [0x9988], cx
loc_25b4f:
    mov eax, dword [0x216f88]
    mov edx, dword [0x216f84]
    dec eax
    dec edx
    test bx, bx
    je near loc_25c33
    push edx
    push eax
    push byte 0
    mov eax, dword [0xc45b4]
    push byte 0
    sar eax, 0x10
    push byte 0xa
    mov edx, dword [0x216f7c]
    push byte 0
    sar edx, 3
    mov ecx, 0x10
    add edx, 0xf
    push eax
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    mov eax, 0x38f
    sub eax, edx
    mov edx, dword [0x9986]
    sar edx, 0x10
    imul edx, edi
    push eax
    movsx eax, bx
    xor ecx, ecx
    sar eax, 1
    mov ebx, 0x3333
    mov dword [ebp - 0x10], eax
    add edx, esi
    add eax, strict dword 0xe6
    sub edx, 4
    shl eax, 0x10
    shl edx, 0x10
    call ROTATE_SPRITE
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    mov eax, dword [0xc45b4]
    push byte 0
    sar eax, 0x10
    push byte 0xa
    mov edx, dword [0x216f7c]
    push byte 0
    mov ecx, 0x10
    sar edx, 3
    push eax
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    add edx, strict dword 0x380
    push edx
    mov edx, dword [0x9986]
    sar edx, 0x10
    imul edx, edi
    mov ebx, dword [ebp - 0x10]
    mov eax, 0xa0
    xor ecx, ecx
    sub eax, ebx
    mov ebx, 0x3333
    add edx, esi
    sub eax, 0x46
    sub edx, 4
    shl eax, 0x10
    shl edx, 0x10
    jmp near loc_25d07
loc_25c33:
    mov ebx, dword [ebp + 8]
    cmp ebx, 1
    jb short loc_25c9e
    cmp ebx, 2
    jbe short loc_25c4b
    cmp ebx, 3
    je near loc_25d0c
    jmp short loc_25c9e
loc_25c4b:
    push edx
    push eax
    push byte 0
    mov eax, dword [0xc45b4]
    push byte 0
    sar eax, 0x10
    push byte 0xa
    mov edx, dword [0x216f7c]
    push byte 0
    mov ecx, 0x10
    sar edx, 3
    push eax
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    mov eax, dword [0x9986]
    sar eax, 0x10
    imul eax, edi
    mov ebx, 0x3333
    mov ecx, dword [ebp - 0xc]
    add esi, eax
    mov eax, dword [0x17d2e6]
    add edx, strict dword 0x380
    sar eax, 0x10
    push edx
    sub ecx, eax
    lea edx, [esi - 4]
    jmp short loc_25cfc
loc_25c9e:
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    mov eax, dword [0xc45b4]
    push byte 0
    sar eax, 0x10
    push byte 0xa
    mov edx, dword [0x216f7c]
    push byte 0
    mov ecx, 0x10
    sar edx, 3
    push eax
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    mov eax, dword [0x9986]
    sar eax, 0x10
    imul edi, eax
    mov ebx, 0x1999
    mov ecx, dword [ebp - 0xc]
    add edx, strict dword 0x380
    mov eax, dword [0x17d2e6]
    push edx
    sar eax, 0x10
    lea edx, [esi + edi]
    sub ecx, eax
    sub edx, 4
loc_25cfc:
    lea eax, [ecx - 4]
    shl edx, 0x10
    shl eax, 0x10
    xor ecx, ecx
loc_25d07:
    call ROTATE_SPRITE
loc_25d0c:
    cmp byte [0x21ec38], 0
    jne short loc_25d31
    cmp byte [0x21ebec], 0
    jne short loc_25d31
    test byte [0xc45c0], 1
    je short loc_25d4c
    cmp word [0xc45ba], 0
    jne short loc_25d4c
loc_25d31:
    xor dh, dh
    mov byte [0x21ebec], dh
    mov byte [0x21ec38], dh
    mov eax, dword [0x9986]
    sar eax, 0x10
    jmp near loc_25e21
loc_25d4c:
    cmp byte [0x21ebd1], 0
    je short loc_25d64
    mov edi, 1
    xor eax, eax
    mov dword [0x9994], edi
    jmp short loc_25d7e
loc_25d64:
    cmp dword [0x9994], 0
    je short loc_25d7c
    xor esi, esi
    mov eax, 1
    mov dword [0x9994], esi
    jmp short loc_25d7e
loc_25d7c:
    xor eax, eax
loc_25d7e:
    cmp eax, 1
    jne short loc_25d99
    xor eax, eax
    mov word [0xc45ba], ax
    mov eax, 0xffffffff
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_25d99:
    cmp word [0xc45ba], 0
    je near loc_25e14
    cmp byte [0x21ec3b], 0
    jne short loc_25dcb
    cmp byte [0x21ec1b], 0
    jne short loc_25dcb
    test byte [0xc45c0], 1
    je short loc_25ddc
    cmp dword [0xc348c], -0x80
    jge short loc_25ddc
loc_25dcb:
    mov eax, dword [0x9986]
    sar eax, 0x10
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_25ddc:
    cmp byte [0x21ec3c], 0
    jne short loc_25e03
    cmp byte [0x21ec1d], 0
    jne short loc_25e03
    test byte [0xc45c0], 1
    je short loc_25e14
    cmp dword [0xc348c], strict dword 0x80
    jle short loc_25e14
loc_25e03:
    mov eax, dword [0x9986]
    sar eax, 0x10
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_25e14:
    mov eax, dword [0x9986]
    sar eax, 0x10
    neg eax
    sub eax, 2
loc_25e21:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    db 0x8b, 0xc0            ; mov eax, eax alignment

menu_text:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x18
    mov esi, dword [ebp + 8]
    mov edi, eax
    mov dword [ebp - 0x14], edx
    mov word [ebp - 0x10], bx
    mov word [ebp - 0xc], cx
    sub edx, 0xc
    xor ecx, ecx
    xor ebx, ebx
    mov dword [ebp - 0x14], edx
    cmp eax, strict dword 0xa0
    jne near loc_25f76
loc_25e59:
    movsx eax, bx
    lea edx, [esi + eax]
    mov dword [ebp - 0x18], edx
    cmp byte [edx], 0
    je near loc_25f76
    mov eax, dword [ebp - 0x18]
    mov dh, byte [eax]
    cmp dh, 0x20
    jne short loc_25e7b
    add ecx, 5
    inc ebx
    jmp short loc_25e59
loc_25e7b:
    cmp dh, 0x30
    jb short loc_25e96
    cmp dh, 0x39
    ja short loc_25e96
    mov edx, dword [ebp - 0x18]
    xor eax, eax
    mov al, byte [edx]
    add eax, strict dword 0x23e
    jmp near loc_25f54
loc_25e96:
    movsx eax, bx
    add eax, esi
    mov dl, byte [eax]
    cmp dl, 0x61
    jb short loc_25ebd
    cmp dl, 0x7a
    ja short loc_25ebd
    mov al, dl
    and eax, strict dword 0xff
    call TO_UPPER
    add eax, strict dword 0x237
    jmp near loc_25f54
loc_25ebd:
    movsx eax, bx
    add eax, esi
    mov dl, byte [eax]
    cmp dl, 0x41
    jb short loc_25edc
    cmp dl, 0x5a
    ja short loc_25edc
    mov al, dl
    xor ah, ah
    add eax, strict dword 0x237
    jmp near loc_25f54
loc_25edc:
    movsx eax, bx
    mov al, byte [esi + eax]
    cmp al, 0x2e
    jb short loc_25f0c
    jbe short loc_25f2c
    cmp al, 0x3b
    jb short loc_25eff
    jbe near loc_25f4f
    cmp al, 0x3f
    je short loc_25f48
    add ecx, 5
    inc ebx
    jmp near loc_25e59
loc_25eff:
    cmp al, 0x3a
    je short loc_25f4f
    add ecx, 5
    inc ebx
    jmp near loc_25e59
loc_25f0c:
    cmp al, 0x27
    jb short loc_25f1f
    jbe short loc_25f33
    cmp al, 0x2c
    je short loc_25f3a
    add ecx, 5
    inc ebx
    jmp near loc_25e59
loc_25f1f:
    cmp al, 0x21
    je short loc_25f41
    add ecx, 5
    inc ebx
    jmp near loc_25e59
loc_25f2c:
    mov eax, 0x2b6
    jmp short loc_25f54
loc_25f33:
    mov eax, 0x2ca
    jmp short loc_25f54
loc_25f3a:
    mov eax, 0x2b7
    jmp short loc_25f54
loc_25f41:
    mov eax, 0x2b8
    jmp short loc_25f54
loc_25f48:
    mov eax, 0x2b9
    jmp short loc_25f54
loc_25f4f:
    mov eax, 0x2ba
loc_25f54:
    cwde
    mov eax, dword [nosplit eax*2 + 0x17cee6]
    sar eax, 0x10
    lea edx, [eax - 1]
    mov eax, edx
    sar edx, 0x1f
    db 0x2b, 0xc2    ; Watcom encoding of sub eax, edx
    sar eax, 1
    movsx ecx, cx
    inc ebx
    add ecx, eax
    jmp near loc_25e59
loc_25f76:
    test cx, cx
    je short loc_25f8a
    mov edi, 0x140
    movsx eax, cx
    sub edi, eax
    sub edi, 0xa
    sar edi, 1
loc_25f8a:
    mov eax, dword [ebp - 0x14]
    shl eax, 0x10
    mov dword [ebp - 0x1c], eax
loc_25f93:
    mov bl, byte [esi]
    test bl, bl
    je near loc_260ca
    cmp bl, 0x20
    jne short loc_25fa8
    add edi, 5
    inc esi
    jmp short loc_25f93
loc_25fa8:
    cmp bl, 0x30
    jb short loc_25fc0
    cmp bl, 0x39
    ja short loc_25fc0
    xor eax, eax
    mov al, bl
    add eax, strict dword 0x23e
    jmp near loc_2606f
loc_25fc0:
    mov al, byte [esi]
    cmp al, 0x61
    jb short loc_25fdd
    cmp al, 0x7a
    ja short loc_25fdd
    xor eax, eax
    mov al, byte [esi]
    call TO_UPPER
    add eax, strict dword 0x237
    jmp near loc_2606f
loc_25fdd:
    mov dl, byte [esi]
    cmp dl, 0x41
    jb short loc_25ff7
    cmp dl, 0x5a
    ja short loc_25ff7
    xor eax, eax
    mov al, dl
    add eax, strict dword 0x237
    jmp near loc_2606f
loc_25ff7:
    mov al, byte [esi]
    cmp al, 0x2e
    jb short loc_26020
    jbe short loc_26040
    cmp al, 0x3b
    jb short loc_26013
    jbe near loc_26063
    cmp al, 0x3f
    je short loc_2605c
    add edi, 5
    inc esi
    jmp short loc_25f93
loc_26013:
    cmp al, 0x3a
    je short loc_2606a
    add edi, 5
    inc esi
    jmp near loc_25f93
loc_26020:
    cmp al, 0x27
    jb short loc_26033
    jbe short loc_26055
    cmp al, 0x2c
    je short loc_26047
    add edi, 5
    inc esi
    jmp near loc_25f93
loc_26033:
    cmp al, 0x21
    je short loc_2604e
    add edi, 5
    inc esi
    jmp near loc_25f93
loc_26040:
    mov eax, 0x2b6
    jmp short loc_2606f
loc_26047:
    mov eax, 0x2b7
    jmp short loc_2606f
loc_2604e:
    mov eax, 0x2b8
    jmp short loc_2606f
loc_26055:
    mov eax, 0x2ca
    jmp short loc_2606f
loc_2605c:
    mov eax, 0x2b9
    jmp short loc_2606f
loc_26063:
    mov eax, 0x2ba
    jmp short loc_2606f
loc_2606a:
    mov eax, 0x2bb
loc_2606f:
    mov edx, dword [0x216f84]
    dec edx
    push edx
    mov edx, dword [0x216f88]
    dec edx
    push edx
    push byte 0
    push byte 0
    mov edx, dword [ebp - 0xe]
    push byte 0x1a
    sar edx, 0x10
    push edx
    mov edx, dword [ebp - 0x12]
    mov ebx, 0x6666
    sar edx, 0x10
    cwde
    push edx
    xor ecx, ecx
    mov dword [ebp - 0x20], eax
    push eax
    mov eax, edi
    mov edx, dword [ebp - 0x1c]
    shl eax, 0x10
    call ROTATE_SPRITE
    mov edx, dword [ebp - 0x20]
    mov edx, dword [nosplit edx*2 + 0x17cee6]
    sar edx, 0x10
    mov eax, edx
    sar edx, 0x1f
    db 0x2b, 0xc2    ; Watcom encoding of sub eax, edx
    sar eax, 1
    inc esi
    add edi, eax
    jmp near loc_25f93
loc_260ca:
    mov eax, edi
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    lea eax, [byte eax + 0]

end_level_menu_text:
    push ebp
    mov ebp, esp
    mov eax, END_LEVEL_TEXT_NOTICE
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret 4
    lea eax, [byte eax + 0]

menu_text_c:
    push ebp
    mov ebp, esp
    mov eax, MENU_TEXT_C_NOTICE
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret 4
    lea eax, [byte eax + 0]

bar:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x10
    mov edi, eax
    mov esi, edx
    test cx, cx
    jge short loc_26122
    mov dl, 1
    neg ecx
    mov byte [ebp - 0xc], dl
    jmp short loc_26127
loc_26122:
    xor ah, ah
    mov byte [ebp - 0xc], ah
loc_26127:
    mov dh, byte [ebp + 8]
    sub esi, 2
    test dh, dh
    je near loc_2626c
    cmp byte [ebp - 0xc], 0
    jne near loc_261df
    cmp byte [0x21ec3b], 0
    jne short loc_26166
    cmp byte [0x21ec1b], 0
    jne short loc_26166
    test byte [0xc45c0], 1
    je short loc_26186
    cmp dword [0xc348c], strict dword 0xffffff00
    jge short loc_26186
loc_26166:
    xor dl, dl
    mov byte [0x21ec3b], dl
    mov byte [0x21ec1b], dl
    mov ax, word [ebx]
    sub eax, ecx
    mov word [ebx], ax
    test ax, ax
    jge short loc_26186
    mov word [ebx], 0
loc_26186:
    cmp byte [0x21ec3c], 0
    jne short loc_261b5
    cmp byte [0x21ec1d], 0
    jne short loc_261b5
    test byte [0xc45c0], 1
    je near loc_2626c
    cmp dword [0xc348c], strict dword 0x100
    jle near loc_2626c
loc_261b5:
    xor dh, dh
    mov byte [0x21ec3c], dh
    mov byte [0x21ec1d], dh
    mov ax, word [ebx]
    add eax, ecx
    mov word [ebx], ax
    cmp ax, strict word 0x3f
    jle near loc_2626c
    mov word [ebx], 0x3f
    jmp near loc_2626c
loc_261df:
    cmp byte [0x21ec3c], 0
    jne short loc_26206
    cmp byte [0x21ec1d], 0
    jne short loc_26206
    test byte [0xc45c0], 1
    je short loc_26224
    cmp dword [0xc348c], strict dword 0x100
    jle short loc_26224
loc_26206:
    xor al, al
    mov byte [0x21ec3c], al
    mov byte [0x21ec1d], al
    mov dx, word [ebx]
    sub edx, ecx
    mov word [ebx], dx
    test dx, dx
    jge short loc_26224
    mov word [ebx], 0
loc_26224:
    cmp byte [0x21ec3b], 0
    jne short loc_2624b
    cmp byte [0x21ec1b], 0
    jne short loc_2624b
    test byte [0xc45c0], 1
    je short loc_2626c
    cmp dword [0xc348c], strict dword 0xffffff00
    jge short loc_2626c
loc_2624b:
    xor ah, ah
    mov byte [0x21ec3b], ah
    mov byte [0x21ec1b], ah
    mov dx, word [ebx]
    add edx, ecx
    mov word [ebx], dx
    cmp dx, 0x40
    jle short loc_2626c
    mov word [ebx], 0x40
loc_2626c:
    mov ax, word [ebx]
    mov word [ebp - 0x10], ax
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    lea edx, [esi - 3]
    mov eax, dword [ebp + 0xe]
    push byte 0
    sar eax, 0x10
    push byte 0xa
    xor ecx, ecx
    mov dword [ebp - 0x14], eax
    push eax
    mov eax, dword [ebp + 0xa]
    mov ebx, 0x10000
    sar eax, 0x10
    shl edx, 0x10
    push eax
    mov dword [ebp - 0x18], eax
    lea eax, [edi + 0x20]
    push dword 0x68a
    shl eax, 0x10
    call ROTATE_SPRITE
    mov cl, byte [ebp - 0xc]
    mov eax, dword [0x216f88]
    mov ebx, dword [0x216f84]
    lea edx, [esi + 1]
    dec eax
    dec ebx
    shl edx, 0x10
    test cl, cl
    jne short loc_262fc
    push ebx
    push eax
    push byte 0
    push byte 0
    push byte 0xa
    mov eax, dword [ebp - 0x14]
    push eax
    mov ebx, dword [ebp - 0x18]
    mov eax, dword [ebp - 0x12]
    push ebx
    sar eax, 0x10
    xor ecx, ecx
    add eax, edi
    push dword 0x26f
    inc eax
    mov ebx, 0x8000
    shl eax, 0x10
    jmp short loc_2632b
loc_262fc:
    push ebx
    push eax
    push byte 0
    mov ebx, 0x41
    mov eax, dword [ebp - 0x12]
    push byte 0
    sar eax, 0x10
    push byte 0xa
    mov ecx, dword [ebp - 0x14]
    sub ebx, eax
    push ecx
    mov esi, dword [ebp - 0x18]
    lea eax, [ebx + edi]
    push esi
    mov ebx, 0x8000
    push dword 0x26f
    shl eax, 0x10
    xor ecx, ecx
loc_2632b:
    call ROTATE_SPRITE
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 0xc
    lea eax, [byte eax + 0]

display_names:
    push ebp
    mov ebp, esp
    mov eax, DISPLAY_NAMES_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

get_filenames:
    push ebp
    mov ebp, esp
    mov eax, GET_FILENAMES_NOTICE
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop

sort_filenames:
    push ebp
    mov ebp, esp
    mov eax, SORT_FILENAMES_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 11 db 0    ; Padding between menu code modules

reset_menu_state:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push edi
    xor edx, edx
    xor ecx, ecx
    xor ebx, ebx
    xor edi, edi
    mov dword [0x99a0], edx
    mov dword [0x99a4], edx
    mov dword [0x99a8], edx
    mov dword [0x99ac], edx
    mov word [0x99b2], bx
    mov dword [0x99b4], edi
    xor edx, edx
    mov dword [0x99b8], ecx
    mov word [0x99b0], dx
    lea esp, [ebp - 0x10]
    pop edi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
