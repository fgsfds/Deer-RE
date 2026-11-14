bits 32
org 0x63543

    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    push eax
    push eax
    mov esi, eax
    mov edi, edx
    mov dword [ebp - 0x10], ebx
    push 0x1a
    call 0x62160
    push esi
    push dword [0xb71f]
    push 1
    call 0x6224c
    push edi
    push dword [0xb71b]
    push 0
    call 0x6224c
    push dword [ebp - 0x10]
    push dword [0xb71b]
    push 0
    call 0x6224c
    mov ebx, dword [ebp - 0x10]
    mov edx, edi
    mov eax, esi
    call 0x63d72
    mov edi, eax
    mov dword [ebp - 0x14], eax
    call 0x6211f
    test al, al
    je short loc_635af
    push esi
    push -6
    inc edi
    push edi
    push 4
    push 0x1a
    push 0
    call 0x6236d
loc_635af:
    call 0x621c6
    mov eax, dword [ebp - 0x14]
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
    add cl, ch
    sbb dword [ecx + eax], esp
    add cl, ch
    cdq
    and eax, 0x89550001
    in eax, 0x83
    in al, dx
    or al, 0x83
    cmp eax, 0xbe64
    add byte [esp + eax*2 - 0x75], dh
    inc ebp
    or byte [ecx + 0x45c7f445], cl
    clc
    push 0xc70000be
    inc ebp
    cld
    add byte [eax], al
    add byte [eax], al
    test eax, eax
    jne short loc_63610
    cmp dword [0xbe68], 0
    je short loc_63610
    push 0x6ce8
    call 0x7349e
    mov dword [0xbe64], 0
    jmp short loc_6361d
loc_63610:
    lea eax, [ebp - 0xc]
    push eax
    call dword [0xbe64]
    add esp, 4
loc_6361d:
    mov esp, ebp
    pop ebp
    ret 4
    push ebp
    mov ebp, esp
    mov eax, dword [ebp + 8]
    mov dword [0xbe64], eax
    pop ebp
    ret 4
loc_63632:
    push ebp
    mov ebp, esp
    mov ebx, dword [ebp + 8]
    mov eax, ebx
    call 0x61c2a
    movzx eax, al
    lea edx, [eax + ebx]
loc_63645:
    test eax, eax
    je short loc_63651
    dec edx
    dec eax
    cmp byte [edx], 0x5c
    jne short loc_63645
    inc eax
loc_63651:
    add eax, ebx
    pop ebp
    ret 4
loc_63657:
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword [ebp + 0x14]
    mov edx, ds
    mov ecx, 0x16
    xor ebx, ebx
    mov eax, esi
    call 0x75cc3
    mov al, byte [ebp + 0x10]
    mov byte [esi + 4], al
    mov eax, dword [ebp + 0xc]
    mov dword [esi], eax
    mov eax, dword [ebp + 8]
    mov dword [esi + 0xa], eax
    mov eax, dword [0xb850]
    mov dword [esi + 6], eax
    push dword [0xb869]
    call loc_63632
    mov dword [esi + 0xe], eax
    mov eax, dword [0xb86d]
    mov dword [esi + 0x12], eax
    cmp byte [0xb872], 0
    je short loc_636aa
    or byte [esi + 5], 1
loc_636aa:
    movzx eax, byte [ebp + 0x10]
    push eax
    call loc_6390c
    test eax, eax
    jne short loc_636bc
    or byte [esi + 5], 4
loc_636bc:
    pop esi
    pop ebp
    ret 0x10
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x1c
    lea edi, [ebp - 0x24]
    push edi
    movzx eax, byte [ebp + 0x10]
    push eax
    push dword [ebp + 0xc]
    push dword [ebp + 8]
    call loc_63657
    push dword [ebp - 0x24]
    lea eax, [ebp - 0x24]
    push eax
    call 0x75df9
    mov esi, eax
    mov dword [ebp - 0xc], eax
    test eax, eax
    je short loc_63721
    cmp eax, 3
    je near loc_637a1
    push 9
    call loc_63a9c
    push esi
    push 0x6d20
    call loc_6398f
    push eax
    push dword [0xb79b]
    call 0x734d7
    add esp, 0x10
    jmp near loc_637a1
loc_63721:
    inc dword [0xb854]
    test byte [ebp - 0x1f], 4
    jne short loc_63774
    push dword [ebp + 0xc]
    call loc_63ac0
    push dword [ebp + 0xc]
    push dword [ebp + 8]
    call loc_63adb
    movzx eax, byte [0xb810]
    add eax, eax
    mov esi, dword [ebp + 8]
    sub esi, eax
    add dword [0xb83c], esi
    mov esi, dword [0xb83c]
    sub esi, dword [0xb840]
    mov dword [0xb844], esi
    cmp esi, dword [0xb848]
    jbe short loc_63774
    mov dword [0xb848], esi
loc_63774:
    cmp dword [0xd42c], 0
    je short loc_637a1
    push edi
    inc byte [0xb887]
    call loc_63a52
    push edi
    push 1
    call dword [0xd42c]
    add esp, 8
    push edi
    call loc_63a79
    dec byte [0xb887]
loc_637a1:
    mov eax, dword [ebp - 0xc]
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 0xc
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    mov esi, dword [ebp + 8]
    cmp byte [esi + 4], 4
    je short loc_63814
    cmp byte [esi + 4], 0x56
    je short loc_63814
    movzx eax, byte [0xb810]
    add eax, eax
    mov ebx, dword [esi + 0xa]
    sub ebx, eax
    add dword [0xb840], ebx
    test byte [0xb806], 0x80
    je short loc_6380d
    test byte [0xb888], 0x10
    sete al
    movzx eax, al
    test eax, eax
    je short loc_6380d
    mov ecx, 0x8000
    cmp ecx, dword [esi + 0xa]
    jbe short loc_637fd
    mov ecx, dword [esi + 0xa]
loc_637fd:
    movzx ebx, byte [0xb83b]
    mov edx, ds
    mov eax, dword [esi]
    call 0x75cc3
loc_6380d:
    and byte [0xb888], 0xef
loc_63814:
    push dword [esi]
    call 0x75e36
    mov edi, eax
    mov dword [ebp - 0xc], eax
    test eax, eax
    je short loc_63847
    push 9
    call loc_63a9c
    push edi
    push 0x6d34
    call loc_6398f
    push eax
    push dword [0xb79b]
    call 0x734d7
    add esp, 0x10
    jmp short loc_6387a
loc_63847:
    inc dword [0xb858]
    cmp dword [0xd42c], 0
    je short loc_6387a
    push esi
    inc byte [0xb887]
    call loc_63a52
    push esi
    push 2
    call dword [0xd42c]
    add esp, 8
    push esi
    call loc_63a79
    dec byte [0xb887]
loc_6387a:
    mov eax, dword [ebp - 0xc]
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    push ebp
    mov ebp, esp
    push esi
    sub esp, 0x18
    xor esi, esi
    lea eax, [ebp - 0x1c]
    mov dword [0xb883], eax
    push dword [ebp + 0xc]
    push eax
    call 0x75e80
    test eax, eax
    je short loc_638c6
    cmp eax, 1
    jne short loc_638cb
    call 0x75eac
    test eax, eax
    jne short loc_638cb
    mov eax, dword [0xb883]
    mov ebx, dword [eax]
    cmp ebx, dword [ebp + 0xc]
    ja short loc_638cb
    add ebx, dword [eax + 0xa]
    cmp ebx, dword [ebp + 0xc]
    jbe short loc_638cb
loc_638c6:
    mov esi, 1
loc_638cb:
    test esi, esi
    je short loc_638e3
    push 0x16
    mov ecx, ds
    mov ebx, dword [0xb883]
    mov edx, ds
    mov eax, dword [ebp + 8]
    call 0x62a66
loc_638e3:
    mov eax, esi
    lea esp, [ebp - 4]
    pop esi
    pop ebp
    ret 8
loc_638ed:
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword [ebp + 8]
    or byte [esi + 5], 8
    push dword [esi]
    call 0x75e36
    push dword [esi]
    push esi
    call 0x75df9
    pop esi
    pop ebp
    ret 4
loc_6390c:
    push ebp
    mov ebp, esp
    mov al, byte [ebp + 8]
    cmp al, 4
    jb short loc_63928
    cmp al, 5
    jbe short loc_63922
    cmp al, 0x56
    jb short loc_63928
    cmp al, 0x59
    ja short loc_63928
loc_63922:
    xor eax, eax
    pop ebp
    ret 4
loc_63928:
    mov eax, 1
    pop ebp
    ret 4
    push ebp
    mov ebp, esp
    push dword [ebp + 8]
    call loc_639e4
    pop ebp
    ret 4
loc_63940:
    cmp byte [0xb872], 0
    jne short loc_6394f
    mov eax, dword [0xb72b]
    ret
loc_6394f:
    cmp byte [0xb891], 1
    jbe short loc_6395e
    mov eax, dword [0xb73b]
    ret
loc_6395e:
    mov eax, dword [0xb72f]
    ret
loc_63964:
    push ebp
    mov ebp, esp
    push dword [ebp + 8]
    push dword [ebp + 0xc]
    cmp dword [ebp + 8], 0
    je short loc_6397a
    mov eax, 0x6d48
    jmp short loc_6397f
loc_6397a:
    mov eax, 0x6d4f
loc_6397f:
    push eax
    push dword [ebp + 0x10]
    call 0x75f3e
    add esp, 0x10
    pop ebp
    ret 0xc
loc_6398f:
    push ebp
    mov ebp, esp
    sub esp, 0x20
    lea eax, [ebp - 0x20]
    push eax
    push dword [0xb869]
    call loc_63632
    push eax
    push dword [0xb86d]
    call loc_63964
    lea eax, [ebp - 0x20]
    push eax
    call loc_63940
    push eax
    call 0x5ab50
    movzx eax, al
    push eax
    call 0x5ab7a
    push eax
    push 0x6d57
    push 0x22ef70
    call 0x75f3e
    add esp, 0x14
    mov eax, 0x22ef70
    mov esp, ebp
    pop ebp
    ret
loc_639e4:
    push ebp
    mov ebp, esp
    push esi
    sub esp, 0x20
    mov esi, dword [ebp + 8]
    lea eax, [ebp - 0x24]
    push eax
    push dword [esi + 0xe]
    push dword [esi + 0x12]
    call loc_63964
    push esi
    call loc_63a52
    push dword [esi + 6]
    push dword [esi]
    push dword [esi + 0xa]
    lea eax, [ebp - 0x24]
    push eax
    test byte [esi + 5], 1
    je short loc_63a1c
    mov eax, dword [0xb72f]
    jmp short loc_63a21
loc_63a1c:
    mov eax, dword [0xb72b]
loc_63a21:
    push eax
    movzx eax, byte [esi + 4]
    push eax
    call 0x5ab7a
    push eax
    push 0x6d60
    push 0x22ef70
    call 0x75f3e
    add esp, 0x20
    push esi
    call loc_63a79
    mov eax, 0x22ef70
    lea esp, [ebp - 4]
    pop esi
    pop ebp
    ret 4
loc_63a52:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp + 8]
    test byte [eax + 5], 6
    jne short loc_63a75
    movzx edx, byte [0xb810]
    lea ebx, [edx + edx]
    sub dword [eax + 0xa], ebx
    mov ebx, dword [eax]
    add ebx, edx
    mov dword [eax], ebx
    or byte [eax + 5], 2
loc_63a75:
    pop ebp
    ret 4
loc_63a79:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp + 8]
    test byte [eax + 5], 6
    je short loc_63a98
    movzx edx, byte [0xb810]
    lea ebx, [edx + edx]
    add dword [eax + 0xa], ebx
    sub dword [eax], edx
    and byte [eax + 5], 0xfd
loc_63a98:
    pop ebp
    ret 4
loc_63a9c:
    push ebp
    mov ebp, esp
    mov ecx, dword [ebp + 8]
    mov dword [0xb873], ecx
    test ecx, ecx
    je short loc_63ab6
    dec ecx
    mov eax, 1
    shl eax, cl
    mov ecx, eax
loc_63ab6:
    or dword [0xb877], ecx
    pop ebp
    ret 4
loc_63ac0:
    push ebp
    mov ebp, esp
    movzx ebx, byte [0xb810]
    mov edx, 0x529b5
    mov eax, dword [ebp + 8]
    call 0x73632
    pop ebp
    ret 4
loc_63adb:
    push ebp
    mov ebp, esp
    movzx eax, byte [0xb810]
    mov edx, dword [ebp + 8]
    sub edx, eax
    mov eax, edx
    add eax, dword [ebp + 0xc]
    push eax
    call loc_63ac0
    pop ebp
    ret 8
loc_63af9:
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword [ebp + 8]
    cmp byte [0xb810], 2
    jne short loc_63b1e
    mov ax, word [esi]
    cmp ax, word [0x529b5]
    setne al
    movzx eax, al
    pop esi
    pop ebp
    ret 4
loc_63b1e:
    movzx eax, byte [0xb810]
    push eax
    mov edx, ds
    mov ecx, ds
    mov ebx, 0x529b5
    mov eax, esi
    call 0x75f6e
    pop esi
    pop ebp
    ret 4
loc_63b3b:
    push ebp
    mov ebp, esp
    movzx eax, byte [0xb810]
    mov edx, dword [ebp + 8]
    sub edx, eax
    mov eax, edx
    add eax, dword [ebp + 0xc]
    push eax
    call loc_63af9
    pop ebp
    ret 8
loc_63b59:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0xc
    mov esi, dword [ebp + 0x10]
    mov dword [ebp - 0x14], 0
    test byte [esi + 5], 4
    jne near loc_63c14
    mov eax, dword [0xb727]
    mov dword [ebp - 0xc], eax
    xor edi, edi
loc_63b7f:
    inc edi
    cmp edi, 3
    je near loc_63c14
    cmp edi, 1
    jne short loc_63b97
    push dword [esi]
    call loc_63af9
    jmp short loc_63ba1
loc_63b97:
    push dword [esi]
    push dword [esi + 0xa]
    call loc_63b3b
loc_63ba1:
    mov dword [ebp - 0x10], eax
    cmp dword [ebp - 0x10], 0
    je short loc_63c01
    mov eax, dword [ebp - 0xc]
    cmp eax, dword [0xb723]
    sete al
    movzx eax, al
    add eax, 3
    push eax
    call loc_63a9c
    mov byte [0xb893], 2
    push dword [ebp - 0xc]
    push dword [ebp + 0xc]
    call loc_6398f
    push eax
    push dword [0xb74b]
    call 0x734d7
    add esp, 0x10
    push esi
    call loc_639e4
    push eax
    push dword [ebp + 0xc]
    push dword [0xb74f]
    call 0x734d7
    add esp, 0xc
    push esi
    call loc_638ed
loc_63c01:
    mov eax, dword [0xb723]
    mov dword [ebp - 0xc], eax
    mov eax, dword [ebp - 0x10]
    or dword [ebp - 0x14], eax
    jmp near loc_63b7f
loc_63c14:
    mov eax, dword [ebp - 0x14]
loc_63c17:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 0xc
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x20
    mov edi, dword [ebp + 0x10]
    xor esi, esi
    movzx eax, byte [ebp + 0xc]
    mov dword [ebp - 0xc], eax
    push eax
    push edi
    push dword [0xb717]
    call 0x73d9f
    test eax, eax
    jne near loc_63d58
    push dword [ebp - 0xc]
    call loc_6390c
    test eax, eax
    je short loc_63c65
    movzx eax, byte [0xb810]
    mov ebx, edi
    sub ebx, eax
    mov dword [ebp - 0x10], ebx
    jmp short loc_63c68
loc_63c65:
    mov dword [ebp - 0x10], edi
loc_63c68:
    lea eax, [ebp - 0x28]
    mov dword [0xb883], eax
    push dword [ebp - 0x10]
    push eax
    call 0x75e80
    test eax, eax
    je near loc_63d25
    cmp byte [0xd430], 0
    je short loc_63cb5
    test byte [0xb807], 0x80
    je near loc_63d1e
    cmp byte [0xd430], 0
    je near loc_63d1e
    mov edx, 1
    mov eax, edi
    call 0x75f93
    cmp eax, 1
    je short loc_63d1e
loc_63cb5:
    push 0xb
    call loc_63a9c
    push edi
    call loc_6398f
    push eax
    push dword [0xb763]
    call 0x734d7
    add esp, 0xc
    cmp dword [0xd434], 0
    je near loc_63d58
    push edi
    inc byte [0xb887]
    call dword [0xd434]
    add esp, 4
    test eax, eax
    je short loc_63cfc
    push 0x6d7f
    call 0x75ff0
loc_63cfc:
    push dword [ebp - 0x10]
    call dword [0xd434]
    add esp, 4
    test eax, eax
    je short loc_63d16
    push 0x6d9a
    call 0x75ff0
loc_63d16:
    dec byte [0xb887]
    jmp short loc_63d58
loc_63d1e:
    mov esi, 2
    jmp short loc_63d58
loc_63d25:
    push 0x16
    lea ebx, [ebp - 0x28]
    mov ecx, ds
    mov edx, ds
    mov eax, dword [ebp + 8]
    call 0x62a66
    movzx esi, byte [ebp + 0xc]
    push esi
    call loc_6390c
    test eax, eax
    je short loc_63d53
    push dword [ebp + 8]
    push dword [0xb71f]
    push esi
    call loc_63b59
loc_63d53:
    mov esi, 1
loc_63d58:
    mov eax, esi
    jmp near loc_63c17
