bits 32
org 0x75cdd

loc_75cdd:
    push ebp
    mov ebp, esp
    mov ebx, dword [ebp + 8]
    mov eax, ebx
    call 0x61c2a
    add eax, 0x17
    call 0x733ad
    mov ecx, eax
loc_75cf4:
    push 0x82ac
    inc dword [0xd3fc]
    push dword [0xd3fc]
    cmp byte [ebx], 0
    je short loc_75d0e
    mov eax, ebx
    jmp short loc_75d13
loc_75d0e:
    mov eax, 0x82aa
loc_75d13:
    push eax
    push 0x82b1
    push ecx
    call 0x75f3e
    add esp, 0x14
    xor edx, edx
    mov eax, ecx
    call 0x640c8
    test eax, eax
    je short loc_75cf4
    push dword [0xd3fc]
    cmp byte [ebx], 0
    jne short loc_75d3f
    mov ebx, 0x82aa
loc_75d3f:
    push ebx
    push 0x82be
    push ecx
    call 0x75f3e
    add esp, 0x10
    mov eax, ecx
    pop ebp
    ret 4
    push ebp
    mov ebp, esp
    push esi
    push eax
    lea eax, [ebp - 8]
    call 0x8613f
    mov dword [0xd3f4], 0
    mov dword [0xd3f0], 0
    or byte [0x23cad4], 3
    mov eax, dword [ebp + 0x14]
    mov dword [0xd3f8], eax
    cmp dword [ebp + 0xc], 0
    jne short loc_75d91
    mov dword [ebp + 0xc], 0x82aa
loc_75d91:
    push dword [ebp + 0xc]
    call loc_75cdd
    mov esi, eax
    movzx eax, word [ebp + 8]
    push eax
    push 0
    movzx ecx, word [ebp + 0x14]
    cmp dword [ebp + 0x10], 1
    jne short loc_75db3
    mov eax, 4
    jmp short loc_75db8
loc_75db3:
    mov eax, 8
loc_75db8:
    movzx ebx, ax
    mov edx, esi
    mov eax, 0xd3ec
    call 0x8614d
    cwde
    mov dword [0xd3f4], eax
    test esi, esi
    je short loc_75dd8
    mov eax, esi
    call 0x61ba4
loc_75dd8:
    mov eax, dword [0xd3f4]
    lea esp, [ebp - 4]
    pop esi
    pop ebp
    ret 0x10
    cmp dword [0xd3ec], 0
    je short loc_75df8
    mov eax, dword [0xd3ec]
    jmp near 0x8618c
loc_75df8:
    ret
    push ebp
    mov ebp, esp
    mov eax, dword [ebp + 0xc]
    mov dword [0x23cacc], eax
    mov eax, dword [ebp + 8]
    mov dword [0x23cad0], eax
    push es
    mov eax, dword [0xd3ec]
    mov edx, 0x23cacc
    call 0x8619f
    cwde
    mov dword [0xd3f4], eax
    test eax, eax
    jne short loc_75e2c
    inc dword [0xd3f0]
loc_75e2c:
    pop es
    mov eax, dword [0xd3f4]
    pop ebp
    ret 8
    push ebp
    mov ebp, esp
    sub esp, 0xc
    mov eax, dword [ebp + 8]
    mov dword [ebp - 0xc], eax
    mov dword [ebp - 8], 0
    mov word [ebp - 4], 0
    mov eax, dword [0xd3ec]
    lea edx, [ebp - 0xc]
    call 0x8652d
    cwde
    mov dword [0xd3f4], eax
    test eax, eax
    jne short loc_75e75
    cmp dword [0xd3f0], 0
    jbe short loc_75e75
    dec dword [0xd3f0]
loc_75e75:
    mov eax, dword [0xd3f4]
    mov esp, ebp
    pop ebp
    ret 4
    push ebp
    mov ebp, esp
    mov eax, dword [ebp + 0xc]
    mov dword [0x23cacc], eax
    mov eax, dword [ebp + 8]
    mov dword [0x23cad0], eax
    mov eax, dword [0xd3ec]
    mov edx, 0x23cacc
    call 0x869ea
    cwde
    mov dword [0xd3f4], eax
    pop ebp
    ret 8
    mov eax, dword [0xd3ec]
    mov edx, 0x23cacc
    call 0x86a67
loc_75ebb:
    cwde
    mov dword [0xd3f4], eax
    ret
    mov eax, dword [0xd3ec]
    xor edx, edx
    call 0x86aaa
    jmp short loc_75ebb
    push ebp
    mov ebp, esp
    mov eax, dword [ebp + 8]
    mov dword [0x23cad0], eax
    mov eax, dword [0xd3ec]
    mov edx, 0x23cacc
    call 0x86ac9
    cwde
    mov dword [0xd3f4], eax
    pop ebp
    ret 4
    push ebp
    mov ebp, esp
    push eax
    lea eax, [ebp - 4]
    call 0x8613f
    test byte [ebp - 3], 0x80
    setne al
    movzx eax, al
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    mov eax, dword [ebp + 8]
    mov eax, dword [eax*4 + 0xd400]
    pop ebp
    ret 4
    mov eax, dword [0xd3f0]
    ret
    mov eax, dword [0xd3f4]
    ret
