bits 32
org 0x10d2c

%define SAVE_FILENAME 0x5c8
%define READ_BINARY 0x5d4
%define SOURCE_FILE 0x278
%define SAVE_NAMES 0xbf918
%define SAVE_VERSION 108
%define SAVE_NAME_LENGTH 19
%define SAVE_SLOT_STRIDE 22

%define DEBUG_LINE 0x5ab32
%define FILE_OPEN 0x5db41
%define FILE_CLOSE 0x5dbf5
%define READ_DATA 0x3160a
%define HEADER ebp - 0x1c
%define SLOT ebp - 0x18

read_save_names:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    xor edx, edx
    mov edi, SAVE_FILENAME
    mov [SLOT], dx
.slot:
    mov al, [SLOT]
    push dword SOURCE_FILE
    add al, '0'
    push dword 511
    mov [edi + 4], al
    call DEBUG_LINE
    mov edx, READ_BINARY
    mov eax, SAVE_FILENAME
    call FILE_OPEN
    mov esi, eax
    test eax, eax
    je .advance

    mov ebx, 1
    mov edx, 4
    mov ecx, eax
    lea eax, [HEADER]
    call READ_DATA
    cmp dword [HEADER], SAVE_VERSION
    jne .done

    mov ebx, 1
    mov edx, 4
    lea eax, [HEADER]
    mov ecx, esi
    call READ_DATA
    ; Watcom loads the slot word through a four-byte load and shift.
    mov eax, [SLOT - 2]
    sar eax, 16
    imul eax, eax, SAVE_SLOT_STRIDE
    mov ebx, 1
    mov edx, SAVE_NAME_LENGTH
    mov ecx, esi
    add eax, SAVE_NAMES
    call READ_DATA
    push dword SOURCE_FILE
    push dword 517
    call DEBUG_LINE
    mov eax, esi
    call FILE_CLOSE
.advance:
    mov ebx, [SLOT]
    inc ebx
    mov [SLOT], bx
    cmp bx, 10
    jl near .slot
.done:
    lea esp, [ebp - 20]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
