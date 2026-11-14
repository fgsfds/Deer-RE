bits 32
org 0x10e08

%define FILE_EXISTS 0x5defc
%define SETUP_ERROR 0x5a77c
%define LOAD_SCRIPT 0x5b1ec
%define GET_STRING 0x5ba40
%define FIND_OPTION 0x5a7e0
%define COPY_OPTION 0x5a6fa
%define APPEND_EXTENSION 0x5e403
%define SET_FORMAT_CONTEXT 0x5ab32
%define PRINT_MESSAGE 0x5ac04
%define GET_NUMBER 0x5bbf8
%define SET_INDEX_CONTEXT 0x5d849
%define FORMAT_KEY 0x5d8cc
%define CLEAR_MAPPINGS 0x5cbc0
%define READ_KEYS 0x1047c
%define SETUP_MOUSE 0x10584
%define SETUP_JOYSTICK 0x10a58
%define SETUP_GAMEPAD 0x1084c
%define SETUP_PATH 0x94a0
%define SCRIPT_HANDLE 0xc0050
%define CONFIG_SOURCE 0x278
%define CONTROLS 0x450
%define COMM_SETUP 0x618
%define SCREEN_SETUP 0x668
%define SOUND_SETUP 0x728
%define MISC_SETUP 0x6f0
%define CONTROLLER_TYPE 0xc0078
%define SETUP_READ 0x9520
%define DEVICE_DISPATCH 0xdf0
%define MISSING_SETUP_MESSAGE 0x5d8
%define MAP_PATH 0x95b8
%define EXECUTION_COUNT 0xbfb37
%define WEAPON_ORDER 0xbfb5b

%macro read_setting 4
    mov ecx, %1
    mov ebx, %2
    mov edx, %3
    mov eax, [SCRIPT_HANDLE]
    call %4
%endmacro

read_setup:
    push dword ebp
    mov ebp, esp
    push dword ebx
    push dword ecx
    push dword edx
    push dword esi
    push dword edi
    sub esp, 0x14
    lea edi, [ebp - 0x28]
    mov esi, 0x10
    mov eax, SETUP_PATH
    movsd
    movsd
    movsd
    movsw
    movsb
    call FILE_EXISTS
    test eax, eax
    jne short .load_defaults
    push dword SETUP_PATH
    push dword MISSING_SETUP_MESSAGE
    call SETUP_ERROR
    add esp, 8
.load_defaults:
    mov edx, 1
    mov edi, 0xc0
    mov eax, 0x80
    mov ebx, 8
    mov dword [0xc0058], edx
    mov dword [0xc0054], edx
    mov ecx, edx
    mov dword [0xc005c], edx
    mov esi, edx
    mov dword [0xc0060], edx
    mov dword [0xc00a0], edi
    mov dword [0xc00a4], eax
    mov dword [0xbfb4f], ebx
    mov dword [0xbfb2b], ecx
    mov dword [0xbfb2f], ecx
    mov dword [0xbffcb], ecx
    mov dword [0xbfff3], ecx
    mov dword [0xbffcf], ecx
    xor edx, edx
    xor ah, ah
    xor esi, ecx
    mov dword [0xc007c], edx
    mov byte [0x8c36a], ah
    mov dword [0xbfb53], edx
    mov byte [0xbf9f4], ah
    mov eax, SETUP_PATH
    mov dword [0xbfb57], edx
    call LOAD_SCRIPT
    mov dword [SCRIPT_HANDLE], eax
    mov dword [ebp - 0x18], esi
    mov esi, COMM_SETUP
.chat_macro:
    imul ecx, dword [ebp - 0x18], 0x28
    mov al, byte [ebp - 0x18]
    lea ebx, [ebp - 0x28]
    add al, 0x30
    mov edx, esi
    mov byte [ebp - 0x1b], al
    mov eax, dword [SCRIPT_HANDLE]
    add ecx, 0xbf788
    call GET_STRING
    mov eax, dword [ebp - 0x18]
    inc eax
    mov dword [ebp - 0x18], eax
    cmp eax, 0xa
    jl short .chat_macro
    read_setting 0xbffff, 0x624, COMM_SETUP, GET_STRING
    mov eax, 0x630
    call FIND_OPTION
    and eax, 0xff
    mov dword [ebp - 0x18], eax
    je short .map_option
    push dword 0x22b
    mov edx, eax
    mov eax, dword [0xabc8]
    mov ecx, CONFIG_SOURCE
    mov ebx, 0xd
    mov edx, dword [eax + edx*4 + 4]
    mov eax, 0xbffff
    call COPY_OPTION
.map_option:
    mov eax, 0x638
    call FIND_OPTION
    and eax, 0xff
    mov dword [ebp - 0x18], eax
    je near .clear_map
    push dword 0x230
    mov edx, dword [0xabc8]
    mov ecx, CONFIG_SOURCE
    mov ebx, 0x80
    mov edx, dword [edx + eax*4 + 4]
    mov eax, MAP_PATH
    mov esi, MAP_PATH
    call COPY_OPTION
    mov dl, 0x2e
.scan_extension:
    mov al, byte [esi]
    db 0x3a, 0xc2             ; cmp al, dl, register-load encoding
    je short .check_extension
    cmp al, 0
    je short .no_extension
    inc esi
    mov al, byte [esi]
    db 0x3a, 0xc2             ; cmp al, dl, register-load encoding
    je short .check_extension
    inc esi
    cmp al, 0
    jne short .scan_extension
.no_extension:
    db 0x2b, 0xf6             ; sub esi, esi, register-load encoding
.check_extension:
    test esi, esi
    jne short .print_map
    push dword 0x80
    mov ecx, 0x232
    mov ebx, CONFIG_SOURCE
    mov edx, 0x63c
    mov eax, MAP_PATH
    call APPEND_EXTENSION
.print_map:
    push dword CONFIG_SOURCE
    push dword 0x233
    call SET_FORMAT_CONTEXT
    push dword MAP_PATH
    push dword 0x644
    call PRINT_MESSAGE
    add esp, 8
    jmp short .read_settings
.clear_map:
    xor dh, dh
    mov byte [MAP_PATH], dh
.read_settings:
    read_setting 0xbfa74, 0x658, COMM_SETUP, GET_STRING
    read_setting 0xbfb2f, 0x660, SCREEN_SETUP, GET_NUMBER
    read_setting 0xbf9f4, 0x678, SCREEN_SETUP, GET_STRING
    read_setting 0xbffcb, 0x684, SCREEN_SETUP, GET_NUMBER
    read_setting 0xbfb2b, 0x68c, SCREEN_SETUP, GET_NUMBER
    read_setting 0xbfb33, 0x694, SCREEN_SETUP, GET_NUMBER
    read_setting 0xc0080, 0x6a0, SCREEN_SETUP, GET_NUMBER
    read_setting 0xc0064, 0x6ac, SCREEN_SETUP, GET_NUMBER
    read_setting 0xc0070, 0x6bc, SCREEN_SETUP, GET_NUMBER
    read_setting 0xbffb3, 0x6c8, SCREEN_SETUP, GET_NUMBER
    read_setting 0xbfb4f, 0x6d4, SCREEN_SETUP, GET_NUMBER
    read_setting 0xbfb53, 0x6e0, SCREEN_SETUP, GET_NUMBER
    read_setting EXECUTION_COUNT, 0x6e4, MISC_SETUP, GET_NUMBER
    mov ecx, 0xbfb3b
    mov ebx, 0x6f8
    mov esi, dword [EXECUTION_COUNT]
    mov edx, MISC_SETUP
    inc esi
    mov eax, dword [SCRIPT_HANDLE]
    mov dword [EXECUTION_COUNT], esi
    call GET_NUMBER
    read_setting 0xbfb57, 0x700, MISC_SETUP, GET_NUMBER
    cmp dword [WEAPON_ORDER], 0
    jne near .read_audio
    cmp dword [0xbfb5f], 0
    jne near .read_audio
    mov edx, 3
    mov ebx, 4
    mov ecx, 5
    mov esi, 7
    mov edi, 8
    mov eax, 6
    mov dword [WEAPON_ORDER], edx
    mov dword [0xbfb5f], ebx
    mov dword [0xbfb63], ecx
    mov dword [0xbfb67], esi
    mov dword [0xbfb6b], edi
    mov dword [0xbfb6f], eax
    mov ebx, 2
    mov ecx, 9
    xor edx, edx
    mov esi, 1
    mov dword [0xbfb73], edx
    mov dword [0xbfb77], ebx
    mov dword [0xbfb7b], ecx
    mov dword [0xbfb7f], esi
    mov dword [ebp - 0x18], edx
    mov esi, 0x8bcc0
.read_weapon_choice:
    push dword CONFIG_SOURCE
    push dword 0x25d
    call SET_INDEX_CONTEXT
    mov eax, dword [ebp - 0x18]
    push dword eax
    push dword 0x70c
    push dword esi
    mov edx, MISC_SETUP
    mov ebx, esi
    call FORMAT_KEY
    mov ecx, dword [ebp - 0x18]
    add esp, 0xc
    shl ecx, 2
    mov eax, dword [SCRIPT_HANDLE]
    add ecx, WEAPON_ORDER
    call GET_NUMBER
    mov edx, dword [ebp - 0x18]
    inc edx
    mov dword [ebp - 0x18], edx
    cmp edx, 0xa
    jl short .read_weapon_choice
.read_audio:
    read_setting 0xc00b8, 0x71c, SOUND_SETUP, GET_NUMBER
    read_setting 0xc00b4, 0x734, SOUND_SETUP, GET_NUMBER
    read_setting 0xc00a0, 0x740, SOUND_SETUP, GET_NUMBER
    read_setting 0xc00a4, 0x74c, SOUND_SETUP, GET_NUMBER
    read_setting 0xc0058, 0x758, SOUND_SETUP, GET_NUMBER
    read_setting 0xc0054, 0x764, SOUND_SETUP, GET_NUMBER
    read_setting 0xc005c, 0x770, SOUND_SETUP, GET_NUMBER
    read_setting 0xc0060, 0x77c, SOUND_SETUP, GET_NUMBER
    read_setting 0xc00a8, 0x78c, SOUND_SETUP, GET_NUMBER
    read_setting 0xc00ac, 0x798, SOUND_SETUP, GET_NUMBER
    read_setting 0xc00b0, 0x7a4, SOUND_SETUP, GET_NUMBER
    read_setting 0xc0068, 0x7ac, SOUND_SETUP, GET_NUMBER
    read_setting 0xc0074, 0x7b4, SOUND_SETUP, GET_NUMBER
    lea ecx, [ebp - 0x18]
    mov ebx, 0x7c0
    mov edx, SOUND_SETUP
    mov eax, dword [SCRIPT_HANDLE]
    call GET_NUMBER
    mov eax, dword [ebp - 0x18]
    lea ecx, [ebp - 0x18]
    mov ebx, 0x7d0
    mov edx, SOUND_SETUP
    mov dword [0xc0084], eax
    mov eax, dword [SCRIPT_HANDLE]
    call GET_NUMBER
    mov eax, dword [ebp - 0x18]
    lea ecx, [ebp - 0x18]
    mov ebx, 0x7dc
    mov edx, SOUND_SETUP
    mov dword [0xc0088], eax
    mov eax, dword [SCRIPT_HANDLE]
    call GET_NUMBER
    mov eax, dword [ebp - 0x18]
    lea ecx, [ebp - 0x18]
    mov ebx, 0x7f0
    mov edx, SOUND_SETUP
    mov dword [0xc008c], eax
    mov eax, dword [SCRIPT_HANDLE]
    call GET_NUMBER
    mov eax, dword [ebp - 0x18]
    lea ecx, [ebp - 0x18]
    mov ebx, 0x7fc
    mov edx, SOUND_SETUP
    mov dword [0xc0090], eax
    mov eax, dword [SCRIPT_HANDLE]
    call GET_NUMBER
    mov eax, dword [ebp - 0x18]
    lea ecx, [ebp - 0x18]
    mov ebx, 0x80c
    mov edx, SOUND_SETUP
    mov dword [0xc0094], eax
    mov eax, dword [SCRIPT_HANDLE]
    call GET_NUMBER
    mov eax, dword [ebp - 0x18]
    lea ecx, [ebp - 0x18]
    mov ebx, 0x818
    mov edx, SOUND_SETUP
    mov dword [0xc009c], eax
    mov eax, dword [SCRIPT_HANDLE]
    call GET_NUMBER
    mov eax, dword [ebp - 0x18]
    mov ecx, CONTROLLER_TYPE
    mov ebx, 0x828
    mov edx, CONTROLS
    mov dword [0xc007c], eax
    mov eax, dword [SCRIPT_HANDLE]
    call GET_NUMBER
    read_setting 0xbfffb, 0x838, CONTROLS, GET_NUMBER
    read_setting 0xc006c, 0x844, CONTROLS, GET_NUMBER
    read_setting 0x8c36a, 0x850, CONTROLS, GET_NUMBER
    call CLEAR_MAPPINGS
    call READ_KEYS
    mov eax, dword [CONTROLLER_TYPE]
    dec eax
    cmp eax, 5
    ja short .mouse_and_joystick
    jmp dword [cs:eax*4 + DEVICE_DISPATCH]
    mov eax, dword [SCRIPT_HANDLE]
    call SETUP_MOUSE
    jmp short .finish
.mouse_and_joystick:
    mov eax, dword [SCRIPT_HANDLE]
    call SETUP_MOUSE
    mov eax, dword [SCRIPT_HANDLE]
    call SETUP_JOYSTICK
    mov dword [SETUP_READ], 1
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    mov eax, dword [SCRIPT_HANDLE]
    call SETUP_GAMEPAD
.finish:
    mov dword [SETUP_READ], 1
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
