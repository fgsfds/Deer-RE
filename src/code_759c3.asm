bits 32
org 0x759c3

    push ebx
    push edx
    mov edx, 0x72c4e
    mov ebx, 0x72db6
    mov dword [0x14878], edx
    mov dword [0x1487c], ebx
    pop edx
    pop ebx
    ret
