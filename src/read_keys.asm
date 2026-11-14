bits 32
org 0x1047c

%define SCRIPT_HANDLE 0xc0050
%define KEY_DEFINITIONS 0x430
%define SOURCE_FILE 0x278
%define NUMBER_ENTRIES 0x5b918
%define SCRIPT_ENTRY 0x5b964
%define ACTION_INDEX 0x10328
%define CLEAR_BUFFER 0x5bf59
%define GET_DOUBLE_STRING 0x5bad8
%define KEY_SCAN_CODE 0x5ae14
%define MAP_KEY 0x5c9cc
%define KEY1 ebp - 0x6c
%define KEY2 ebp - 0xbc
%define ENTRY_COUNT ebp - 0x1c
%define ACTION ebp - 0x18

read_keys:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xa8
    mov edx, KEY_DEFINITIONS
    mov eax, [SCRIPT_HANDLE]
    call NUMBER_ENTRIES
    xor esi, esi
    mov [ENTRY_COUNT], eax
    test eax, eax
    jle near .done
.entry:
    mov edx, KEY_DEFINITIONS
    mov eax, [SCRIPT_HANDLE]
    mov ebx, esi
    call SCRIPT_ENTRY
    call ACTION_INDEX
    mov [ACTION], eax
    cmp eax, -1
    je near .advance

    push byte 80
    mov ecx, SOURCE_FILE
    mov ebx, 80
    push dword 298
    lea eax, [KEY1]
    xor edx, edx
    call CLEAR_BUFFER
    push byte 80
    mov ecx, SOURCE_FILE
    mov ebx, 80
    push dword 299
    lea eax, [KEY2]
    xor edx, edx
    call CLEAR_BUFFER

    lea eax, [KEY2]
    mov edx, KEY_DEFINITIONS
    mov ebx, esi
    push eax
    mov eax, [SCRIPT_HANDLE]
    lea ecx, [KEY1]
    call SCRIPT_ENTRY
    mov edx, KEY_DEFINITIONS
    mov edi, [SCRIPT_HANDLE]
    mov ebx, eax
    mov eax, edi
    call GET_DOUBLE_STRING

    xor dl, dl
    mov ah, [KEY1]
    xor dh, dh
    test ah, ah
    je .second_key
    lea eax, [KEY1]
    call KEY_SCAN_CODE
    mov dl, al
.second_key:
    cmp byte [KEY2], 0
    je .map
    lea eax, [KEY2]
    call KEY_SCAN_CODE
    mov dh, al
.map:
    xor ebx, ebx
    mov bl, dh
    mov eax, [ACTION]
    and edx, strict dword 255
    call MAP_KEY
.advance:
    mov edx, [ENTRY_COUNT]
    inc esi
    cmp esi, edx
    jl near .entry
.done:
    lea esp, [ebp - 20]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
