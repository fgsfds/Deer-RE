bits 32
org 0x8b349

    push ebp
    mov ebp, esp
    push dword [ebp + 8]
    push 0x900c
    call 0x5ac04
    add esp, 8
    pop ebp
    ret
