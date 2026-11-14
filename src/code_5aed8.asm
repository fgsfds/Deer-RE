bits 32
org 0x5aed8

    jmp near 0x62b85
    test eax, eax
    jne near 0x62bae
    call 0x61ead
    xor eax, eax
    ret
    add byte [eax], al
    db 0x00
