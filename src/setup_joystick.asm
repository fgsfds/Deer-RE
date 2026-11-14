bits 32
org 0x10a58

%define SOURCE_FILE 0x278
%define JOYSTICK_BUTTON 0x4e0
%define CONTROLS 0x450
%define CLICKED_BUTTON 0x4f4
%define ANALOG_AXIS 0x550
%define DIGITAL_NEGATIVE 0x568
%define DIGITAL_POSITIVE 0x584
%define ANALOG_SCALE 0x5a0
%define PORT_KEY 0x540
%define JOYSTICK_PORT 0xb0ac
%define ENABLE_RUDDER 0x5b8
%define RUDDER_STATE 0xb09c
%define KEY_NAME ebp - 0xbc
%define KEY_VALUE ebp - 0x6c
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

%include "config_mapping.inc"

setup_joystick:
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
    lookup_mapping JOYSTICK_BUTTON, 0x1c6, ACTION_INDEX
    je .clicked
    mov edx, esi
    xor ebx, ebx
    call MAP_BUTTON
.clicked:
    lookup_mapping CLICKED_BUTTON, 0x1cc, ACTION_INDEX
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
    lookup_mapping ANALOG_AXIS, 0x1d6, ANALOG_INDEX
    je .digital_negative
    mov edx, eax
    mov eax, esi
    call MAP_ANALOG_AXIS
.digital_negative:
    lookup_mapping DIGITAL_NEGATIVE, 0x1de, ACTION_INDEX
    je .digital_positive
    mov edx, eax
    xor ebx, ebx
    mov eax, esi
    call MAP_DIGITAL_AXIS
.digital_positive:
    lookup_mapping DIGITAL_POSITIVE, 0x1e4, ACTION_INDEX
    je .scale
    mov ebx, 1
    mov edx, eax
    mov eax, esi
    call MAP_DIGITAL_AXIS
.scale:
    line_marker 0x1ea
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
    cmp esi, 4
    jl near .axis

    lea ecx, [FUNCTION]
    mov ebx, PORT_KEY
    mov edx, CONTROLS
    mov eax, edi
    call GET_NUMBER
    mov al, [FUNCTION]
    mov ecx, RUDDER_STATE
    mov ebx, ENABLE_RUDDER
    mov edx, CONTROLS
    mov [JOYSTICK_PORT], al
    mov eax, edi
    call GET_NUMBER
    lea esp, [ebp - 20]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0              ; mov eax, eax alignment
