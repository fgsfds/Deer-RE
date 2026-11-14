bits 32
org 0x1aabc

%define TRANSLATE_WORD 0x1a678
%define TRANSLATE_NUMBER 0x1a8c4
%define GET_LABEL 0x1a554
%define KEYWORD 0x1a5f4
%define IS_SPECIAL 0x1a044
%define SET_DEBUG_LOCATION 0x5ab32
%define PRINTF 0x5ac04
%define OPEN_GAME_FILE 0x310bf
%define READ_GAME_FILE 0x31201
%define GAME_FILE_LENGTH 0x31383
%define CLOSE_GAME_FILE 0x313c4
%define GAME_EXIT 0x14f28
%define TO_UPPER 0x5e8c3
%define PUTS 0x5e9d9
%define STRCMP 0x60140
%define SOURCE_NAME 0x1e00
%define TEXT_CURSOR 0xbd9c4
%define LINE_NUMBER 0xc3358

command_dispatch:
    dd loc_1ca4c - 0x10000
    dd loc_1c284 - 0x10000
    dd loc_1bb89 - 0x10000
    dd loc_1beae - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1c7fd - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1b9c9 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1bec6 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b25b - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ae89 - 0x10000
    dd loc_1b030 - 0x10000
    dd loc_1b0fe - 0x10000
    dd loc_1c0bb - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1beae - 0x10000
    dd loc_1b7c0 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1beae - 0x10000
    dd loc_1bffa - 0x10000
    dd loc_1c018 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b2a9 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1beae - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1addd - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1beae - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1be9f - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1b494 - 0x10000
    dd loc_1b613 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1c65e - 0x10000
    dd loc_1beae - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1c88c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1bf54 - 0x10000
    dd loc_1c06b - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1c561 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1bd03 - 0x10000
    dd loc_1beae - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1c0d8 - 0x10000
    dd loc_1c1ae - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1bf59 - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1b7d4 - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1ca4c - 0x10000
    dd loc_1bf5e - 0x10000
    dd loc_1ca4c - 0x10000

condition_dispatch:
    dd loc_1c8c5 - 0x10000
    dd loc_1c8d1 - 0x10000
    dd loc_1c8dd - 0x10000
    dd loc_1c8e9 - 0x10000
    dd loc_1c8f5 - 0x10000
    dd loc_1c901 - 0x10000
    dd loc_1c90d - 0x10000
    dd loc_1c919 - 0x10000
    dd loc_1c925 - 0x10000
    dd loc_1c931 - 0x10000
    dd loc_1c93d - 0x10000
    dd loc_1c949 - 0x10000
    dd loc_1c955 - 0x10000
    dd loc_1c961 - 0x10000
    dd loc_1c96d - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c979 - 0x10000
    dd loc_1c9ba - 0x10000
    dd loc_1c9c3 - 0x10000
    dd loc_1c9cc - 0x10000
    dd loc_1c9d5 - 0x10000
    dd loc_1c9fa - 0x10000
    dd loc_1ca03 - 0x10000
    dd loc_1ca0c - 0x10000
    dd loc_1ca15 - 0x10000

parse_command:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x10
    cmp byte [0xc0046], 0xc
    ja short loc_1adb8
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0
    je short loc_1adb8
    cmp byte [eax + 1], 0
    jne short loc_1adbf
loc_1adb8:
    mov dl, 1
    jmp near loc_1ca4e
loc_1adbf:
    call TRANSLATE_WORD
    mov dl, al
    inc al
    cmp al, 0x93
    ja near loc_1ca4c
    and eax, strict dword 0xff
    jmp dword [cs:nosplit eax*4 + command_dispatch - 0x10000]
loc_1addd:
    mov eax, dword [0xc3356]
    mov esi, dword [0xbd9c0]
    sar eax, 0x10
    sub esi, 4
    mov dword [ebp - 0x20], eax
    mov dword [0xbd9c0], esi
loc_1adf7:
    mov eax, dword [TEXT_CURSOR]
    inc eax
    mov dl, byte [eax]
    mov dword [TEXT_CURSOR], eax
    cmp dl, 0xa
    jne short loc_1ae10
    inc word [LINE_NUMBER]
loc_1ae10:
    mov eax, dword [TEXT_CURSOR]
    mov dh, byte [eax]
    test dh, dh
    jne short loc_1ae68
    push dword SOURCE_NAME
    push dword 0x1e6
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov edx, dword [ebp - 0x20]
    push edx
    push dword 0x1fd8
    call PRINTF
    mov cl, byte [0xc0046]
    xor dl, dl
    inc cl
    add esp, 0xc
    mov byte [0xc0046], cl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ae68:
    cmp dh, 0x2a
    jne short loc_1adf7
    cmp byte [eax + 1], 0x2f
    jne short loc_1adf7
    add eax, 2
    xor dl, dl
    mov dword [TEXT_CURSOR], eax
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ae89:
    cmp dword [0xbd9b8], 0
    jne short loc_1aee7
    cmp dword [0xc3344], 0
    jne short loc_1aee7
    call GET_LABEL
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9ac]
    mov edi, dword [0xbd9c0]
    shl eax, 2
    sub edi, 4
    add eax, edx
    mov ebx, dword [0xbd9b4]
    mov dword [0xbd9c0], edi
    mov dword [eax], edi
    mov eax, 1
    xor dl, dl
    add ebx, eax
    mov dword [0xc3344], eax
    mov dword [0xbd9b4], ebx
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1aee7:
    call GET_LABEL
    xor ebx, ebx
loc_1aeee:
    mov eax, dword [0xbd9b4]
    mov ecx, dword [0xbd9bc]
    shl eax, 6
    mov edx, dword [ebx + 0x9730]
    add eax, ecx
    call STRCMP
    test eax, eax
    jne short loc_1af5f
    mov cl, byte [0xc0046]
    push dword SOURCE_NAME
    inc cl
    push dword 0x201
    mov byte [0xc0046], cl
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x2004
    xor dl, dl
    call PRINTF
    add esp, 0xc
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1af5f:
    add ebx, 4
    cmp ebx, strict dword 0x24c
    jl short loc_1aeee
    xor ecx, ecx
    mov esi, dword [0xbd9b4]
    mov dword [ebp - 0x20], ecx
    test esi, esi
    jle short loc_1afc4
    xor ebx, ebx
loc_1af7b:
    mov edx, dword [0xbd9b4]
    mov eax, dword [0xbd9bc]
    shl edx, 6
    add edx, eax
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_1afb0
    mov eax, dword [ebp - 0x20]
    mov edx, dword [0xbd9ac]
    shl eax, 2
    add eax, edx
    mov edx, dword [0xbd9c0]
    mov eax, dword [eax]
    mov dword [edx], eax
    jmp short loc_1afc4
loc_1afb0:
    mov edi, dword [ebp - 0x20]
    mov edx, dword [0xbd9b4]
    inc edi
    add ebx, 0x40
    mov dword [ebp - 0x20], edi
    cmp edi, edx
    jl short loc_1af7b
loc_1afc4:
    mov eax, dword [ebp - 0x20]
    cmp eax, dword [0xbd9b4]
    jne short loc_1b013
    push dword SOURCE_NAME
    push dword 0x210
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x2034
    call PRINTF
    mov ch, byte [0xc0046]
    inc ch
    add esp, 0xc
    mov byte [0xc0046], ch
loc_1b013:
    mov ecx, dword [0xbd9c0]
    add ecx, 4
    xor dl, dl
    mov dword [0xbd9c0], ecx
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b030:
    cmp dword [0xc3344], 0
    jne short loc_1b06e
    mov eax, SOURCE_NAME
    push eax
    push dword 0x221
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    mov eax, 0x205c
    push eax
    call PRINTF
    mov ah, byte [0xc0046]
    inc ah
    add esp, 8
    mov byte [0xc0046], ah
loc_1b06e:
    cmp word [0xc3356], 0
    jle short loc_1b0ab
    push dword SOURCE_NAME
    push dword 0x228
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x208c
    call PRINTF
    mov dl, byte [0xc0046]
    inc dl
    add esp, 8
    mov byte [0xc0046], dl
loc_1b0ab:
    cmp word [0xc3356], 0
    jge short loc_1b0e8
    push dword SOURCE_NAME
    push dword 0x22d
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x20c8
    call PRINTF
    mov dh, byte [0xc0046]
    inc dh
    add esp, 8
    mov byte [0xc0046], dh
loc_1b0e8:
    xor ebx, ebx
    xor dl, dl
    mov dword [0xc3344], ebx
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b0fe:
    xor esi, esi
    call GET_LABEL
    cmp esi, strict dword 0x93
    jge near loc_1b195
    lea ebx, [esi*4]
loc_1b118:
    mov eax, dword [0xbd9b4]
    mov ecx, dword [0xbd9bc]
    shl eax, 6
    mov edx, dword [ebx + 0x9730]
    add eax, ecx
    call STRCMP
    test eax, eax
    jne short loc_1b189
    mov bl, byte [0xc0046]
    push dword SOURCE_NAME
    inc bl
    push dword 0x23b
    mov byte [0xc0046], bl
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x2104
    xor dl, dl
    call PRINTF
    add esp, 0xc
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b189:
    add ebx, 4
    inc esi
    cmp ebx, strict dword 0x24c
    jl short loc_1b118
loc_1b195:
    mov edi, dword [0xbd9b4]
    xor esi, esi
    test edi, edi
    jle short loc_1b212
    xor ebx, ebx
loc_1b1a3:
    mov ecx, dword [0xbd9b4]
    mov eax, dword [0xbd9bc]
    shl ecx, 6
    lea edx, [eax + ebx]
    add eax, ecx
    call STRCMP
    test eax, eax
    jne short loc_1b205
    mov bh, byte [0xc0045]
    push dword SOURCE_NAME
    inc bh
    push dword 0x244
    mov byte [0xc0045], bh
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x2134
    call PRINTF
    add esp, 0xc
    jmp short loc_1b212
loc_1b205:
    mov eax, dword [0xbd9b4]
    inc esi
    add ebx, 0x40
    cmp esi, eax
    jl short loc_1b1a3
loc_1b212:
    call TRANSLATE_NUMBER
    mov edx, dword [0xbd9b4]
    cmp esi, edx
    jne short loc_1b23e
    mov ecx, dword [0xbd9c0]
    mov ebx, dword [0xbd9ac]
    lea eax, [esi + 1]
    shl edx, 2
    mov dword [0xbd9b4], eax
    mov eax, dword [ecx - 4]
    mov dword [edx + ebx], eax
loc_1b23e:
    mov ebx, dword [0xbd9c0]
    sub ebx, 8
    xor dl, dl
    mov dword [0xbd9c0], ebx
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b25b:
    xor ecx, ecx
    mov dword [ebp - 0x20], ecx
    cmp ecx, 4
    jge short loc_1b280
loc_1b265:
    call KEYWORD
    cmp eax, -1
    jne short loc_1b280
    mov esi, dword [ebp - 0x20]
    inc esi
    call TRANSLATE_NUMBER
    mov dword [ebp - 0x20], esi
    cmp esi, 4
    jl short loc_1b265
loc_1b280:
    mov edx, 4
loc_1b285:
    cmp edx, dword [ebp - 0x20]
    jle near loc_1ca4c
    mov ebx, dword [ebp - 0x20]
    mov eax, dword [0xbd9c0]
    inc ebx
    mov dword [eax], 0
    add eax, edx
    mov dword [ebp - 0x20], ebx
    mov dword [0xbd9c0], eax
    jmp short loc_1b285
loc_1b2a9:
    cmp dword [0xbd9b8], 0
    jne short loc_1b2bb
    cmp dword [0xc3344], 0
    je short loc_1b308
loc_1b2bb:
    xor ebx, ebx
    call TRANSLATE_NUMBER
    mov dword [ebp - 0x20], ebx
loc_1b2c5:
    call KEYWORD
    cmp eax, -1
    jne short loc_1b2f0
    call TRANSLATE_NUMBER
    mov esi, dword [0xbd9c0]
    mov edi, dword [ebp - 0x20]
    mov eax, dword [esi - 4]
    sub esi, 4
    or edi, eax
    mov dword [0xbd9c0], esi
    mov dword [ebp - 0x20], edi
    jmp short loc_1b2c5
loc_1b2f0:
    mov eax, dword [0xbd9c0]
    add eax, 4
    mov edx, dword [ebp - 0x20]
    mov dword [eax - 4], edx
    mov dword [0xbd9c0], eax
    jmp near loc_1ca4c
loc_1b308:
    mov edx, dword [0xbd9c0]
    sub edx, 4
    xor ebx, ebx
    mov dword [0xbd9c0], edx
    call GET_LABEL
loc_1b31e:
    mov eax, dword [0xbd9b4]
    mov ecx, dword [0xbd9bc]
    shl eax, 6
    mov edx, dword [ebx + 0x9730]
    add eax, ecx
    call STRCMP
    test eax, eax
    jne short loc_1b38f
    mov ch, byte [0xc0046]
    push dword SOURCE_NAME
    inc ch
    push dword 0x278
    mov byte [0xc0046], ch
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x216c
    xor dl, dl
    call PRINTF
    add esp, 0xc
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b38f:
    add ebx, 4
    cmp ebx, strict dword 0x24c
    jl short loc_1b31e
    mov ebx, dword [0xbd9b4]
    xor esi, esi
    test ebx, ebx
    jle short loc_1b416
    xor ebx, ebx
loc_1b3a8:
    mov ecx, dword [0xbd9b4]
    mov eax, dword [0xbd9bc]
    shl ecx, 6
    lea edx, [eax + ebx]
    add eax, ecx
    call STRCMP
    test eax, eax
    jne short loc_1b408
    mov al, byte [0xc0045]
    push dword SOURCE_NAME
    inc al
    push dword 0x280
    mov byte [0xc0045], al
    call SET_DEBUG_LOCATION
    mov edx, dword [0xbd9b4]
    mov eax, dword [0xbd9bc]
    shl edx, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x219c
    call PRINTF
    add esp, 0xc
    jmp short loc_1b416
loc_1b408:
    mov ecx, dword [0xbd9b4]
    inc esi
    add ebx, 0x40
    cmp esi, ecx
    jl short loc_1b3a8
loc_1b416:
    mov edi, dword [0xbd9b4]
    cmp esi, edi
    jne short loc_1b440
    lea edx, [edi*4]
    lea eax, [edi + 1]
    mov ebx, dword [0xbd9ac]
    mov dword [0xbd9b4], eax
    lea eax, [ebx + edx]
    mov edx, dword [0xbd9c0]
    mov dword [eax], edx
loc_1b440:
    xor eax, eax
    mov dword [ebp - 0x20], eax
loc_1b445:
    call KEYWORD
    test eax, eax
    jge short loc_1b45f
    mov edx, dword [ebp - 0x20]
    inc edx
    call TRANSLATE_NUMBER
    mov dword [ebp - 0x20], edx
    cmp edx, 2
    jl short loc_1b445
loc_1b45f:
    mov eax, dword [ebp - 0x20]
    cmp eax, 2
    jge near loc_1ca4c
loc_1b46b:
    mov edx, dword [0xbd9c0]
    mov dword [edx], 0
    add edx, 4
    inc eax
    mov dword [0xbd9c0], edx
    cmp eax, 2
    jl short loc_1b46b
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b494:
    sub dword [0xbd9c0], 4
    call TRANSLATE_NUMBER
    mov ecx, dword [0xbd9c0]
    mov eax, dword [ecx - 4]
    sub ecx, 4
    dec eax
    mov dword [0xbd9c0], ecx
    test eax, eax
    jl near loc_1b56c
    lea ecx, [eax*8]
    add ecx, eax
    shl ecx, 4
    xor esi, esi
    sub ecx, eax
loc_1b4cb:
    call KEYWORD
    cmp eax, -1
    jne near loc_1ca4c
    xor dl, dl
loc_1b4db:
    mov eax, dword [TEXT_CURSOR]
    mov al, byte [eax]
    and eax, strict dword 0xff
    call 0x1a078
    test al, al
    jne short loc_1b512
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0xa
    jne short loc_1b501
    inc word [LINE_NUMBER]
loc_1b501:
    mov eax, dword [TEXT_CURSOR]
    inc eax
    mov bh, byte [eax]
    mov dword [TEXT_CURSOR], eax
    cmp dl, bh
    jne short loc_1b4db
loc_1b512:
    xor edx, edx
    mov ebx, esi
    mov dword [ebp - 0x20], edx
loc_1b519:
    mov edi, dword [ebp - 0x20]
    mov eax, dword [TEXT_CURSOR]
    add eax, edi
    mov al, byte [eax]
    and eax, strict dword 0xff
    lea edx, [ecx + ebx]
    call 0x1a078
    add edx, edi
    test al, al
    je short loc_1b54f
    mov eax, dword [TEXT_CURSOR]
    add eax, edi
    mov al, byte [eax]
    mov byte [edx + 0xbd770], al
    lea eax, [edi + 1]
    mov dword [ebp - 0x20], eax
    jmp short loc_1b519
loc_1b54f:
    mov byte [edx + 0xbd770], al
    add dword [TEXT_CURSOR], edi
    cmp esi, 0x75
    jg near loc_1ca4c
    add esi, 0xd
    jmp near loc_1b4cb
loc_1b56c:
    xor ebx, ebx
    xor ecx, ecx
loc_1b570:
    call KEYWORD
    cmp eax, -1
    jne near loc_1ca4c
    mov dl, cl
loc_1b580:
    mov eax, dword [TEXT_CURSOR]
    mov al, byte [eax]
    and eax, strict dword 0xff
    call 0x1a078
    test al, al
    jne short loc_1b5b7
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0xa
    jne short loc_1b5a6
    inc word [LINE_NUMBER]
loc_1b5a6:
    mov eax, dword [TEXT_CURSOR]
    inc eax
    mov dh, byte [eax]
    mov dword [TEXT_CURSOR], eax
    cmp dl, dh
    jne short loc_1b580
loc_1b5b7:
    mov dword [ebp - 0x20], ecx
    mov edx, ebx
loc_1b5bc:
    mov esi, dword [ebp - 0x20]
    mov eax, dword [TEXT_CURSOR]
    add eax, esi
    mov al, byte [eax]
    and eax, strict dword 0xff
    call 0x1a078
    test al, al
    je short loc_1b5ee
    mov eax, dword [TEXT_CURSOR]
    add eax, esi
    inc edx
    lea edi, [esi + 1]
    mov al, byte [eax]
    mov dword [ebp - 0x20], edi
    mov byte [edx + 0xbd727], al
    jmp short loc_1b5bc
loc_1b5ee:
    mov edi, dword [TEXT_CURSOR]
    add edi, esi
    mov byte [edx + 0xbd728], cl
    mov dword [TEXT_CURSOR], edi
    cmp ebx, 0x75
    jg near loc_1ca4c
    add ebx, 0xd
    jmp near loc_1b570
loc_1b613:
    sub dword [0xbd9c0], 4
    xor dl, dl
loc_1b61c:
    mov eax, dword [TEXT_CURSOR]
    mov al, byte [eax]
    and eax, strict dword 0xff
    call 0x1a078
    test al, al
    jne short loc_1b655
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0xa
    jne short loc_1b642
    inc word [LINE_NUMBER]
loc_1b642:
    mov ecx, dword [TEXT_CURSOR]
    inc ecx
    mov bl, byte [ecx]
    mov dword [TEXT_CURSOR], ecx
    cmp dl, bl
    jne short loc_1b61c
loc_1b655:
    xor esi, esi
    mov dword [ebp - 0x20], esi
loc_1b65a:
    mov eax, dword [TEXT_CURSOR]
    mov al, byte [eax]
    and eax, strict dword 0xff
    call 0x1a078
    test al, al
    je short loc_1b68e
    mov eax, dword [TEXT_CURSOR]
    mov ebx, dword [ebp - 0x20]
    inc eax
    lea edi, [ebx + 1]
    mov dl, byte [eax - 1]
    mov dword [TEXT_CURSOR], eax
    mov dword [ebp - 0x20], edi
    mov byte [ebx + 0xa6ab0], dl
    jmp short loc_1b65a
loc_1b68e:
    mov eax, dword [ebp - 0x20]
    xor edx, edx
    xor bh, bh
    mov dl, byte [0xc0043]
    mov byte [eax + 0xa6ab0], bh
    mov eax, 0xa6ab0
    call OPEN_GAME_FILE
    mov esi, eax
    test eax, eax
    jne short loc_1b703
    mov ah, byte [0xc0046]
    push dword SOURCE_NAME
    inc ah
    push dword 0x2e0
    mov byte [0xc0046], ah
    call SET_DEBUG_LOCATION
    mov edx, dword [0xbd9b4]
    mov eax, dword [0xbd9bc]
    shl edx, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x21d0
    xor dl, dl
    call PRINTF
    add esp, 0xc
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b703:
    call GAME_FILE_LENGTH
    push dword SOURCE_NAME
    push dword 0x2e6
    mov edi, eax
    call SET_DEBUG_LOCATION
    push dword 0xa6ab0
    push dword 0x21f8
    call PRINTF
    mov eax, 1
    mov cx, word [LINE_NUMBER]
    mov word [LINE_NUMBER], ax
    mov al, byte [0xc335a]
    mov byte [ebp - 0x18], al
    xor al, al
    mov byte [0xc335a], al
    mov eax, dword [TEXT_CURSOR]
    mov edx, dword [0xc3348]
    mov dword [ebp - 0x24], eax
    mov eax, dword [0xc3340]
    mov ebx, edi
    add eax, edx
    add esp, 8
    mov edx, eax
    mov dword [TEXT_CURSOR], eax
    mov eax, esi
    mov byte [edx + edi], 0
    call READ_GAME_FILE
    mov eax, esi
    call CLOSE_GAME_FILE
loc_1b77c:
    call parse_command
    test al, al
    je short loc_1b77c
    mov eax, dword [ebp - 0x24]
    mov dx, word [0xc3354]
    mov dword [TEXT_CURSOR], eax
    mov ax, word [LINE_NUMBER]
    mov word [LINE_NUMBER], cx
    add edx, eax
    mov al, byte [ebp - 0x18]
    mov word [0xc3354], dx
    mov byte [0xc335a], al
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b7c0:
    mov ecx, dword [0xbd9b8]
    test ecx, ecx
    jne short loc_1b7d4
    mov esi, dword [0xc3344]
    test esi, esi
    je short loc_1b7e7
loc_1b7d4:
    call TRANSLATE_NUMBER
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b7e7:
    sub dword [0xbd9c0], 4
    call GET_LABEL
    cmp ecx, strict dword 0x93
    jge near loc_1b883
    lea ebx, [ecx*4]
loc_1b806:
    mov eax, dword [0xbd9b4]
    mov ecx, dword [0xbd9bc]
    shl eax, 6
    mov edx, dword [ebx + 0x9730]
    add eax, ecx
    call STRCMP
    test eax, eax
    jne short loc_1b877
    mov ah, byte [0xc0046]
    push dword SOURCE_NAME
    inc ah
    push dword 0x30b
    mov byte [0xc0046], ah
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x220c
    xor dl, dl
    call PRINTF
    add esp, 0xc
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b877:
    add ebx, 4
    inc esi
    cmp ebx, strict dword 0x24c
    jl short loc_1b806
loc_1b883:
    mov eax, dword [0xbd9b4]
    xor esi, esi
    test eax, eax
    jle short loc_1b900
    xor ebx, ebx
loc_1b890:
    mov ecx, dword [0xbd9b4]
    mov eax, dword [0xbd9bc]
    shl ecx, 6
    lea edx, [eax + ebx]
    add eax, ecx
    call STRCMP
    test eax, eax
    jne short loc_1b8f2
    mov dl, byte [0xc0045]
    push dword SOURCE_NAME
    inc dl
    push dword 0x313
    mov byte [0xc0045], dl
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x223c
    call PRINTF
    add esp, 0xc
    jmp short loc_1b900
loc_1b8f2:
    mov edx, dword [0xbd9b4]
    inc esi
    add ebx, 0x40
    cmp esi, edx
    jl short loc_1b890
loc_1b900:
    mov ebx, dword [0xbd9b4]
    cmp esi, ebx
    jne short loc_1b92a
    lea edx, [ebx*4]
    lea eax, [esi + 1]
    mov ebx, dword [0xbd9ac]
    mov dword [0xbd9b4], eax
    lea eax, [ebx + edx]
    mov edx, dword [0xbd9c0]
    mov dword [eax], edx
loc_1b92a:
    xor ecx, ecx
    mov dword [ebp - 0x20], ecx
loc_1b92f:
    call KEYWORD
    test eax, eax
    jge short loc_1b994
    mov esi, dword [ebp - 0x20]
    cmp esi, 2
    jne short loc_1b984
    xor edx, edx
loc_1b942:
    call KEYWORD
    cmp eax, -1
    jne short loc_1b966
    call TRANSLATE_NUMBER
    mov ebx, dword [0xbd9c0]
    sub ebx, 4
    mov ecx, dword [ebx]
    mov dword [0xbd9c0], ebx
    or edx, ecx
    jmp short loc_1b942
loc_1b966:
    mov eax, dword [0xbd9c0]
    add eax, 4
    mov dword [eax - 4], edx
    mov dword [0xbd9c0], eax
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b984:
    lea edi, [esi + 1]
    call TRANSLATE_NUMBER
    mov dword [ebp - 0x20], edi
    cmp edi, 3
    jl short loc_1b92f
loc_1b994:
    mov eax, dword [ebp - 0x20]
    cmp eax, 3
    jge near loc_1ca4c
loc_1b9a0:
    mov edx, dword [0xbd9c0]
    mov dword [edx], 0
    add edx, 4
    inc eax
    mov dword [0xbd9c0], edx
    cmp eax, 3
    jl short loc_1b9a0
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b9c9:
    mov edx, dword [0xbd9b8]
    test edx, edx
    jne short loc_1b9dc
    cmp dword [0xc3344], 0
    je short loc_1b9ef
loc_1b9dc:
    call TRANSLATE_NUMBER
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1b9ef:
    mov ecx, dword [0xbd9c0]
    sub ecx, 4
    xor esi, esi
    mov dword [0xbd9c0], ecx
    call GET_LABEL
    cmp edx, strict dword 0x93
    jge near loc_1ba93
    lea ebx, [edx*4]
loc_1ba18:
    mov eax, dword [0xbd9b4]
    mov ecx, dword [0xbd9bc]
    shl eax, 6
    mov edx, dword [ebx + 0x9730]
    add eax, ecx
    call STRCMP
    test eax, eax
    jne short loc_1ba87
    mov al, byte [0xc0046]
    push dword SOURCE_NAME
    inc al
    push dword 0x341
    mov byte [0xc0046], al
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x226c
    xor dl, dl
    call PRINTF
    add esp, 0xc
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ba87:
    add ebx, 4
    inc esi
    cmp ebx, strict dword 0x24c
    jl short loc_1ba18
loc_1ba93:
    mov ecx, dword [0xbd9b4]
    xor esi, esi
    test ecx, ecx
    jle short loc_1bb11
    xor ebx, ebx
loc_1baa1:
    mov ecx, dword [0xbd9b4]
    mov eax, dword [0xbd9bc]
    shl ecx, 6
    lea edx, [eax + ebx]
    add eax, ecx
    call STRCMP
    test eax, eax
    jne short loc_1bb03
    mov ah, byte [0xc0045]
    push dword SOURCE_NAME
    inc ah
    push dword 0x349
    mov byte [0xc0045], ah
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbd9b4]
    mov edx, dword [0xbd9bc]
    shl eax, 6
    add eax, edx
    push eax
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x229c
    call PRINTF
    add esp, 0xc
    jmp short loc_1bb11
loc_1bb03:
    mov edi, dword [0xbd9b4]
    inc esi
    add ebx, 0x40
    cmp esi, edi
    jl short loc_1baa1
loc_1bb11:
    mov eax, dword [0xbd9b4]
    cmp esi, eax
    jne short loc_1bb35
    lea edx, [eax*4]
    inc eax
    mov ebx, dword [0xbd9ac]
    mov dword [0xbd9b4], eax
    mov eax, dword [0xbd9c0]
    mov dword [edx + ebx], eax
loc_1bb35:
    xor edx, edx
    mov dword [ebp - 0x20], edx
loc_1bb3a:
    call KEYWORD
    test eax, eax
    jge short loc_1bb54
    mov ebx, dword [ebp - 0x20]
    inc ebx
    call TRANSLATE_NUMBER
    mov dword [ebp - 0x20], ebx
    cmp ebx, 5
    jl short loc_1bb3a
loc_1bb54:
    mov eax, dword [ebp - 0x20]
    cmp eax, 5
    jge near loc_1ca4c
loc_1bb60:
    mov edx, dword [0xbd9c0]
    mov dword [edx], 0
    add edx, 4
    inc eax
    mov dword [0xbd9c0], edx
    cmp eax, 5
    jl short loc_1bb60
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1bb89:
    cmp dword [0xc3344], 0
    je short loc_1bbc7
    mov eax, SOURCE_NAME
    push eax
    push dword 0x360
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    mov eax, 0x22d0
    push eax
    call PRINTF
    mov ah, byte [0xc0046]
    inc ah
    add esp, 8
    mov byte [0xc0046], ah
loc_1bbc7:
    cmp dword [0xbd9b8], 0
    je short loc_1bc03
    push dword SOURCE_NAME
    push dword 0x366
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x2300
    call PRINTF
    mov dl, byte [0xc0046]
    inc dl
    add esp, 8
    mov byte [0xc0046], dl
loc_1bc03:
    mov ecx, dword [0xbd9c0]
    xor ebx, ebx
    sub ecx, 4
    mov word [0xc3356], bx
    mov dword [0xbd9c0], ecx
    mov dword [0xbd9b8], ecx
    call TRANSLATE_NUMBER
    mov esi, dword [0xbd9c0]
    xor edi, edi
    sub esi, 4
    mov dword [ebp - 0x20], edi
    mov edx, dword [esi]
    mov eax, dword [0xbd9b8]
    mov dword [0xbd9c0], esi
    mov dword [nosplit edx*4 + 0x82280], eax
    xor edx, edx
    xor esi, esi
loc_1bc4c:
    mov eax, dword [0xbd9b8]
    mov dword [edx + eax], esi
    cmp edx, 0xc
    jne short loc_1bc9e
    xor ecx, ecx
    mov dword [ebp - 0x20], ecx
loc_1bc5e:
    call KEYWORD
    cmp eax, -1
    jne short loc_1bc89
    call TRANSLATE_NUMBER
    mov esi, dword [0xbd9c0]
    mov edi, dword [ebp - 0x20]
    mov eax, dword [esi - 4]
    sub esi, 4
    or edi, eax
    mov dword [0xbd9c0], esi
    mov dword [ebp - 0x20], edi
    jmp short loc_1bc5e
loc_1bc89:
    mov eax, dword [0xbd9c0]
    add eax, 4
    mov edx, dword [ebp - 0x20]
    mov dword [eax - 4], edx
    mov dword [0xbd9c0], eax
    jmp short loc_1bced
loc_1bc9e:
    call KEYWORD
    test eax, eax
    jl short loc_1bcc2
    mov eax, 4
    sub eax, dword [ebp - 0x20]
    mov ebx, dword [0xbd9c0]
    shl eax, 2
    add ebx, eax
    mov dword [0xbd9c0], ebx
    jmp short loc_1bced
loc_1bcc2:
    call TRANSLATE_NUMBER
    mov eax, dword [0xbd9b8]
    mov ebx, dword [0xbd9c0]
    lea ecx, [eax + edx]
    mov eax, dword [ebx - 4]
    mov dword [ecx], eax
    mov eax, dword [ebp - 0x20]
    inc eax
    add edx, 4
    mov dword [ebp - 0x20], eax
    cmp edx, 0x10
    jl near loc_1bc4c
loc_1bced:
    xor bl, bl
    xor dl, dl
    mov byte [0xc335a], bl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1bd03:
    cmp dword [0xc3344], 0
    je short loc_1bd3f
    push dword SOURCE_NAME
    push dword 0x397
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x2330
    call PRINTF
    mov bl, byte [0xc0046]
    inc bl
    add esp, 8
    mov byte [0xc0046], bl
loc_1bd3f:
    cmp dword [0xbd9b8], 0
    je short loc_1bd7b
    push dword SOURCE_NAME
    push dword 0x39d
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x2364
    call PRINTF
    mov bh, byte [0xc0046]
    inc bh
    add esp, 8
    mov byte [0xc0046], bh
loc_1bd7b:
    xor edx, edx
    mov word [0xc3356], dx
    mov edx, dword [0xbd9c0]
    sub edx, 4
    mov dword [0xbd9c0], edx
    mov dword [0xbd9b8], edx
    call TRANSLATE_NUMBER
    mov ebx, dword [0xbd9c0]
    sub ebx, 4
    mov eax, dword [ebx]
    mov dword [0xbd9c0], ebx
    mov dword [ebp - 0x20], eax
    call TRANSLATE_NUMBER
    mov ecx, dword [0xbd9c0]
    xor esi, esi
    mov ebx, dword [ecx - 4]
    mov edx, dword [0xbd9b8]
    sub ecx, 4
    mov dword [nosplit ebx*4 + 0x82280], edx
    mov dword [0xbd9c0], ecx
    mov eax, dword [ecx]
    mov dl, byte [ebp - 0x20]
    mov dword [ebp - 0x20], esi
    mov byte [eax + 0x68fd0], dl
    xor edx, edx
    xor ecx, ecx
loc_1bdea:
    mov eax, dword [0xbd9b8]
    mov dword [edx + eax], ecx
    cmp edx, 0xc
    jne short loc_1be3c
    xor ecx, ecx
    mov dword [ebp - 0x20], ecx
loc_1bdfc:
    call KEYWORD
    cmp eax, -1
    jne short loc_1be27
    call TRANSLATE_NUMBER
    mov esi, dword [0xbd9c0]
    mov edi, dword [ebp - 0x20]
    mov eax, dword [esi - 4]
    sub esi, 4
    or edi, eax
    mov dword [0xbd9c0], esi
    mov dword [ebp - 0x20], edi
    jmp short loc_1bdfc
loc_1be27:
    mov eax, dword [0xbd9c0]
    add eax, 4
    mov edx, dword [ebp - 0x20]
    mov dword [eax - 4], edx
    mov dword [0xbd9c0], eax
    jmp short loc_1be89
loc_1be3c:
    call KEYWORD
    test eax, eax
    jl short loc_1be60
    mov eax, 4
    sub eax, dword [ebp - 0x20]
    mov ebx, dword [0xbd9c0]
    shl eax, 2
    add ebx, eax
    mov dword [0xbd9c0], ebx
    jmp short loc_1be89
loc_1be60:
    call TRANSLATE_NUMBER
    mov ebx, dword [0xbd9c0]
    mov eax, dword [0xbd9b8]
    mov ebx, dword [ebx - 4]
    mov dword [edx + eax], ebx
    mov eax, dword [ebp - 0x20]
    inc eax
    add edx, 4
    mov dword [ebp - 0x20], eax
    cmp edx, 0x10
    jl near loc_1bdea
loc_1be89:
    xor dh, dh
    mov byte [0xc335a], dh
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1be9f:
    call TRANSLATE_NUMBER
    call TRANSLATE_NUMBER
    call TRANSLATE_NUMBER
loc_1beae:
    call TRANSLATE_NUMBER
    call TRANSLATE_NUMBER
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1bec6:
    mov bl, byte [0xc335a]
    test bl, bl
    je short loc_1bf02
    mov cl, bl
    mov edx, dword [0xbd9c0]
    dec cl
    lea eax, [edx + 4]
    mov byte [0xc335a], cl
    mov dword [0xbd9c0], eax
    call parse_command
    mov eax, dword [0xbd9c0]
    mov dword [edx], eax
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1bf02:
    mov eax, SOURCE_NAME
    mov edi, dword [0xbd9c0]
    mov bh, byte [0xc0045]
    push eax
    sub edi, 4
    inc bh
    push dword 0x407
    mov dword [0xbd9c0], edi
    mov byte [0xc0045], bh
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    mov eax, 0x2398
    push eax
    call PRINTF
    add esp, 8
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1bf54:
    call TRANSLATE_NUMBER
loc_1bf59:
    call TRANSLATE_NUMBER
loc_1bf5e:
    cmp dl, 0x33
    jne short loc_1bfa0
    xor eax, eax
    mov dword [ebp - 0x20], eax
loc_1bf68:
    call TRANSLATE_NUMBER
    mov edi, dword [0xbd9c0]
    sub edi, 4
    mov edx, dword [ebp - 0x20]
    mov eax, dword [edi]
    mov dword [0xbd9c0], edi
    or edx, eax
    call KEYWORD
    mov dword [ebp - 0x20], edx
    cmp eax, -1
    je short loc_1bf68
    mov eax, dword [0xbd9c0]
    add eax, 4
    mov dword [eax - 4], edx
    mov dword [0xbd9c0], eax
loc_1bfa0:
    mov edx, dword [0xbd9c0]
    mov ebx, 0x27
    lea eax, [edx + 4]
    mov ecx, 0x14
    mov dword [0xbd9c0], eax
loc_1bfb8:
    call KEYWORD
    mov dword [ebp - 0x20], eax
    cmp eax, 0x14
    je short loc_1bfca
    cmp eax, 0x27
    jne short loc_1bfcf
loc_1bfca:
    call parse_command
loc_1bfcf:
    mov esi, dword [ebp - 0x20]
    cmp ecx, esi
    je short loc_1bfb8
    cmp ebx, esi
    je short loc_1bfb8
    call parse_command
    mov eax, dword [0xbd9c0]
    mov dword [edx], eax
    xor dl, dl
    inc byte [0xc335a]
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1bffa:
    inc word [0xc3356]
loc_1c001:
    call parse_command
    test al, al
    je short loc_1c001
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1c018:
    mov bx, word [0xc3356]
    dec ebx
    mov word [0xc3356], bx
    test bx, bx
    jge short loc_1c05d
    push dword SOURCE_NAME
    push dword 0x46a
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x23d0
    call PRINTF
    mov al, byte [0xc0046]
    inc al
    add esp, 8
    mov byte [0xc0046], al
loc_1c05d:
    mov dl, 1
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1c06b:
    mov ebx, dword [0xbd9c0]
    xor edx, edx
    sub ebx, 4
    mov dword [ebp - 0x20], edx
    mov dword [0xbd9c0], ebx
loc_1c07f:
    mov eax, dword [TEXT_CURSOR]
    mov dl, byte [eax]
    cmp dl, 0xa
    je short loc_1c0a2
    mov ebx, dword [ebp - 0x20]
    inc eax
    mov byte [ebx + 0x1d480], dl
    lea edx, [ebx + 1]
    mov dword [TEXT_CURSOR], eax
    mov dword [ebp - 0x20], edx
    jmp short loc_1c07f
loc_1c0a2:
    mov eax, dword [ebp - 0x20]
    xor dh, dh
    mov byte [eax + 0x1d480], dh
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1c0bb:
    sub dword [0xbd9c0], 4
loc_1c0c2:
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0xa
    je near loc_1ca4c
    inc eax
    mov dword [TEXT_CURSOR], eax
    jmp short loc_1c0c2
loc_1c0d8:
    sub dword [0xbd9c0], 4
    call TRANSLATE_NUMBER
    mov esi, dword [0xbd9c0]
    sub esi, 4
    mov eax, dword [esi]
    mov dword [0xbd9c0], esi
    mov dword [ebp - 0x20], eax
loc_1c0f8:
    mov edx, dword [TEXT_CURSOR]
    cmp byte [edx], 0x20
    jne short loc_1c10c
    inc edx
    mov dword [TEXT_CURSOR], edx
    jmp short loc_1c0f8
loc_1c10c:
    mov edx, dword [ebp - 0x20]
    mov eax, edx
    shl eax, 5
    xor esi, esi
    add edx, eax
loc_1c118:
    mov eax, dword [TEXT_CURSOR]
    mov bh, byte [eax]
    cmp bh, 0xa
    je short loc_1c18f
    mov al, bh
    and eax, strict dword 0xff
    call TO_UPPER
    inc edx
    mov edi, dword [TEXT_CURSOR]
    inc esi
    inc edi
    mov byte [edx + 0xbf469], al
    mov dword [TEXT_CURSOR], edi
    cmp esi, 0x20
    jl short loc_1c118
    push dword SOURCE_NAME
    push dword 0x48f
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x23fc
    call PRINTF
    mov cl, byte [0xc0046]
    inc cl
    add esp, 8
    mov byte [0xc0046], cl
loc_1c17d:
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0xa
    je short loc_1c18f
    inc eax
    mov dword [TEXT_CURSOR], eax
    jmp short loc_1c17d
loc_1c18f:
    mov edx, dword [ebp - 0x20]
    mov eax, edx
    shl eax, 5
    add eax, edx
    xor dl, dl
    mov byte [esi + eax + 0xbf469], dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1c1ae:
    sub dword [0xbd9c0], 4
    call TRANSLATE_NUMBER
    mov ebx, dword [0xbd9c0]
    sub ebx, 4
    mov eax, dword [ebx]
    mov dword [0xbd9c0], ebx
    mov dword [ebp - 0x20], eax
loc_1c1ce:
    mov edx, dword [TEXT_CURSOR]
    cmp byte [edx], 0x20
    jne short loc_1c1e2
    inc edx
    mov dword [TEXT_CURSOR], edx
    jmp short loc_1c1ce
loc_1c1e2:
    mov edx, dword [ebp - 0x20]
    mov eax, edx
    shl eax, 5
    xor esi, esi
    add edx, eax
loc_1c1ee:
    mov eax, dword [TEXT_CURSOR]
    mov bh, byte [eax]
    cmp bh, 0xa
    je short loc_1c265
    mov al, bh
    and eax, strict dword 0xff
    call TO_UPPER
    inc edx
    mov ecx, dword [TEXT_CURSOR]
    inc esi
    inc ecx
    mov byte [edx + 0xbf3a3], al
    mov dword [TEXT_CURSOR], ecx
    cmp esi, 0x20
    jl short loc_1c1ee
    push dword SOURCE_NAME
    push dword 0x4a6
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x2440
    call PRINTF
    mov cl, byte [0xc0046]
    inc cl
    add esp, 8
    mov byte [0xc0046], cl
loc_1c253:
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0xa
    je short loc_1c265
    inc eax
    mov dword [TEXT_CURSOR], eax
    jmp short loc_1c253
loc_1c265:
    mov edx, dword [ebp - 0x20]
    mov eax, edx
    shl eax, 5
    add eax, edx
    xor dl, dl
    mov byte [esi + eax + 0xbf3a3], dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1c284:
    sub dword [0xbd9c0], 4
    call TRANSLATE_NUMBER
    mov edx, dword [0xbd9c0]
    sub edx, 4
    mov eax, dword [edx]
    mov dword [0xbd9c0], edx
    mov dword [ebp - 0x20], eax
    call TRANSLATE_NUMBER
    mov ebx, dword [0xbd9c0]
    sub ebx, 4
    mov eax, dword [ebx]
    mov dword [0xbd9c0], ebx
    mov dword [ebp - 0x1c], eax
loc_1c2bd:
    mov edx, dword [TEXT_CURSOR]
    cmp byte [edx], 0x20
    jne short loc_1c2d1
    inc edx
    mov dword [TEXT_CURSOR], edx
    jmp short loc_1c2bd
loc_1c2d1:
    mov edx, dword [ebp - 0x20]
    lea eax, [edx*8]
    sub eax, edx
    mov edx, dword [ebp - 0x1c]
    add edx, eax
    xor esi, esi
    shl edx, 7
loc_1c2e7:
    mov eax, dword [TEXT_CURSOR]
    mov cl, byte [eax]
    cmp cl, 0x20
    je short loc_1c34e
    cmp cl, 0xa
    je short loc_1c34e
    inc edx
    inc eax
    inc esi
    mov byte [edx + 0x1d57f], cl
    mov dword [TEXT_CURSOR], eax
    cmp esi, 0x7f
    jle short loc_1c2e7
    push dword SOURCE_NAME
    push dword 0x4c2
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x2484
    call PRINTF
    mov al, byte [0xc0046]
    inc al
    add esp, 8
    mov byte [0xc0046], al
loc_1c33c:
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0x20
    je short loc_1c34e
    inc eax
    mov dword [TEXT_CURSOR], eax
    jmp short loc_1c33c
loc_1c34e:
    mov edx, dword [ebp - 0x20]
    lea eax, [edx*8]
    sub eax, edx
    mov edx, dword [ebp - 0x1c]
    add edx, eax
    mov eax, edx
    shl eax, 5
    add eax, edx
    xor dh, dh
    mov byte [esi + eax + 0xbd143], dh
loc_1c36f:
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0x20
    jne short loc_1c381
    inc eax
    mov dword [TEXT_CURSOR], eax
    jmp short loc_1c36f
loc_1c381:
    xor ebx, ebx
    mov bl, byte [eax + 3]
    sub ebx, 0x30
    lea edx, [ebx*4]
    add ebx, edx
    xor edx, edx
    mov dl, byte [eax + 4]
    add ebx, ebx
    sub edx, 0x30
    add ebx, edx
    lea ecx, [ebx*4]
    sub ecx, ebx
    xor edx, edx
    shl ecx, 2
    mov dl, byte [eax]
    add ecx, ebx
    lea ebx, [edx - 0x30]
    lea edx, [ebx*4]
    add edx, ebx
    xor ebx, ebx
    mov bl, byte [eax + 1]
    add edx, edx
    sub ebx, 0x30
    add ebx, edx
    lea edx, [ebx*4]
    sub edx, ebx
    shl edx, 3
    mov ebx, edx
    shl edx, 6
    add ecx, ecx
    add edx, ebx
    mov ebx, dword [ebp - 0x20]
    add ecx, edx
    lea edx, [ebx*8]
    sub edx, ebx
    mov ebx, dword [ebp - 0x1c]
    add eax, 5
    add edx, ebx
    mov dword [TEXT_CURSOR], eax
    mov dword [nosplit edx*4 + 0x1ff08], ecx
loc_1c3ff:
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0x20
    jne short loc_1c411
    inc eax
    mov dword [TEXT_CURSOR], eax
    jmp short loc_1c3ff
loc_1c411:
    xor ebx, ebx
    mov bl, byte [eax + 3]
    sub ebx, 0x30
    lea edx, [ebx*4]
    add edx, ebx
    xor ebx, ebx
    mov bl, byte [eax + 4]
    add edx, edx
    sub ebx, 0x30
    add ebx, edx
    lea ecx, [ebx*4]
    sub ecx, ebx
    shl ecx, 2
    add ecx, ebx
    xor ebx, ebx
    mov bl, byte [eax]
    sub ebx, 0x30
    lea edx, [ebx*4]
    add ebx, edx
    xor edx, edx
    mov dl, byte [eax + 1]
    add ebx, ebx
    sub edx, 0x30
    add ebx, edx
    lea edx, [ebx*4]
    sub edx, ebx
    shl edx, 3
    mov ebx, edx
    shl edx, 6
    add ecx, ecx
    add edx, ebx
    mov ebx, dword [ebp - 0x20]
    add ecx, edx
    lea edx, [ebx*8]
    mov esi, dword [ebp - 0x1c]
    sub edx, ebx
    add eax, 5
    add edx, esi
    mov dword [TEXT_CURSOR], eax
    mov dword [nosplit edx*4 + 0x1d4d0], ecx
loc_1c48f:
    mov edx, dword [TEXT_CURSOR]
    cmp byte [edx], 0x20
    jne short loc_1c4a3
    inc edx
    mov dword [TEXT_CURSOR], edx
    jmp short loc_1c48f
loc_1c4a3:
    mov edx, dword [ebp - 0x20]
    lea eax, [edx*8]
    sub eax, edx
    mov edx, dword [ebp - 0x1c]
    add edx, eax
    mov eax, edx
    shl eax, 5
    xor esi, esi
    add edx, eax
loc_1c4bd:
    mov eax, dword [TEXT_CURSOR]
    mov ch, byte [eax]
    cmp ch, 0xa
    je short loc_1c532
    mov al, ch
    and eax, strict dword 0xff
    call TO_UPPER
    inc edx
    mov edi, dword [TEXT_CURSOR]
    inc esi
    inc edi
    mov byte [edx + 0xbd143], al
    mov dword [TEXT_CURSOR], edi
    cmp esi, 0x20
    jl short loc_1c4bd
    push dword SOURCE_NAME
    push dword 0x4ea
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x24cc
    call PRINTF
    mov al, byte [0xc0046]
    inc al
    add esp, 8
    mov byte [0xc0046], al
loc_1c520:
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0xa
    je short loc_1c532
    inc eax
    mov dword [TEXT_CURSOR], eax
    jmp short loc_1c520
loc_1c532:
    mov edx, dword [ebp - 0x20]
    lea eax, [edx*8]
    sub eax, edx
    mov edx, dword [ebp - 0x1c]
    add edx, eax
    mov eax, edx
    shl eax, 5
    add eax, edx
    xor dh, dh
    mov byte [esi + eax + 0xbd143], dh
    xor dl, dl
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1c561:
    sub dword [0xbd9c0], 4
    call TRANSLATE_NUMBER
    mov edi, dword [0xbd9c0]
    mov edi, dword [edi - 4]
    cmp edi, strict dword 0xc0
    jl short loc_1c5b6
    push dword SOURCE_NAME
    push dword 0x4fb
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    push dword 0xc0
    sar eax, 0x10
    push eax
    push dword 0x2510
    call PRINTF
    mov cl, byte [0xc0046]
    inc cl
    add esp, 0xc
    mov byte [0xc0046], cl
loc_1c5b6:
    mov eax, dword [0xbd9c0]
    sub eax, 4
    xor esi, esi
    mov dword [0xbd9c0], eax
loc_1c5c5:
    mov edx, dword [TEXT_CURSOR]
    cmp byte [edx], 0x20
    jne short loc_1c5d9
    inc edx
    mov dword [TEXT_CURSOR], edx
    jmp short loc_1c5c5
loc_1c5d9:
    mov edx, edi
    shl edx, 6
    add edx, esi
loc_1c5e0:
    mov eax, dword [TEXT_CURSOR]
    mov bh, byte [eax]
    cmp bh, 0xa
    je short loc_1c644
    inc edx
    inc eax
    inc esi
    mov byte [edx + 0x9203f], bh
    mov dword [TEXT_CURSOR], eax
    cmp esi, 0x40
    jl short loc_1c5e0
    push dword SOURCE_NAME
    push dword 0x509
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x2550
    call PRINTF
    mov cl, byte [0xc0046]
    inc cl
    add esp, 8
    mov byte [0xc0046], cl
loc_1c632:
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0xa
    je short loc_1c644
    inc eax
    mov dword [TEXT_CURSOR], eax
    jmp short loc_1c632
loc_1c644:
    shl edi, 6
    xor al, al
    xor dl, dl
    mov byte [edi + esi + 0x92040], al
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1c65e:
    sub dword [0xbd9c0], 4
    call TRANSLATE_NUMBER
    mov edi, dword [0xbd9c0]
    mov edi, dword [edi - 4]
    cmp edi, strict dword 0x1f4
    jl short loc_1c6b3
    push dword SOURCE_NAME
    push dword 0x517
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    push dword 0x1f4
    sar eax, 0x10
    push eax
    push dword 0x258c
    call PRINTF
    mov ch, byte [0xc0046]
    inc ch
    add esp, 0xc
    mov byte [0xc0046], ch
loc_1c6b3:
    mov eax, dword [0xbd9c0]
    sub eax, 4
    xor esi, esi
    mov dword [0xbd9c0], eax
loc_1c6c2:
    mov edx, dword [TEXT_CURSOR]
    cmp byte [edx], 0x20
    jne short loc_1c6d6
    inc edx
    mov dword [TEXT_CURSOR], edx
    jmp short loc_1c6c2
loc_1c6d6:
    lea ecx, [edi*8]
    sub ecx, edi
    add ecx, ecx
    lea edx, [esi + ecx]
loc_1c6e4:
    mov eax, dword [TEXT_CURSOR]
    mov bh, byte [eax]
    cmp bh, 0x20
    je short loc_1c754
    inc edx
    inc eax
    inc esi
    mov byte [edx + 0x67477], bh
    mov dword [TEXT_CURSOR], eax
    cmp esi, 0xd
    jl short loc_1c6e4
    mov eax, 0x67478
    add eax, ecx
    call PUTS
    push dword SOURCE_NAME
    push dword 0x526
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x25bc
    call PRINTF
    mov cl, byte [0xc0046]
    inc cl
    add esp, 8
    mov byte [0xc0046], cl
loc_1c742:
    mov eax, dword [TEXT_CURSOR]
    cmp byte [eax], 0x20
    je short loc_1c754
    inc eax
    mov dword [TEXT_CURSOR], eax
    jmp short loc_1c742
loc_1c754:
    lea eax, [edi*8]
    sub eax, edi
    xor dl, dl
    mov byte [esi + eax*2 + 0x67478], dl
    call TRANSLATE_NUMBER
    mov eax, dword [0xbd9c0]
    sub eax, 4
    mov bx, word [eax]
    mov dword [0xbd9c0], eax
    mov word [nosplit edi*2 + 0x1ef68], bx
    call TRANSLATE_NUMBER
    mov eax, dword [0xbd9c0]
    sub eax, 4
    mov bx, word [eax]
    mov dword [0xbd9c0], eax
    mov word [nosplit edi*2 + 0x1eb80], bx
    call TRANSLATE_NUMBER
    mov eax, dword [0xbd9c0]
    sub eax, 4
    mov bl, byte [eax]
    mov dword [0xbd9c0], eax
    mov byte [edi + 0xbcf50], bl
    call TRANSLATE_NUMBER
    mov eax, dword [0xbd9c0]
    sub eax, 4
    mov bl, byte [eax]
    mov dword [0xbd9c0], eax
    mov byte [edi + 0xbcd5c], bl
    call TRANSLATE_NUMBER
    mov eax, dword [0xbd9c0]
    sub eax, 4
    mov bx, word [eax]
    mov dword [0xbd9c0], eax
    mov word [nosplit edi*2 + 0x1fb20], bx
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1c7fd:
    cmp dword [0xbd9b8], 0
    jne short loc_1c83b
    mov eax, SOURCE_NAME
    push eax
    push dword 0x542
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    mov eax, 0x2600
    push eax
    call PRINTF
    mov ch, byte [0xc0046]
    inc ch
    add esp, 8
    mov byte [0xc0046], ch
loc_1c83b:
    cmp word [0xc3356], 0
    jle short loc_1c876
    push dword SOURCE_NAME
    push dword 0x549
    call SET_DEBUG_LOCATION
    mov eax, dword [0xc3356]
    sar eax, 0x10
    push eax
    push dword 0x263c
    call PRINTF
    mov al, byte [0xc0046]
    inc al
    add esp, 8
    mov byte [0xc0046], al
loc_1c876:
    xor edi, edi
    xor dl, dl
    mov dword [0xbd9b8], edi
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1c88c:
    mov ebx, 0x400
    xor ecx, ecx
    xor edx, edx
    mov dword [ebp - 0x20], ecx
    mov esi, 4
    xor ecx, ecx
loc_1c89f:
    call TRANSLATE_NUMBER
    mov edi, dword [0xbd9c0]
    sub edi, esi
    mov eax, dword [ebp - 0x20]
    mov dword [0xbd9c0], edi
    cmp eax, 0x21
    ja near loc_1ca1c
    jmp dword [cs:edx + condition_dispatch - 0x10000]
loc_1c8c5:
    mov eax, dword [edi]
    mov dword [0xbfb03], eax
    jmp near loc_1ca1c
loc_1c8d1:
    mov eax, dword [edi]
    mov dword [0xbf37c], eax
    jmp near loc_1ca1c
loc_1c8dd:
    mov eax, dword [edi]
    mov dword [0xbf378], eax
    jmp near loc_1ca1c
loc_1c8e9:
    mov eax, dword [edi]
    mov dword [0xbf32c], eax
    jmp near loc_1ca1c
loc_1c8f5:
    mov eax, dword [edi]
    mov dword [0x9374], eax
    jmp near loc_1ca1c
loc_1c901:
    mov eax, dword [edi]
    mov dword [0x9378], eax
    jmp near loc_1ca1c
loc_1c90d:
    mov eax, dword [edi]
    mov dword [0x939c], eax
    jmp near loc_1ca1c
loc_1c919:
    mov eax, dword [edi]
    mov dword [0xbf330], eax
    jmp near loc_1ca1c
loc_1c925:
    mov eax, dword [edi]
    mov dword [0xbccac], eax
    jmp near loc_1ca1c
loc_1c931:
    mov eax, dword [edi]
    mov dword [0xbccb4], eax
    jmp near loc_1ca1c
loc_1c93d:
    mov eax, dword [edi]
    mov dword [0xbcc90], eax
    jmp near loc_1ca1c
loc_1c949:
    mov eax, dword [edi]
    mov dword [0xbccb0], eax
    jmp near loc_1ca1c
loc_1c955:
    mov eax, dword [edi]
    mov dword [0xbcca4], eax
    jmp near loc_1ca1c
loc_1c961:
    mov eax, dword [edi]
    mov dword [0xbcc94], eax
    jmp near loc_1ca1c
loc_1c96d:
    mov eax, dword [edi]
    mov dword [0xbcca0], eax
    jmp near loc_1ca1c
loc_1c979:
    mov edi, dword [ebp - 0x20]
    cmp edi, 0x18
    jne short loc_1c992
    mov eax, dword [0xbd9c0]
    mov eax, dword [eax]
    mov dword [0xbf360], eax
    jmp near loc_1ca1c
loc_1c992:
    cmp edi, 0x19
    jne short loc_1c9a8
    mov eax, dword [0xbd9c0]
    mov eax, dword [eax]
    mov dword [0xbf364], eax
    jmp near loc_1ca1c
loc_1c9a8:
    mov eax, dword [0xbd9c0]
    mov eax, dword [eax]
    mov dword [edx + 0xbf2fc], eax
    jmp near loc_1ca1c
loc_1c9ba:
    mov al, byte [edi]
    mov byte [0xc0039], al
    jmp short loc_1ca1c
loc_1c9c3:
    mov eax, dword [edi]
    mov dword [0x93a8], eax
    jmp short loc_1ca1c
loc_1c9cc:
    mov al, byte [edi]
    mov byte [0x93a0], al
    jmp short loc_1ca1c
loc_1c9d5:
    mov ax, word [edi]
    mov word [0x9370], ax
    cmp bx, ax
    jge short loc_1c9ec
    mov word [0x9370], bx
    jmp short loc_1ca1c
loc_1c9ec:
    cmp cx, ax
    jle short loc_1ca1c
    mov word [0x9370], cx
    jmp short loc_1ca1c
loc_1c9fa:
    mov al, byte [edi]
    mov byte [0xc0036], al
    jmp short loc_1ca1c
loc_1ca03:
    mov eax, dword [edi]
    mov dword [0xbf368], eax
    jmp short loc_1ca1c
loc_1ca0c:
    mov eax, dword [edi]
    mov dword [0xbf36c], eax
    jmp short loc_1ca1c
loc_1ca15:
    mov eax, dword [edi]
    mov dword [0xbf374], eax
loc_1ca1c:
    mov edi, dword [ebp - 0x20]
    inc edi
    add edx, 4
    mov dword [ebp - 0x20], edi
    cmp edi, 0x22
    jl near loc_1c89f
    mov ebx, dword [0xbd9c0]
    add ebx, 4
    xor dl, dl
    mov dword [0xbd9c0], ebx
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ca4c:
    xor dl, dl
loc_1ca4e:
    mov al, dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

pass_one:
    push ebp
    mov ebp, esp
    push edx
loc_1ca60:
    call parse_command
    test al, al
    je short loc_1ca60
    xor eax, eax
    xor edx, edx
    mov al, byte [0xc0046]
    mov dl, byte [0xc0045]
    add eax, edx
    cmp eax, 0xc
    jle short loc_1ca89
    mov eax, 0x2678
    call PUTS
loc_1ca89:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    nop

copy_default_scripts:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    xor edx, edx
    mov dword [ebp - 0x18], edx
loc_1caa0:
    mov eax, dword [ebp - 0x18]
    mov edx, 1
    mov eax, dword [eax + 0x997c]
    call OPEN_GAME_FILE
    push dword SOURCE_NAME
    push dword 0x5e8
    mov esi, eax
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov edx, 0x26a0
    mov eax, dword [eax + 0x997c]
    call 0x5db41
    mov edi, eax
    test esi, esi
    jne short loc_1caf1
    test eax, eax
    jne near loc_1cb58
    push dword SOURCE_NAME
    push dword 0x5ec
    jmp short loc_1cb4c
loc_1caf1:
    test eax, eax
    jne short loc_1cb00
    test esi, esi
    jne short loc_1cb58
    call CLOSE_GAME_FILE
    jmp short loc_1cb58
loc_1cb00:
    mov eax, esi
    mov edx, 0x20438
    call GAME_FILE_LENGTH
    mov dword [ebp - 0x1c], eax
    mov ebx, eax
    mov eax, esi
    call READ_GAME_FILE
    push dword SOURCE_NAME
    push dword 0x5f8
    call SET_DEBUG_LOCATION
    mov ebx, 1
    mov edx, dword [ebp - 0x1c]
    mov eax, 0x20438
    mov ecx, edi
    call 0x6024e
    mov eax, esi
    call CLOSE_GAME_FILE
    push dword SOURCE_NAME
    push dword 0x5fb
loc_1cb4c:
    call SET_DEBUG_LOCATION
    mov eax, edi
    call 0x5dbf5
loc_1cb58:
    mov ebx, dword [ebp - 0x18]
    add ebx, 4
    mov dword [ebp - 0x18], ebx
    cmp ebx, 0xc
    jne near loc_1caa0
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

load_scripts:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 4
    mov esi, eax
    mov dword [ebp - 0x14], edx
    call 0x5defc
    test eax, eax
    jne short loc_1cbda
    cmp byte [0xc0043], 0
    jne short loc_1cbda
    mov eax, 0x26a4
    call PUTS
    mov eax, 0x26c4
    call PUTS
    call 0x5adcc
loc_1cbae:
    call 0x5ad2c
    test eax, eax
    jne short loc_1cbae
    call 0x5ad40
    and eax, strict dword 0xff
    cmp eax, 0x79
    je short loc_1cbcb
    cmp eax, 0x59
    jne short loc_1cbda
loc_1cbcb:
    mov eax, 0x26f0
    call PUTS
    call copy_default_scripts
loc_1cbda:
    xor edx, edx
    mov eax, esi
    mov dl, byte [0xc0043]
    call OPEN_GAME_FILE
    mov edi, eax
    test eax, eax
    jne short loc_1cc0e
    cmp byte [0xc0043], 1
    jne short loc_1cc02
    mov eax, 0x26f8
    call GAME_EXIT
loc_1cc02:
    mov byte [0xc0043], 1
    jmp near loc_1cec8
loc_1cc0e:
    push dword SOURCE_NAME
    push dword 0x61f
    call SET_DEBUG_LOCATION
    push esi
    push dword 0x2710
    call PRINTF
    add esp, 8
    mov eax, edi
    call GAME_FILE_LENGTH
    mov ecx, eax
    mov eax, dword [ebp - 0x14]
    mov ebx, ecx
    mov dword [TEXT_CURSOR], eax
    mov dword [0xc3340], eax
    mov edx, eax
    mov eax, edi
    mov dword [0xc3348], ecx
    call READ_GAME_FILE
    mov eax, edi
    call CLOSE_GAME_FILE
    mov eax, dword [TEXT_CURSOR]
    mov edi, 0x82280
    mov byte [ecx + eax - 2], 0
    mov ecx, 0x1000
    xor eax, eax
    rep stosd
    mov ecx, 0x1000
    mov edi, 0x68fd0
    xor edx, edx
    cmp ecx, 4
    jae short loc_1cc8f
    test cl, 1
    je short loc_1cc88
    stosb
loc_1cc88:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_1ccba
loc_1cc8f:
    test edi, 1
    je short loc_1cc99
    stosb
    dec ecx
loc_1cc99:
    test edi, 2
    je short loc_1cca6
    stosw
    sub ecx, 2
loc_1cca6:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_1ccb4
    stosw
loc_1ccb4:
    test bl, 1
    je short loc_1ccba
    stosb
loc_1ccba:
    mov ebx, 0x6b3e4
    mov dword [0xbd9b4], edx
    xor dl, dl
    mov dword [0xbd9c0], ebx
    mov byte [0xc0045], dl
    mov byte [0xc0046], dl
    xor ebx, ebx
    mov edx, 1
    mov word [0xc3354], bx
    mov word [LINE_NUMBER], dx
    call pass_one
    mov eax, dword [0xbd9c0]
    xor edx, edx
    mov dword [0x6b3e0], eax
    xor eax, eax
    mov dl, byte [0xc0046]
    mov al, byte [0xc0045]
    or eax, edx
    je short loc_1cd3c
    push dword SOURCE_NAME
    push dword 0x63a
    call SET_DEBUG_LOCATION
    xor eax, eax
    mov al, byte [0xc0046]
    push eax
    xor eax, eax
    mov al, byte [0xc0045]
    push eax
    push dword 0x2724
    call PRINTF
    add esp, 0xc
loc_1cd3c:
    cmp byte [0xc0046], 0
    jne near loc_1cdd9
    cmp byte [0xc0045], 0
    je near loc_1cdd9
    cmp dword [0xbd75c], -1
    je near loc_1cdd9
    cmp byte [0xc0043], 0
    jne short loc_1cdd9
    push dword SOURCE_NAME
    push dword 0x640
    call SET_DEBUG_LOCATION
    push esi
    push dword 0x274c
    call PRINTF
    add esp, 8
    mov eax, 0x2798
    call PUTS
    mov eax, 0x27d4
    call PUTS
    call 0x5adcc
loc_1cda2:
    call 0x5ad2c
    test eax, eax
    jne short loc_1cda2
    call 0x5ad40
    and eax, strict dword 0xff
    cmp eax, 0x79
    je short loc_1cdbf
    cmp eax, 0x59
    jne short loc_1cdd9
loc_1cdbf:
    mov byte [0xc0043], 1
    mov eax, 0x26f0
    call PUTS
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1cdd9:
    cmp byte [0xc0046], 0
    je near loc_1cebb
    mov dh, byte [0xc0043]
    test dh, dh
    je short loc_1ce25
    push dword SOURCE_NAME
    push dword 0x654
    call 0x5d849
    push esi
    push dword 0x27f0
    push dword 0x8bcc0
    call 0x5d8cc
    add esp, 0xc
    mov eax, 0x8bcc0
    call GAME_EXIT
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1ce25:
    cmp dword [0xbd75c], -1
    je near loc_1cec8
    test dh, dh
    jne near loc_1cec8
    push dword SOURCE_NAME
    push dword 0x65b
    call SET_DEBUG_LOCATION
    push esi
    push dword 0x2800
    call PRINTF
    add esp, 8
    mov eax, 0x2844
    call PUTS
    mov eax, 0x2880
    call PUTS
    call 0x5adcc
loc_1ce70:
    call 0x5ad2c
    test eax, eax
    je short loc_1ce70
    call 0x5ad40
    and eax, strict dword 0xff
    cmp eax, 0x79
    je short loc_1ce8d
    cmp eax, 0x59
    jne short loc_1cea8
loc_1ce8d:
    mov eax, 0x26f0
    mov bh, 1
    call PUTS
    mov byte [0xc0043], bh
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1cea8:
    mov eax, 0x289c
    call GAME_EXIT
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1cebb:
    mov ax, word [LINE_NUMBER]
    add word [0xc3354], ax
loc_1cec8:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    times 15 db 0    ; Padding between gamedef1 and gamedef2 code
