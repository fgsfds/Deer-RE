bits 32
org 0x8ac7c

    push ebp
    mov ebp, esp
    push ebx
    push dword [ebp + 8]
    call 0x8b349
    add esp, 4
    call 0x88d12
    test eax, eax
    je short loc_8ace7
    call 0x88d20
    test eax, eax
    jne short loc_8ace7
    call 0x88d28
    test eax, eax
    jne short loc_8ace7
    call 0x5ab50
    cmp al, 0xa
    setne al
    movzx eax, al
    test eax, eax
    je short loc_8ace7
    cmp byte [0xb891], 2
    jae short loc_8ace7
    call 0x5ab50
    cmp al, 1
    setne al
    movzx eax, al
    test eax, eax
    je short loc_8ace7
    push 0x8fbc
    push 0x4d
    call 0x5d849
    push 0x8fc6
    call 0x88da6
loc_8ace7:
    pop ebx
    pop ebp
    ret
