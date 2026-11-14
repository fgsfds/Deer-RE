bits 32
org 0x61ace

    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    push eax
    xor edi, edi
    mov byte [ebp - 0x18], 0
    test byte [0xb888], 0x20
    je short loc_61aed
    mov al, 0x24
    jmp short loc_61aef
loc_61aed:
    mov al, 0x10
loc_61aef:
    movzx eax, al
    mov dword [ebp - 0x1c], eax
    push eax
    call 0x62160
    call 0x62071
    test al, al
    jne short loc_61b13
    mov eax, dword [ebp - 0x24]
    call 0x733ad
    mov edi, eax
    jmp near loc_61b93
loc_61b13:
    movzx eax, byte [0xb810]
    add eax, eax
    inc dword [0xb850]
    mov edx, dword [ebp - 0x24]
    add edx, eax
    cmp edx, -0x21
    jbe short loc_61b32
loc_61b2c:
    mov byte [ebp - 0x18], 1
    jmp short loc_61b59
loc_61b32:
    mov eax, edx
    call 0x733ad
    mov esi, eax
    mov dword [ebp - 0x20], eax
    test eax, eax
    je short loc_61b2c
    push dword [ebp - 0x1c]
    push eax
    push edx
    call 0x636c1
    test eax, eax
    jne short loc_61b2c
    movzx edi, byte [0xb810]
    add edi, esi
loc_61b59:
    cmp byte [ebp - 0x18], 0
    je short loc_61b93
    push 0xd
    call 0x63a9c
    push dword [0xb850]
    push dword [ebp - 0x24]
    call 0x6398f
    push eax
    push dword [0xb767]
    call 0x734d7
    add esp, 0x10
    cmp dword [ebp - 0x20], 0
    je short loc_61b91
    mov eax, dword [ebp - 0x20]
    call 0x7355e
loc_61b91:
    xor edi, edi
loc_61b93:
    call 0x621c6
    mov eax, edi
loc_61b9a:
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
    push esi
    push edi
    sub esp, 0x1c
    mov esi, eax
    mov edi, 1
    test byte [0xb888], 0x40
    je short loc_61bc3
    mov al, 0x1c
    jmp short loc_61bc5
loc_61bc3:
    mov al, 0xf
loc_61bc5:
    movzx eax, al
    mov dword [ebp - 0x18], eax
    push eax
    call 0x62160
    call 0x62071
    test al, al
    je short loc_61c14
    test esi, esi
    jne short loc_61be2
    xor edi, edi
    jmp short loc_61bf1
loc_61be2:
    push esi
    push dword [ebp - 0x18]
    lea eax, [ebp - 0x30]
    push eax
    call 0x63c20
    mov edi, eax
loc_61bf1:
    cmp edi, 1
    jne short loc_61c0a
    lea eax, [ebp - 0x30]
    push eax
    call 0x637ad
    movzx eax, byte [0xb810]
    sub esi, eax
    jmp short loc_61c14
loc_61c0a:
    cmp edi, 2
    jne short loc_61c14
    mov edi, 1
loc_61c14:
    cmp edi, 1
    jne short loc_61c20
    mov eax, esi
    call 0x7355e
loc_61c20:
    call 0x621c6
    jmp near loc_61b9a
