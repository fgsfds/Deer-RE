bits 32
org 0x735e0

    mov eax, esp
    sub eax, dword [0xc8d0]
    ret
    db 0x00
