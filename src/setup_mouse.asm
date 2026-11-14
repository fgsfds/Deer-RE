bits 32
org 0x10584

%define SOURCE_FILE 0x278
%define MOUSE_BUTTON 0x440
%define CONTROLS 0x450
%define CLICKED_BUTTON 0x45c
%define ANALOG_AXIS 0x474
%define DIGITAL_NEGATIVE 0x488
%define DIGITAL_POSITIVE 0x4a0
%define ANALOG_SCALE 0x4b8
%define SENSITIVITY 0x4cc
%define KEY_NAME ebp - 0x6c
%define KEY_VALUE ebp - 0xbc
%define FUNCTION ebp - 0x18
%define SCALE ebp - 0x1c

%define DEBUG_LINE 0x5d849
%define FORMAT_KEY 0x5d8cc
%define CLEAR_VALUE 0x5bf59
%define GET_STRING 0x5ba40
%define GET_NUMBER 0x5bbf8
%define ACTION_INDEX 0x10328
%define ANALOG_INDEX 0x10380
%define MAP_BUTTON 0x5cab0
%define MAP_ANALOG_AXIS 0x5caf4
%define MAP_DIGITAL_AXIS 0x5cb5c
%define SET_AXIS_SCALE 0x5cb34
%define SET_SENSITIVITY 0x5c00c

%include "config_mapping.inc"

setup_mouse:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xa8
    mov edi, eax
    xor esi, esi
.button:
    lookup_mapping MOUSE_BUTTON, 0x155, ACTION_INDEX
    je .clicked
    mov edx, esi
    xor ebx, ebx
    call MAP_BUTTON
.clicked:
    lookup_mapping CLICKED_BUTTON, 0x15b, ACTION_INDEX
    je .next_button
    mov ebx, 1
    mov edx, esi
    call MAP_BUTTON
.next_button:
    inc esi
    cmp esi, 3
    jl near .button

    xor esi, esi
.axis:
    lookup_mapping ANALOG_AXIS, 0x165, ANALOG_INDEX
    je .digital_negative
    mov edx, eax
    mov eax, esi
    call MAP_ANALOG_AXIS
.digital_negative:
    lookup_mapping DIGITAL_NEGATIVE, 0x16d, ACTION_INDEX
    je .digital_positive
    mov edx, eax
    xor ebx, ebx
    mov eax, esi
    call MAP_DIGITAL_AXIS
.digital_positive:
    lookup_mapping DIGITAL_POSITIVE, 0x173, ACTION_INDEX
    je .scale
    mov ebx, 1
    mov edx, eax
    mov eax, esi
    call MAP_DIGITAL_AXIS
.scale:
    line_marker 0x179
    format_indexed_key ANALOG_SCALE
    lea ecx, [SCALE]
    lea ebx, [KEY_NAME]
    call FORMAT_KEY
    add esp, 12
    mov edx, CONTROLS
    mov eax, edi
    call GET_NUMBER
    mov edx, [SCALE]
    mov eax, esi
    inc esi
    call SET_AXIS_SCALE
    cmp esi, 2
    jl near .axis

    lea ecx, [FUNCTION]
    mov ebx, SENSITIVITY
    mov edx, CONTROLS
    mov eax, edi
    call GET_NUMBER
    mov eax, [FUNCTION]
    call SET_SENSITIVITY
    lea esp, [ebp - 20]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
