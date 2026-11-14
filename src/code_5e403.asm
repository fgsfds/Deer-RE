bits 32
org 0x5e403

    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, eax
    mov esi, edx
    push ebx
    push ecx
    push dword [ebp + 8]
    call 0x5d8a9
    mov edx, esi
    mov eax, edi
    call 0x64185
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    add byte [eax], al
    add byte [eax], al
    add byte [eax], al
    add byte [eax], al
