bits 32
org 0x81735

    xor eax, eax
    ret
loc_81738:
    push ebp
    mov ebp, esp
    mov ebx, dword [ebp + 8]
    mov edx, ebx
    mov eax, 0x8568
loc_81745:
    call 0x642be
    mov edx, ebx
    mov eax, dword [ebp + 0xc]
    call 0x642be
    pop ebp
    ret 8
loc_81758:
    push ebp
    mov ebp, esp
    mov ebx, dword [ebp + 8]
    mov edx, ebx
    mov eax, 0x856b
    jmp short loc_81745
loc_81767:
    push ebp
    mov ebp, esp
    test byte [0xb807], 0x10
    setne al
    movzx eax, al
    test eax, eax
    je short loc_8178d
    mov eax, dword [0x14ce0]
    mov edx, dword [ebp + 8]
    call 0x5db41
    mov dword [0x23eefc], eax
loc_8178d:
    pop ebp
    ret 4
loc_81791:
    push ebp
    mov ebp, esp
    push esi
    sub esp, 0x100
    test byte [0xb807], 0x10
    setne al
    movzx eax, al
    test eax, eax
    je near loc_81d41
    mov byte [0x23ef00], 1
    push 0x8571
    call loc_81767
    mov dword [0x23eefc], eax
    test eax, eax
    jne short loc_817d9
    mov dword [0x23eefc], 0xaeb8
    jmp near loc_81d41
loc_817d9:
    xor eax, eax
    call 0x88a13
    mov dword [ebp - 8], eax
    lea eax, [ebp - 8]
    call 0x88b7b
    push eax
    push 0x8573
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0xc
    mov edx, dword [0x23eefc]
    lea eax, [ebp - 0x104]
    call 0x642be
    push 0x85a3
    push dword [0x23eefc]
    call loc_81738
    cmp dword [0xabc8], 0
    je near loc_818f0
    mov eax, dword [0xabc8]
    push dword [eax]
    push 0x85e4
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0xc
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81738
    cmp dword [0xabc4], 1
    jle short loc_818c0
    push 0x85f1
    push dword [0x23eefc]
    call loc_81758
    mov ecx, 1
    mov esi, 4
    jmp short loc_818a8
loc_81880:
    mov edx, dword [0x23eefc]
    mov eax, 0x85ff
    call 0x642be
    mov edx, dword [0x23eefc]
    mov ebx, dword [0xabc8]
    mov eax, dword [esi + ebx]
    call 0x642be
    add esi, 4
    inc ecx
loc_818a8:
    cmp ecx, dword [0xabc4]
    jl short loc_81880
    mov edx, dword [0x23eefc]
    mov eax, 0x8601
    call 0x642be
loc_818c0:
    push 0x8603
    push 0x8608
    push 0x8618
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0x10
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
loc_818f0:
    push 0x8630
    push 0x8646
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0xc
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
    push 0x8654
    push dword [0x23eefc]
    call loc_81738
    movzx eax, word [0xb80e]
    push eax
    test byte [0xb806], 8
    je short loc_81943
    mov eax, 0x866f
    jmp short loc_81948
loc_81943:
    mov eax, 0x8672
loc_81948:
    push eax
    push 0x8676
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0x10
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
    movzx eax, word [0xb80c]
    push eax
    test byte [0xb806], 0x10
    je short loc_81987
    mov eax, 0x866f
    jmp short loc_8198c
loc_81987:
    mov eax, 0x8672
loc_8198c:
    push eax
    push 0x86a2
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0x10
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
    push 0x86ce
    push dword [0x23eefc]
    call loc_81738
    test byte [0xb806], 0x20
    je short loc_819d3
    mov eax, 0x86df
    jmp short loc_819d8
loc_819d3:
    mov eax, 0x86e3
loc_819d8:
    push eax
    mov eax, dword [0x22ee6c]
    sub eax, dword [0x22ee70]
    push eax
    push eax
    push 0x86e6
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0x14
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
    test byte [0xb807], 8
    je short loc_81a1c
    mov eax, 0x86df
    jmp short loc_81a21
loc_81a1c:
    mov eax, 0x86e3
loc_81a21:
    push eax
    push 0x871a
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0xc
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
    test byte [0xb807], 8
    je short loc_81a85
    movzx eax, word [0xb836]
    push eax
    push 0x872f
    lea eax, [ebp - 0x3c]
    push eax
    call 0x5d8cc
    add esp, 0xc
    movzx eax, word [0xb838]
    push eax
    push 0x8738
    lea eax, [ebp - 0x28]
    push eax
    call 0x5d8cc
    add esp, 0xc
    jmp short loc_81a9f
loc_81a85:
    mov edx, 0x873b
    lea eax, [ebp - 0x3c]
    call 0x61e18
    mov edx, 0x873b
    lea eax, [ebp - 0x28]
    call 0x61e18
loc_81a9f:
    lea eax, [ebp - 0x28]
    push eax
    lea eax, [ebp - 0x3c]
    push eax
    push 0x873f
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0x10
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
    test byte [0xb807], 0x80
    je short loc_81add
    mov eax, 0x866f
    jmp short loc_81ae2
loc_81add:
    mov eax, 0x8672
loc_81ae2:
    push eax
    push 0x876e
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0xc
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81738
    test byte [0xb807], 0x80
    je short loc_81b64
    cmp byte [0x14860], 0
    je short loc_81b22
    mov eax, 0x86df
    jmp short loc_81b27
loc_81b22:
    mov eax, 0x86e3
loc_81b27:
    push eax
    cmp byte [0xd430], 0
    je short loc_81b38
    mov eax, 0x86df
    jmp short loc_81b3d
loc_81b38:
    mov eax, 0x86e3
loc_81b3d:
    push eax
    push 0x878f
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0x10
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
loc_81b64:
    push 0x87bb
    push dword [0x23eefc]
    call loc_81738
    test byte [0xb807], 0x20
    je short loc_81b84
    mov eax, 0x87cb
    jmp short loc_81b89
loc_81b84:
    mov eax, 0x87d2
loc_81b89:
    push eax
    test byte [0xb806], 2
    je short loc_81b9a
    mov eax, 0x866f
    jmp short loc_81b9f
loc_81b9a:
    mov eax, 0x8672
loc_81b9f:
    push eax
    test byte [0xb806], 0x40
    je short loc_81bb0
    mov eax, 0x866f
    jmp short loc_81bb5
loc_81bb0:
    mov eax, 0x8672
loc_81bb5:
    push eax
    push 0x87d8
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0x14
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
    test byte [0xb807], 1
    je short loc_81bec
    mov eax, 0x880a
    jmp short loc_81bf1
loc_81bec:
    mov eax, 0x880f
loc_81bf1:
    push eax
    push dword [0x14850]
    push 0x8816
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0x10
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
    movzx eax, byte [0xb83b]
    push eax
    test byte [0xb806], 0x80
    je short loc_81c36
    mov eax, 0x86df
    jmp short loc_81c3b
loc_81c36:
    mov eax, 0x86e3
loc_81c3b:
    push eax
    push 0x8834
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0x10
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
    test byte [0xb808], 1
    je short loc_81c72
    mov eax, 0x866f
    jmp short loc_81c77
loc_81c72:
    mov eax, 0x8672
loc_81c77:
    push eax
    push 0x8864
    lea eax, [ebp - 0x104]
    push eax
    call 0x5d8cc
    add esp, 0xc
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81738
    mov edx, 0x887c
    lea eax, [ebp - 0x104]
    call 0x61e18
    xor ecx, ecx
    xor ebx, ebx
loc_81cb2:
    cmp byte [ebx + 0xd314], 0xff
    je short loc_81ce8
    movzx eax, byte [ebx + 0xd314]
    push eax
    push 0x8891
    lea eax, [ebp - 0x14]
    push eax
    call 0x5d8cc
    add esp, 0xc
    lea edx, [ebp - 0x14]
    lea eax, [ebp - 0x104]
    call 0x64185
    add ebx, 7
    inc ecx
    jmp short loc_81cb2
loc_81ce8:
    test ecx, ecx
    jne short loc_81cfc
    mov edx, 0x8898
    lea eax, [ebp - 0x104]
    call 0x64185
loc_81cfc:
    mov edx, 0x8601
    lea eax, [ebp - 0x104]
    call 0x64185
    lea eax, [ebp - 0x104]
    push eax
    push dword [0x23eefc]
    call loc_81758
    call 0x88b8d
    push 0x889d
    push dword [0x23eefc]
    call loc_81738
    test byte [0xb807], 0x20
    je short loc_81d41
    call loc_81e58
loc_81d41:
    lea esp, [ebp - 4]
    pop esi
    pop ebp
    ret
    push ebp
    mov ebp, esp
    test byte [0xb807], 0x10
    setne al
    movzx eax, al
    test eax, eax
    je short loc_81d6f
    mov eax, dword [0x23eefc]
    call 0x5dbf5
    mov dword [0x23eefc], 0
loc_81d6f:
    mov esp, ebp
    pop ebp
    ret
loc_81d73:
    push ebp
    mov ebp, esp
    push ebx
    sub esp, 0x104
    test byte [0xb807], 0x10
    setne al
    movzx eax, al
    test eax, eax
    jne short loc_81d95
    mov eax, 1
    jmp short loc_81dff
loc_81d95:
    cmp byte [0x23ef00], 0
    jne short loc_81da3
    call loc_81791
loc_81da3:
    cmp dword [0x23eefc], 0
    je short loc_81df2
    lea eax, [ebp + 0xc]
    mov dword [ebp - 8], eax
    lea ebx, [ebp - 8]
    mov edx, dword [ebp + 8]
    lea eax, [ebp - 0x108]
    call 0x63d72
    mov dword [ebp - 8], 0
    lea eax, [ebp - 0x108]
    push eax
    push 0x88e3
    push dword [0x23eefc]
    call 0x61e8c
    add esp, 0xc
    test byte [0xb807], 0x20
    je short loc_81df2
    call loc_81e58
loc_81df2:
    cmp dword [0x23eefc], 0
    sete al
    movzx eax, al
loc_81dff:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
loc_81e04:
    ret
    push ebp
    mov ebp, esp
    test byte [0xb807], 0x10
    setne al
    movzx eax, al
    test eax, eax
    je short loc_81e54
    cmp byte [0x23ef00], 0
    jne short loc_81e27
    call loc_81791
loc_81e27:
    cmp dword [0x23eefc], 0
    je short loc_81e54
    push dword [ebp + 8]
    push 0x88e3
    push dword [0x23eefc]
    call 0x61e8c
    add esp, 0xc
    test byte [0xb807], 0x20
    je short loc_81e54
    call loc_81e58
loc_81e54:
    pop ebp
    ret 4
loc_81e58:
    test byte [0xb807], 0x10
    setne al
    movzx eax, al
    test eax, eax
    je short loc_81e04
    cmp dword [0x23eefc], 0
    je short loc_81e04
    mov eax, dword [0x23eefc]
    jmp near 0x5aedd
    push ebp
    mov ebp, esp
    test byte [0xb807], 0x20
    setne al
    cmp byte [ebp + 8], 0
    je short loc_81e9a
    or byte [0xb807], 0x20
    pop ebp
    ret 4
loc_81e9a:
    and byte [0xb807], 0xdf
    pop ebp
    ret 4
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push eax
    test byte [0xb807], 0x10
    setne al
    movzx eax, al
    test eax, eax
    je near loc_81f8f
    push 0x88e7
    call loc_81d73
    add esp, 4
    test byte [0x22ee80], 1
    je short loc_81f09
    push 0
    call 0x88be3
    push eax
    push 0
    call 0x88be3
    push eax
    push 3
    call 0x88be3
    push eax
    push 3
    call 0x88be3
    push eax
    push 0x88fd
    push 0x8908
    call loc_81d73
    add esp, 0x18
loc_81f09:
    push dword [0xb848]
    push dword [0xb848]
    push 0x8930
    push 0x8945
    call loc_81d73
    add esp, 0x10
    call 0x88d31
    mov edi, eax
    call 0x88d31
    test eax, eax
    je short loc_81f82
    push 0x8960
    call loc_81d73
    add esp, 4
    xor esi, esi
    mov dword [ebp - 0x10], 0xffffffff
loc_81f4d:
    test esi, esi
    je short loc_81f5f
    mov cl, byte [ebp - 0x10]
    mov eax, 1
    shl eax, cl
    mov ecx, eax
    jmp short loc_81f61
loc_81f5f:
    xor ecx, ecx
loc_81f61:
    test edi, ecx
    je short loc_81f79
    push esi
    call 0x88d3d
    push eax
    push 0x8973
    call loc_81d73
    add esp, 8
loc_81f79:
    inc dword [ebp - 0x10]
    inc esi
    cmp esi, 0x20
    jl short loc_81f4d
loc_81f82:
    push 0x897c
    call loc_81d73
    add esp, 4
loc_81f8f:
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
