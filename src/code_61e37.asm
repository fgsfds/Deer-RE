bits 32
org 0x61e37

    cli
    ret
    sti
    ret
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    push eax
    mov esi, eax
    mov edi, edx
    mov dword [ebp - 0x10], ebx
    mov eax, 0x11
    call 0x62228
    call 0x6211f
    test al, al
    je short loc_61e6f
    push esi
    push edi
    push dword [ebp - 0x10]
    push 4
    push 0x8011
    push 0
    call 0x6236d
loc_61e6f:
    mov ebx, dword [ebp - 0x10]
    mov edx, edi
    mov eax, esi
    call 0x73632
    mov esi, eax
    call 0x6223c
    mov eax, esi
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
