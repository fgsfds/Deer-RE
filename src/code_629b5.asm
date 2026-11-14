bits 32
org 0x629b5

    times 4 dd 0xaeafdfea
    mov ebx, 0x54
    xor edx, edx
    mov eax, 0xb83c
    call 0x73370
    mov ebx, 0x14
    xor edx, edx
    mov eax, 0x22ee6c
    call 0x73370
    mov byte [0xb890], 0
    mov ebx, 0x34
    mov edx, 0xd36c
    mov eax, 0xb806
    call 0x73632
    mov byte [0xd35a], 0xff
    call 0x8c364
    mov eax, dword [0xc8d4]
    sub eax, 0x18
    mov dword [0xd361], eax
    mov eax, dword [0xc8d4]
    mov dword [0x22ee6c], eax
    mov eax, dword [0xc8d0]
    mov dword [0x22ee70], eax
    mov eax, dword [0x22ee6c]
    mov dword [0x22ee78], eax
    mov dword [0x22ee80], 0
    mov word [0xd35f], 0
    ret
