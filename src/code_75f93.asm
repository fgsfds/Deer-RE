bits 32
org 0x75f93

    push ebp
    mov ebp, esp
    push ebx
    sub esp, 0x10
    mov ebx, eax
    test byte [0xb889], 2
    je short loc_75fac
    mov eax, 0xffffffff
    jmp short loc_75fea
loc_75fac:
    mov word [ebp - 0x10], 0
    mov dword [ebp - 0x14], 0
    lea ebx, [eax - 4]
    test edx, edx
    jne short loc_75fc7
loc_75fc0:
    mov eax, 1
    jmp short loc_75fea
loc_75fc7:
    lea eax, [ebp - 0x14]
    call 0x86b0a
    test eax, eax
    jne short loc_75fe8
    mov eax, ds
    cmp ebx, dword [ebp - 0x14]
    jne short loc_75fc7
    cmp ax, word [ebp - 0x10]
    jne short loc_75fc7
    cmp dword [ebp - 0xa], 1
    je short loc_75fc7
    jmp short loc_75fc0
loc_75fe8:
    xor eax, eax
loc_75fea:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
