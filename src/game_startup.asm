bits 32
org 0x16fc0

%define PRINT_NOTICE 0x5130c
%define STOP_GAME_TIMER 0x118c4
%define WRITE_SETUP 0x1154c
%define START_GAME_TIMER 0x11894
%define SET_DEBUG_LOCATION 0x5ab32
%define PRINTF 0x5ac04
%define TO_UPPER 0x5e8c3
%define SEND_PACKET 0x300b0
%define GET_PACKETS 0x11fb0
%define ROTATE_SPRITE 0x47f83
%define SOUND_SHUTDOWN 0x2b570
%define MUSIC_SHUTDOWN 0x2b640
%define UNINIT_ENGINE 0x3a1f0
%define CONTROL_SHUTDOWN 0x5d820
%define KEYBOARD_SHUTDOWN 0x5ae98
%define KEYBOARD_STARTUP 0x5ae44
%define CONTROL_STARTUP 0x5d5b0
%define INIT_ENGINE 0x3a08a
%define PUTS 0x5e9d9
%define LOAD_PICS 0x3a83b
%define INIT_MULTIPLAYER 0x2fdf4
%define SETUP_GAME_BUTTONS 0x19c74
%define MUSIC_STARTUP 0x2b59c
%define SOUND_STARTUP 0x2b450
%define NEXT_PAGE 0x3a2b0
%define KEY_WAITING 0x5ad2c
%define CHEATS_NOTICE 0xebc
%define LOGO_NOTICE 0xed4
%define SOURCE_NAME 0xee8
%define WRITE_DEFAULTS_TEXT 0xef0
%define ART_HEADER_TEXT 0xf1c
%define ART_FILENAME 0xf30
%define MULTIPLAYER_TEXT 0xf40
%define MUSIC_INIT_TEXT 0xf5c
%define SOUND_INIT_TEXT 0xf74
%define SEARCHING_TEXT 0xf8c
%define INTRO_INDEX_ERROR 0xfac
%define NUM_PLAYERS 0xcf65c

cheats:
    push ebp
    mov ebp, esp
    mov eax, CHEATS_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

nonshared_keys:
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    times 5 db 0    ; Padding between game6 and game7 code

game7_empty_entry:
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop

set_game_defaults:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    mov edx, 1
    xor ah, ah
    xor ebx, ebx
    xor ecx, ecx
    xor esi, esi
    mov dword [0xbfb33], edx
    mov byte [0xbf570], ah
    mov dword [0xbffb7], ebx
    mov dword [0xbffbb], ecx
    mov dword [0xbffbf], esi
    mov byte [0xbf571], ah
    mov byte [0xbf572], ah
    mov dword [0xbffe7], edx
    mov dword [0xbffd7], edx
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

write_text_screen:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 4
    mov esi, ebx
    mov byte [ebp - 0xc], cl
    imul edx, edx, 0x50
    add edx, eax
    xor ebx, ebx
    add edx, edx
loc_17052:
    movsx eax, bx
    add eax, esi
    mov cl, byte [eax]
    test cl, cl
    je short loc_17084
    movzx edi, byte [ebp - 0xc]
    mov al, cl
    shl edi, 8
    and eax, strict dword 0xff
    add eax, edi
    movsx edi, dx
    mov ecx, 1
    add edi, strict dword 0xb8000
    inc ebx
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    add edx, 2
    jmp short loc_17052
loc_17084:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
    nop

logo:
    push ebp
    mov ebp, esp
    mov eax, LOGO_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

startup_empty_entry:
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop

shutdown:
    push ebp
    mov ebp, esp
    call SOUND_SHUTDOWN
    call MUSIC_SHUTDOWN
    call STOP_GAME_TIMER
    call UNINIT_ENGINE
    mov eax, 3
    int 0x10
    call CONTROL_SHUTDOWN
    call WRITE_SETUP
    call KEYBOARD_SHUTDOWN
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

init_game_pointers:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov edx, 0x20438
    mov ebx, 0x20a068
    mov ecx, 0x191368
    mov eax, 0x9538
    mov dword [0xbf38c], edx
    mov dword [0xbd9ac], ebx
    mov dword [0xbd9bc], ecx
    call 0x1cb74
    cmp byte [0xc0043], 0
    je short loc_1713f
    push dword SOURCE_NAME
    push byte 0x6f
    call SET_DEBUG_LOCATION
    push dword WRITE_DEFAULTS_TEXT
    call PRINTF
    add esp, 4
    mov eax, 0x9538
    mov edx, dword [0xbf38c]
    call 0x1cb74
loc_1713f:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

startup:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    call KEYBOARD_STARTUP
    call init_game_pointers
    cmp dword [0x9530], 0
    je short loc_1716b
    xor ebx, ebx
    mov dword [0xc0058], ebx
loc_1716b:
    cmp dword [0x9534], 0
    je short loc_1717c
    xor esi, esi
    mov dword [0xc0054], esi
loc_1717c:
    mov ebx, 0x78
    mov edx, 0x9f00
    xor eax, eax
    mov ecx, 0x10
    mov al, byte [0xc0078]
    xor edi, edi
    call CONTROL_STARTUP
    mov dword [0xa238], edi
    call INIT_ENGINE
    call START_GAME_TIMER
    mov eax, ART_HEADER_TEXT
    xor edx, edx
    call PUTS
    mov eax, ART_FILENAME
    xor ebx, ebx
    call LOAD_PICS
    call 0x54de0
    mov eax, 0x7f390
    mov word [0x181f6a], dx
    xor edx, edx
    mov word [0x17d76a], bx
    call 0x5ea10
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call INIT_MULTIPLAYER
    cmp word [NUM_PLAYERS], 1
    jle short loc_171ff
    mov eax, MULTIPLAYER_TEXT
    call PUTS
loc_171ff:
    mov eax, dword [NUM_PLAYERS]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dword [eax + 0x8c37d], 0x209d68
    call SETUP_GAME_BUTTONS
    cmp byte [0x93a1], 0xff
    jne short loc_17249
    mov si, word [NUM_PLAYERS]
    cmp si, 1
    jle short loc_17241
    cmp si, 4
    jg short loc_17241
    mov byte [0x93a1], 1
    jmp short loc_17249
loc_17241:
    xor dl, dl
    mov byte [0x93a1], dl
loc_17249:
    mov eax, MUSIC_INIT_TEXT
    call PUTS
    call MUSIC_STARTUP
    mov eax, SOUND_INIT_TEXT
    call PUTS
    call SOUND_STARTUP
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

startup_empty_tail:
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop

get_names:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    xor esi, esi
    jmp short loc_172bb
loc_17287:
    xor eax, eax
    mov al, byte [edx + 0xbffff]
    call TO_UPPER
    mov ebx, dword [NUM_PLAYERS]
    sar ebx, 0x10
    shl ebx, 5
    mov byte [edx + ebx + 0xbf578], al
    xor eax, eax
    mov al, byte [edx + 0xbffff]
    inc esi
    call TO_UPPER
    mov byte [edx + 0x8bcc2], al
loc_172bb:
    movsx edx, si
    mov ah, byte [edx + 0xbffff]
    test ah, ah
    jne short loc_17287
    cmp word [NUM_PLAYERS], 1
    jle near loc_1741e
    mov byte [0x8bcc0], 6
    mov byte [0x8bcc1], 0x6c
    mov byte [edx + 0x8bcc2], ah
    mov eax, SEARCHING_TEXT
    call PUTS
    call 0x2e5ec
    mov cx, word [0xcf658]
    add esi, 3
    test cx, cx
    jl short loc_17331
loc_17308:
    cmp cx, word [0xcf65e]
    je short loc_17321
    mov edx, 0x8bcc0
    movsx ebx, si
    movsx eax, cx
    call SEND_PACKET
loc_17321:
    movsx ecx, cx
    mov cx, word [nosplit ecx*2 + 0xcf540]
    test cx, cx
    jge short loc_17308
loc_17331:
    call GET_PACKETS
    mov esi, 1
    mov ch, 9
    xor edx, edx
    mov byte [0x8bcc0], ch
loc_17345:
    mov ebx, dword [NUM_PLAYERS]
    sar ebx, 0x10
    imul ebx, ebx, 0x44
    movsx eax, dx
    shl eax, 2
    lea ecx, [ebx + eax]
    mov ebx, dword [eax + 0xbfb5b]
    inc edx
    mov dword [ecx + 0xbfb5b], ebx
    movsx ebx, si
    mov al, byte [eax + 0xbfb5b]
    inc esi
    mov byte [ebx + 0x8bcc0], al
    cmp dx, 0xa
    jl short loc_17345
    mov cx, word [0xcf658]
    test cx, cx
    jl short loc_173b2
loc_17389:
    cmp cx, word [0xcf65e]
    je short loc_173a2
    mov edx, 0x8bcc0
    movsx ebx, si
    movsx eax, cx
    call SEND_PACKET
loc_173a2:
    movsx eax, cx
    mov cx, word [nosplit eax*2 + 0xcf540]
    test cx, cx
    jge short loc_17389
loc_173b2:
    call GET_PACKETS
    mov byte [0x8bcc0], 0xa
    mov al, byte [0x8c36a]
    mov byte [0x8bcc1], al
    mov eax, dword [NUM_PLAYERS]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dl, byte [0x8c36a]
    mov cx, word [0xcf658]
    mov byte [eax + 0x8c36a], dl
    test cx, cx
    jl short loc_17419
loc_173ee:
    cmp cx, word [0xcf65e]
    je short loc_17409
    mov ebx, 2
    mov edx, 0x8bcc0
    movsx eax, cx
    call SEND_PACKET
loc_17409:
    movsx eax, cx
    mov cx, word [nosplit eax*2 + 0xcf540]
    test cx, cx
    jge short loc_173ee
loc_17419:
    call GET_PACKETS
loc_1741e:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 9 db 0    ; Alignment before intro code

do_intro:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp word [0xcf65e], 0
    jl short loc_1744c
    cmp word [0xbf562], 0
    jge short loc_1745b
loc_1744c:
    mov eax, INTRO_INDEX_ERROR
    call PRINT_NOTICE
    jmp near loc_17670
loc_1745b:
    mov eax, dword [NUM_PLAYERS]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, 0x209d68
    mov ecx, dword [0x216f84]
    mov ebx, dword [0x216f88]
    mov dword [eax + 0x8c37d], edx
    xor edx, edx
    xor eax, eax
    call 0x47b92
    xor eax, eax
    call 0x4d427
    call NEXT_PAGE
    xor edx, edx
    mov ecx, dword [0x216f84]
    mov ebx, dword [0x216f88]
    xor eax, eax
    dec ecx
    dec ebx
    call 0x47b92
    call 0x5adcc
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, 0x209d68
    xor esi, esi
    mov dword [eax + 0x8c37d], ebx
    xor edi, edi
loc_174ce:
    movsx ecx, si
    mov ebx, edi
    mov edx, edi
    mov eax, edi
    inc esi
    call 0x27980
    cmp si, 0x3f
    jl short loc_174ce
    xor eax, eax
    call 0x4d427
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push dword 0xda
    push byte 0
    mov ebx, 0x10000
    mov esi, 0x3f
    push byte 0
    xor ecx, ecx
    xor edx, edx
    push dword 0x1bc2
    xor eax, eax
    xor edi, edi
    call ROTATE_SPRITE
    call NEXT_PAGE
loc_17526:
    movsx ecx, si
    mov ebx, edi
    mov edx, edi
    mov eax, edi
    dec esi
    call 0x27980
    test si, si
    jg short loc_17526
    mov eax, dword [0x216f7c]
    add eax, strict dword 0x168
    mov dword [0xbd6f8], eax
loc_17549:
    call KEY_WAITING
    test eax, eax
    jne short loc_1755f
    mov eax, dword [0x216f7c]
    cmp eax, dword [0xbd6f8]
    jl short loc_17549
loc_1755f:
    call 0x5adcc
    call 0x5f464
    call 0x2c650
    xor esi, esi
    xor edi, edi
loc_17572:
    movsx ecx, si
    mov ebx, edi
    mov edx, edi
    mov eax, edi
    inc esi
    call 0x27980
    cmp si, 0x3f
    jl short loc_17572
    xor eax, eax
    call 0x4d427
    call NEXT_PAGE
    xor edx, edx
    mov ecx, dword [0x216f84]
    mov ebx, dword [0x216f88]
    xor eax, eax
    dec ecx
    dec ebx
    call 0x47b92
    call 0x5adcc
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dword [eax + 0x8c37d], 0x209d68
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push dword 0xda
    push byte 0
    xor edi, edi
    mov ebx, 0x10000
    push byte 0
    xor ecx, ecx
    xor edx, edx
    push dword 0x1bc3
    xor eax, eax
    mov esi, 0x3f
    call ROTATE_SPRITE
    call NEXT_PAGE
loc_17603:
    movsx ecx, si
    mov ebx, edi
    mov edx, edi
    mov eax, edi
    dec esi
    call 0x27980
    test si, si
    jg short loc_17603
    mov eax, dword [0x216f7c]
    add eax, strict dword 0x168
    mov dword [0xbd6f8], eax
loc_17626:
    call KEY_WAITING
    test eax, eax
    jne short loc_1763c
    mov eax, dword [0x216f7c]
    cmp eax, dword [0xbd6f8]
    jl short loc_17626
loc_1763c:
    call 0x5adcc
    call 0x5f464
    call 0x2c650
    xor esi, esi
    xor edi, edi
loc_1764f:
    movsx ecx, si
    mov ebx, edi
    mov edx, edi
    mov eax, edi
    inc esi
    call 0x27980
    cmp si, 0x3f
    jl short loc_1764f
    xor eax, eax
    call 0x4d427
    call NEXT_PAGE
loc_17670:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
