bits 32
org 0x88e92

    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    or byte [0xb888], 0x80
    cmp byte [0xb890], 0
    je short loc_88eb6
    test byte [0xb806], 0x40
    je short loc_88eb6
    call 0x73cb4
loc_88eb6:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    ret
