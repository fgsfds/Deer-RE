bits 32
org 0x88b8d

    push ebp
    mov ebp, esp
    push ecx
    push edx
    push 0x8d14
    push 0x8d20
    call 0x81d73
    add esp, 8
    lea esp, [ebp - 8]
    pop edx
    pop ecx
    pop ebp
    ret
loc_88bab:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    test byte [0xb889], 1
    jne short loc_88bbf
    call 0x737de
loc_88bbf:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    and cl, byte [edi + eax + 0x78c3100]
    add byte [eax - 0x74], al
    pop es
    add byte [esi - 0x74], ah
    pop es
    add byte [ebp - 0x74], dh
    pop es
    add bh, dl
    mov word [edi], es
    add dh, ch
    mov word [edi], es
    add byte [ebp - 0x77], dl
    in eax, 0xf6
    add eax, 0x22ee80
    add dword [edi], ecx
    test bl, bh
    add byte [eax], al
    add dh, dh
    add eax, 0xb806
    add dword [edi], ecx
    xchg esp, eax
    ror byte [edi], 0xb6
    rol byte [ebp - 0x197af040], 0
    add byte [eax], al
    call loc_88bab
    cmp dword [ebp + 8], 6
    ja near loc_88cee
    mov eax, dword [ebp + 8]
    jmp dword [cs:eax*4 + 0x78bc7]
    mov eax, dword [0x22ee6c]
loc_88c27:
    sub eax, dword [0x22ee70]
    pop ebp
    ret 4
    mov eax, dword [0x22ee6c]
    sub eax, dword [0x22ee74]
    pop ebp
    ret 4
    call 0x8c373
    cmp eax, dword [0x22ee6c]
    jae short loc_88c60
    call 0x8c373
    mov edx, dword [0x22ee6c]
    sub edx, eax
    mov eax, edx
    pop ebp
    ret 4
loc_88c60:
    xor eax, eax
    pop ebp
    ret 4
    mov eax, dword [0x22ee6c]
    sub eax, dword [0x22ee78]
    pop ebp
    ret 4
    call 0x8c373
    cmp eax, dword [0x22ee6c]
    jae short loc_88c91
    call 0x8c373
    mov edx, dword [0x22ee6c]
    sub edx, eax
    jmp short loc_88c93
loc_88c91:
    xor edx, edx
loc_88c93:
    mov eax, dword [0x22ee6c]
    sub eax, dword [0x22ee74]
    cmp eax, edx
    jbe short loc_88cd1
    call 0x8c373
    cmp eax, dword [0x22ee6c]
    jae short loc_88cbe
    call 0x8c373
    mov edx, dword [0x22ee6c]
    sub edx, eax
    jmp short loc_88cc0
loc_88cbe:
    xor edx, edx
loc_88cc0:
    mov eax, dword [0x22ee6c]
    sub eax, dword [0x22ee74]
    sub eax, edx
    pop ebp
    ret 4
loc_88cd1:
    xor eax, eax
    pop ebp
    ret 4
    mov eax, dword [0x22ee78]
    cmp eax, dword [0x22ee70]
    ja near loc_88c27
    xor eax, eax
    pop ebp
    ret 4
loc_88cee:
    xor eax, eax
    pop ebp
    ret 4
    mov eax, dword [0xb850]
    ret
    mov eax, dword [0xb83c]
    ret
    mov eax, dword [0xb840]
    ret
    mov eax, dword [0xb854]
    ret
    mov eax, dword [0xb858]
    ret
    cmp byte [0xb890], 0
loc_88d19:
    setne al
    movzx eax, al
    ret
    movzx eax, byte [0xb872]
    ret
    cmp byte [0xb893], 0
    jmp short loc_88d19
    mov eax, dword [0xb877]
    ret
    mov eax, dword [0xb85c]
    ret
    push ebp
    mov ebp, esp
    cmp dword [ebp + 8], 0x14
    jge short loc_88d54
    mov eax, dword [ebp + 8]
    mov eax, dword [eax*4 + 0x14ce4]
    pop ebp
    ret 4
loc_88d54:
    mov eax, 0x8ed2
    pop ebp
    ret 4
