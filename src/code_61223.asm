bits 32
org 0x61223

    push ebp
    mov ebp, esp
    push ecx
    push esi
    mov esi, eax
    push edx
    push ebx
    call 0x5d849
    mov eax, esi
    call 0x61ace
    lea esp, [ebp - 8]
    pop esi
    pop ecx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ecx
    push esi
    mov esi, eax
    push edx
    push ebx
    call 0x5d849
    mov eax, esi
    call 0x61ba4
    lea esp, [ebp - 8]
    pop esi
    pop ecx
    pop ebp
    ret
