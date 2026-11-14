bits 32
org 0x5d849

loc_5d849:
    push ebp
    mov ebp, esp
    cmp dword [0xbe64], 0
    je short loc_5d86d
    cmp dword [0xbe68], 0
    sete al
    movzx eax, al
    test eax, eax
    je short loc_5d86d
    push 0
    call 0x635ca
loc_5d86d:
    mov eax, dword [ebp + 0xc]
    mov dword [0xb860], eax
    mov eax, dword [ebp + 8]
    mov dword [0xb864], eax
    cmp byte [0xb890], 0
    je short loc_5d8a5
    cmp byte [0xb891], 0
    jne short loc_5d8a5
    mov eax, dword [ebp + 0xc]
    mov dword [0xb869], eax
    mov eax, dword [ebp + 8]
    mov dword [0xb86d], eax
    inc byte [0xb872]
loc_5d8a5:
    pop ebp
    ret 8
    push ebp
    mov ebp, esp
    push dword [ebp + 0x10]
    push dword [ebp + 0xc]
    call loc_5d849
    cmp byte [0xb872], 1
    jne short loc_5d8c8
    mov eax, dword [ebp + 8]
    mov dword [0xb87f], eax
loc_5d8c8:
    pop ebp
    ret 0xc
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x1c
    push 0x15
    call 0x62160
    push dword [ebp + 8]
    push dword [0xb71f]
    push 1
    call 0x6224c
    push dword [ebp + 0xc]
    push dword [0xb71b]
    push 0
    call 0x6224c
    call 0x6211f
    test al, al
    je short loc_5d928
    push dword [ebp + 8]
    lea eax, [ebp - 0x30]
    push eax
    call 0x63886
    test eax, eax
    je short loc_5d928
    lea eax, [ebp - 0x30]
    push eax
    push dword [0xb73f]
    push 0x15
    call 0x63b59
loc_5d928:
    lea eax, [ebp + 0x10]
    mov dword [ebp - 0x18], eax
    lea ebx, [ebp - 0x18]
    mov edx, dword [ebp + 0xc]
    mov eax, dword [ebp + 8]
    call 0x63d72
    mov esi, eax
    mov edi, eax
    mov dword [ebp - 0x18], 0
    call 0x6211f
    test al, al
    je short loc_5d962
    push dword [ebp + 8]
    push -6
    inc esi
    push esi
    push 4
    push 0x15
    push 0
    call 0x6236d
loc_5d962:
    call 0x621c6
    mov eax, edi
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
