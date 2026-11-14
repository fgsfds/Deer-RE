bits 32
org 0x10020

%define SET_DEBUG_LOCATION 0x5ab32
%define PRINTF 0x5ac04
%define KEY_WAITING 0x5ad2c
%define GET_KEY 0x5ad40
%define SOURCE_NAME 0x278
%define DEFAULT_CONFIG_NAME 0x284
%define SETUPFILE_PATTERN 0x290

select_config_file:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x64
    push byte 0x4a
    mov ecx, SOURCE_NAME
    mov ebx, 0x80
    mov edx, DEFAULT_CONFIG_NAME
    mov eax, 0x94a0
    mov edi, 0x94a0
    call 0x5a6fa
    mov edx, 0x94a0
    sub ecx, ecx
    dec ecx
    xor eax, eax
    repne scasb
    not ecx
    dec ecx
    add edx, ecx
    mov ah, byte [edx - 1]
    dec edx
    cmp ah, 0x2e
    je short loc_1006e
loc_10065:
    mov bl, byte [edx - 1]
    dec edx
    cmp bl, 0x2e
    jne short loc_10065
loc_1006e:
    push byte 0x54
    mov ecx, SOURCE_NAME
    mov ebx, 4
    lea eax, [ebp - 0x27]
    call 0x5a6fa
    xor edi, edi
    mov bh, 0x2a
    mov eax, SETUPFILE_PATTERN
    mov byte [ebp - 0x28], bh
    call 0x5a7e0
    and eax, strict dword 0xff
    mov dword [ebp - 0x1c], eax
    je short loc_100bd
    push byte 0x6a
    mov edx, dword [0xabc8]
    mov ecx, SOURCE_NAME
    mov ebx, 0x80
    mov edx, dword [edx + eax*4 + 4]
    mov eax, 0x94a0
    call 0x5a6fa
loc_100bd:
    cmp edi, 1
    jle near loc_1029d
    push dword SOURCE_NAME
    push byte 0x72
    call SET_DEBUG_LOCATION
    push dword 0x29c
    call PRINTF
    add esp, 4
    push dword SOURCE_NAME
    push byte 0x73
    call SET_DEBUG_LOCATION
    push dword 0x2c8
    call PRINTF
    add esp, 4
    push dword SOURCE_NAME
    push byte 0x74
    call SET_DEBUG_LOCATION
    push dword 0x2f4
    call PRINTF
    add esp, 4
    push dword SOURCE_NAME
    push byte 0x75
    call SET_DEBUG_LOCATION
    push dword 0x340
    call PRINTF
    xor ebx, ebx
    add esp, 4
    mov dword [ebp - 0x1c], ebx
    test edi, edi
    jle short loc_1019d
    xor esi, esi
loc_10135:
    mov edx, DEFAULT_CONFIG_NAME
    mov eax, dword [esi + ebp - 0x78]
    call 0x5ac26
    test eax, eax
    je short loc_10168
    push dword SOURCE_NAME
    push byte 0x7a
    call SET_DEBUG_LOCATION
    xor eax, eax
    mov ebx, dword [esi + ebp - 0x78]
    mov al, byte [ebp - 0x1c]
    push ebx
    add eax, 0x61
    push eax
    push dword 0x358
    jmp short loc_10187
loc_10168:
    push dword SOURCE_NAME
    push byte 0x7e
    call SET_DEBUG_LOCATION
    xor eax, eax
    mov edx, dword [esi + ebp - 0x78]
    mov al, byte [ebp - 0x1c]
    push edx
    add eax, 0x61
    push eax
    push dword 0x360
loc_10187:
    call PRINTF
    add esp, 0xc
    mov ecx, dword [ebp - 0x1c]
    inc ecx
    add esi, 4
    mov dword [ebp - 0x1c], ecx
    cmp edi, ecx
    jg short loc_10135
loc_1019d:
    push dword SOURCE_NAME
    push dword 0x81
    call SET_DEBUG_LOCATION
    push dword 0x374
    call PRINTF
    add esp, 4
    push dword SOURCE_NAME
    push dword 0x82
    call SET_DEBUG_LOCATION
    push dword DEFAULT_CONFIG_NAME
    push dword 0x378
    call PRINTF
    add esp, 8
    call 0x5adcc
    call 0x5ade0
    call 0x5aed8
    mov edx, eax
    call 0x5aed8
    add eax, strict dword 0x3e8
    mov esi, 9
    mov dword [ebp - 0x18], eax
loc_101fd:
    mov ecx, dword [ebp - 0x18]
    call 0x5aed8
    cmp eax, ecx
    jae near loc_10281
    call 0x5aed8
    cmp eax, edx
    jbe short loc_10246
    push dword SOURCE_NAME
    push dword 0x8c
    call SET_DEBUG_LOCATION
    push esi
    push dword 0x3b8
    call PRINTF
    add esp, 8
    mov eax, 0xae9e
    dec esi
    call 0x5aedd
    call 0x5aed8
    lea edx, [eax + 0x64]
loc_10246:
    call KEY_WAITING
    test eax, eax
    je short loc_101fd
    call GET_KEY
    and eax, strict dword 0xff
    sub eax, 0x61
    test eax, eax
    jl short loc_101fd
    cmp eax, edi
    jge short loc_101fd
    push dword 0x97
    mov ecx, SOURCE_NAME
    mov ebx, 0x80
    mov edx, dword [ebp + eax*4 - 0x78]
    mov eax, 0x94a0
    call 0x5a6fa
loc_10281:
    push dword SOURCE_NAME
    push dword 0x9c
    call SET_DEBUG_LOCATION
    push dword 0x3cc
    call PRINTF
    add esp, 4
loc_1029d:
    cmp edi, 1
    jne short loc_102be
    push dword 0x9f
    mov ecx, SOURCE_NAME
    mov ebx, 0x80
    mov edx, dword [ebp - 0x78]
    mov eax, 0x94a0
    call 0x5a6fa
loc_102be:
    push dword SOURCE_NAME
    push dword 0xa0
    call SET_DEBUG_LOCATION
    push dword 0x94a0
    push dword 0x3d0
    call PRINTF
    add esp, 8
    call 0x5aed8
    add eax, 0x4b
    mov dword [ebp - 0x1c], eax
    mov esi, dword [ebp - 0x1c]
loc_102ed:
    call 0x5aed8
    cmp eax, esi
    jb short loc_102ed
    xor eax, eax
    mov dword [ebp - 0x1c], eax
    test edi, edi
    jle short loc_1031b
    shl edi, 2
    xor esi, esi
loc_10304:
    mov eax, dword [esi + ebp - 0x78]
    mov edx, dword [ebp - 0x1c]
    call 0x5ab14
    inc edx
    add esi, 4
    mov dword [ebp - 0x1c], edx
    cmp esi, edi
    jl short loc_10304
loc_1031b:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
