bits 32
org 0x14780

%define PRINT_NOTICE 0x5130c
%define ROTATE_SPRITE 0x47f83
%define SET_DEBUG_LOCATION 0x5d849
%define SPRINTF 0x5d8cc
%define PRINT_TEXT_256 0x46e99
%define DRAW_TEXT 0x118f0
%define OPEN_GAME_FILE 0x310bf
%define READ_GAME_FILE 0x31201
%define CLOSE_GAME_FILE 0x313c4
%define PLAYER_QUOTE_INDEX 0x8c0f4
%define QUOTE_TEXT 0x92040
%define VIEW_PLAYER 0xbf560
%define USER_QUOTE_TIME 0xbf564
%define USER_QUOTE 0xbd9b0
%define CONNECT_HEAD 0xcf658
%define CONNECT_NEXT 0xcf540
%define SOURCE_NAME 0xd20
%define TICS_FORMAT 0xd28
%define TEXT_SCREEN_FILE 0xd64
%define CHECK_FTA_SOUNDS_NOTICE 0xb38
%define SHOWMOTORCYCLE_NOTICE 0xb58
%define ONMOTORCYCLE_NOTICE 0xb78
%define OFFMOTORCYCLE_NOTICE 0xb94
%define SHOWBOAT_NOTICE 0xbb4
%define ONBOAT_NOTICE 0xbcc
%define OFFBOAT_NOTICE 0xbe4
%define INVENNUM_NOTICE 0xbfc
%define WEAPONNUM_NOTICE 0xc14
%define WEAPONNUM999_NOTICE 0xc30
%define WEAPON_AMOUNTS_NOTICE 0xc4c
%define DIGITALNUMBER_NOTICE 0xc6c
%define DISPLAYINVENTORY_NOTICE 0xc8c
%define DISPLAYFRAGBAR_NOTICE 0xcac
%define WEAPONBAR_NOTICE 0xccc
%define COOLGAUGETEXT_NOTICE 0xce8
%define GUTMETER_NOTICE 0xd08
%define COORDS_NOTICE 0xd2c
%define SHOWTWOSCREENS_NOTICE 0xd44

check_fta_sounds:
    push ebp
    mov ebp, esp
    mov eax, CHECK_FTA_SOUNDS_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

inventory:
    push ebp
    mov ebp, esp
    mov ax, word [eax + 0xe]
    cmp ax, strict word 0x3b
    jb short loc_147b3
    jbe short loc_147c7
    cmp ax, strict word 0x3d
    jb short loc_147d0
    jbe short loc_147c7
    cmp ax, strict word 0x546
    je short loc_147c7
    jmp short loc_147d0
loc_147b3:
    cmp ax, strict word 0x35
    jb short loc_147d0
    jbe short loc_147c7
    cmp ax, strict word 0x37
    jb short loc_147d0
    cmp ax, strict word 0x39
    ja short loc_147d0
loc_147c7:
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
loc_147d0:
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    times 10 db 0    ; Padding between game1 and game2 code

actorfella:
    push ebp
    mov ebp, esp
    mov ax, word [eax + 0xe]
    cmp ax, strict word 0x1351
    jb short loc_147ff
    jbe short loc_14805
    cmp ax, strict word 0x1603
    jb short loc_1480e
    jbe short loc_14805
    cmp ax, strict word 0x1a02
    je short loc_14805
    jmp short loc_1480e
loc_147ff:
    cmp ax, strict word 0x10a4
    jne short loc_1480e
loc_14805:
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
loc_1480e:
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret

badguy:
    push ebp
    mov ebp, esp
    push edx
    mov edx, eax
    mov ax, word [eax + 0xe]
    cmp ax, strict word 0x1351
    jb short loc_14836
    jbe short loc_1483c
    cmp ax, strict word 0x1603
    jb short loc_14843
    jbe short loc_1483c
    cmp ax, strict word 0x1a02
    je short loc_1483c
    jmp short loc_14843
loc_14836:
    cmp ax, strict word 0x10a4
    jne short loc_14843
loc_1483c:
    mov eax, 1
    jmp short loc_14860
loc_14843:
    mov edx, dword [edx + 0xc]
    sar edx, 0x10
    mov ah, byte [edx + 0x68fd0]
    test ah, ah
    je short loc_1485e
    mov eax, 1
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
loc_1485e:
    xor al, al
loc_14860:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

badguypic:
    push ebp
    mov ebp, esp
    cmp ax, strict word 0x1351
    jb short loc_14883
    jbe short loc_14889
    cmp ax, strict word 0x1603
    jb short loc_14892
    jbe short loc_14889
    cmp ax, strict word 0x1a02
    je short loc_14889
    jmp short loc_14892
loc_14883:
    cmp ax, strict word 0x10a4
    jne short loc_14892
loc_14889:
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
loc_14892:
    cwde
    cmp byte [eax + 0x68fd0], 0
    je short loc_148a5
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
loc_148a5:
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop

show_motorcycle:
    push ebp
    mov ebp, esp
    mov eax, SHOWMOTORCYCLE_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 0xc
    nop

on_motorcycle:
    push ebp
    mov ebp, esp
    mov eax, ONMOTORCYCLE_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

off_motorcycle:
    push ebp
    mov ebp, esp
    mov eax, OFFMOTORCYCLE_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

show_boat:
    push ebp
    mov ebp, esp
    mov eax, SHOWBOAT_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 0xc
    nop

on_boat:
    push ebp
    mov ebp, esp
    mov eax, ONBOAT_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

off_boat:
    push ebp
    mov ebp, esp
    mov eax, OFFBOAT_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

myos:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 4
    mov ch, byte [ebp + 8]
    mov esi, eax
    mov edi, ebx
    test ch, 4
    je short loc_14940
    mov word [ebp - 0xc], 0x400
    jmp short loc_14946
loc_14940:
    xor ebx, ebx
    mov word [ebp - 0xc], bx
loc_14946:
    mov eax, dword [VIEW_PLAYER]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c0a8]
    sar eax, 0x10
    mov ebx, eax
    shl eax, 2
    add eax, ebx
    mov ebx, dword [0x215c84]
    push ebx
    mov ebx, dword [0x215c8c]
    mov ah, byte [nosplit eax*8 + 0x20a085]
    push ebx
    mov ebx, dword [0x215c88]
    mov al, ch
    push ebx
    mov ebx, dword [0x215c90]
    or al, 2
    push ebx
    xor ebx, ebx
    mov bl, al
    push ebx
    mov al, ah
    and eax, strict dword 0xff
    mov ebx, 0x10000
    push eax
    movsx eax, cl
    shl edx, 0x10
    push eax
    movsx eax, di
    mov ecx, dword [ebp - 0xe]
    push eax
    mov eax, esi
    sar ecx, 0x10
    shl eax, 0x10
    call ROTATE_SPRITE
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    lea eax, [byte eax + 0]

myospal:
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov esi, eax
    test byte [ebp + 8], 4
    je short loc_149d8
    mov eax, 0x400
    jmp short loc_149da
loc_149d8:
    xor eax, eax
loc_149da:
    mov edi, dword [0x215c84]
    push edi
    mov edi, dword [0x215c8c]
    push edi
    mov edi, dword [0x215c88]
    mov ch, byte [ebp + 8]
    push edi
    mov edi, dword [0x215c90]
    or ch, 2
    push edi
    movzx edi, ch
    push edi
    movzx edi, byte [ebp + 0xc]
    push edi
    movsx ecx, cl
    push ecx
    movsx ecx, bx
    shl edx, 0x10
    push ecx
    movsx ecx, ax
    mov eax, esi
    mov ebx, 0x8000
    shl eax, 0x10
    call ROTATE_SPRITE
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 8
    nop

myospalsb:
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov esi, eax
    test byte [ebp + 8], 4
    je short loc_14a40
    mov eax, 0x400
    jmp short loc_14a42
loc_14a40:
    xor eax, eax
loc_14a42:
    mov edi, dword [0x215c84]
    push edi
    mov edi, dword [0x215c8c]
    push edi
    mov edi, dword [0x215c88]
    mov ch, byte [ebp + 8]
    push edi
    mov edi, dword [0x215c90]
    or ch, 2
    push edi
    movzx edi, ch
    push edi
    movzx edi, byte [ebp + 0xc]
    push edi
    movsx ecx, cl
    push ecx
    movsx ecx, bx
    shl edx, 0x10
    push ecx
    movsx ecx, ax
    mov eax, esi
    mov ebx, 0x8000
    shl eax, 0x10
    call ROTATE_SPRITE
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 8
    nop

rdmyospal:
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov esi, eax
    test byte [ebp + 8], 4
    je short loc_14aa8
    mov eax, 0x400
    jmp short loc_14aaa
loc_14aa8:
    xor eax, eax
loc_14aaa:
    mov edi, dword [0x215c84]
    push edi
    mov edi, dword [0x215c8c]
    push edi
    mov edi, dword [0x215c88]
    mov ch, byte [ebp + 8]
    push edi
    mov edi, dword [0x215c90]
    or ch, 2
    push edi
    movzx edi, ch
    push edi
    movzx edi, byte [ebp + 0xc]
    push edi
    movsx ecx, cl
    push ecx
    movsx ecx, bx
    shl edx, 0x10
    push ecx
    movsx ecx, ax
    mov eax, esi
    mov ebx, 0x8f5c
    shl eax, 0x10
    call ROTATE_SPRITE
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 8
    nop

rd2myospal:
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov esi, eax
    test byte [ebp + 8], 4
    je short loc_14b10
    mov eax, 0x400
    jmp short loc_14b12
loc_14b10:
    xor eax, eax
loc_14b12:
    mov edi, dword [0x215c84]
    push edi
    mov edi, dword [0x215c8c]
    push edi
    mov edi, dword [0x215c88]
    mov ch, byte [ebp + 8]
    push edi
    mov edi, dword [0x215c90]
    or ch, 2
    push edi
    movzx edi, ch
    push edi
    movzx edi, byte [ebp + 0xc]
    push edi
    movsx ecx, cl
    push ecx
    movsx ecx, bx
    shl edx, 0x10
    push ecx
    movsx ecx, ax
    mov eax, esi
    mov ebx, 0xac08
    shl eax, 0x10
    call ROTATE_SPRITE
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 8
    nop

rd3myospal:
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov esi, eax
    test byte [ebp + 8], 4
    je short loc_14b78
    mov eax, 0x400
    jmp short loc_14b7a
loc_14b78:
    xor eax, eax
loc_14b7a:
    mov edi, dword [0x215c84]
    push edi
    mov edi, dword [0x215c8c]
    push edi
    mov edi, dword [0x215c88]
    mov ch, byte [ebp + 8]
    push edi
    mov edi, dword [0x215c90]
    or ch, 2
    push edi
    movzx edi, ch
    push edi
    movzx edi, byte [ebp + 0xc]
    push edi
    movsx ecx, cl
    push ecx
    movsx ecx, bx
    shl edx, 0x10
    push ecx
    movsx ecx, ax
    mov eax, esi
    mov ebx, 0xb7c0
    shl eax, 0x10
    call ROTATE_SPRITE
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 8
    nop

invennum:
    push ebp
    mov ebp, esp
    mov eax, INVENNUM_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 4
    nop

weaponnum:
    push ebp
    mov ebp, esp
    mov eax, WEAPONNUM_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 8
    nop

weaponnum999:
    push ebp
    mov ebp, esp
    mov eax, WEAPONNUM999_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 8
    nop

weapon_amounts:
    push ebp
    mov ebp, esp
    mov eax, WEAPON_AMOUNTS_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

digitalnumber:
    push ebp
    mov ebp, esp
    mov eax, DIGITALNUMBER_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 4
    nop

displayinventory:
    push ebp
    mov ebp, esp
    mov eax, DISPLAYINVENTORY_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

displayfragbar:
    push ebp
    mov ebp, esp
    mov eax, DISPLAYFRAGBAR_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

weaponbar:
    push ebp
    mov ebp, esp
    mov eax, WEAPONBAR_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

coolgaugetext:
    push ebp
    mov ebp, esp
    mov eax, COOLGAUGETEXT_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

gutmeter:
    push ebp
    mov ebp, esp
    mov eax, GUTMETER_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

tics:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    sub esp, 0xc
    mov esi, dword [0x216f7c]
    mov eax, dword [0x9698]
    cmp esi, dword [nosplit eax*4 + 0xc1040]
    je short store_frame_clock
    push dword SOURCE_NAME
    push dword 0x11c
    call SET_DEBUG_LOCATION
    mov eax, dword [0x9698]
    mov ecx, dword [nosplit eax*4 + 0xc1040]
    mov eax, 0x780
    mov ebx, esi
    mov edx, eax
    sub ebx, ecx
    sar edx, 0x1f
    idiv ebx
    push eax
    push dword TICS_FORMAT
    lea eax, [ebp - 0x1c]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ecx, 0xffffffeb
    push byte 1
    lea eax, [ebp - 0x1c]
    mov ebx, 0x1f
    push eax
    mov edx, dword [0x215c88]
    mov eax, dword [0x215c90]
    call PRINT_TEXT_256
    mov eax, dword [0x9698]
    mov dword [nosplit eax*4 + 0xc1040], esi
store_frame_clock:
    mov eax, dword [0x9698]
    inc eax
    and eax, 0xf
    mov dword [0x9698], eax
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

coords:
    push ebp
    mov ebp, esp
    mov eax, COORDS_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

draw_quotes:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    cmp word [USER_QUOTE_TIME], 0
    jle short check_player_quote
    cmp dword [0xbfb4f], 0
    jle short loc_14d68
    mov edx, 0x9f
    jmp short loc_14d6d
loc_14d68:
    mov edx, 0xc0
loc_14d6d:
    mov eax, 0xa0
    mov ebx, dword [USER_QUOTE]
    xor ecx, ecx
    call DRAW_TEXT
    cmp word [USER_QUOTE_TIME], 1
    jne short check_player_quote
    mov ah, 1
    mov byte [0xc003a], ah
    mov byte [0xc003b], ah
check_player_quote:
    mov eax, dword [VIEW_PLAYER]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ax, word [eax + PLAYER_QUOTE_INDEX]
    cmp ax, strict word 1
    jle near loc_14e5f
    cmp dword [0xbfb4b], 1
    je near loc_14e2d
    cmp dword [0xbfb4f], 0
    jle near loc_14e2d
    cmp dword [0xbffe3], 1
    jle short loc_14e2d
    mov ebx, 8
    mov ax, word [CONNECT_HEAD]
    xor edx, edx
    test ax, ax
    jl short loc_14e00
loc_14deb:
    cmp ax, dx
    jle short loc_14df2
    mov edx, eax
loc_14df2:
    cwde
    mov ax, word [nosplit eax*2 + CONNECT_NEXT]
    test ax, ax
    jge short loc_14deb
loc_14e00:
    cmp dx, 4
    jl short loc_14e11
    cmp dx, 8
    jg short loc_14e11
    add ebx, 8
    jmp short loc_14e2f
loc_14e11:
    cmp dx, 8
    jle short loc_14e22
    cmp dx, 0xc
    jg short loc_14e22
    add ebx, 0x10
    jmp short loc_14e2f
loc_14e22:
    cmp dx, 0xc
    jle short loc_14e2f
    add ebx, 0x18
    jmp short loc_14e2f
loc_14e2d:
    xor ebx, ebx
loc_14e2f:
    mov eax, dword [VIEW_PLAYER]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + PLAYER_QUOTE_INDEX]
    sar eax, 0x10
    shl eax, 6
    movsx edx, bx
    add eax, strict dword QUOTE_TEXT
    xor ecx, ecx
    mov ebx, eax
    mov eax, 0xa0
    call DRAW_TEXT
loc_14e5f:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

set_player_quote:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edi
    cmp dword [0xbfb33], 1
    jne short loc_14eca
    cmp word [edx + 0x2e4], 0
    jle short loc_14ea0
    cmp ax, strict word 0x73
    je short loc_14ea0
    cmp ax, strict word 0x74
    je short loc_14ea0
    mov cx, word [edx + 0x2e6]
    cmp cx, 0x73
    je short loc_14eca
    cmp cx, 0x74
    je short loc_14eca
loc_14ea0:
    mov di, word [edx + 0x2e6]
    mov word [edx + 0x2e4], 0x64
    cmp ax, di
    je short loc_14eca
    mov bl, 1
    mov word [edx + 0x2e6], ax
    mov byte [0xc003a], bl
    mov byte [0xc003b], bl
loc_14eca:
    lea esp, [ebp - 0xc]
    pop edi
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

showtwoscreens:
    push ebp
    mov ebp, esp
    mov eax, SHOWTWOSCREENS_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

binscreen:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    xor edx, edx
    mov eax, TEXT_SCREEN_FILE
    mov dl, byte [0xc0043]
    call OPEN_GAME_FILE
    mov ecx, eax
    cmp eax, -1
    je short loc_14f1d
    mov ebx, 0xfa0
    mov edx, 0xb8000
    call READ_GAME_FILE
    mov eax, ecx
    call CLOSE_GAME_FILE
loc_14f1d:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
