bits 32
org 0x61a22

    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    push eax
    mov esi, eax
    mov edi, edx
    mov dword [ebp - 0x10], ebx
    push 0x19
    call 0x62160
    call 0x6211f
    test al, al
    je short loc_61a50
    push esi
    push edi
    push dword [ebp - 0x10]
    push 4
    push 0x19
    push 0
    call 0x6236d
loc_61a50:
    mov ebx, dword [ebp - 0x10]
    mov edx, edi
    mov eax, esi
    call 0x73388
    mov esi, eax
    call 0x621c6
    mov eax, esi
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
