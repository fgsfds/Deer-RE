bits 32
org 0x89dd5

    push ebp
    mov ebp, esp
    mov eax, 0x12c
    call 0x8b2ec
    mov dword [0x14d44], eax
    test eax, eax
    jne short loc_89df2
    mov eax, 4
    jmp short loc_89e3d
loc_89df2:
    add eax, 0xa4
    call 0x8a19c
    test ax, ax
    jne short loc_89e3d
    mov eax, dword [0x14d44]
    mov word [eax + 0xc], 8
    xor dh, dh
    and dl, 2
    or dh, 0x80
    mov word [eax + 0xe], dx
    test byte [eax + 0xe], 2
    je short loc_89e23
    mov dword [eax + 0x44], ecx
    jmp short loc_89e2a
loc_89e23:
    mov dword [eax + 0x44], 0x7b313
loc_89e2a:
    movzx eax, word [ebp + 8]
    call 0x8a938
    movzx eax, bx
    call 0x8a3d1
    xor eax, eax
loc_89e3d:
    mov esp, ebp
    pop ebp
    ret 4
    push ebp
    mov ebp, esp
    call 0x8a43b
    call 0x8a9ba
    mov eax, dword [0x14d44]
    call 0x8b303
    mov dword [0x14d44], 0
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edx, dword [0x14d44]
    mov bx, word [edx + 0x12]
    mov ecx, dword [edx + 0x54]
    cmp word [edx + 0xc], 8
    je short loc_89e88
    test ecx, ecx
    jne short loc_89e97
loc_89e88:
    call loc_8a101
    mov eax, 1
    jmp near loc_89f74
loc_89e97:
    mov esi, 3
    movsx eax, bx
    imul eax, eax, 6
    mov ax, word [edx + eax + 0x18]
loc_89ea7:
    mov edx, dword [0x14d44]
    cmp bx, word [edx + 0x6c]
    jge short loc_89ee6
    cwde
    mov edx, dword [ecx + eax*4 + 0x14]
    inc ebx
    movsx eax, bx
    call 0x8ab3e
    mov ecx, eax
    test byte [eax + 6], 4
    je short loc_89ece
    mov esi, 2
loc_89ece:
    mov eax, esi
    neg eax
    movsx edx, bx
    imul edx, edx, 6
    mov edi, dword [0x14d44]
    add edx, edi
    mov word [edx + 0x18], ax
    jmp short loc_89ea7
loc_89ee6:
    movsx esi, bx
    imul esi, esi, 6
    inc eax
    inc eax
loc_89eee:
    mov word [edx + esi + 0x18], ax
    cmp ax, word [ecx + 4]
    jne short loc_89f45
    test bx, bx
    je short loc_89e88
    dec ebx
    movsx ecx, bx
    imul esi, ecx, 6
    mov eax, dword [0x14d44]
    mov edx, dword [esi + eax + 0x14]
    mov eax, ecx
    call 0x8ab3e
    mov edx, eax
    mov ecx, eax
    mov eax, dword [0x14d44]
    mov ax, word [esi + eax + 0x18]
    test ax, ax
    jge short loc_89f2c
    xor eax, eax
    jmp short loc_89f37
loc_89f2c:
    cmp ax, word [edx + 4]
    jge short loc_89f37
    db 0x05, 0x03, 0x00, 0x00, 0x00    ; add eax, 3
loc_89f37:
    movsx edx, bx
    imul esi, edx, 6
    mov edx, dword [0x14d44]
    jmp short loc_89eee
loc_89f45:
    mov edx, dword [0x14d44]
    mov word [edx + 0x12], bx
    mov word [edx + 0xc], 0
    cwde
    shl eax, 2
    add eax, ecx
    mov esi, dword [eax + 0xc]
    mov dword [edx], esi
    mov esi, dword [eax + 0x10]
    mov dword [edx + 4], esi
    test byte [ecx + 6], 4
    jne short loc_89f72
    mov eax, dword [eax + 0x14]
    mov dword [edx + 8], eax
loc_89f72:
    xor eax, eax
loc_89f74:
    lea esp, [ebp - 0x14]
    pop edi
loc_89f78:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push eax
    mov eax, dword [0x14d44]
    mov bx, word [eax + 0x12]
    mov edx, dword [eax + 0x54]
    cmp word [eax + 0xc], 8
    je short loc_89f9d
    test edx, edx
    jne short loc_89fac
loc_89f9d:
    call loc_8a07d
    mov eax, 1
    jmp near loc_8a075
loc_89fac:
    mov esi, 3
    test byte [edx + 6], 4
    je short loc_89fbc
    mov esi, 2
loc_89fbc:
    movsx eax, bx
    imul ecx, eax, 6
    mov eax, dword [0x14d44]
    add eax, ecx
    mov cx, word [eax + 0x18]
    sub ecx, esi
loc_89fcf:
    mov word [eax + 0x18], cx
    mov eax, dword [0x14d44]
    cmp bx, word [eax + 0x6c]
    jge short loc_8a014
    movsx eax, cx
    mov edx, dword [edx + eax*4 + 0x14]
    inc ebx
    movsx eax, bx
    call 0x8ab3e
    mov edx, eax
    test byte [eax + 6], 4
    je short loc_89ffb
    mov esi, 2
loc_89ffb:
    mov cx, word [edx + 4]
    sub ecx, esi
    movsx eax, bx
    imul eax, eax, 6
    mov dword [ebp - 0x14], eax
    mov eax, dword [0x14d44]
    add eax, dword [ebp - 0x14]
    jmp short loc_89fcf
loc_8a014:
    test cx, cx
    jge short loc_8a045
loc_8a019:
    test bx, bx
    je near loc_89f9d
    dec ebx
    movsx esi, bx
    imul edx, esi, 6
    mov eax, dword [0x14d44]
    add eax, edx
    mov cx, word [eax + 0x18]
    test cx, cx
    jl short loc_8a019
    mov edx, dword [eax + 0x14]
    mov eax, esi
    call 0x8ab3e
    mov edx, eax
loc_8a045:
    mov eax, dword [0x14d44]
    mov word [eax + 0x12], bx
    mov word [eax + 0xc], 0
    movsx ebx, cx
    shl ebx, 2
    add ebx, edx
    mov esi, dword [ebx + 0xc]
    mov dword [eax], esi
    mov esi, dword [ebx + 0x10]
    mov dword [eax + 4], esi
    test byte [edx + 6], 4
    jne short loc_8a073
    mov edx, dword [ebx + 0x14]
    mov dword [eax + 8], edx
loc_8a073:
    xor eax, eax
loc_8a075:
    lea esp, [ebp - 0x10]
    jmp near loc_89f78
loc_8a07d:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edx, dword [0x14d44]
    cmp word [edx + 0xc], 1
    je near loc_89f74
    mov edx, dword [edx + 0x50]
    xor ebx, ebx
    mov ecx, 3
    test byte [edx + 6], 4
    je short loc_8a0ab
    mov ecx, 2
loc_8a0ab:
    mov esi, ecx
    neg esi
    mov eax, dword [0x14d44]
    mov word [eax + 0x18], si
loc_8a0b8:
    mov eax, dword [0x14d44]
    cmp bx, word [eax + 0x6c]
    jge short loc_8a0f2
    mov edx, dword [edx + 8]
    inc ebx
    movsx eax, bx
    call 0x8ab3e
    mov edx, eax
    test byte [eax + 6], 4
    je short loc_8a0dc
    mov ecx, 2
loc_8a0dc:
    mov edi, ecx
    neg edi
    movsx esi, bx
    imul esi, esi, 6
    mov eax, dword [0x14d44]
    mov word [esi + eax + 0x18], di
    jmp short loc_8a0b8
loc_8a0f2:
    mov word [eax + 0x12], bx
    mov word [eax + 0xc], 1
    jmp near loc_89f74
loc_8a101:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov eax, dword [0x14d44]
    cmp word [eax + 0xc], 2
    je near loc_89f74
    mov eax, dword [eax + 0x50]
    xor ebx, ebx
    mov ecx, 3
    test byte [eax + 6], 4
    je short loc_8a12e
    mov ecx, 2
loc_8a12e:
    mov dx, word [eax + 4]
    sub edx, ecx
    mov esi, dword [0x14d44]
    mov word [esi + 0x18], dx
    test dx, dx
    jl short loc_8a178
loc_8a143:
    mov esi, dword [0x14d44]
    cmp bx, word [esi + 0x6c]
    jge short loc_8a178
    movsx edx, dx
    mov edx, dword [eax + edx*4 + 0x14]
    inc ebx
    movsx esi, bx
    mov eax, esi
    call 0x8ab3e
    mov dx, word [eax + 4]
    sub edx, ecx
    imul esi, esi, 6
    mov edi, dword [0x14d44]
    add esi, edi
    mov word [esi + 0x18], dx
    jmp short loc_8a143
loc_8a178:
    movsx edx, bx
    imul esi, edx, 6
    mov edx, dword [0x14d44]
    mov ax, word [eax + 4]
    mov word [edx + esi + 0x18], ax
    mov word [edx + 0x12], bx
    mov word [edx + 0xc], 2
    jmp near loc_89f74
