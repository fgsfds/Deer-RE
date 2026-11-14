bits 32
org 0x14f28

%define PRINT_NOTICE 0x5130c
%define CLOSE_LOG 0x512d4
%define WAIT_FOR_PEERS_ON_QUIT 0x11f24
%define UNINIT_MULTIPLAYER 0x30034
%define CLOSE_DEMO_WRITE 0x17d68
%define SET_DEBUG_LOCATION 0x5ab32
%define CLOSE_DEMO_READ 0x5dbf5
%define SHOW_BONUS 0x19eec
%define SET_GAME_MODE 0x39bc5
%define SHOW_TWO_SCREENS 0x14ed4
%define SHUTDOWN 0x170a8
%define SHUTDOWN_CDROM 0x2fdd0
%define PRINTF 0x5ac04
%define UNINIT_GROUP_FILE 0x31071
%define UNLINK 0x5e95b
%define EXIT 0x5e97d
%define TO_UPPER 0x5e8c3
%define DRAW_TEXT 0x118f0
%define DRAW_TICS 0x14c94
%define DRAW_QUOTES 0x14d48
%define DRAW_COORDS 0x14d34
%define SOURCE_NAME 0xd20
%define LOG_CLOSING 0xd70
%define EXIT_NEWLINE 0xd80
%define EXIT_MESSAGE_FORMAT 0xd84
%define TEMP_FILE 0xd94
%define EXIT_DONE_TEXT 0xda0
%define TYPING_NOTICE 0xda8
%define PAUSE_TEXT 0xdc0
%define NUM_PLAYERS 0xcf65c
%define DEMO_FILE 0x968c
%define PLAY_ON_TEN 0x93a4
%define SHOW_TICS_FLAG 0x96a0
%define VIEW_PLAYER 0xbf560
%define KEY_WAITING 0x5ad2c
%define GET_KEY 0x5ad40
%define INPUT_LENGTH 0x969c
%define INPUT_LENGTH_BEFORE 0x969a
%define ENTER_KEY_STATE 0x21ebec
%define KEYPAD_ENTER_STATE 0x21ec38
%define ESCAPE_KEY_STATE 0x21ebd1

game_exit:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov esi, eax
    mov eax, LOG_CLOSING
    call PRINT_NOTICE
    call CLOSE_LOG
    cmp byte [esi], 0
    je short loc_14f5d
    mov eax, dword [NUM_PLAYERS]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dword [eax + 0x8c37d], 0x209d68
loc_14f5d:
    cmp word [NUM_PLAYERS], 1
    jle short loc_14f71
    call WAIT_FOR_PEERS_ON_QUIT
    call UNINIT_MULTIPLAYER
loc_14f71:
    mov ebx, dword [0xbffab]
    cmp ebx, 1
    jne short loc_14f83
    call CLOSE_DEMO_WRITE
    jmp short loc_14fa1
loc_14f83:
    cmp ebx, 2
    jne short loc_14fa1
    push dword SOURCE_NAME
    push dword 0x18d
    call SET_DEBUG_LOCATION
    mov eax, dword [DEMO_FILE]
    call CLOSE_DEMO_READ
loc_14fa1:
    cmp byte [0xc1030], 1
    jbe short loc_14fd8
    cmp dword [0xbfb4b], 1
    je short loc_14fd8
    cmp byte [esi], 0x20
    jne short loc_14fd8
    mov eax, 1
    call SHOW_BONUS
    mov ebx, dword [0xc0064]
    mov edx, dword [0xc0080]
    mov eax, dword [0xc0070]
    call SET_GAME_MODE
loc_14fd8:
    cmp byte [esi], 0
    je short loc_14ff8
    mov bh, byte [esi + 1]
    cmp bh, 0x56
    je short loc_14ff8
    cmp bh, 0x59
    je short loc_14ff8
    cmp byte [PLAY_ON_TEN], 0
    jne short loc_14ff8
    call SHOW_TWO_SCREENS
loc_14ff8:
    call SHUTDOWN
    mov eax, 3
    int 0x10
    cmp word [NUM_PLAYERS], 2
    jge short loc_15013
    call SHUTDOWN_CDROM
loc_15013:
    cmp byte [esi], 0
    je short loc_1505f
    cmp byte [PLAY_ON_TEN], 0
    jne short loc_1505f
    push dword SOURCE_NAME
    push dword 0x1a3
    call SET_DEBUG_LOCATION
    push dword EXIT_NEWLINE
    call PRINTF
    add esp, 4
    cmp byte [esi], 0x20
    je short loc_1505f
    push dword SOURCE_NAME
    push dword 0x1a5
    call SET_DEBUG_LOCATION
    push esi
    push dword EXIT_MESSAGE_FORMAT
    call PRINTF
    add esp, 8
loc_1505f:
    call UNINIT_GROUP_FILE
    mov eax, TEMP_FILE
    call UNLINK
    push dword SOURCE_NAME
    push dword 0x1ae
    call SET_DEBUG_LOCATION
    push dword EXIT_DONE_TEXT
    call PRINTF
    add esp, 4
    xor eax, eax
    call EXIT
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

read_text_entry:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x30
    mov esi, eax
    mov word [ebp - 0xc], dx
loc_150aa:
    call KEY_WAITING
    test eax, eax
    je near loc_1518d
    xor edx, edx
    call GET_KEY
    mov dl, al
    test dx, dx
    jne short loc_150dc
    call GET_KEY
    xor ah, ah
    cmp ax, strict word 0x68
    jne short loc_150aa
    mov eax, 1
    jmp near loc_151f8
loc_150dc:
    cmp dx, 8
    jne short loc_15106
    mov dx, word [INPUT_LENGTH]
    test dx, dx
    jle short loc_150aa
    mov edi, edx
    dec edi
    mov word [INPUT_LENGTH], di
    mov eax, dword [INPUT_LENGTH_BEFORE]
    sar eax, 0x10
    mov byte [ebx + eax], 0
    jmp short loc_150aa
loc_15106:
    cmp dx, 0xd
    jne short loc_1512a
    xor dl, al
    mov byte [ENTER_KEY_STATE], dl
    xor dh, dh
    mov byte [KEYPAD_ENTER_STATE], dh
    mov eax, 1
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_1512a:
    cmp dx, 0x1b
    jne short loc_15146
    xor ah, ah
    mov byte [ESCAPE_KEY_STATE], ah
    mov eax, 0xffffffff
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_15146:
    cmp dx, 0x20
    jl near loc_150aa
    cmp cx, word [INPUT_LENGTH]
    jle near loc_150aa
    cmp dx, 0x7f
    jge near loc_150aa
    movsx eax, dx
    call TO_UPPER
    mov edx, eax
    mov eax, dword [INPUT_LENGTH_BEFORE]
    sar eax, 0x10
    mov byte [ebx + eax + 1], 0
    mov byte [ebx + eax], dl
    inc word [INPUT_LENGTH]
    jmp near loc_150aa
loc_1518d:
    mov edx, dword [ebp + 8]
    cmp dx, 0x3e7
    je short loc_151f6
    cmp dx, 0x3e6
    jne short loc_151db
    xor dl, dl
    jmp short loc_151ae
loc_151a2:
    xor eax, eax
    mov al, dl
    mov bh, 0x2a
    inc dl
    mov byte [eax + ebp - 0x38], bh
loc_151ae:
    xor eax, eax
    mov bx, word [INPUT_LENGTH]
    mov al, dl
    cmp ax, bx
    jl short loc_151a2
    xor eax, eax
    xor bl, bl
    xor ecx, ecx
    mov al, dl
    mov cl, byte [ebp + 8]
    mov edx, dword [ebp - 0xe]
    mov byte [eax + ebp - 0x38], bl
    lea ebx, [ebp - 0x38]
    sar edx, 0x10
    movsx eax, si
    jmp short loc_151e9
loc_151db:
    mov edx, dword [ebp - 0xe]
    xor ecx, ecx
    movsx eax, si
    mov cl, byte [ebp + 8]
    sar edx, 0x10
loc_151e9:
    call DRAW_TEXT
    mov eax, dword [0x216f7c]
    shl eax, 4
loc_151f6:
    xor eax, eax
loc_151f8:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    times 15 db 0    ; Padding between game2 and game3 code

draw_typing_overlay:
    push ebp
    mov ebp, esp
    mov eax, TYPING_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

toggle_tics:
    push ebp
    mov ebp, esp
    xor byte [SHOW_TICS_FLAG], 1
    mov esp, ebp
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

draw_screen_overlays:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    cmp dword [SHOW_TICS_FLAG], 1
    jne short loc_1524e
    call 0x5103c
    call DRAW_TICS
loc_1524e:
    call 0x59084
    mov eax, dword [VIEW_PLAYER]
    sar eax, 0x10
    imul edx, eax, strict dword 0x623
    mov bl, byte [0xbfaf4]
    add edx, strict dword 0x8be10
    cmp bl, 2
    je short loc_15277
    call 0x29948
loc_15277:
    mov ecx, 0x600
    mov ebx, 0x14
    mov eax, dword [edx + 0x23c]
    mov esi, dword [edx + 0x238]
    mov edx, eax
    mov eax, esi
    call 0x57b38
    call DRAW_QUOTES
    mov eax, dword [NUM_PLAYERS]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 0x10
    je short loc_152b9
    call draw_typing_overlay
    jmp short loc_152be
loc_152b9:
    call 0x26810
loc_152be:
    cmp word [0xbfaf7], 1
    jne short loc_152f7
    mov eax, dword [NUM_PLAYERS]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 1
    jne short loc_152f7
    push dword PAUSE_TEXT
    mov edx, 0x64
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call 0x25e2c
loc_152f7:
    cmp dword [0xbfb3f], 0
    je short loc_1530d
    mov eax, dword [VIEW_PLAYER]
    sar eax, 0x10
    call DRAW_COORDS
loc_1530d:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
