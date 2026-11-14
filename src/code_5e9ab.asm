bits 32
org 0x5e9ab

    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    mov edi, eax
    mov dword [ebp - 0xc], edx
    mov esi, ebx
    push ecx
    push dword [ebp + 8]
    push dword [ebp + 0xc]
    call 0x5d8a9
    mov ebx, esi
    mov edx, dword [ebp - 0xc]
    mov eax, edi
    call 0x61e3b
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 8
