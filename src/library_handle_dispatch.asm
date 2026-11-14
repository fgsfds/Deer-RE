bits 32
org 0x8a22e

    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x10
    push eax
    mov edx, dword [0x14d44]
    mov ebx, dword [edx + 0x50]
    mov dword [ebp - 0x18], 3
    cmp word [edx + 0xc], 0
    jne short loc_8a260
    mov edi, edx
    call dword [edi + 0x44]
    test ax, ax
    jne short loc_8a274
    jmp near loc_8a3c7
loc_8a260:
    cmp word [edx + 0xc], 8
    jne short loc_8a274
    mov dword [edx + 0x54], ebx
loc_8a26a:
    mov eax, 1
    jmp near loc_8a3c7
loc_8a274:
    cmp word [ebx + 4], 0
    jne short loc_8a291
    mov eax, dword [0x14d44]
    mov word [eax + 0xc], 8
    mov word [eax + 0x18], 0xfffe
    mov dword [eax + 0x54], ebx
    jmp short loc_8a26a
loc_8a291:
    mov dword [ebp - 0x20], 0
    mov eax, dword [0x14d44]
    mov word [eax + 0xc], 4
loc_8a2a3:
    test byte [ebx + 6], 4
    je short loc_8a2b0
    mov dword [ebp - 0x18], 2
loc_8a2b0:
    mov ax, word [ebx + 4]
    mov dword [ebp - 0x1c], eax
    cwde
    movsx edi, word [ebp - 0x18]
    cdq
    idiv edi
    sar eax, 1
    imul eax, edi
    mov ecx, eax
    mov edi, dword [0x14d44]
    cwde
    shl eax, 2
    lea edx, [ebx + 0xc]
    add edx, eax
    mov eax, dword [ebp - 0x28]
    call dword [edi + 0x44]
    mov edi, eax
    test ax, ax
    jne short loc_8a2e6
loc_8a2e2:
    mov esi, ecx
    jmp short loc_8a305
loc_8a2e6:
    jge short loc_8a2f4
    mov esi, dword [ebp - 0x18]
    neg esi
    mov dword [ebp - 0x1c], ecx
    xor ecx, ecx
    jmp short loc_8a2f9
loc_8a2f4:
    mov esi, ecx
    add ecx, dword [ebp - 0x18]
loc_8a2f9:
    lea eax, [ebx + 0xc]
    mov dword [ebp - 0x24], eax
loc_8a2ff:
    cmp cx, word [ebp - 0x1c]
    jl short loc_8a347
loc_8a305:
    movsx eax, word [ebp - 0x20]
    imul edx, eax, 6
    mov eax, dword [0x14d44]
    mov word [edx + eax + 0x18], si
    test di, di
    jne short loc_8a373
    mov word [eax + 0xc], di
    movsx edx, si
    shl edx, 2
    add edx, ebx
    mov ecx, dword [edx + 0xc]
    mov dword [eax], ecx
    mov ecx, dword [edx + 0x10]
    mov dword [eax + 4], ecx
    test byte [ebx + 6], 4
    jne near loc_8a3b6
    mov edx, dword [edx + 0x14]
    mov dword [eax + 8], edx
    jmp near loc_8a3b6
loc_8a347:
    mov edi, dword [0x14d44]
    movsx eax, cx
    shl eax, 2
    mov edx, dword [ebp - 0x24]
    add edx, eax
    mov eax, dword [ebp - 0x28]
    call dword [edi + 0x44]
    mov edi, eax
    test ax, ax
    jg short loc_8a36c
    jne short loc_8a305
    jmp near loc_8a2e2
loc_8a36c:
    mov esi, ecx
    add ecx, dword [ebp - 0x18]
    jmp short loc_8a2ff
loc_8a373:
    test byte [ebx + 6], 4
    je short loc_8a39c
    test si, si
    jl short loc_8a3b6
    cmp si, word [ebx + 4]
    jge short loc_8a3b6
    mov word [eax + 0xc], 0
    movsx edx, si
    mov ecx, dword [ebx + edx*4 + 0xc]
    mov dword [eax], ecx
    mov edx, dword [ebx + edx*4 + 0x10]
    mov dword [eax + 4], edx
    jmp short loc_8a3b6
loc_8a39c:
    movsx eax, si
    mov edx, dword [ebx + eax*4 + 0x14]
    inc dword [ebp - 0x20]
    movsx eax, word [ebp - 0x20]
    call loc_8ab3e
    mov ebx, eax
    jmp near loc_8a2a3
loc_8a3b6:
    mov eax, dword [0x14d44]
    mov edx, dword [ebp - 0x20]
    mov word [eax + 0x12], dx
    mov dword [eax + 0x54], ebx
    mov eax, edi
loc_8a3c7:
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
    push ebx
    push ecx
    push edx
    mov ecx, eax
    mov eax, 0x800
    call 0x8b2ec
    mov ebx, dword [0x14d44]
    mov dword [ebx + 0x88], eax
    test eax, eax
    jne short loc_8a403
    lea eax, [ebx + 0xa4]
loc_8a3f9:
    mov edx, 4
    jmp near 0x8a1d1
loc_8a403:
    mov ebx, dword [0x14d44]
    mov word [ebx + 0xa0], 0xffff
    mov dword [ebx + 0x7c], 0x40
    mov word [ebx + 0x98], cx
    movzx ecx, cx
    xor edx, edx
    mov eax, 0x7e8
    div ecx
    mov word [ebx + 0x9a], ax
loc_8a433:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov eax, dword [0x14d44]
    mov eax, dword [eax + 0x84]
    test eax, eax
    je short loc_8a46a
loc_8a44f:
    mov ebx, dword [eax + 0x7fc]
    call 0x8b303
    mov eax, ebx
    mov edx, dword [0x14d44]
    cmp ebx, dword [edx + 0x84]
    jne short loc_8a44f
loc_8a46a:
    mov eax, dword [0x14d44]
    cmp dword [eax + 0x88], 0
    je short loc_8a483
    mov eax, dword [eax + 0x88]
    call 0x8b303
loc_8a483:
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edi, eax
    mov eax, dword [0x14d44]
    cmp dword [eax + 0x78], 0
    jne short loc_8a4c6
    test byte [eax + 0xa2], 2
    jne short loc_8a4bd
    test byte [eax + 0xf], 4
    je short loc_8a4bd
    add eax, 0xa4
    mov edx, 3
    jmp near 0x8a1d1
loc_8a4bd:
    call loc_8a54d
    mov ecx, eax
    jmp short loc_8a4d7
loc_8a4c6:
    mov ecx, dword [eax + 0x78]
    cmp ecx, dword [eax + 0x84]
    je short loc_8a4d7
    mov dword [eax + 0x84], ecx
loc_8a4d7:
    mov ax, word [ecx + 8]
    test ax, ax
    jne short loc_8a4fd
    mov bx, word [ecx + 0xa]
    movzx esi, bx
    add esi, ecx
    mov eax, dword [0x14d44]
    mov ax, word [eax + 0x98]
    add ebx, eax
    mov word [ecx + 0xa], bx
    jmp short loc_8a509
loc_8a4fd:
    movzx esi, ax
    add esi, ecx
    mov ax, word [esi]
    mov word [ecx + 8], ax
loc_8a509:
    mov eax, dword [0x14d44]
    movzx ebx, word [eax + 0x98]
    mov edx, edi
    mov eax, esi
    call 0x61e3b
    mov eax, dword [0x14d44]
    inc word [ecx + 0xc]
    mov bx, word [ecx + 0xc]
    cmp bx, word [eax + 0x9a]
    jne short loc_8a541
    mov ebx, dword [ecx + 4]
    mov dword [eax + 0x78], ebx
    mov dword [ecx + 4], 0
loc_8a541:
    mov eax, esi
    lea esp, [ebp - 0x14]
    pop edi
loc_8a547:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_8a54d:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov eax, dword [0x14d44]
    test byte [eax + 0xf], 4
    je short loc_8a567
    add eax, 0xa4
    jmp near loc_8a3f9
loc_8a567:
    mov eax, 0x800
    call 0x8b2ec
    mov edx, eax
    test eax, eax
    jne short loc_8a590
    mov eax, dword [0x14d44]
    mov edx, dword [eax + 0x88]
    mov dword [eax + 0x88], 0
    or byte [eax + 0xf], 4
loc_8a590:
    mov eax, dword [0x14d44]
    mov dword [eax + 0x78], edx
    mov dword [edx + 4], 0
    mov word [edx + 8], 0x10
    mov bx, word [eax + 0x98]
    add ebx, 0x10
    mov word [edx + 0xa], bx
    cmp dword [eax + 0x84], 0
    jne short loc_8a5d9
    mov dword [edx + 0x7fc], edx
    mov dword [edx + 0x7f8], edx
    mov dword [eax + 0x8c], edx
    mov dword [eax + 0x90], edx
    jmp near loc_8a649
loc_8a5d9:
    cmp edx, dword [eax + 0x90]
    jbe short loc_8a5ef
    mov ebx, dword [eax + 0x90]
    mov dword [eax + 0x90], edx
    jmp short loc_8a62b
loc_8a5ef:
    cmp edx, dword [eax + 0x8c]
    jae short loc_8a605
    mov ebx, dword [eax + 0x90]
    mov dword [eax + 0x8c], edx
    jmp short loc_8a62b
loc_8a605:
    mov ebx, dword [eax + 0x84]
    cmp edx, ebx
    jae short loc_8a61b
loc_8a60f:
    mov ebx, dword [ebx + 0x7f8]
    cmp ebx, edx
    ja short loc_8a60f
    jmp short loc_8a62b
loc_8a61b:
    cmp edx, dword [ebx + 0x7fc]
    jbe short loc_8a62b
    mov ebx, dword [ebx + 0x7fc]
    jmp short loc_8a61b
loc_8a62b:
    mov dword [edx + 0x7f8], ebx
    mov eax, dword [ebx + 0x7fc]
    mov dword [edx + 0x7fc], eax
    mov dword [eax + 0x7f8], edx
    mov dword [ebx + 0x7fc], edx
loc_8a649:
    mov eax, dword [0x14d44]
    inc dword [eax + 0x94]
    mov dword [eax + 0x84], edx
    mov eax, edx
    jmp near loc_8a483
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    call loc_8a813
    mov ecx, eax
    mov edx, dword [0x14d44]
    mov eax, dword [edx + 0x84]
    dec word [eax + 0xc]
    jne short loc_8a688
    call loc_8a6b8
    jmp short loc_8a6b0
loc_8a688:
    movzx ebx, cx
    mov si, word [eax + 8]
    mov word [ebx + eax], si
    mov word [eax + 8], cx
    movzx ecx, word [edx + 0x9a]
    movzx ebx, word [eax + 0xc]
    dec ecx
    cmp ebx, ecx
    jne short loc_8a6b0
    mov ebx, dword [edx + 0x78]
    mov dword [eax + 4], ebx
    mov dword [edx + 0x78], eax
loc_8a6b0:
    lea esp, [ebp - 0x10]
    jmp near loc_8a547
loc_8a6b8:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov eax, dword [0x14d44]
    mov ecx, dword [eax + 0x84]
    dec dword [eax + 0x94]
    jne short loc_8a6fd
    mov dword [eax + 0x84], 0
    mov dword [eax + 0x78], 0
    mov dword [eax + 0x8c], 0
    mov edx, dword [eax + 0x8c]
loc_8a6f2:
    mov dword [eax + 0x90], edx
    jmp near loc_8a769
loc_8a6fd:
    mov edx, dword [ecx + 0x7f8]
    mov ebx, dword [ecx + 0x7fc]
    mov dword [edx + 0x7fc], ebx
    mov dword [ebx + 0x7f8], edx
    mov dword [eax + 0x84], edx
    mov edx, dword [eax + 0x78]
    cmp edx, ecx
    jne short loc_8a72a
    mov edx, dword [ecx + 4]
    mov dword [eax + 0x78], edx
    jmp short loc_8a740
loc_8a72a:
    test edx, edx
    je short loc_8a740
    cmp ecx, dword [edx + 4]
    jne short loc_8a73b
    mov eax, dword [ecx + 4]
    mov dword [edx + 4], eax
    jmp short loc_8a740
loc_8a73b:
    mov edx, dword [edx + 4]
    jmp short loc_8a72a
loc_8a740:
    mov eax, dword [0x14d44]
    cmp ecx, dword [eax + 0x90]
    jne short loc_8a755
    mov edx, dword [ecx + 0x7f8]
    jmp short loc_8a6f2
loc_8a755:
    cmp ecx, dword [eax + 0x8c]
    jne short loc_8a769
    mov edx, dword [ecx + 0x7fc]
    mov dword [eax + 0x8c], edx
loc_8a769:
    mov eax, dword [0x14d44]
    cmp dword [eax + 0x88], 0
    jne short loc_8a799
    mov ebx, 0x800
    xor edx, edx
    mov eax, ecx
    call 0x61915
    mov eax, dword [0x14d44]
    mov dword [eax + 0x88], ecx
    and byte [eax + 0xf], 0xfb
    jmp near loc_8a433
loc_8a799:
    mov eax, ecx
    call 0x8b303
    jmp near loc_8a433
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    mov ecx, eax
    mov eax, edx
    call loc_8a813
    mov edx, eax
    mov eax, dword [0x14d44]
    movzx ebx, dx
    mov edx, dword [eax + 0x84]
    add edx, ebx
    movzx ebx, word [eax + 0x98]
    mov eax, ecx
    call 0x61e3b
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    mov ecx, eax
    mov eax, edx
    call loc_8a813
    mov ebx, eax
    mov eax, dword [0x14d44]
    movzx ebx, bx
    mov esi, dword [eax + 0x84]
    add esi, ebx
    movzx ebx, word [eax + 0x98]
    mov edx, ecx
    mov eax, esi
    call 0x61e3b
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_8a813:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov ebx, eax
    mov edx, dword [0x14d44]
    mov eax, dword [edx + 0x84]
    cmp dword [edx + 0x94], 1
    jbe short loc_8a86d
    cmp ebx, eax
    jae short loc_8a83f
loc_8a833:
    mov eax, dword [eax + 0x7f8]
    cmp eax, ebx
    ja short loc_8a833
    jmp short loc_8a859
loc_8a83f:
    cmp ebx, dword [eax + 0x7fc]
    jbe short loc_8a859
    lea edx, [eax + 0x7f8]
    cmp edx, ebx
    ja short loc_8a859
    mov eax, dword [eax + 0x7fc]
    jmp short loc_8a83f
loc_8a859:
    mov edx, dword [0x14d44]
    cmp eax, dword [edx + 0x84]
    je short loc_8a86d
    mov dword [edx + 0x84], eax
loc_8a86d:
    sub ebx, eax
    mov eax, ebx
    jmp near loc_8a483
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    push eax
    mov esi, edx
    mov dword [ebp - 0x10], ebx
    mov dx, word [eax + 4]
    cmp dx, si
    je short loc_8a8bd
    movsx ebx, dx
    movsx ecx, word [ebp - 0x10]
    add ebx, ecx
    shl ebx, 2
    sub ebx, 4
    lea edi, [eax + 0xc]
    add ebx, edi
    shl ecx, 2
    mov edi, ebx
    sub edi, ecx
    mov ecx, edi
    sub edx, esi
loc_8a8aa:
    dec edx
    cmp dx, -1
    je short loc_8a8bd
    mov edi, dword [ecx]
    mov dword [ebx], edi
    sub ecx, 4
    sub ebx, 4
    jmp short loc_8a8aa
loc_8a8bd:
    mov ebx, dword [0x14d44]
    movsx edx, si
    shl edx, 2
    add edx, eax
    mov ecx, dword [ebx]
    mov dword [edx + 0xc], ecx
    mov ecx, dword [ebx + 4]
    mov dword [edx + 0x10], ecx
    test byte [eax + 6], 4
    jne short loc_8a8e2
    mov ebx, dword [ebx + 8]
    mov dword [edx + 0x14], ebx
loc_8a8e2:
    mov edx, dword [ebp - 0x10]
    add word [eax + 4], dx
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ecx
    push esi
    mov ecx, eax
    mov esi, edx
    mov ax, word [eax + 4]
    sub eax, ebx
    mov word [ecx + 4], ax
    cmp ax, dx
    je short loc_8a931
    movsx edx, dx
    shl edx, 2
    add ecx, 0xc
    add ecx, edx
    movsx edx, bx
    shl edx, 2
    add edx, ecx
    sub eax, esi
loc_8a91e:
    dec eax
    db 0x66, 0x3d, 0xff, 0xff    ; cmp ax, 0xffff
    je short loc_8a931
    mov ebx, dword [edx]
    mov dword [ecx], ebx
    add edx, 4
    add ecx, 4
    jmp short loc_8a91e
loc_8a931:
    lea esp, [ebp - 8]
    pop esi
    pop ecx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov eax, dword [0x14d44]
    mov dword [eax + 0x4c], 0x140
    call loc_8ab72
    mov eax, dword [0x14d44]
    mov ebx, dword [eax + 0x60]
    inc word [ebx + 8]
    mov ebx, dword [eax + 0x60]
    add ebx, 0x20
    mov dword [eax + 0x50], ebx
    or byte [ebx + 6], 2
    mov dword [ebx], 0x40
    mov dword [eax + 0x14], ebx
    mov edx, dword [ebx + 8]
    mov dword [eax + 0x48], edx
    mov eax, 0x800
    call 0x8b2ec
    mov edx, eax
    mov eax, dword [0x14d44]
    mov dword [eax + 0x5c], edx
    test edx, edx
    jne short loc_8a99d
loc_8a98e:
    add eax, 0xa4
    mov edx, 4
    jmp near 0x8a1d1
loc_8a99d:
    mov eax, dword [0x14d44]
    mov word [eax + 0x74], 0xffff
    cmp word [eax + 0x6c], 0
    jne short loc_8a9b3
    or byte [ebx + 6], 4
loc_8a9b3:
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov eax, dword [0x14d44]
    mov eax, dword [eax + 0x60]
    test eax, eax
    je short loc_8a9e0
loc_8a9cb:
    mov ebx, dword [eax + 4]
    call 0x8b303
    mov eax, ebx
    mov edx, dword [0x14d44]
    cmp ebx, dword [edx + 0x60]
    jne short loc_8a9cb
loc_8a9e0:
    mov eax, dword [0x14d44]
    cmp dword [eax + 0x5c], 0
    je short loc_8a9b3
    mov eax, dword [eax + 0x5c]
    call 0x8b303
    jmp short loc_8a9b3
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov edx, dword [0x14d44]
    inc dword [edx + 0x64]
    mov eax, dword [edx + 0x48]
    test eax, eax
    jne short loc_8aa1c
    call loc_8ab72
    mov eax, dword [0x14d44]
    mov eax, dword [eax + 0x60]
    add eax, 0x20
    jmp short loc_8aa25
loc_8aa1c:
    mov ebx, dword [eax + 0xf0]
    mov dword [edx + 0x60], ebx
loc_8aa25:
    mov edx, dword [0x14d44]
    mov ebx, dword [edx + 0x60]
    inc word [ebx + 8]
    mov ebx, dword [eax + 8]
    mov dword [edx + 0x48], ebx
    mov dword [eax + 8], 0
    mov word [eax + 6], 0
    jmp near loc_8a9b3
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov word [eax + 4], 0
    mov word [eax + 6], 0
    mov edx, dword [0x14d44]
    mov ebx, dword [eax + 0xf0]
    mov dword [edx + 0x60], ebx
    dec word [ebx + 8]
    jne short loc_8aa77
    call loc_8aaa1
    jmp short loc_8aa80
loc_8aa77:
    mov ebx, dword [edx + 0x48]
    mov dword [eax + 8], ebx
    mov dword [edx + 0x48], eax
loc_8aa80:
    mov eax, dword [0x14d44]
    dec dword [eax + 0x64]
    jne near loc_8a9b3
    mov dword [eax + 0x48], 0
    mov dword [eax + 0x4c], 0x140
    jmp near loc_8a9b3
loc_8aaa1:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov eax, dword [0x14d44]
    mov ecx, dword [eax + 0x60]
    mov ebx, dword [ecx]
    mov edx, dword [ecx + 4]
    mov dword [ebx + 4], edx
    mov dword [edx], ebx
    cmp ecx, ebx
    jne short loc_8aac7
    mov dword [eax + 0x60], 0
    jmp short loc_8aaca
loc_8aac7:
    mov dword [eax + 0x60], ebx
loc_8aaca:
    lea ebx, [ecx + 0x20]
    xor esi, esi
loc_8aacf:
    mov edx, dword [0x14d44]
    mov eax, dword [edx + 0x48]
    cmp eax, ebx
    jne short loc_8aae4
    mov eax, dword [ebx + 8]
    mov dword [edx + 0x48], eax
    jmp short loc_8aafa
loc_8aae4:
    test eax, eax
    je short loc_8aafa
    cmp ebx, dword [eax + 8]
    jne short loc_8aaf5
    mov edx, dword [ebx + 8]
    mov dword [eax + 8], edx
    jmp short loc_8aafa
loc_8aaf5:
    mov eax, dword [eax + 8]
    jmp short loc_8aae4
loc_8aafa:
    inc esi
    add ebx, 0xfc
    cmp si, 8
    jb short loc_8aacf
    mov eax, dword [0x14d44]
    cmp dword [eax + 0x5c], 0
    jne short loc_8ab2e
    mov ebx, 0x800
    xor edx, edx
    mov eax, ecx
    call 0x61915
    mov eax, dword [0x14d44]
    mov dword [eax + 0x5c], ecx
    and byte [eax + 0xf], 0xf7
    jmp short loc_8ab35
loc_8ab2e:
    mov eax, ecx
    call 0x8b303
loc_8ab35:
    lea esp, [ebp - 0x10]
loc_8ab38:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_8ab3e:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    mov ebx, edx
    test ax, ax
    jne short loc_8ab55
    mov edx, dword [0x14d44]
    mov ecx, dword [edx + 0x50]
    jmp short loc_8ab57
loc_8ab55:
    mov ecx, edx
loc_8ab57:
    movsx edx, ax
    imul edx, edx, 6
    mov eax, dword [0x14d44]
    mov dword [edx + eax + 0x14], ebx
    mov dword [eax + 0x54], ecx
    mov eax, ecx
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
loc_8ab72:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov eax, 0x800
    call 0x8b2ec
    mov ebx, eax
    test eax, eax
    jne short loc_8abaa
    mov eax, dword [0x14d44]
    mov ebx, dword [eax + 0x5c]
    test ebx, ebx
    je near loc_8a98e
    mov eax, dword [0x14d44]
    mov dword [eax + 0x5c], 0
    or byte [eax + 0xf], 8
loc_8abaa:
    mov edx, dword [0x14d44]
    mov eax, dword [edx + 0x60]
    mov dword [edx + 0x60], ebx
    test eax, eax
    jne short loc_8abc1
    mov dword [ebx + 4], ebx
    mov dword [ebx], ebx
    jmp short loc_8abce
loc_8abc1:
    mov dword [ebx], eax
    mov edx, dword [eax + 4]
    mov dword [ebx + 4], edx
    mov dword [edx], ebx
    mov dword [eax + 4], ebx
loc_8abce:
    lea eax, [ebx + 0x20]
    mov edx, dword [0x14d44]
    mov ecx, dword [edx + 0x4c]
    xor esi, esi
    lea edi, [ecx + 0x800]
    mov dword [edx + 0x4c], edi
loc_8abe5:
    mov dword [eax], ecx
    mov dword [eax + 0xf0], ebx
    lea edx, [eax + 0xfc]
    mov dword [eax + 8], edx
    add ecx, 0x100
    inc esi
    mov eax, edx
    cmp si, 8
    jb short loc_8abe5
    lea eax, [edx - 0xfc]
    mov dword [eax + 8], 0
    lea esp, [ebp - 0x14]
    pop edi
    jmp near loc_8ab38
    db 0x00
