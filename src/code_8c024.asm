bits 32
org 0x8c024

    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 0x10
    xor esi, esi
    imul eax, edx
    mov dword [ebp - 0x20], eax
    mov edi, eax
    mov byte [ebp - 0x14], 0
    mov byte [ebp - 0x18], 0
    test byte [0xb888], 0x20
    je short loc_8c04d
    mov al, 0x24
    jmp short loc_8c04f
loc_8c04d:
    mov al, 0xe
loc_8c04f:
    mov byte [ebp - 0x1c], al
    movzx eax, al
    push eax
    call 0x62160
    call 0x62071
    test al, al
    je short loc_8c083
    movzx edi, byte [0xb810]
    add edi, edi
    inc dword [0xb850]
    add edi, dword [ebp - 0x20]
    cmp edi, -0x21
    jbe short loc_8c07f
    mov byte [ebp - 0x14], 1
loc_8c07f:
    mov byte [ebp - 0x18], 1
loc_8c083:
    cmp byte [ebp - 0x14], 0
    jne short loc_8c0a5
    mov eax, edi
    call 0x733ad
    mov esi, eax
    test eax, eax
    je short loc_8c0a1
    mov ebx, edi
    xor edx, edx
    call 0x73370
    jmp short loc_8c0a5
loc_8c0a1:
    mov byte [ebp - 0x14], 1
loc_8c0a5:
    cmp byte [ebp - 0x18], 1
    jne short loc_8c0fc
    cmp byte [ebp - 0x14], 0
    jne short loc_8c0c5
    movzx eax, byte [ebp - 0x1c]
    push eax
    push esi
    push edi
    call 0x636c1
    test eax, eax
    je short loc_8c0c5
    mov byte [ebp - 0x14], 1
loc_8c0c5:
    cmp byte [ebp - 0x14], 0
    jne short loc_8c0d6
    movzx eax, byte [0xb810]
    add esi, eax
    jmp short loc_8c0fc
loc_8c0d6:
    push 0xd
    call 0x63a9c
    push dword [0xb850]
    push dword [ebp - 0x20]
    call 0x6398f
    push eax
    push dword [0xb767]
    call 0x734d7
    add esp, 0x10
    xor esi, esi
loc_8c0fc:
    call 0x621c6
    mov eax, esi
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
