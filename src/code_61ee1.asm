bits 32
org 0x61ee1

    push ebp
    mov ebp, esp
    push esi
    mov esi, dword [0xd2bc]
    mov eax, dword [ebp + 8]
    mov dword [0xd2bc], eax
    test eax, eax
    je short loc_61f17
    test byte [0xb808], 1
    je short loc_61f2c
    test byte [0xb889], 4
    jne short loc_61f2c
    or byte [0xb889], 4
    call 0x8c311
    jmp short loc_61f2c
loc_61f17:
    test byte [0xb889], 4
    je short loc_61f2c
    call 0x8c1c6
    and byte [0xb889], 0xfb
loc_61f2c:
    mov eax, esi
    pop esi
    pop ebp
    ret 4
    mov eax, dword [0xd2bc]
    ret
    test byte [0xb889], 1
    setne al
    movzx ax, al
    or byte [0xb889], 1
    and byte [0x22ee80], 0xf7
    inc byte [0xb887]
    ret
    and byte [0xb889], 0xfe
    dec byte [0xb887]
    ret
    mov eax, 0xd314
    ret
    test byte [0xb889], 1
    setne al
    movzx ax, al
    ret
    push 0x68c4
loc_61f84:
    call 0x734d7
    add esp, 4
    ret
    push 0x68f3
    jmp short loc_61f84
    push 0x6920
    jmp short loc_61f84
    db 0x00
