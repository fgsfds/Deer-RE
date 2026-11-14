bits 32
org 0x13e20

%define SET_DEBUG_LOCATION 0x5d849
%define SPRINTF 0x5d8cc
%define PRINT_TEXT_256 0x46e99
%define SOURCE_NAME 0x860
%define CACHE_FORMAT 0x8d0
%define TEMP_BUFFER 0xa6ab0
%define CACHE_LOCK 0xcf7ec
%define CACHE_LENGTH 0xcf7e8
%define CACHE_COUNT 0x9e51

draw_locked_cache_entries:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    xor edx, edx
    mov word [ebp - 0x18], dx
    mov word [ebp - 0x1c], dx
    jmp short check_entry_index
inspect_entry:
    imul edi, esi, 0xc
    mov edx, dword [edi + CACHE_LOCK]
    cmp byte [edx], 0xc8
    jb short next_entry
    push dword SOURCE_NAME
    push dword 0x38d
    call SET_DEBUG_LOCATION
    mov edx, dword [edi + CACHE_LOCK]
    mov dl, byte [edx]
    and edx, strict dword 0xff
    push edx
    mov ebx, dword [edi + CACHE_LENGTH]
    push ebx
    push esi
    push dword CACHE_FORMAT
    push dword TEMP_BUFFER
    call SPRINTF
    add esp, 0x14
    mov ecx, 0xffffffff
    push byte 1
    mov edx, dword [ebp - 0x1a]
    mov ebx, 0x1f
    push dword TEMP_BUFFER
    sar edx, 0x10
    xor eax, eax
    call PRINT_TEXT_256
    add word [ebp - 0x18], 6
next_entry:
    inc word [ebp - 0x1c]
check_entry_index:
    mov esi, dword [ebp - 0x1e]
    mov edx, dword [CACHE_COUNT]
    sar esi, 0x10
    cmp esi, edx
    jl short inspect_entry
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
