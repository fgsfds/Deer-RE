bits 32
org 0x8613f

    push ebp
    mov ebp, esp
    mov word [eax], 0x8000
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push esi
    mov esi, eax
    mov eax, edx
    mov edx, ebx
    movzx ebx, word [ebp + 0xc]
    push ebx
    movzx ebx, cx
    movzx edx, dx
    mov ecx, dword [ebp + 8]
    call 0x89dd5
    test ax, ax
    je short loc_86176
    mov eax, 4
    jmp short loc_86184
loc_86176:
    call 0x8a07d
    mov eax, dword [0x14d44]
    mov dword [esi], eax
    xor eax, eax
loc_86184:
    lea esp, [ebp - 4]
    pop esi
    pop ebp
    ret 8
    push ebp
    mov ebp, esp
    mov dword [0x14d44], eax
    call 0x89e43
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    mov dword [0x14d44], eax
    add eax, 0xa4
    call 0x8a19c
    test ax, ax
    jne short loc_8620a
    mov eax, edx
    call 0x8a22e
    test ax, ax
    jne short loc_861ca
    mov eax, 1
    jmp short loc_8620a
loc_861ca:
    mov eax, dword [0x14d44]
    mov ebx, dword [edx]
    mov dword [eax], ebx
    mov dword [eax + 8], 0
    mov eax, dword [edx + 4]
    call 0x8a48a
    mov ebx, eax
    mov eax, dword [0x14d44]
    mov dword [eax + 4], ebx
    call loc_86210
    test ax, ax
    je short loc_86208
    mov eax, dword [0x14d44]
    mov word [eax + 0xc], 4
    mov eax, edx
    call 0x8a22e
loc_86208:
    xor eax, eax
loc_8620a:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
loc_86210:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push eax
    mov eax, dword [0x14d44]
    mov si, word [eax + 0x12]
    xor edi, edi
    mov ecx, dword [eax + 0x54]
    mov dword [ebp - 0x18], 2
    test byte [eax + 0x76], 2
    jne short loc_86250
    cmp word [ecx + 4], 0x36
    jle short loc_86250
    test byte [eax + 0xf], 8
    je short loc_86250
    add eax, 0xa4
    mov edx, 3
    jmp near 0x8a1d1
loc_86250:
    test byte [ecx + 6], 4
    jne short loc_8625d
    mov dword [ebp - 0x18], 3
loc_8625d:
    movsx ebx, si
    imul eax, ebx, 6
    mov edx, dword [0x14d44]
    add eax, edx
    mov dx, word [eax + 0x18]
    add edx, dword [ebp - 0x18]
    mov word [eax + 0x18], dx
    cmp word [ecx + 4], 0x36
    jg short loc_86298
    movsx ebx, word [ebp - 0x18]
    movsx edx, dx
    mov eax, ecx
    call 0x8a876
    mov eax, dword [0x14d44]
    mov word [eax + 0xc], 0
    jmp short loc_862d0
loc_86298:
    mov edi, 1
    movsx edx, dx
    mov eax, ecx
    call loc_863c7
    sub esi, edi
    test si, si
    jge short loc_862b7
    call loc_862e7
    xor esi, esi
    jmp short loc_862d0
loc_862b7:
    movsx eax, si
    imul edx, eax, 6
    mov ecx, dword [0x14d44]
    mov edx, dword [ecx + edx + 0x14]
    call 0x8ab3e
    mov ecx, eax
    jmp short loc_86250
loc_862d0:
    mov eax, dword [0x14d44]
    mov word [eax + 0x12], si
    inc dword [eax + 0x68]
    mov eax, edi
    lea esp, [ebp - 0x14]
    pop edi
    jmp near loc_8637e
loc_862e7:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov eax, dword [0x14d44]
    mov ecx, dword [eax + 0x50]
    inc word [eax + 0x6c]
    movsx edx, word [eax + 0x6c]
    cmp edx, 7
    jb short loc_86312
    add eax, 0xa4
    mov edx, 5
    jmp near 0x8a1d1
loc_86312:
    mov eax, dword [0x14d44]
    mov dword [eax + 0x54], ecx
    call 0x8a9f5
    mov esi, eax
    test byte [ecx + 6], 4
    je short loc_8632f
    or byte [eax + 6], 4
    and byte [ecx + 6], 0xfb
loc_8632f:
    or byte [ecx + 6], 2
    mov ax, word [ecx + 4]
    mov word [esi + 4], ax
    mov eax, dword [ecx + 8]
    mov dword [esi + 8], eax
    lea edx, [ecx + 0xc]
    lea eax, [esi + 0xc]
    mov ebx, 0xe4
    call 0x61e3b
    call loc_86384
    mov dword [ecx + 8], esi
    mov eax, dword [0x14d44]
    mov edx, dword [eax]
    mov dword [ecx + 0xc], edx
    mov edx, dword [eax + 4]
    mov dword [ecx + 0x10], edx
    mov edx, dword [eax + 8]
    mov dword [ecx + 0x14], edx
    mov word [ecx + 4], 3
    mov word [eax + 0x18], 0
loc_8637b:
    lea esp, [ebp - 0x10]
loc_8637e:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_86384:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov ebx, dword [0x14d44]
    mov bx, word [ebx + 0x6c]
    mov ecx, ebx
    dec ecx
    jmp short loc_863c0
loc_8639a:
    movsx eax, cx
    imul eax, eax, 6
    mov edx, dword [0x14d44]
    add eax, edx
    movsx esi, bx
    imul esi, esi, 6
    add edx, esi
    mov esi, dword [eax + 0x14]
    mov dword [edx + 0x14], esi
    mov ax, word [eax + 0x18]
    mov word [edx + 0x18], ax
    dec ecx
    dec ebx
loc_863c0:
    test bx, bx
    jne short loc_8639a
    jmp short loc_8637b
loc_863c7:
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    sub esp, 0x1c
    mov ecx, eax
    mov dword [ebp - 0x14], edx
    mov dword [ebp - 0x18], ebx
    mov dword [ebp - 0x1c], 0
    mov edi, 0x1e
    mov dword [ebp - 0x10], 3
    test byte [eax + 6], 4
    je short loc_863f8
    mov dword [ebp - 0x10], 2
loc_863f8:
    call 0x8a9f5
    mov esi, eax
    cmp di, word [ebp - 0x14]
    jle short loc_86415
    mov eax, dword [ebp - 0x10]
    add eax, eax
    sub edi, eax
    test byte [ecx + 6], 4
    je short loc_86415
    sub edi, dword [ebp - 0x10]
loc_86415:
    cmp di, word [ebp - 0x14]
    jne short loc_86439
    mov eax, dword [0x14d44]
    mov edx, dword [eax]
    mov dword [ebp - 0x20], edx
    mov edx, dword [eax + 4]
    mov dword [ebp - 0x24], edx
    test byte [ecx + 6], 4
    jne short loc_86467
    mov eax, dword [eax + 8]
    mov dword [ebp - 0x1c], eax
    jmp short loc_86467
loc_86439:
    movsx eax, di
    shl eax, 2
    add eax, ecx
    mov edx, dword [eax + 0xc]
    mov dword [ebp - 0x20], edx
    mov edx, dword [eax + 0x10]
    mov dword [ebp - 0x24], edx
    test byte [ecx + 6], 4
    jne short loc_86459
    mov eax, dword [eax + 0x14]
    mov dword [ebp - 0x1c], eax
loc_86459:
    movsx ebx, word [ebp - 0x10]
    movsx edx, di
    mov eax, ecx
    call 0x8a8f1
loc_86467:
    movsx ebx, word [ecx + 4]
    movsx eax, di
    sub ebx, eax
    shl ebx, 2
    shl eax, 2
    lea edx, [ecx + 0xc]
    add edx, eax
    lea eax, [esi + 0xc]
    call 0x61e3b
    test byte [ecx + 6], 4
    jne short loc_8648f
    mov eax, dword [ebp - 0x1c]
    mov dword [esi + 8], eax
loc_8648f:
    mov ax, word [ecx + 4]
    sub eax, edi
    mov word [esi + 4], ax
    mov word [ecx + 4], di
    mov dword [ebp - 0x28], esi
    mov ax, word [ecx + 6]
    mov word [esi + 6], ax
    test byte [ecx + 6], 2
    je short loc_864b2
    and byte [esi + 6], 0xfd
loc_864b2:
    cmp di, word [ebp - 0x14]
    jge short loc_864fe
    mov eax, dword [ebp - 0x10]
    sub dword [ebp - 0x14], eax
    movsx ebx, ax
    mov eax, dword [ebp - 0x14]
    sub eax, edi
    movsx edx, ax
    mov eax, esi
    call 0x8a876
    cmp word [ebp - 0x18], 0
    je short loc_864eb
    movsx eax, word [ebp - 0x18]
    imul edx, eax, 6
    mov eax, dword [0x14d44]
    add eax, edx
    mov edx, dword [ebp - 0x28]
    mov dword [eax + 0x14], edx
loc_864eb:
    movsx eax, word [ebp - 0x18]
    imul edx, eax, 6
    mov eax, dword [0x14d44]
    sub word [edx + eax + 0x18], di
    jmp short loc_8650f
loc_864fe:
    jle short loc_8650f
    movsx ebx, word [ebp - 0x10]
    movsx edx, word [ebp - 0x14]
    mov eax, ecx
    call 0x8a876
loc_8650f:
    mov eax, dword [0x14d44]
    mov edx, dword [ebp - 0x20]
    mov dword [eax], edx
    mov edx, dword [ebp - 0x24]
    mov dword [eax + 4], edx
    mov edx, dword [ebp - 0x28]
    mov dword [eax + 8], edx
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, edx
    mov dword [0x14d44], eax
    mov eax, edx
    call 0x8a22e
    test ax, ax
    je short loc_8654b
    mov eax, 1
    jmp short loc_86587
loc_8654b:
    test byte [edx + 8], 1
    je short loc_86561
    mov eax, dword [0x14d44]
    mov edx, dword [eax + 4]
    mov eax, dword [ebx + 4]
    call 0x8a7a5
loc_86561:
    mov eax, dword [0x14d44]
    mov eax, dword [eax + 4]
    call 0x8a661
    call loc_8658d
    mov eax, dword [0x14d44]
    mov word [eax + 0xc], 4
    mov eax, ebx
    call 0x8a22e
    xor eax, eax
loc_86587:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
loc_8658d:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x28
    mov eax, dword [0x14d44]
    mov si, word [eax + 0x12]
    mov ecx, dword [eax + 0x54]
    mov dword [ebp - 0x1c], 2
    movsx edx, si
    imul edx, edx, 6
    mov di, word [edx + eax + 0x18]
    test byte [ecx + 6], 4
    jne short loc_865fa
loc_865bc:
    mov eax, dword [eax + 8]
    inc esi
    movsx ebx, si
    mov edx, eax
    mov eax, ebx
    call 0x8ab3e
    imul ebx, ebx, 6
    mov edx, dword [0x14d44]
    add edx, ebx
    mov word [edx + 0x18], 0xfffd
    test byte [eax + 6], 4
    je short loc_865bc
    mov word [edx + 0x18], 0
    movsx edx, di
    mov ebx, dword [eax + 0xc]
    mov dword [ecx + edx*4 + 0xc], ebx
    mov eax, dword [eax + 0x10]
    mov dword [ecx + edx*4 + 0x10], eax
loc_865fa:
    movsx ebx, si
    imul edx, ebx, 6
    mov eax, dword [0x14d44]
    mov edx, dword [edx + eax + 0x14]
    mov eax, ebx
    call 0x8ab3e
    mov edi, eax
    test byte [eax + 6], 4
    jne short loc_8661f
    mov dword [ebp - 0x1c], 3
loc_8661f:
    movsx ecx, si
    imul ecx, ecx, 6
    mov eax, dword [0x14d44]
    mov ax, word [ecx + eax + 0x18]
    movsx ebx, word [ebp - 0x1c]
    movsx edx, ax
    mov eax, edi
    call 0x8a8f1
    mov ax, word [edi + 4]
    mov dword [ebp - 0x24], eax
    test byte [edi + 6], 2
    je short loc_8666d
    test ax, ax
    jne near loc_86939
    mov eax, dword [0x14d44]
    cmp word [eax + 0x6c], 0
    je near loc_86939
    call loc_8698f
    jmp near loc_86939
loc_8666d:
    db 0x66, 0x3d, 0x1e, 0x00    ; cmp ax, 0x1e
    jg near loc_86939
    mov edx, dword [0x14d44]
    mov eax, dword [ecx + edx + 0x14]
    mov dword [ebp - 0x34], eax
    dec esi
    movsx ebx, si
    imul eax, ebx, 6
    mov dword [ebp - 0x3c], eax
    mov edx, dword [edx + eax + 0x14]
    mov eax, ebx
    call 0x8ab3e
    mov ecx, eax
    mov dword [ebp - 0x1c], 3
    mov eax, dword [0x14d44]
    mov edx, dword [ebp - 0x3c]
    add edx, eax
    mov dword [ebp - 0x30], edx
    mov dx, word [edx + 0x18]
    mov dword [ebp - 0x28], edx
    add edx, 3
    mov dword [ebp - 0x20], edx
    mov ebx, dword [ebp - 0x30]
    mov word [ebx + 0x18], dx
    mov ebx, ecx
    cmp dx, word [ebx + 4]
    jge near loc_867c3
    movsx edx, dx
    shl edx, 2
    add edx, ebx
    mov ebx, dword [edx + 0xc]
    mov dword [eax], ebx
    mov ebx, dword [edx + 0x10]
    mov dword [eax + 4], ebx
    mov edx, dword [edx + 0x14]
    mov dword [eax + 8], edx
    inc esi
    cmp si, word [eax + 0x6c]
    jne short loc_866f6
    mov dword [ebp - 0x1c], 2
loc_866f6:
    movsx eax, word [ebp - 0x20]
    mov edx, dword [ecx + eax*4 + 0x14]
    movsx ebx, si
    mov eax, ebx
    call 0x8ab3e
    mov ecx, eax
    imul ebx, ebx, 6
    mov edx, dword [0x14d44]
    add edx, ebx
    mov ebx, dword [ebp - 0x34]
    mov dword [edx + 0x14], ebx
    mov ax, word [eax + 4]
    mov dword [ebp - 0x18], eax
    movsx edx, word [ebp - 0x24]
    cwde
    lea ebx, [edx + eax]
    cmp ebx, 0x36
    jle short loc_8673d
    movsx ebx, word [ebp - 0x1c]
    add edx, ebx
    cmp eax, edx
    jle near loc_86939
loc_8673d:
    mov edx, dword [0x14d44]
    movsx eax, word [ebp - 0x24]
    shl eax, 2
    add eax, edi
    mov ebx, dword [edx]
    mov dword [eax + 0xc], ebx
    mov edx, dword [edx + 4]
    mov dword [eax + 0x10], edx
    test byte [edi + 6], 4
    jne short loc_86763
    mov edx, dword [ecx + 8]
    mov dword [eax + 0x14], edx
loc_86763:
    mov eax, dword [ebp - 0x1c]
    add dword [ebp - 0x24], eax
    mov eax, dword [ebp - 0x24]
    mov word [edi + 4], ax
    cwde
    movsx edx, word [ebp - 0x18]
    add eax, edx
    movsx edx, word [ebp - 0x1c]
    add edx, 0x36
    cmp edx, eax
    jl short loc_86791
    mov edx, ecx
    mov eax, edi
    call loc_8694f
    dec esi
    jmp near loc_865fa
loc_86791:
    mov eax, dword [0x14d44]
    mov edx, dword [ecx + 0xc]
    mov dword [eax], edx
    mov edx, dword [ecx + 0x10]
    mov dword [eax + 4], edx
    test byte [ecx + 6], 4
    jne short loc_867b0
    mov edx, dword [ecx + 0x14]
    mov dword [eax + 8], edx
    mov dword [ecx + 8], edx
loc_867b0:
    movsx ebx, word [ebp - 0x1c]
    xor edx, edx
    mov eax, ecx
    call 0x8a8f1
    dec esi
    jmp near loc_8690a
loc_867c3:
    movsx edx, word [ebp - 0x28]
    shl edx, 2
    add edx, ebx
    mov ebx, dword [edx + 0xc]
    mov dword [eax], ebx
    mov ebx, dword [edx + 0x10]
    mov dword [eax + 4], ebx
    mov edx, dword [edx + 0x14]
    mov dword [eax + 8], edx
    mov edx, dword [ebp - 0x28]
    sub edx, 3
    mov dword [ebp - 0x20], edx
    mov ebx, dword [ebp - 0x30]
    mov word [ebx + 0x18], dx
    inc esi
    cmp si, word [eax + 0x6c]
    jne short loc_867fb
    mov dword [ebp - 0x1c], 2
loc_867fb:
    movsx eax, word [ebp - 0x20]
    mov edx, dword [ecx + eax*4 + 0x14]
    movsx ebx, si
    mov eax, ebx
    call 0x8ab3e
    mov edx, eax
    mov ecx, eax
    imul ebx, ebx, 6
    mov eax, dword [0x14d44]
    add eax, ebx
    mov ebx, dword [ebp - 0x34]
    mov dword [eax + 0x14], ebx
    mov dx, word [edx + 4]
    mov dword [ebp - 0x2c], edx
    sub edx, dword [ebp - 0x1c]
    mov dword [ebp - 0x20], edx
    mov word [eax + 0x18], dx
    movsx edx, word [ebp - 0x24]
    movsx eax, word [ebp - 0x2c]
    lea ebx, [edx + eax]
    cmp ebx, 0x36
    jle short loc_86850
    movsx ebx, word [ebp - 0x1c]
    add edx, ebx
    cmp eax, edx
    jle near loc_86939
loc_86850:
    movsx eax, si
    imul edx, eax, 6
    mov eax, dword [0x14d44]
    mov word [edx + eax + 0x18], 0
    test byte [edi + 6], 4
    jne short loc_8686e
    mov edx, dword [edi + 8]
    mov dword [eax + 8], edx
loc_8686e:
    movsx eax, word [ebp - 0x1c]
    mov dword [ebp - 0x38], eax
    mov ebx, eax
    xor edx, edx
    mov eax, edi
    call 0x8a876
    mov eax, dword [ebp - 0x1c]
    add dword [ebp - 0x24], eax
    movsx eax, word [ebp - 0x24]
    movsx edx, word [ebp - 0x2c]
    add eax, edx
    mov edx, dword [ebp - 0x38]
    add edx, 0x36
    cmp edx, eax
    jl short loc_868bd
    mov edx, edi
    mov eax, ecx
    call loc_8694f
    dec esi
    movsx eax, si
    imul edx, eax, 6
    mov eax, dword [0x14d44]
    add eax, edx
    mov edx, dword [ebp - 0x28]
    mov word [eax + 0x18], dx
    jmp near loc_865fa
loc_868bd:
    movsx eax, word [ebp - 0x20]
    shl eax, 2
    lea edx, [ecx + eax]
    mov eax, dword [0x14d44]
    mov ebx, dword [edx + 0xc]
    mov dword [eax], ebx
    mov ebx, dword [edx + 0x10]
    mov dword [eax + 4], ebx
    cmp word [ebp - 0x1c], 3
    jne short loc_868e7
    mov edx, dword [edx + 0x14]
    mov dword [eax + 8], edx
    mov dword [edi + 8], edx
loc_868e7:
    mov eax, dword [ebp - 0x20]
    mov word [ecx + 4], ax
    mov eax, dword [ebp - 0x28]
    mov dword [ebp - 0x20], eax
    dec esi
    movsx eax, si
    imul eax, eax, 6
    mov edx, dword [0x14d44]
    add eax, edx
    mov edx, dword [ebp - 0x28]
    mov word [eax + 0x18], dx
loc_8690a:
    movsx eax, si
    imul edx, eax, 6
    mov ebx, dword [0x14d44]
    mov edx, dword [edx + ebx + 0x14]
    call 0x8ab3e
    mov edx, dword [0x14d44]
    movsx ebx, word [ebp - 0x20]
    shl ebx, 2
    add eax, ebx
    mov ebx, dword [edx]
    mov dword [eax + 0xc], ebx
    mov edx, dword [edx + 4]
    mov dword [eax + 0x10], edx
loc_86939:
    mov eax, dword [0x14d44]
    mov word [eax + 0x12], si
    dec dword [eax + 0x68]
    lea esp, [ebp - 0x14]
    pop edi
loc_86949:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_8694f:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov ecx, eax
    mov esi, edx
    movsx ebx, word [edx + 4]
    shl ebx, 2
    add edx, 0xc
    movsx eax, word [eax + 4]
    shl eax, 2
    mov edi, ecx
    add edi, 0xc
    add eax, edi
    call 0x61e3b
    mov ax, word [esi + 4]
    add word [ecx + 4], ax
    mov eax, esi
    call 0x8aa4a
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_8698f:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov ecx, dword [0x14d44]
    mov ecx, dword [ecx + 0x50]
    mov edx, dword [ecx + 8]
    mov eax, 1
    call 0x8ab3e
    mov esi, eax
    mov dx, word [eax + 4]
    mov word [ecx + 4], dx
    mov edx, dword [eax + 8]
    mov dword [ecx + 8], edx
    lea edx, [eax + 0xc]
    lea eax, [ecx + 0xc]
    mov ebx, 0xe4
    call 0x61e3b
    mov eax, dword [0x14d44]
    dec word [eax + 0x6c]
    jne short loc_869db
    or byte [ecx + 6], 4
loc_869db:
    mov eax, esi
    call 0x8aa4a
    lea esp, [ebp - 0x10]
    jmp near loc_86949
    push ebp
    mov ebp, esp
    push ebx
    mov dword [0x14d44], eax
    mov eax, edx
    call 0x8a22e
    test ax, ax
    jne short loc_86a1d
    test byte [edx + 8], 1
    je short loc_86a19
    mov eax, dword [0x14d44]
    mov eax, dword [eax + 4]
    mov ebx, dword [edx + 4]
    mov edx, eax
    mov eax, ebx
    call 0x8a7a5
loc_86a19:
    xor ebx, ebx
    jmp short loc_86a5f
loc_86a1d:
    mov ebx, 1
    test byte [edx + 8], 2
    jne short loc_86a34
    call 0x89e68
    test ax, ax
    je short loc_86a4f
    jmp short loc_86a4a
loc_86a34:
    mov eax, dword [0x14d44]
    cmp word [eax + 0xc], 0
    je short loc_86a4f
    call 0x89f7e
    test ax, ax
    je short loc_86a4f
loc_86a4a:
    mov ebx, 2
loc_86a4f:
    mov eax, dword [0x14d44]
    cmp word [eax + 0xc], 0
    jne short loc_86a5f
    mov eax, dword [eax]
    mov dword [edx], eax
loc_86a5f:
    mov eax, ebx
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    mov ebx, edx
    mov dword [0x14d44], eax
    mov esi, 1
    cmp word [eax + 0xc], 0
    jne short loc_86aa0
    mov ecx, eax
    mov edx, eax
    mov eax, ebx
    call dword [ecx + 0x44]
    test ax, ax
    jne short loc_86aa0
    mov eax, dword [0x14d44]
    mov edx, dword [eax + 4]
    mov eax, dword [ebx + 4]
    call 0x8a7a5
    xor esi, esi
loc_86aa0:
    mov eax, esi
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    mov dword [0x14d44], eax
    test dx, dx
    jne short loc_86abe
    call 0x8a07d
    jmp short loc_86ac3
loc_86abe:
    call 0x8a101
loc_86ac3:
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    mov dword [0x14d44], eax
    mov ebx, 2
    call 0x89e68
    test ax, ax
    jne short loc_86b01
    mov eax, dword [0x14d44]
    mov ebx, dword [eax]
    mov dword [edx], ebx
    test byte [edx + 8], 1
    je short loc_86aff
    mov eax, dword [eax + 4]
    mov ebx, dword [edx + 4]
    mov edx, eax
    mov eax, ebx
    call 0x8a7a5
loc_86aff:
    xor ebx, ebx
loc_86b01:
    mov eax, ebx
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    ret
