bits 32
org 0x8b2ec

    push ebp
    mov ebp, esp
    push edx
    movzx edx, ax
    mov eax, 1
    call 0x8bd7a
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    test eax, eax
    je short loc_8b30f
    call 0x8bd8c
loc_8b30f:
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword [eax]
    cmp ebx, dword [edx]
    jbe short loc_8b324
    mov eax, 1
    jmp short loc_8b32f
loc_8b324:
    jae short loc_8b32d
    mov eax, 0xffffffff
    jmp short loc_8b32f
loc_8b32d:
    xor eax, eax
loc_8b32f:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    ret
