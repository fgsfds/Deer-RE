bits 32
org 0x10380

%define NAME_COMPARE 0x5ac26
%define ANALOG_TURNING 0x3e8
%define ANALOG_STRAFING 0x3f8
%define ANALOG_MOVING 0x408
%define ANALOG_LOOKING 0x418

analog_name_to_index:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov ebx, eax
    mov edx, ANALOG_TURNING
    call NAME_COMPARE
    test eax, eax
    je .done
    mov edx, ANALOG_STRAFING
    mov eax, ebx
    call NAME_COMPARE
    test eax, eax
    jne .moving
    mov eax, 1
    jmp short .done
.moving:
    mov edx, ANALOG_MOVING
    mov eax, ebx
    call NAME_COMPARE
    test eax, eax
    jne .looking
    mov eax, 5
    jmp short .done
.looking:
    mov edx, ANALOG_LOOKING
    mov eax, ebx
    call NAME_COMPARE
    test eax, eax
    jne .unknown
    mov eax, 2
    jmp short .done
.unknown:
    mov eax, -1
.done:
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0              ; mov eax, eax alignment
