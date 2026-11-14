%macro line_marker 1
    push dword SOURCE_FILE
    push dword %1
    call DEBUG_LINE
%endmacro

%macro format_indexed_key 1
    push esi
    push dword %1
    lea eax, [KEY_NAME]
    push eax
%endmacro

%macro lookup_mapping 3
    line_marker %2
    format_indexed_key %1
    call FORMAT_KEY
    add esp, 12

    push byte 80
    mov ecx, SOURCE_FILE
    mov ebx, 80
    push dword %2 + 1
    xor edx, edx
    lea eax, [KEY_VALUE]
    call CLEAR_VALUE
    lea ecx, [KEY_VALUE]
    lea ebx, [KEY_NAME]
    mov edx, CONTROLS
    mov eax, edi
    call GET_STRING
    lea eax, [KEY_VALUE]
    call %3
    mov [FUNCTION], eax
    cmp eax, -1
%endmacro
