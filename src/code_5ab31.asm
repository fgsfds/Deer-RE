bits 32
org 0x5ab31

    db 0x00
    push ebp
    mov ebp, esp
    push dword [ebp + 0xc]
    push dword [ebp + 8]
    call 0x5d849
    push 0xb
    call 0x62160
    call 0x621c6
    pop ebp
    ret 8
    mov al, byte [0xb871]
    ret
    mov eax, dword [0xb869]
    ret
    mov eax, dword [0xb86d]
    ret
    mov eax, dword [0xb860]
    ret
    mov eax, dword [0xb864]
    ret
    mov al, byte [0xb868]
    ret
    mov eax, dword [0xb873]
    ret
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
    push ebp
    mov ebp, esp
    mov eax, dword [0xbe48]
    cmp dword [ebp + 8], 0
    jne short loc_5abdc
    mov edx, 0x52a8e
    jmp short loc_5abdf
loc_5abdc:
    mov edx, dword [ebp + 8]
loc_5abdf:
    mov dword [0xbe48], edx
    pop ebp
    ret 4
    mov eax, dword [0xb883]
    ret
    mov eax, dword [0xb88c]
    ret
    test byte [0xb807], 1
    setne al
    movzx eax, al
    inc eax
    ret
