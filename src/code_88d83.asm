bits 32
org 0x88d83

loc_88d83:
    inc dword [0x23f1e8]
    cmp dword [0x23f1e8], 1
    jne short loc_88da5
    push cs
    push 0x767c
    push 0x8eec
    call 0x81d73
    add esp, 0xc
loc_88da5:
    ret
    push ebp
    mov ebp, esp
    push esi
    xor esi, esi
    push 0xc
    call 0x62160
    cmp byte [0xb890], 0
    je short loc_88dc5
    cmp byte [0x23f1ed], 0
    je short loc_88dce
loc_88dc5:
    cmp byte [0xb887], 0
    je short loc_88e1b
loc_88dce:
    mov byte [0x23f1ed], 1
    mov esi, dword [ebp + 8]
    mov dword [0x23f1e4], esi
    inc byte [0x23f1ec]
    cmp byte [0x23f1ec], 1
    jne short loc_88e0c
    push 0x8f0a
    call 0x81d73
    add esp, 4
    push 0x8f43
    call 0x81d73
    add esp, 4
    call loc_88d83
loc_88e0c:
    call 0x8c543
    movsx esi, ax
    mov byte [0x23f1ed], 0
loc_88e1b:
    call 0x621c6
    mov eax, esi
    pop esi
    pop ebp
    ret 4
    push ebx
    call 0x81e58
    push 5
    call 0x88be3
    push eax
    call 0x6398f
    push eax
    push 0x8f88
    call 0x734d7
    add esp, 0xc
    call 0x81e58
    pop ebx
    ret
