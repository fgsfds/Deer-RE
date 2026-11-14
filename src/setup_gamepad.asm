bits 32
org 0x1084c

%define SOURCE_FILE 0x278
%define CONTROLS 0x450
%define JOYSTICK_BUTTON 0x4e0
%define CLICKED_BUTTON 0x4f4
%define DIGITAL_NEGATIVE 0x510
%define DIGITAL_POSITIVE 0x528
%define PORT_KEY 0x540
%define JOYSTICK_PORT 0xb0ac

%define KEY_NAME ebp - 0xb8
%define KEY_VALUE ebp - 0x68
%define FUNCTION ebp - 0x18
%define DEBUG_LINE 0x5d849
%define FORMAT_KEY 0x5d8cc
%define CLEAR_VALUE 0x5bf59
%define GET_STRING 0x5ba40
%define GET_NUMBER 0x5bbf8
%define ACTION_INDEX 0x10328
%define MAP_BUTTON 0x5cab0
%define MAP_DIGITAL_AXIS 0x5cb5c

%include "config_mapping.inc"

setup_gamepad:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xa4
    mov edi, eax
    xor esi, esi
.button:
    lookup_mapping JOYSTICK_BUTTON, 0x194, ACTION_INDEX
    je .clicked
    mov edx, esi
    xor ebx, ebx
    call MAP_BUTTON
.clicked:
    lookup_mapping CLICKED_BUTTON, 0x19a, ACTION_INDEX
    je .next_button
    mov ebx, 1
    mov edx, esi
    call MAP_BUTTON
.next_button:
    inc esi
    cmp esi, 8
    jl near .button

    xor esi, esi
.axis:
    lookup_mapping DIGITAL_NEGATIVE, 0x1a4, ACTION_INDEX
    je .positive
    mov edx, eax
    xor ebx, ebx
    mov eax, esi
    call MAP_DIGITAL_AXIS
.positive:
    lookup_mapping DIGITAL_POSITIVE, 0x1aa, ACTION_INDEX
    je .next_axis
    mov ebx, 1
    mov edx, eax
    mov eax, esi
    call MAP_DIGITAL_AXIS
.next_axis:
    inc esi
    cmp esi, 2
    jl near .axis

    lea ecx, [FUNCTION]
    mov ebx, PORT_KEY
    mov edx, CONTROLS
    mov eax, edi
    call GET_NUMBER
    mov al, [FUNCTION]
    mov [JOYSTICK_PORT], al
    lea esp, [ebp - 20]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
