bits 32
org 0x1154c

%define PUT_NUMBER 0x5be74
%define PUT_STRING 0x5be10
%define SET_INDEX_CONTEXT 0x5d849
%define FORMAT_KEY 0x5d8cc
%define MOUSE_SENSITIVITY 0x5c000
%define SAVE_SCRIPT 0x5b24c
%define FREE_SCRIPT 0x5b0b4
%define SETUP_PATH 0x94a0
%define SCRIPT_HANDLE 0xc0050
%define CONFIG_SOURCE 0x278
%define CONTROLS 0x450
%define SCREEN_SETUP 0x668
%define SOUND_SETUP 0x728
%define MISC_SETUP 0x6f0
%define CONTROLLER_TYPE 0xc0078
%define SETUP_READ 0x9520
%define EXECUTION_COUNT 0xbfb37

%macro write_number 3
    push byte 0
    mov ebx, %2
    mov edx, %1
    push byte 0
    mov ecx, [%3]
    mov eax, [SCRIPT_HANDLE]
    call PUT_NUMBER
%endmacro

write_setup:
    push dword ebp
    mov ebp, esp
    push dword ebx
    push dword ecx
    push dword edx
    push dword esi
    push dword edi
    cmp dword [SETUP_READ], 0
    je near .done
    write_number SCREEN_SETUP, 0x660, 0xbfb2f
    mov ecx, 0xbf9f4
    mov ebx, 0x678
    mov edx, SCREEN_SETUP
    mov eax, dword [SCRIPT_HANDLE]
    call PUT_STRING
    write_number SCREEN_SETUP, 0x684, 0xbffcb
    write_number SCREEN_SETUP, 0x68c, 0xbfb2b
    write_number SCREEN_SETUP, 0x694, 0xbfb33
    write_number SCREEN_SETUP, 0x6e0, 0xbfb53
    write_number SOUND_SETUP, 0x740, 0xc00a0
    write_number SOUND_SETUP, 0x74c, 0xc00a4
    write_number SOUND_SETUP, 0x758, 0xc0058
    write_number SOUND_SETUP, 0x770, 0xc005c
    write_number SOUND_SETUP, 0x77c, 0xc0060
    write_number SOUND_SETUP, 0x764, 0xc0054
    write_number SOUND_SETUP, 0x818, 0xc007c
    write_number SCREEN_SETUP, 0x6d4, 0xbfb4f
    write_number SCREEN_SETUP, 0x6c8, 0xbffb3
    write_number MISC_SETUP, 0x6e4, EXECUTION_COUNT
    write_number MISC_SETUP, 0x6f8, 0xbfb3b
    write_number MISC_SETUP, 0x700, 0xbfb57
    write_number CONTROLS, 0x838, 0xbfffb
    mov ecx, dword [0xcf65c]
    sar ecx, 0x10
    imul ecx, ecx, 0x623
    push byte 0
    push byte 0
    mov cl, byte [ecx + 0x8c36a]
    mov ebx, 0x850
    mov edx, CONTROLS
    mov eax, dword [SCRIPT_HANDLE]
    and ecx, 0xff
    call PUT_NUMBER
    xor esi, esi
    xor edi, edi
.weapon_choice:
    push dword CONFIG_SOURCE
    push dword 0x2cf
    call SET_INDEX_CONTEXT
    push dword esi
    push dword 0x70c
    push dword 0x8bcc0
    call FORMAT_KEY
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, 0x44
    add esp, 0xc
    add edi, 4
    push byte 0
    mov ebx, 0x8bcc0
    mov edx, MISC_SETUP
    push byte 0
    mov ecx, dword [edi + eax + 0xbfb57]
    mov eax, dword [SCRIPT_HANDLE]
    inc esi
    call PUT_NUMBER
    cmp esi, 0xa
    jl short .weapon_choice
    mov eax, dword [CONTROLLER_TYPE]
    cmp eax, 1
    jne short .save
    call MOUSE_SENSITIVITY
    push byte 0
    mov ebx, 0x4cc
    mov edx, CONTROLS
    mov esi, dword [SCRIPT_HANDLE]
    push byte 0
    mov ecx, eax
    mov eax, esi
    call PUT_NUMBER
.save:
    mov edx, SETUP_PATH
    mov eax, dword [SCRIPT_HANDLE]
    call SAVE_SCRIPT
    mov eax, dword [SCRIPT_HANDLE]
    call FREE_SCRIPT
.done:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 15 db 0            ; alignment before the next code unit
