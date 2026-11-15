bits 32
org 0x5ab7a

    push ebp
    mov ebp, esp
    push esi
    movzx eax, byte [ebp + 8]
    mov edx, ds
    mov eax, dword [eax*4 + 0xbcc5]
    call 0x62a4d
    mov esi, eax
    cmp eax, 0x13
    jb short loc_5ab9c
    mov esi, 0x13
loc_5ab9c:
    push esi
    movzx eax, byte [ebp + 8]
    mov ecx, ds
    mov ebx, dword [eax*4 + 0xbcc5]
    mov edx, ds
    mov eax, 0x21eabc
    call 0x62a66
    mov byte [esi + 0x21eabc], 0
    mov eax, 0x21eabc
    pop esi
    pop ebp
    ret 4
