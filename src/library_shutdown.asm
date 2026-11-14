bits 32
org 0x8c1ae

; Explicit encodings preserve operand direction and prefix order.

    xor eax, eax
    ret
    db 0    ; Alignment
    push ebp
    db 0x8b, 0xec    ; mov ebp, esp
    push edx
    mov edx, dword [ebp + 8]
    lsl eax, edx
    je short loc_8c1c3
    mov eax, 0xfffffffe
loc_8c1c3:
    pop edx
    pop ebp
    ret
loc_8c1c6:
    pushad
    call 0x61f6a
    db 0x8b, 0xf0    ; mov esi, eax
loc_8c1ce:
    lodsb
    cmp al, 0xff
    je short loc_8c1ec
    db 0x8a, 0xd8    ; mov bl, al
    lodsw
    db 0x66, 0x8b, 0xc8    ; mov cx, ax
    lodsd
    db 0x8b, 0xd0    ; mov edx, eax
    mov ax, 0x203
    int 0x31
    jae short loc_8c1ce
    call 0x61f7f
    jmp short loc_8c1ce
loc_8c1ec:
    popad
    ret
loc_8c1ee:
    push es
    pushad
    call 0x5ab50
    db 0x32, 0xe4    ; xor ah, ah
    push eax
    call 0x62160
    mov ax, word [0xd2d0]
    mov word [0xb234], ax
    mov eax, dword [0xd2cc]
    mov dword [0x22ee64], eax
    popad
    pop es
    ret
loc_8c216:
    push es
    pushad
    call 0x621c6
    mov word [0xb234], 0
    popad
    pop es
    ret
    pushad
    push es
    push eax
    mov dword [0xd2e0], eax
    mov dword [0xd2e4], ebx
    mov dword [0xd2e8], ecx
    mov dword [0xd2ec], edx
    mov dword [0xd2f0], esi
    mov dword [0xd2f4], edi
    mov dword [0xd2f8], ebp
    mov ax, word [0xd2d0]
    mov word [0xd300], ax
    mov ax, word [0xd2dc]
    mov word [0xd30a], ax
    mov eax, dword [0xd2d8]
    mov dword [0xd2fc], eax
    db 0x66, 0x8c, 0x1d, 0x02, 0xd3, 0x00, 0x00    ; mov word [0xd302], ds
    db 0x66, 0x8c, 0x05, 0x04, 0xd3, 0x00, 0x00    ; mov word [0xd304], es
    db 0x66, 0x8c, 0x25, 0x06, 0xd3, 0x00, 0x00    ; mov word [0xd306], fs
    db 0x66, 0x8c, 0x2d, 0x08, 0xd3, 0x00, 0x00    ; mov word [0xd308], gs
    pushfd
    pop eax
    mov dword [0xd30c], eax
    pop eax
    cmp dword [0xd2bc], 0
    je short loc_8c2c1
    mov eax, dword [0xd2cc]
    push eax
    push ebp
    db 0x8b, 0xec    ; mov ebp, esp
    call loc_8c1ee
    call dword [0xd2bc]
    call loc_8c216
    pop ebp
    add esp, 4
loc_8c2c1:
    call 0x61f5c
    pop es
    popad
    jmp dword [0xd2cc]
    call loc_8c1c6
    pushad
    push es
    call 0x61f39
    db 0x66, 0x0b, 0xc0    ; or ax, ax
    pop es
    popad
    je short loc_8c2e2
    retf
loc_8c2e2:
    push ebp
    db 0x8b, 0xec    ; mov ebp, esp
    push ds
    push es
    pushad
    lea edi, [0xd2c0]
    push ds
    pop es
    push ss
    pop ds
    lea esi, [ebp + 4]
    mov ecx, 0x10
    db 0xf3, 0x66, 0xa5    ; rep movsw word [es:edi], word [esi]
    mov di, cs
    mov word [ebp + 0x14], di
    mov edi, 0x7c229
    mov dword [ebp + 0x10], edi
    popad
    pop es
    pop ds
    pop ebp
    retf
    push ebp
    db 0x8b, 0xec    ; mov ebp, esp
    pushad
    push ds
    push es
    cld
    call 0x61f6a
    db 0x8b, 0xf0    ; mov esi, eax
    db 0x33, 0xc0    ; xor eax, eax
loc_8c321:
    lodsb
    db 0x33, 0xdb    ; xor ebx, ebx
    db 0x8a, 0xd8    ; mov bl, al
    cmp bl, 0xff
    je short loc_8c35f
    mov ax, 0x202
    int 0x31
    jae short loc_8c33e
    call 0x61f94
    add si, 6
    jmp short loc_8c321
loc_8c33e:
    mov word [esi], cx
    mov dword [esi + 2], edx
    add si, 6
    mov cx, cs
    mov edx, 0x7c2ce
    mov ax, 0x203
    int 0x31
    jae short loc_8c321
    call 0x61f8d
    jmp short loc_8c321
loc_8c35f:
    pop es
    pop ds
    popad
    pop ebp
    ret
    db 0x66, 0x8c, 0x1d, 0x5b, 0xd3, 0x00, 0x00    ; mov word [0xd35b], ds
    db 0x66, 0x8c, 0x15, 0x5d, 0xd3, 0x00, 0x00    ; mov word [0xd35d], ss
    ret
    db 0x8b, 0xc4    ; mov eax, esp
    sub eax, 4
    ret
loc_8c379:
    cmp byte [0xd35a], 0
    je short loc_8c385
    and ebx, 0xfffffffe
loc_8c385:
    ret
    db 0x8b, 0xdd    ; mov ebx, ebp
    call loc_8c379
    mov ebx, dword [ss:ebx]
    call loc_8c379
    db 0x8b, 0xc3    ; mov eax, ebx
    db 0x8b, 0xdc    ; mov ebx, esp
    add eax, dword [ss:ebx + 4]
    ret 4
    mov eax, dword [fs:4]
    ret
    mov eax, dword [fs:8]
    ret
    push ebp
    db 0x8b, 0xec    ; mov ebp, esp
    mov ecx, dword [ebp + 0x10]
    db 0x8b, 0xdd    ; mov ebx, ebp
    db 0x33, 0xc0    ; xor eax, eax
    mov al, byte [ebp + 8]
loc_8c3bb:
    db 0x0a, 0xc0    ; or al, al
    je short loc_8c3c2
    and ebx, 0xfffffffe
loc_8c3c2:
    db 0x3b, 0xd9    ; cmp ebx, ecx
    jge short loc_8c3ce
    mov ebx, dword [ebx]
    db 0x0b, 0xdb    ; or ebx, ebx
    jne short loc_8c3bb
    jmp short loc_8c3d7
loc_8c3ce:
    add ecx, dword [ebp + 0xc]
    db 0x3b, 0xcb    ; cmp ecx, ebx
    jle short loc_8c3d7
    inc ah
loc_8c3d7:
    db 0x32, 0xc0    ; xor al, al
    cwde
    db 0x8b, 0xe5    ; mov esp, ebp
    pop ebp
    ret 0xc
    push eax
    push ecx
    push es
    push edi
    mov cx, ss
    db 0x66, 0x8e, 0xc1    ; mov es, cx
    cld
    mov eax, 0x4d433335
    mov edi, dword [0x22ee74]
    sub edi, dword [0x22ee7c]
    add edi, 4
    and edi, 0xfffffffc
    db 0x8b, 0xcc    ; mov ecx, esp
    db 0x2b, 0xcf    ; sub ecx, edi
    sub ecx, 0x10
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword [es:edi], eax
    pop edi
    pop es
    pop ecx
    pop eax
    ret
    push es
    push edi
    push ecx
    cld
    mov ax, ss
    db 0x66, 0x8e, 0xc0    ; mov es, ax
    mov eax, 0x4d433335
    mov edi, dword [0x22ee74]
    sub edi, dword [0x22ee7c]
    add edi, 4
    and edi, 0xfffffffc
    mov ecx, 0xffffffff
    db 0xf3, 0xaf    ; repe scasd eax, dword [es:edi]
    db 0x8b, 0xc7    ; mov eax, edi
    pop ecx
    pop edi
    pop es
    ret
    add bl, al
    add byte [eax - 0x37fc71c], al
    sbb byte [ebx + eax - 0x80], dh
    cld
    adc bl, al
loc_8c450:
    push ax
    mov ax, es
    cmp word [0xb234], ax
    jne short loc_8c46f
    cmp dword [0x22ee64], edi
    jne short loc_8c46f
    mov word [0xb234], 0
loc_8c46f:
    pop ax
    ret
    push edx
    verr cx
    jne short loc_8c48a
    and ecx, 0xffff
    lsl edx, ecx
    jne short loc_8c48a
    db 0x3b, 0xfa    ; cmp edi, edx
    ja short loc_8c48a
    db 0x66, 0x2b, 0xd2    ; sub dx, dx
loc_8c48a:
    pop edx
    ret
loc_8c48c:
    db 0x32, 0xc0    ; xor al, al
    mov edi, dword [ss:ebx + 4]
    call loc_8c450
    je near loc_8c540
    cmp byte [edi - 5], 0xe8
    je near loc_8c53e
    cmp byte [edi - 3], 0xff
    jne short loc_8c4b7
    mov ah, byte [edi - 2]
    call 0x8c444
    je short loc_8c50a
loc_8c4b7:
    cmp byte [edi - 2], 0xff
    jne short loc_8c4c7
    mov ah, byte [edi - 1]
    call 0x8c444
    je short loc_8c53e
loc_8c4c7:
    cmp byte [edi - 4], 0xff
    jne short loc_8c4d7
    mov ah, byte [edi - 3]
    call 0x8c444
    je short loc_8c53e
loc_8c4d7:
    cmp byte [edi - 6], 0xff
    jne short loc_8c4e7
    mov ah, byte [edi - 5]
    call 0x8c444
    je short loc_8c53e
loc_8c4e7:
    call loc_8c450
    je short loc_8c540
    cmp byte [edi - 5], 0x9a
    je short loc_8c540
    cmp byte [edi - 3], 0xe8
    jne short loc_8c50c
    cmp byte [edi - 4], 0xe
    je short loc_8c540
    cmp byte [edi - 4], 6
    je short loc_8c540
    jmp short loc_8c50c
    jmp short loc_8c540
loc_8c50a:
    jmp short loc_8c53e
loc_8c50c:
    cmp byte [edi - 3], 0xff
    jne short loc_8c51c
    mov ah, byte [edi - 2]
    call 0x8c444
    je short loc_8c540
loc_8c51c:
    cmp byte [edi - 4], 0xff
    jne short loc_8c52c
    mov ah, byte [edi - 3]
    call 0x8c444
    je short loc_8c540
loc_8c52c:
    cmp byte [edi - 2], 0xff
    jne short loc_8c53c
    mov ah, byte [edi - 1]
    call 0x8c444
    je short loc_8c540
loc_8c53c:
    jmp short loc_8c542
loc_8c53e:
    inc al
loc_8c540:
    inc al
loc_8c542:
    ret
    push ebp
    db 0x8b, 0xec    ; mov ebp, esp
    push es
    db 0x66, 0x8c, 0x05, 0x50, 0x4d, 0x01, 0x00    ; mov word [0x14d50], es
    push edi
    push ecx
    push edx
    cmp dword [0x14df8], 0
    je short loc_8c572
    push es
    db 0x66, 0x8e, 0x05, 0x50, 0x4d, 0x01, 0x00    ; mov es, word [0x14d50]
    mov eax, 0x80
    push eax
    call dword [0x14df8]
    add esp, 4
    pop es
loc_8c572:
    db 0x8b, 0xdd    ; mov ebx, ebp
    call loc_8c379
    db 0x33, 0xd2    ; xor edx, edx
    db 0x33, 0xc9    ; xor ecx, ecx
    mov cx, cs
    db 0x66, 0x8e, 0xc1    ; mov es, cx
loc_8c583:
    cmp dword [ss:ebx + 4], 0x100
    jbe short loc_8c5fa
    cmp ebx, dword [0xd361]
    jae short loc_8c5fa
    inc edx
    call loc_8c48c
    db 0x32, 0xe4    ; xor ah, ah
    push ebx
    push edx
    push edi
    push es
    push ecx
    push eax
    db 0x66, 0x8e, 0x05, 0x50, 0x4d, 0x01, 0x00    ; mov es, word [0x14d50]
    cmp dword [0x14df8], 0
    je short loc_8c5b9
    call dword [0x14df8]
loc_8c5b9:
    pop eax
    pop ecx
    pop es
    pop edi
    pop edx
    pop ebx
    db 0x0a, 0xc0    ; or al, al
    je short loc_8c5fe
    cmp dword [ss:ebx], 1
    jbe short loc_8c5fa
    cmp ebx, dword [ss:ebx]
    jb short loc_8c5f0
    mov al, 3
    db 0x32, 0xe4    ; xor ah, ah
    cmp dword [0x14df8], 0
    je short loc_8c5fe
    push es
    db 0x66, 0x8e, 0x05, 0x50, 0x4d, 0x01, 0x00    ; mov es, word [0x14d50]
    push eax
    call dword [0x14df8]
    add esp, 4
    pop es
    jmp short loc_8c5fe
loc_8c5f0:
    mov ebx, dword [ss:ebx]
    call loc_8c379
    jmp short loc_8c583
loc_8c5fa:
    db 0x8b, 0xc2    ; mov eax, edx
    jmp short loc_8c603
loc_8c5fe:
    mov eax, 0xffffffff
loc_8c603:
    push eax
    cmp dword [0x14df8], 0
    je short loc_8c626
    mov eax, 0x81
    push es
    db 0x66, 0x8e, 0x05, 0x50, 0x4d, 0x01, 0x00    ; mov es, word [0x14d50]
    push eax
    call dword [0x14df8]
    add esp, 4
    pop es
    pop eax
loc_8c626:
    pop edx
    pop ecx
    pop edi
    pop es
    db 0x8b, 0xe5    ; mov esp, ebp
    pop ebp
    ret
