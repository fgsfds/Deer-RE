bits 32
org 0x64185

    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov edi, edx
    push 0x16
    call 0x62160
    call 0x6211f
    test al, al
    je short loc_641e4
    push esi
    push dword [0xb71f]
    push 1
    call 0x6224c
    test eax, eax
    jne short loc_641e4
    push edi
    push dword [0xb71b]
    push eax
    call 0x6224c
    test eax, eax
    jne short loc_641e4
    mov eax, esi
    call 0x61c2a
    mov edx, eax
    mov eax, edi
    call 0x61c2a
    add eax, edx
    inc eax
    push esi
    push edi
    push eax
    push 4
    push 0x16
    push 0
    call 0x6236d
loc_641e4:
    mov edx, edi
    mov eax, esi
    call 0x760df
    mov esi, eax
    call 0x621c6
    mov eax, esi
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
