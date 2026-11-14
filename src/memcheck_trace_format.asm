bits 32
org 0x8bd7a

    push ebp
    mov ebp, esp
    movzx edx, dx
    movzx eax, ax
    call 0x8c024
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    call 0x61ba4
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword [ebp + 8]
    mov ebx, dword [ebp + 0xc]
    cmp si, 2
    jb short loc_8bdcc
    jbe near loc_8be62
    cmp si, 0x80
    jb near loc_8bf2e
    jbe short loc_8bdda
    cmp si, 0x81
    je near loc_8be44
    jmp near loc_8bf2e
loc_8bdcc:
    test si, si
    jbe near loc_8bf2e
    jmp near loc_8be5f
loc_8bdda:
    push 0xb895
    push 0x9014
    call 0x81d73
    add esp, 8
    call 0x88d12
    test eax, eax
    je short loc_8be08
    call 0x6398f
    push eax
    push 0x9017
    call 0x81d73
    add esp, 8
loc_8be08:
    push dword [0x23f1e4]
    push 0x9026
    call 0x81d73
    add esp, 8
    mov word [0x23f240], 0
    mov word [0x23f23e], 0
    mov word [0x23f23c], 0
    mov dword [0x23f238], 0
    pop esi
    pop ebx
    pop ebp
    ret
loc_8be44:
    push 0xb8c6
    push 0x9014
    call 0x81d73
    add esp, 8
    call 0x81e58
    pop esi
    pop ebx
    pop ebp
    ret
loc_8be5f:
    mov ebx, dword [ebp + 0x10]
loc_8be62:
    inc word [0x23f240]
    movsx eax, word [0x23f240]
    cmp eax, dword [0x14d38]
    jge near loc_8bf1a
    cmp bx, word [0x23f23c]
    jne short loc_8be99
    mov eax, dword [ebp + 0x14]
    cmp eax, dword [0x23f238]
    jne short loc_8be99
    inc word [0x23f23e]
    jmp short loc_8bec8
loc_8be99:
    cmp word [0x23f23e], 2
    jle short loc_8bebf
    movsx eax, word [0x23f23e]
    dec eax
    dec eax
    push eax
    push 0xb8e6
    push 0x9034
    call 0x81d73
    add esp, 0xc
loc_8bebf:
    mov word [0x23f23e], 0
loc_8bec8:
    cmp word [0x23f23e], 2
    jg short loc_8bf00
    cmp si, 1
    jne short loc_8bedf
    mov eax, 0x46
    jmp short loc_8bee4
loc_8bedf:
    mov eax, 0x4e
loc_8bee4:
    push eax
    push dword [ebp + 0x14]
    movzx eax, bx
    push eax
    push 0xb8dc
    push 0x9045
    call 0x81d73
    add esp, 0x14
    jmp short loc_8bf07
loc_8bf00:
    dec word [0x23f240]
loc_8bf07:
    mov word [0x23f23c], bx
    mov eax, dword [ebp + 0x14]
    mov dword [0x23f238], eax
    pop esi
    pop ebx
    pop ebp
    ret
loc_8bf1a:
    jne short loc_8bf3b
    push eax
    push 0xb8f1
    call 0x81d73
    add esp, 8
    pop esi
    pop ebx
    pop ebp
    ret
loc_8bf2e:
    push 0xb920
    call 0x81d73
    add esp, 4
loc_8bf3b:
    pop esi
    pop ebx
    pop ebp
    ret
