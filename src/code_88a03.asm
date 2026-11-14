bits 32
org 0x88a03

    push ebp
    mov ebp, esp
    push dword [ebp + 8]
    call 0x8ac7c
    add esp, 4
    pop ebp
    ret
