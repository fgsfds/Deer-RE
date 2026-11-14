bits 32
org 0x73657

loc_73657:
    push ebp
    mov ebp, esp
    test byte [0xb806], 0x10
    je short loc_7367c
    cmp byte [0xb890], 0
    je short loc_7367c
    mov word [0x23cabe], 0
    and byte [0xb888], 0xfe
loc_7367c:
    mov esp, ebp
    pop ebp
    ret
loc_73680:
    push ebp
    mov ebp, esp
    test byte [0xb806], 8
    je short loc_736a5
    cmp byte [0xb890], 0
    je short loc_736a5
    mov word [0x23cabc], 0
    and byte [0xb888], 0xfd
loc_736a5:
    mov esp, ebp
    pop ebp
    ret
loc_736a9:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    xor esi, esi
    cmp byte [0xb890], 0
    je near loc_73754
    test byte [0xb806], 0x10
    je short loc_736ef
    test byte [0xb888], 1
    sete al
    movzx eax, al
    test eax, eax
    je short loc_736ef
    cmp word [0x23cabe], 0
    je short loc_736ef
    or byte [0xb888], 1
    mov esi, 1
loc_736ef:
    test byte [0xb806], 8
    je short loc_73723
    test esi, esi
    jne short loc_73723
    test byte [0xb888], 2
    sete al
    movzx eax, al
    test eax, eax
    je short loc_73723
    cmp word [0x23cabc], 0
    je short loc_73723
    or byte [0xb888], 2
    mov esi, 2
loc_73723:
    test esi, esi
    je short loc_73754
    push 6
    call 0x63a9c
    cmp esi, 1
    jne short loc_7373a
    mov eax, dword [0xb737]
    jmp short loc_7373f
loc_7373a:
    mov eax, dword [0xb733]
loc_7373f:
    push eax
    call 0x6398f
    push eax
    push dword [0xb76f]
    call 0x734d7
    add esp, 0xc
loc_73754:
    mov eax, esi
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    call loc_73680
    jmp near loc_73657
    push esi
    xor esi, esi
    push 8
    call 0x62160
    cmp byte [0xb890], 0
    je short loc_7378c
    call 0x73490
    test eax, eax
    jne short loc_7378c
    call loc_736a9
    mov esi, eax
loc_7378c:
    call 0x621c6
    mov eax, esi
    pop esi
    ret
    or byte [0x22ee80], 4
    and byte [0x22ee80], 0xf7
    jmp near loc_73847
loc_737a8:
    push esi
    test byte [0x22ee80], 2
    setne al
    movzx esi, al
    or byte [0x22ee80], 2
    push 0xf
    call 0x63a9c
    mov eax, esi
    pop esi
    ret
    and byte [0x22ee80], 0xfd
    ret
    test byte [0x22ee80], 2
    setne al
    movzx eax, al
loc_737dd:
    ret
    test byte [0x22ee80], 1
    je short loc_737dd
    test byte [0x22ee80], 8
    je short loc_73823
    movzx ecx, word [0xb838]
    mov bl, byte [0x23cac0]
    movzx eax, bl
    cdq
    idiv ecx
    inc bl
    mov byte [0x23cac0], bl
    test edx, edx
    jne short loc_7383a
    call 0x8c413
    cmp eax, dword [0x22ee78]
    jb short loc_73835
    mov eax, dword [0x22ee78]
    jmp short loc_73835
loc_73823:
    call 0x8c373
    cmp eax, dword [0x22ee78]
    jb short loc_73835
    mov eax, dword [0x22ee78]
loc_73835:
    mov dword [0x22ee78], eax
loc_7383a:
    mov eax, dword [0x22ee78]
    cmp eax, dword [0x22ee74]
    ja short loc_737dd
loc_73847:
    push ebx
    call loc_737a8
    test eax, eax
    jne short loc_7386c
    inc byte [0xb887]
    cmp dword [0x1484c], 0
    je short loc_73866
    call dword [0x1484c]
loc_73866:
    dec byte [0xb887]
loc_7386c:
    pop ebx
    ret
    push ebp
    mov ebp, esp
    mov eax, dword [0x1484c]
    mov edx, dword [ebp + 8]
    mov dword [0x1484c], edx
    pop ebp
    ret 4
    mov eax, dword [0x1484c]
    ret
loc_73889:
    mov eax, dword [0x14850]
    call 0x64103
    test eax, eax
    jne short loc_738a5
    mov eax, 0x811c
    call 0x64103
    test eax, eax
    je short loc_738aa
loc_738a5:
    mov eax, 1
loc_738aa:
    test eax, eax
    jne short loc_738c4
    inc dword [0xd354]
    cmp dword [0xd354], 0x14
    jne short loc_738c4
    or byte [0xb888], 4
loc_738c4:
    ret
loc_738c5:
    test byte [0xb888], 4
    jne short loc_738c4
    call loc_73889
    test eax, eax
    je short loc_738c4
    call 0x629c5
    or byte [0xb888], 4
    push 0xb806
    call 0x82348
    add esp, 4
    mov al, byte [0x14854]
    test al, al
    jbe short loc_738ff
    cmp al, 0x1a
    je short loc_7390f
    jmp short loc_73908
loc_738ff:
    and byte [0xb806], 0xbf
    jmp short loc_7390f
loc_73908:
    or byte [0xb806], 0x40
loc_7390f:
    mov al, byte [0x14858]
    test al, al
    jbe short loc_7391e
    cmp al, 0x1a
    je short loc_7392e
    jmp short loc_73927
loc_7391e:
    and byte [0xb807], 0xf7
    jmp short loc_7392e
loc_73927:
    or byte [0xb807], 8
loc_7392e:
    mov al, byte [0x1485c]
    test al, al
    jbe short loc_7393d
    cmp al, 0x1a
    je short loc_7394d
    jmp short loc_73946
loc_7393d:
    and byte [0xb807], 0x7f
    jmp short loc_7394d
loc_73946:
    or byte [0xb807], 0x80
loc_7394d:
    test byte [0xb807], 0x80
    jne short loc_73964
    mov byte [0xd430], 0
    mov byte [0x14860], 1
loc_73964:
    mov ax, word [0x14864]
    test ax, ax
    jbe short loc_73977
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    je short loc_73993
    jmp short loc_73980
loc_73977:
    and byte [0x22ee80], 0xf7
    jmp short loc_73993
loc_73980:
    mov ax, word [0x14864]
    mov word [0xb838], ax
    or byte [0x22ee80], 8
loc_73993:
    mov ax, word [0x14868]
    cmp ax, 0xff1a
    je short loc_739a5
    mov word [0xb836], ax
loc_739a5:
    mov al, byte [0x1486c]
    test al, al
    jbe short loc_739b4
    cmp al, 0x1a
    je short loc_739c4
    jmp short loc_739bd
loc_739b4:
    and byte [0xb807], 0xef
    jmp short loc_739c4
loc_739bd:
    or byte [0xb807], 0x10
loc_739c4:
    mov al, byte [0x14870]
    test al, al
    jbe short loc_739d3
    cmp al, 0x1b
    je short loc_739e3
    jmp short loc_739dc
loc_739d3:
    and byte [0xb807], 0xbf
    jmp short loc_739e3
loc_739dc:
    or byte [0xb807], 0x40
loc_739e3:
    mov al, byte [0xabb5]
    test al, al
    jbe short loc_739f2
    cmp al, 0x1a
    je short loc_73a02
    jmp short loc_739fb
loc_739f2:
    and byte [0xb807], 0xdf
    jmp short loc_73a02
loc_739fb:
    or byte [0xb807], 0x20
loc_73a02:
    cmp word [0xb836], 0x50
    jae short loc_73a15
    mov word [0xb836], 0x50
loc_73a15:
    movzx eax, word [0xb836]
    mov dword [0x22ee7c], eax
    mov edx, eax
    mov eax, dword [0x22ee70]
    add eax, edx
    mov dword [0x22ee74], eax
    test byte [0xb806], 0x20
    jne short loc_73a51
    and byte [0xb807], 0xf7
    mov word [0xb836], 0
    mov word [0xb838], 0
loc_73a51:
    or byte [0xb807], 2
    test byte [0xb806], 0x40
    je near loc_738c4
    push 0x8121
    push 0
    push dword [0x14848]
    call loc_73a81
    call 0x8c442
    jmp near 0x8248b
loc_73a81:
    push ebp
    mov ebp, esp
    push esi
    cmp dword [ebp + 8], 0
    je short loc_73a93
    push dword [ebp + 8]
    call 0x8248c
loc_73a93:
    inc byte [0xb894]
    cmp byte [0xb894], 1
    jne near loc_73caf
    mov byte [0xb892], 1
    call loc_738c5
    test byte [0xb807], 8
    je short loc_73ac2
    or byte [0x22ee80], 1
loc_73ac2:
    cmp word [0xb838], 0
    je short loc_73ad3
    or byte [0x22ee80], 8
loc_73ad3:
    test byte [0xb806], 1
    je near loc_73c92
    mov byte [0xb871], 0
    mov eax, dword [ebp + 0x10]
    mov dword [0xb860], eax
    mov dword [0xb869], eax
    mov eax, dword [ebp + 0xc]
    mov dword [0xb864], eax
    mov dword [0xb86d], eax
    inc byte [0xb891]
    inc byte [0xb887]
    call dword [0x14874]
    dec byte [0xb887]
    cmp word [0xb7d8], 0
    jne short loc_73b40
    push dword [0xb747]
    call 0x734d7
    add esp, 4
    mov dword [0xb877], 0xffffffff
    pop esi
    pop ebp
    ret 0xc
loc_73b40:
    and byte [0xb806], 0xe3
    or byte [0xb806], 4
    mov eax, 0x8129
    call 0x64103
    test eax, eax
    je short loc_73b63
    and byte [0xb808], 0xfe
loc_73b63:
    test byte [0xb808], 1
    je short loc_73b80
    cmp dword [0xd2bc], 0
    je short loc_73b80
    push dword [0xd2bc]
    call 0x61ee1
loc_73b80:
    test byte [0x22ee80], 1
    je short loc_73b8e
    call 0x8c3e0
loc_73b8e:
    cmp dword [0xd42c], 0
    je short loc_73ba4
    push 0
    push 0
    call dword [0xd42c]
    add esp, 8
loc_73ba4:
    push 0x16
    test byte [0xb807], 2
    setne al
    movzx eax, al
    push eax
    push 0xb812
    movzx eax, word [0xb80a]
    push eax
    call 0x75d54
    mov esi, eax
    test eax, eax
    je short loc_73c0a
    cmp eax, 7
    jne short loc_73be4
    push dword [0xb79f]
    call 0x734d7
    add esp, 4
    pop esi
    pop ebp
    ret 0xc
loc_73be4:
    push 9
    call 0x63a9c
    push esi
    push 0x8134
    call 0x6398f
    push eax
    push dword [0xb79b]
    call 0x734d7
    add esp, 0x10
    pop esi
    pop ebp
    ret 0xc
loc_73c0a:
    call 0x75ef4
    test eax, eax
    je short loc_73c2a
    test byte [0xb807], 1
    je short loc_73c2a
    push dword [0xb797]
    call 0x734d7
    add esp, 4
loc_73c2a:
    push 0x8146
    call 0x5ac04
    add esp, 4
    push 0xb7da
    push 0x50
    push 3
    push dword [0xb743]
    call 0x734d7
    add esp, 0x10
    test byte [0xb806], 1
    setne al
    mov byte [0xb890], al
    call loc_73680
    call loc_73657
    cmp byte [0xb872], 0
    je short loc_73c7b
    push dword [ebp + 0x10]
    push dword [ebp + 0xc]
    call 0x5d849
loc_73c7b:
    push 0
    call 0x62160
    call 0x621c6
    dec byte [0xb891]
    pop esi
    pop ebp
    ret 0xc
loc_73c92:
    cmp dword [0xd2bc], 0
    je short loc_73caf
    cmp byte [0xabb4], 0
    je short loc_73caf
    push dword [0xd2bc]
    call 0x61ee1
loc_73caf:
    pop esi
    pop ebp
    ret 0xc
    test byte [0xb888], 0x80
    je short loc_73cc4
    and byte [0xb806], 0xf7
loc_73cc4:
    push 1
    call 0x62160
    cmp byte [0xb890], 0
    je near loc_73d74
    cmp byte [0xd358], 0
    jne near loc_73d74
    test byte [0xb889], 1
    sete al
    movzx eax, al
    test eax, eax
    je near loc_73d74
    test byte [0xb806], 0x40
    sete al
    movzx eax, al
    test eax, eax
    jne short loc_73d14
    test byte [0xb888], 0x80
    je short loc_73d74
loc_73d14:
    mov byte [0xd358], 1
    push 1
    call 0x82629
    call 0x75de5
    call 0x81ea5
    inc byte [0xb887]
    call dword [0xbe48]
    dec byte [0xb887]
    call 0x81d47
    test byte [0xb889], 4
    je short loc_73d58
    call 0x8c1c6
    and byte [0xb889], 0xfb
loc_73d58:
    mov byte [0xb890], 0
    and byte [0xb888], 0xfb
    mov byte [0xb894], 0
    mov byte [0xd358], 0
loc_73d74:
    call 0x621c6
    mov eax, dword [0xb877]
    ret
loc_73d7f:
    push ebp
    mov ebp, esp
    movzx eax, word [0xb80c]
loc_73d89:
    cmp eax, dword [ebp + 8]
    seta al
    pop ebp
    ret 4
loc_73d93:
    push ebp
    mov ebp, esp
    movzx eax, word [0xb80e]
    jmp short loc_73d89
    push ebp
    mov ebp, esp
    push esi
    push dword [ebp + 0xc]
    call loc_73d7f
    test al, al
    jne short loc_73dbb
    push dword [ebp + 0xc]
    call loc_73d93
    test al, al
    je short loc_73dc2
loc_73dbb:
    mov eax, 1
    jmp short loc_73dc4
loc_73dc2:
    xor eax, eax
loc_73dc4:
    mov esi, eax
    test eax, eax
    je short loc_73df7
    mov eax, dword [ebp + 8]
    cmp eax, dword [0xb71b]
    setne al
    movzx eax, al
    inc eax
    push eax
    call 0x63a9c
    push dword [ebp + 8]
    call 0x6398f
    push eax
    push dword [0xb75f]
    call 0x734d7
    add esp, 0xc
loc_73df7:
    mov eax, esi
    pop esi
    pop ebp
    ret 0xc
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x18
    mov edi, eax
    xor esi, esi
    push 0x4e
    call 0x62160
    call 0x620e8
    test al, al
    jne short loc_73e28
    mov eax, edi
    call 0x8266e
    mov esi, eax
    jmp short loc_73e3c
loc_73e28:
    push edi
    push 0x4e
    lea eax, [ebp - 0x2c]
    push eax
    call 0x63c20
    cmp eax, 1
    jne short loc_73e3c
    mov esi, dword [ebp - 0x22]
loc_73e3c:
    call 0x621c6
    mov eax, esi
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
