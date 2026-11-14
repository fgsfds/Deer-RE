bits 32
org 0x61915

    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    push eax
    mov edi, eax
    mov dword [ebp - 0x10], edx
    mov esi, ebx
    push 0x13
    call 0x62160
    call 0x6211f
    test al, al
    je short loc_61942
    push edi
    push -6
    push esi
    push 4
    push 0x13
    push 0
    call 0x6236d
loc_61942:
    mov ebx, esi
    mov edx, dword [ebp - 0x10]
    mov eax, edi
    call 0x73370
    mov esi, eax
    call 0x621c6
    mov eax, esi
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
