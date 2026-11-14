bits 32
org 0x626b2

    push ebp
    mov ebp, esp
    call 0x73dfe
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 0x24
    mov edi, eax
    mov esi, edx
    mov dword [ebp - 0x18], 0
    mov byte [ebp - 0x14], 0
    push 0x14
    call 0x62160
    call 0x62071
    test al, al
    jne short loc_626f8
    mov edx, esi
    mov eax, edi
    call 0x73e4d
    mov dword [ebp - 0x18], eax
    jmp near loc_627f0
loc_626f8:
    test edi, edi
    jne short loc_62725
    movzx edi, byte [0xb872]
    call 0x621c6
    movzx eax, byte [0xb872]
    cmp edi, eax
    je short loc_62719
    inc byte [0xb872]
loc_62719:
    mov eax, esi
    call 0x61ace
    jmp near loc_627f8
loc_62725:
    movzx eax, byte [0xb810]
    add eax, eax
    inc dword [0xb850]
    add eax, esi
    mov dword [ebp - 0x1c], eax
    cmp eax, -0x21
    jbe short loc_62742
    mov byte [ebp - 0x14], 1
loc_62742:
    push edi
    push 0x14
    lea eax, [ebp - 0x34]
    push eax
    call 0x63c20
    cmp eax, 1
    jne short loc_627a8
    movzx eax, byte [0xb810]
    sub edi, eax
    mov eax, edi
    mov edx, dword [ebp - 0x1c]
    call 0x73e4d
    mov dword [ebp - 0x18], eax
    test eax, eax
    jne short loc_62771
    mov byte [ebp - 0x14], 1
loc_62771:
    cmp byte [ebp - 0x14], 0
    jne short loc_627c1
    or byte [0xb888], 0x10
    lea eax, [ebp - 0x34]
    push eax
    call 0x637ad
    push 0x14
    push dword [ebp - 0x18]
    push dword [ebp - 0x1c]
    call 0x636c1
    test eax, eax
    setne al
    mov byte [ebp - 0x14], al
    movzx eax, byte [0xb810]
    add dword [ebp - 0x18], eax
    jmp short loc_627c1
loc_627a8:
    cmp eax, 2
    jne short loc_627c1
    mov edx, esi
    mov eax, edi
    call 0x73e4d
    mov dword [ebp - 0x18], eax
    test eax, eax
    jne short loc_627c1
    mov byte [ebp - 0x14], 1
loc_627c1:
    cmp byte [ebp - 0x14], 0
    je short loc_627f0
    mov dword [ebp - 0x18], 0
    push 0xd
    call 0x63a9c
    push dword [0xb850]
    push esi
    call 0x6398f
    push eax
    push dword [0xb767]
    call 0x734d7
    add esp, 0x10
loc_627f0:
    call 0x621c6
    mov eax, dword [ebp - 0x18]
loc_627f8:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
