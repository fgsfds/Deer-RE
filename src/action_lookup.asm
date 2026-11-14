bits 32
org 0x10328

%define ACTION_NAMES 0x93d0
%define ACTION_COUNT 52
%define NAME_COMPARE 0x5ac26

action_index:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov ecx, eax
    xor esi, esi
    xor ebx, ebx
.scan:
    mov eax, ecx
    mov edx, [ebx + ACTION_NAMES]
    call NAME_COMPARE
    test eax, eax
    jne .advance
    mov eax, esi
    jmp short .done
.advance:
    add ebx, 4
    inc esi
    cmp ebx, strict dword ACTION_COUNT * 4
    jl .scan
    mov eax, -1
.done:
    lea esp, [ebp - 16]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

action_name:
    push ebp
    mov ebp, esp
    cmp eax, ACTION_COUNT
    jge .missing
    mov eax, [eax * 4 + ACTION_NAMES]
    mov esp, ebp
    pop ebp
    ret
.missing:
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
