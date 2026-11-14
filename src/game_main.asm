bits 32
org 0x1767c

%define READ_SETUP 0x10e08
%define WRITE_TEXT_SCREEN 0x1703c
%define STARTUP 0x17148
%define GET_NAMES 0x1727c
%define DO_INTRO 0x17430
%define GAME_EXIT 0x14f28
%define PRINT_NOTICE 0x5130c
%define SET_DEBUG_LOCATION 0x5ab32
%define PRINTF 0x5ac04
%define DISPLAY_ROOMS 0x15828
%define DRAW_SCREEN_OVERLAYS 0x15234
%define DRAW_LOCKED_CACHE_ENTRIES 0x13e20
%define CHECK_SYNC 0x13ec0
%define SHUTDOWN 0x170a8
%define PUTS 0x5e9d9
%define KEY_WAITING 0x5ad2c
%define SET_GAME_MODE 0x39bc5
%define INIT_GROUP_FILE 0x30e54
%define SET_GAME_DEFAULTS 0x16fe8
%define NEW_GAME 0x2db2c
%define ENTER_LEVEL 0x2ece8
%define LOAD_PLAYER 0x25808
%define NEXT_PAGE 0x3a2b0
%define LOG_OPENED 0xfc0
%define SOURCE_NAME 0xfd0
%define BLANK_TEXT_LINE 0xfd8
%define TITLE_TEXT 0x102c
%define LOW_MEMORY_ERROR 0x1124
%define GROUP_FILE_NAME 0x1170
%define QUIT_MESSAGE 0x1418
%define OPEN_DEMO_READ_NOTICE 0x142c
%define OPEN_DEMO_WRITE_NOTICE 0x1448
%define RECORD_NOTICE 0x1468
%define CLOSE_DEMO_WRITE_NOTICE 0x1480

main:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 4
    mov dword [ebp - 0x14], eax
    mov esi, edx
    call 0x5a678
    test eax, eax
    jne short loc_17699
    call 0x5e97d
loc_17699:
    call 0x5a304
    call 0x512a4
    mov eax, LOG_OPENED
    mov dl, 0x44
    call PRINT_NOTICE
    mov ah, 0x54
    mov byte [0x970c], dl
    mov dh, 0x49
    mov byte [0x96a8], ah
    mov byte [0x96eb], dh
    call 0x10020
    call READ_SETUP
    push dword 0x80
    mov ecx, SOURCE_NAME
    mov ebx, 0x80
    push byte 0x7f
    mov eax, 0x95b8
    xor edx, edx
    call 0x5bf59
    mov eax, 3
    mov ecx, 0x6f
    mov ebx, BLANK_TEXT_LINE
    int 0x10
    xor edx, edx
    xor eax, eax
    mov edi, TITLE_TEXT
    call WRITE_TEXT_SCREEN
    sub ecx, ecx
    dec ecx
    xor eax, eax
    repne scasb
    not ecx
    dec ecx
    mov eax, 0x28
    shr ecx, 1
    mov ebx, 0x1054
    sub eax, ecx
    xor edx, edx
    sub eax, 3
    mov ecx, 0x6f
    cwde
    call WRITE_TEXT_SCREEN
    mov edx, 1
    mov ecx, 0x6f
    mov ebx, 0x107c
    xor eax, eax
    mov dword [0xbffe3], edx
    call WRITE_TEXT_SCREEN
    mov ecx, 0x6f
    mov ebx, 0x10d0
    mov edx, 2
    xor eax, eax
    call WRITE_TEXT_SCREEN
    call 0x5fc4c
    cmp eax, strict dword 0x2b5d90
    jge short loc_17782
    mov eax, LOW_MEMORY_ERROR
    call PUTS
    xor eax, eax
    call 0x5e97d
loc_17782:
    push dword SOURCE_NAME
    push dword 0x98
    call SET_DEBUG_LOCATION
    push dword 0x1168
    call PRINTF
    add esp, 4
    mov eax, GROUP_FILE_NAME
    mov edx, esi
    call INIT_GROUP_FILE
    mov eax, dword [ebp - 0x14]
    call SET_GAME_DEFAULTS
    mov eax, SHUTDOWN - 0x10000
    call 0x5a774
    call STARTUP
    cmp byte [0x952c], 0
    je short loc_1782c
    cmp word [0xcf65c], 1
    jle short loc_1782c
    cmp dword [0xc00b4], 0xd
    je short loc_1782c
    mov eax, 0x117c
    call PUTS
    mov eax, 0x11c8
    call PUTS
    mov eax, 0x11e8
    call PUTS
    mov eax, 0x1234
    call PUTS
    mov eax, 0x1280
    call PUTS
    mov eax, 0x12cc
    call PUTS
    mov eax, 0x1304
    call PUTS
loc_17823:
    call KEY_WAITING
    test eax, eax
    je short loc_17823
loc_1782c:
    cmp word [0xcf65c], 1
    jle short loc_1784a
    mov eax, dword [0xcf65a]
    sar eax, 0x10
    mov dword [0xbffe3], eax
    call 0x3003c
    jmp short loc_1786e
loc_1784a:
    cmp byte [0x95b8], 0
    je short loc_1786e
    mov ecx, 7
    xor esi, esi
    mov dword [0xbffdb], ecx
    mov cl, 1
    mov dword [0xbffdf], esi
    mov byte [0xbf571], cl
loc_1786e:
    call GET_NAMES
    cmp dword [0xbffe3], 1
    jle short loc_178a2
    mov al, byte [0xbffe3]
    mov ch, byte [0xbf571]
    mov byte [0xc1030], al
    test ch, ch
    jne short loc_178a2
    mov eax, 1
    xor edx, edx
    mov dword [0xbffc7], eax
    mov dword [0xbffd7], edx
loc_178a2:
    mov ecx, 0xffffffff
    mov ebx, dword [0xb0a8]
    mov word [0xbfaff], cx
    test ebx, ebx
    je short loc_178d6
    push dword 0x9fbc
    mov ecx, 0x9f90
    mov ebx, 0x9f64
    mov edx, 0x9f38
    mov eax, 0x9f0c
    call 0x5c3a0
loc_178d6:
    cmp byte [0xbf571], 1
    jbe near loc_17986
    cmp word [0xcf65c], 1
    jle short loc_1791c
    push dword SOURCE_NAME
    push dword 0xc6
    call SET_DEBUG_LOCATION
    xor eax, eax
    mov al, byte [0xbf571]
    sub eax, 2
    push eax
    push dword 0x1350
    call PRINTF
    mov al, byte [0xbf571]
    neg al
    inc al
    jmp short loc_17947
loc_1791c:
    push dword SOURCE_NAME
    push dword 0xca
    call SET_DEBUG_LOCATION
    xor eax, eax
    mov al, byte [0xbf571]
    sub eax, 2
    push eax
    push dword 0x137c
    call PRINTF
    mov al, byte [0xbf571]
    sub al, 2
loc_17947:
    add esp, 8
    movsx eax, al
    call LOAD_PLAYER
    cmp eax, -1
    jne short loc_17986
    push dword SOURCE_NAME
    push dword 0xce
    call SET_DEBUG_LOCATION
    xor eax, eax
    mov al, byte [0xbf571]
    sub eax, 2
    push eax
    push dword 0x13ac
    call PRINTF
    xor ah, ah
    add esp, 8
    mov byte [0xbf571], ah
loc_17986:
    mov eax, 0x13c8
    call PUTS
    mov ebx, dword [0xc0064]
    mov edx, dword [0xc0080]
    mov eax, dword [0xc0070]
    call SET_GAME_MODE
    test eax, eax
    jge short loc_179fa
    push dword SOURCE_NAME
    push dword 0xd5
    call SET_DEBUG_LOCATION
    mov ecx, dword [0x216f84]
    push ecx
    mov esi, dword [0x216f88]
    push esi
    push dword 0x13e0
    mov edi, 2
    mov dl, 2
    call PRINTF
    mov ebx, dword [0xc0064]
    add esp, 0xc
    mov byte [0x21805e], dl
    mov eax, edi
    mov edx, dword [0xc0080]
    mov dword [0xc0070], edi
    call SET_GAME_MODE
loc_179fa:
    call 0x2e2bc
    cmp word [0xcf65c], 2
    jge short loc_17a0e
    call 0x2fdd8
loc_17a0e:
    cmp byte [0x21ebd1], 0
    je short loc_17a21
    mov eax, QUIT_MESSAGE
    call GAME_EXIT
loc_17a21:
    call DO_INTRO
    mov edi, 0x141c
    mov esi, 0x10000
    xor ecx, ecx
loc_17a32:
    call 0x5f464
    call 0x2c650
    call 0x536d4
    cmp byte [0xbf571], 1
    jne short loc_17a72
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    mov bl, byte [0xbffd7]
    mov dl, byte [0xbffdb]
    mov al, byte [0xbffdf]
    call NEW_GAME
    mov eax, 4
    call ENTER_LEVEL
    jmp short loc_17a77
loc_17a72:
    call 0x2c814
loc_17a77:
    cmp cl, byte [0xbf571]
    jne short loc_17a88
    call 0x17d7c
    test eax, eax
    jne short loc_17a32
loc_17a88:
    mov al, byte [0xc6c5a]
    mov byte [0xbf571], cl
    cmp cl, al
    jne short loc_17a32
main_loop:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 0x80
    jne near loc_17d18
    cmp dword [0xbffab], 2
    je short loc_17ad8
    cmp dword [0xbffe3], 1
    jg short loc_17ad8
    cmp cl, byte [0xbf575]
    jne short loc_17af8
    mov al, byte [eax + 0x8c34c]
    and al, 1
    cmp al, 1
    je short loc_17af8
loc_17ad8:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 4
    je short loc_17af8
    call 0x18214
    test al, al
    jne short main_loop
loc_17af8:
    mov ebx, dword [0xcf65c]
    sar ebx, 0x10
    imul ebx, ebx, strict dword 0x623
    mov al, byte [ebx + 0x8c34c]
    test al, 8
    jne short loc_17b19
    test al, 0x20
    je near loc_17c08
loc_17b19:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 8
    je near loc_17bc6
    call close_demo_write
    mov edx, dword [0xbfb4f]
    mov byte [0xc0049], cl
    mov dword [0xbfb4f], ecx
    call 0x2c814
    mov dword [0xbfb4f], edx
    cmp byte [0xc1030], 1
    ja short loc_17b69
    cmp word [0xcf65c], 1
    jle short loc_17b72
loc_17b69:
    mov eax, ecx
    call 0x19eec
    jmp short loc_17b79
loc_17b72:
    mov eax, ecx
    call 0x19be8
loc_17b79:
    cmp cl, byte [0xbf573]
    je short loc_17bc6
    mov ebx, dword [0xbffe3]
    mov byte [0xbf573], cl
    cmp ebx, 2
    jge short loc_17bba
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c34c], 1
    mov eax, ecx
    call 0x25758
    mov word [0x9988], cx
    jmp near loc_17a32
loc_17bba:
    mov dword [0xbffdb], ecx
    mov dword [0xbffeb], ecx
loc_17bc6:
    cmp word [0xcf65c], 1
    jle short loc_17be5
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c34c], 4
loc_17be5:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov al, byte [eax + 0x8c34c]
    and eax, strict dword 0xff
    call ENTER_LEVEL
    jmp near main_loop
loc_17c08:
    cmp cl, byte [0xbf575]
    jne short loc_17c22
    cmp dword [0xbffe3], 2
    jge short loc_17c22
    test byte [ebx + 0x8c34c], 1
    je short loc_17c34
loc_17c22:
    cmp dword [0xbffe3], 1
    jg short loc_17c34
    cmp dword [0xbffab], 2
    jne short loc_17c8e
loc_17c34:
    mov ebx, dword [0x216f7c]
    mov eax, dword [0xbd6f8]
    sub ebx, eax
    shl ebx, 0xe
    test ebx, ebx
    jle short loc_17c55
    mov ebx, dword [0x216f7c]
    sub ebx, eax
    shl ebx, 0xe
    jmp short loc_17c57
loc_17c55:
    mov ebx, ecx
loc_17c57:
    cmp ebx, strict dword 0x10000
    jge short loc_17c8a
    mov ebx, dword [0x216f7c]
    mov eax, dword [0xbd6f8]
    sub ebx, eax
    mov eax, ebx
    shl eax, 0xe
    test eax, eax
    jle short loc_17c86
    mov ebx, dword [0x216f7c]
    sub ebx, dword [0xbd6f8]
    shl ebx, 0xe
    jmp short loc_17c90
loc_17c86:
    mov ebx, ecx
    jmp short loc_17c90
loc_17c8a:
    mov ebx, esi
    jmp short loc_17c90
loc_17c8e:
    mov ebx, esi
loc_17c90:
    mov eax, dword [0xbf560]
    mov edx, ebx
    sar eax, 0x10
    call DISPLAY_ROOMS
    mov eax, ebx
    call DRAW_SCREEN_OVERLAYS
    call 0x5a02c
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 2
    jne near loc_17a32
    cmp cl, byte [0x9688]
    je short loc_17cd3
    call DRAW_LOCKED_CACHE_ENTRIES
loc_17cd3:
    cmp cl, byte [0x21ec28]
    je short loc_17d09
    mov byte [0x21ec28], cl
    mov edx, ecx
    mov eax, edi
    call 0x3aeed
    mov edx, dword [0xcf65c]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov eax, 0x67
    add edx, strict dword 0x8be10
    call 0x14e68
loc_17d09:
    call CHECK_SYNC
    call NEXT_PAGE
    jmp near main_loop
loc_17d18:
    mov eax, QUIT_MESSAGE
    call GAME_EXIT
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

open_demo_read:
    push ebp
    mov ebp, esp
    mov eax, OPEN_DEMO_READ_NOTICE
    call PRINT_NOTICE
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    nop

open_demo_write:
    push ebp
    mov ebp, esp
    mov eax, OPEN_DEMO_WRITE_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

record:
    push ebp
    mov ebp, esp
    mov eax, RECORD_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

close_demo_write:
    push ebp
    mov ebp, esp
    mov eax, CLOSE_DEMO_WRITE_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
