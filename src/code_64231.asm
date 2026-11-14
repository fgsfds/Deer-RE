bits 32
org 0x64231

    push ebp
    mov ebp, esp
    call 0x76112
    call 0x73680
    mov esp, ebp
    pop ebp
    ret
