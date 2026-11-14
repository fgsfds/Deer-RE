bits 32
org 0x17d7c

%define FLUSH_PERMS 0x47f72
%define DRAW_BACKGROUND 0x15774
%define MENU 0x26810
%define NEXT_PAGE 0x3a2b0
%define KEY_WAITING 0x5ad2c
%define DISPLAY_ROOMS 0x15828
%define DRAW_SCREEN_OVERLAYS 0x15234
%define GET_PACKETS 0x11fb0
%define CLOSE_GAME_FILE 0x313c4
%define DRAW_TYPING_OVERLAY 0x15210
%define DRAW_QUOTES 0x14d48
%define DO_MOVE_THINGS 0x19650
%define NONSHARED_KEYS 0x16fd4
%define GET_Z_RANGE 0x46fb4
%define GET_FLOOR_Z_OF_SLOPE 0x4decc
%define GET_ANGLE 0x3b4fc
%define BADGUY 0x14814
%define CLIP_MOVE 0x430f3
%define PUSH_MOVE 0x44c03
%define READY_TO_SEND 0xc0049
%define LOCAL_PLAYER_BEFORE 0xcf65c
%define TOTAL_CLOCK 0x216f7c
%define MOVE_FIFO_END 0x67438

playback:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x28
    cmp byte [READY_TO_SEND], 0
    je short loc_17d97
    xor eax, eax
    jmp near loc_18208
loc_17d97:
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dl, 1
    xor bl, bl
    mov byte [0xc003a], dl
    mov al, byte [eax + 0x8c34c]
    mov byte [0xc003b], dl
    and al, 1
    mov byte [ebp - 0x18], bl
    mov byte [0x9729], al
    call FLUSH_PERMS
    cmp dl, byte [0x9728]
    jae short loc_17dda
    mov byte [0x9728], dl
    jmp short loc_17d97
loc_17dda:
    xor edi, edi
loc_17ddc:
    mov ecx, edi
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    add edi, 7
    call 0x27980
    cmp edi, 0x3f
    jl short loc_17ddc
    call DRAW_BACKGROUND
    call MENU
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, 0x209d68
    mov edi, 0x3f
    mov dword [eax + 0x8c37d], edx
    call NEXT_PAGE
loc_17e1e:
    mov ecx, edi
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    sub edi, 7
    call 0x27980
    test edi, edi
    jg short loc_17e1e
    xor ebx, ebx
    mov ch, byte [ebp - 0x18]
    mov dword [0xbfb23], ebx
    test ch, ch
    je short loc_17e5c
    cmp byte [0x9729], 0
    jne short loc_17e5c
    call KEY_WAITING
    test eax, eax
    jne short loc_17e5c
    cmp dword [0xbffe3], 1
    jle short loc_17e7b
loc_17e5c:
    call 0x5f464
    call 0x2c650
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    or byte [eax + 0x8c34c], 1
loc_17e7b:
    xor dh, dh
    xor esi, esi
    mov byte [READY_TO_SEND], dh
    mov dword [ebp - 0x1c], esi
    call 0x5adcc
loc_17e8d:
    cmp dword [0xbfb23], 0
    jg short loc_17ea0
    cmp byte [ebp - 0x18], 0
    jne near loc_181de
loc_17ea0:
    cmp byte [ebp - 0x18], 0
    je near loc_17fdd
loc_17eaa:
    mov eax, dword [0xbd764]
    add eax, 4
    cmp eax, dword [TOTAL_CLOCK]
    jg near loc_17fdd
    mov ebx, dword [ebp - 0x1c]
    test ebx, ebx
    je short loc_17ecd
    cmp ebx, strict dword 0x9d8
    jl short loc_17f0b
loc_17ecd:
    xor esi, esi
    mov edi, dword [0xbfb23]
    mov dword [ebp - 0x1c], esi
    cmp edi, strict dword 0x9d8
    jge short loc_17ee4
    mov edx, edi
    jmp short loc_17ee9
loc_17ee4:
    mov edx, 0x9d8
loc_17ee9:
    mov ebx, dword [0xbffe3]
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    imul edx, ebx, 0xa
    mov ecx, dword [0xc1024]
    mov ebx, eax
    mov eax, 0x95040
    call 0x313f1
loc_17f0b:
    mov edx, dword [0xcf656]
    sar edx, 0x10
    test edx, edx
    jl near loc_17fd3
    imul eax, dword [ebp - 0x1c], 0xa
    add eax, strict dword 0x95040
    mov dword [ebp - 0x20], eax
loc_17f28:
    lea eax, [edx*4]
    mov dword [ebp - 0x24], eax
    mov edi, dword [eax + MOVE_FIFO_END]
    imul eax, edx, 0xa
    and edi, strict dword 0xff
    imul edi, edi, strict dword 0xa0
    mov ecx, 0xa
    add edi, strict dword 0x9beb0
    mov esi, dword [ebp - 0x20]
    add edi, eax
    cmp ecx, 4
    jae short loc_17f69
    test cl, 1
    je short loc_17f62
    movsb
loc_17f62:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw with Watcom prefix order
    jmp short loc_17f94
loc_17f69:
    test edi, 1
    je short loc_17f73
    movsb
    dec ecx
loc_17f73:
    test edi, 2
    je short loc_17f80
    movsw
    sub ecx, 2
loc_17f80:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_17f8e
    movsw
loc_17f8e:
    test bl, 1
    je short loc_17f94
    movsb
loc_17f94:
    mov eax, dword [ebp - 0x24]
    mov ebx, dword [ebp - 0x1c]
    mov edx, dword [nosplit edx*2 + 0xcf53e]
    mov ecx, dword [0xbfb23]
    sar edx, 0x10
    mov edi, dword [eax + MOVE_FIFO_END]
    inc ebx
    inc edi
    dec ecx
    mov dword [eax + MOVE_FIFO_END], edi
    mov eax, dword [ebp - 0x20]
    mov dword [ebp - 0x1c], ebx
    add eax, 0xa
    mov dword [0xbfb23], ecx
    mov dword [ebp - 0x20], eax
    test edx, edx
    jge near loc_17f28
loc_17fd3:
    call DO_MOVE_THINGS
    jmp near loc_17eaa
loc_17fdd:
    cmp byte [ebp - 0x18], 0
    jne short loc_17fed
    call DRAW_BACKGROUND
    jmp near loc_18081
loc_17fed:
    call NONSHARED_KEYS
    mov eax, dword [TOTAL_CLOCK]
    mov edi, dword [0xbd764]
    sub eax, edi
    shl eax, 0xe
    test eax, eax
    jle short loc_18012
    mov eax, dword [TOTAL_CLOCK]
    sub eax, edi
    shl eax, 0xe
    jmp short loc_18014
loc_18012:
    xor eax, eax
loc_18014:
    cmp eax, strict dword 0x10000
    jge short loc_18041
    mov eax, dword [TOTAL_CLOCK]
    mov ebx, dword [0xbd764]
    sub eax, ebx
    shl eax, 0xe
    test eax, eax
    jle short loc_1803b
    mov eax, dword [TOTAL_CLOCK]
    sub eax, ebx
    shl eax, 0xe
    jmp short loc_1803d
loc_1803b:
    xor eax, eax
loc_1803d:
    mov ecx, eax
    jmp short loc_18046
loc_18041:
    mov ecx, 0x10000
loc_18046:
    mov eax, dword [0xbf560]
    mov edx, ecx
    sar eax, 0x10
    call DISPLAY_ROOMS
    mov eax, ecx
    call DRAW_SCREEN_OVERLAYS
    cmp dword [0xbffe3], 1
    jle short loc_18081
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp byte [eax + 0x8c34c], 0
    je short loc_18081
    call GET_PACKETS
loc_18081:
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dh, byte [eax + 0x8c34c]
    test dh, 1
    je short loc_180a3
    test dh, 8
    jne near loc_17d97
loc_180a3:
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 0x10
    je short loc_180df
    call DRAW_TYPING_OVERLAY
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 0x10
    jne short loc_18137
    mov byte [eax + 0x8c34c], 1
    jmp short loc_18137
loc_180df:
    call MENU
    cmp dword [0xbffe3], 1
    jle short loc_18137
    lea eax, [ebp - 0x3c]
    call 0x5d3f4
    mov eax, dword [0x21f308]
    shr eax, 5
    test al, 1
    je short loc_18137
    call 0x5adcc
    mov eax, 0x25
    call 0x5d398
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov cl, 0x10
    xor edx, edx
    mov byte [eax + 0x8c34c], cl
    xor ch, ch
    mov word [0x969c], dx
    mov byte [0xc000c], ch
loc_18137:
    call DRAW_QUOTES
    mov ax, word [0xbfafd]
    mov bx, word [0xbfafb]
    cmp ax, bx
    je short loc_18164
    mov word [0xbfafd], bx
    mov eax, dword [TOTAL_CLOCK]
    add eax, strict dword 0xf0
    mov dword [0xbfb0b], eax
loc_18164:
    call GET_PACKETS
    cmp byte [0x21ec28], 0
    je short loc_18186
    xor bh, bh
    mov byte [0x21ec28], bh
    mov eax, 0x141c
    xor edx, edx
    call 0x3aeed
loc_18186:
    call NEXT_PAGE
    cmp dword [0x9724], 1
    jne short loc_181a6
    mov eax, 6
    xor edx, edx
    call 0x51c58
    mov dword [0x9724], edx
loc_181a6:
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov cl, byte [eax + 0x8c34c]
    cmp cl, 0x80
    je short loc_181c8
    cmp cl, 4
    jne near loc_17e8d
loc_181c8:
    mov eax, dword [0xc1024]
    call CLOSE_GAME_FILE
    xor eax, eax
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_181de:
    mov eax, dword [0xc1024]
    call CLOSE_GAME_FILE
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 1
    jne near loc_17d97
    mov eax, 1
loc_18208:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

move_loop:
    push ebp
    mov ebp, esp
    push ecx
    push edx
    push esi
    push edi
    mov ecx, dword [0xbd70c]
    cmp word [LOCAL_PLAYER_BEFORE], 1
    jle short loc_18249
loc_1822b:
    mov edx, dword [LOCAL_PLAYER_BEFORE]
    sar edx, 0x10
    mov eax, dword [0xbcd40]
    cmp eax, dword [nosplit edx*4 + MOVE_FIFO_END]
    jge short loc_18249
    call predict_movement
    jmp short loc_1822b
loc_18249:
    call GET_PACKETS
    cmp word [LOCAL_PLAYER_BEFORE], 2
    jge short loc_18260
    xor esi, esi
    mov dword [0x93ac], esi
loc_18260:
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    mov ecx, dword [0xbd70c]
    mov eax, dword [nosplit eax*4 + MOVE_FIFO_END]
    mov edi, dword [0x93ac]
    sub eax, ecx
    cmp eax, edi
    jle short loc_182c1
    mov eax, dword [0xcf656]
    sar eax, 0x10
    test eax, eax
    jl short loc_182a4
loc_1828d:
    cmp ecx, dword [nosplit eax*4 + MOVE_FIFO_END]
    je short loc_182a4
    mov eax, dword [nosplit eax*2 + 0xcf53e]
    sar eax, 0x10
    test eax, eax
    jge short loc_1828d
loc_182a4:
    mov dword [0xbd70c], ecx
    test eax, eax
    jge short loc_182c1
    call DO_MOVE_THINGS
    test al, al
    je short loc_18260
    mov al, 1
    mov ecx, dword [0xbd70c]
    jmp short loc_182c9
loc_182c1:
    mov ecx, dword [0xbd70c]
    xor al, al
loc_182c9:
    mov dword [0xbd70c], ecx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebp
    ret

correct_predicted_movement:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    cmp word [LOCAL_PLAYER_BEFORE], 2
    jl near loc_18494
    mov eax, dword [LOCAL_PLAYER_BEFORE]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, dword [0xbd70c]
    dec ebx
    and ebx, strict dword 0xff
    lea edx, [ebx*4]
    add eax, strict dword 0x8be10
    mov esi, dword [edx + 0x1c680]
    cmp esi, dword [eax + 0x214]
    jne short loc_18361
    mov ecx, dword [eax + 0x218]
    cmp ecx, dword [edx + 0x1ca80]
    jne short loc_18361
    mov ecx, dword [eax + 0x21c]
    cmp ecx, dword [edx + 0x1c280]
    jne short loc_18361
    mov ecx, dword [eax + 0x220]
    cmp ecx, dword [edx + 0x1d080]
    jne short loc_18361
    mov dx, word [eax + 0x294]
    cmp dx, word [nosplit ebx*2 + 0x1ce80]
    je near loc_18494
loc_18361:
    mov edx, dword [eax + 0x214]
    mov dword [0xbcd50], edx
    mov edx, dword [eax + 0x238]
    mov dword [0xbcd54], edx
    mov edx, dword [eax + 0x24c]
    mov dword [0xbcd48], edx
    mov edx, dword [eax + 0x218]
    mov dword [0xbcd4c], edx
    mov edx, dword [eax + 0x23c]
    mov dword [0xbcd58], edx
    mov edx, dword [eax + 0x250]
    mov dword [0xbcd44], edx
    mov edx, dword [eax + 0x21c]
    mov dword [0xbccc4], edx
    mov edx, dword [eax + 0x240]
    mov dword [0xbcd3c], edx
    mov edx, dword [eax + 0x254]
    mov dword [0xbccc0], edx
    mov dx, word [eax + 0x294]
    mov word [0xbf552], dx
    mov dx, word [eax + 0x296]
    mov word [0xbf554], dx
    mov dx, word [eax + 0x29a]
    mov word [0xbf54e], dx
    mov dx, word [eax + 0x220]
    mov word [0xbf548], dx
    mov dx, word [eax + 0x224]
    mov word [0xbf54a], dx
    mov dx, word [eax + 0x2ce]
    mov word [0xbf54c], dx
    mov dx, word [eax + 0x228]
    mov word [0xbf556], dx
    mov dx, word [eax + 0x2dc]
    mov word [0xbf550], dx
    mov dl, byte [eax + 0x540]
    mov byte [0xc0040], dl
    mov dl, byte [eax + 0x542]
    mov byte [0xc0041], dl
    mov dl, byte [eax + 0x575]
    mov al, byte [eax + 0x57f]
    mov byte [0xc003e], al
    mov eax, dword [0xbd70c]
    mov byte [0xc003f], dl
    mov dword [0xbcd40], eax
loc_18476:
    mov edx, dword [LOCAL_PLAYER_BEFORE]
    sar edx, 0x10
    mov eax, dword [0xbcd40]
    cmp eax, dword [nosplit edx*4 + MOVE_FIFO_END]
    jge short loc_18494
    call predict_movement
    jmp short loc_18476
loc_18494:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

predict_movement:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x44
    mov edx, dword [0xbcd40]
    and edx, strict dword 0xff
    lea eax, [edx*4]
    mov ecx, 0x9beb0
    add eax, edx
    mov ebx, dword [LOCAL_PLAYER_BEFORE]
    shl eax, 5
    sar ebx, 0x10
    add ecx, eax
    lea eax, [ebx*4]
    add eax, ebx
    imul ebx, ebx, strict dword 0x623
    mov esi, 0x8be10
    add esi, ebx
    mov edx, dword [esi + 0x2f6]
    add eax, eax
    sar edx, 0x10
    add ecx, eax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov dx, word [nosplit eax*4 + 0x191374]
    mov dword [ebp - 0x24], edx
    and edx, strict dword 0xfffffefe
    mov word [nosplit eax*4 + 0x191374], dx
    mov eax, dword [ecx + 6]
    mov dword [ebp - 0x44], eax
    mov ax, word [0xbf54e]
    mov word [ebp - 0x28], ax
    mov edx, dword [ebp - 0x2a]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov di, word [nosplit eax*8 + 0x20a08a]
    mov edx, dword [esi + 0x2f6]
    xor ah, ah
    sar edx, 0x10
    mov byte [ebp - 0x18], ah
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov dl, byte [nosplit eax*4 + 0x19137d]
    mov dword [ebp - 0x2c], ecx
    cmp dl, 8
    setb al
    mov dh, byte [0xbf577]
    mov byte [ebp - 0x1c], al
    test dh, dh
    jne short loc_185bd
    mov edx, dword [ebp - 0x2a]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a080], 0x441
    je short loc_185a7
    mov ebx, dword [ebp - 0x28]
    test bx, bx
    jl short loc_185a7
    cmp bx, 0x400
    jl short loc_185bd
loc_185a7:
    mov eax, dword [0xbcd54]
    mov dword [0xbcd50], eax
    mov eax, dword [0xbcd58]
    mov dword [0xbcd4c], eax
    jmp short loc_185d1
loc_185bd:
    mov eax, dword [0xbcd50]
    mov dword [0xbcd54], eax
    mov eax, dword [0xbcd4c]
    mov dword [0xbcd58], eax
loc_185d1:
    mov ax, word [0xbf548]
    mov word [0xbf54a], ax
    mov ax, word [0xbf54c]
    mov word [0xbf556], ax
    mov eax, dword [0xbccc4]
    push dword 0x10001
    mov dword [0xbcd3c], eax
    mov ax, word [0xbf552]
    push dword 0xa3
    mov word [0xbf554], ax
    lea eax, [ebp - 0x58]
    push eax
    lea eax, [ebp - 0x4c]
    push eax
    lea eax, [ebp - 0x54]
    push eax
    lea eax, [ebp - 0x50]
    push eax
    mov eax, dword [ebp - 0x2a]
    sar eax, 0x10
    mov ebx, dword [0xbccc4]
    mov dword [ebp - 0x48], eax
    mov edx, dword [0xbcd4c]
    mov ecx, dword [ebp - 0x48]
    mov eax, dword [0xbcd50]
    call GET_Z_RANGE
    mov eax, dword [ebp - 0x48]
    mov ebx, dword [0xbcd4c]
    mov edx, dword [0xbcd50]
    call GET_FLOOR_Z_OF_SLOPE
    mov edx, dword [ebp - 0x58]
    and edx, strict dword 0xc000
    mov dword [ebp - 0x40], eax
    cmp edx, strict dword 0x4000
    jne short loc_18682
    cmp di, 1
    jne short loc_18682
    mov edx, dword [0xbccc4]
    sub edx, eax
    mov eax, edx
    test eax, eax
    jns short loc_18679
    neg eax
loc_18679:
    cmp eax, strict dword 0x3800
    jle short loc_18682
    xor edi, edi
loc_18682:
    cmp byte [esi + 0x55a], 0
    jne near loc_18781
    cmp byte [0xc0041], 0
    je near loc_18781
    cmp di, 2
    je near loc_18781
    mov eax, dword [ebp - 0x2a]
    sar eax, 0x10
    mov dword [ebp - 0x38], eax
    mov edx, eax
    shl eax, 2
    add eax, edx
    test byte [nosplit eax*8 + 0x20a076], 2
    je near loc_18781
    mov eax, dword [0xbf550]
    sar eax, 0x10
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    mov edx, dword [0xbcd50]
    sar eax, 5
    add edx, eax
    mov ax, word [0xbf552]
    and ah, 7
    cwde
    lea ebx, [ebp - 0x20]
    mov dword [ebp - 0x30], edx
    mov ecx, dword [nosplit eax*2 + 0x1bd566]
    mov edx, dword [0xbcd4c]
    sar ecx, 0x10
    mov eax, dword [ebp - 0x28]
    sar ecx, 5
    mov word [ebp - 0x20], ax
    add ecx, edx
    mov eax, dword [ebp - 0x30]
    mov edx, ecx
    call 0x4500f
    cmp word [ebp - 0x20], 0
    jl short loc_18781
    mov edx, dword [ebp - 0x30]
    mov eax, dword [ebp - 0x38]
    mov ebx, ecx
    call GET_FLOOR_Z_OF_SLOPE
    mov dword [ebp - 0x34], eax
    mov eax, dword [ebp - 0x40]
    sub eax, dword [ebp - 0x34]
    mov edx, dword [ebp - 0x20]
    mov dword [ebp - 0x3c], eax
    cmp dx, word [ebp - 0x28]
    je short loc_1876c
    mov eax, dword [ebp - 0x22]
    mov edx, dword [ebp - 0x30]
    mov ebx, ecx
    sar eax, 0x10
    mov ecx, dword [ebp - 0x34]
    call GET_FLOOR_Z_OF_SLOPE
    sub eax, ecx
    test eax, eax
    jns short loc_18765
    neg eax
loc_18765:
    cmp eax, strict dword 0x400
    jg short loc_18781
loc_1876c:
    mov edx, 0xa0
    mov eax, dword [ebp - 0x3c]
    imul edx
    shrd eax, edx, 0x10
    add word [0xbf54c], ax
loc_18781:
    mov ax, word [0xbf54c]
    test ax, ax
    jle short loc_1879e
    mov eax, dword [0xbf54a]
    sar eax, 0x10
    mov edx, eax
    sar edx, 3
    inc edx
    sub eax, edx
    jmp short loc_187b2
loc_1879e:
    jge short loc_187b8
    mov eax, dword [0xbf54a]
    sar eax, 0x10
    mov edx, eax
    neg edx
    sar edx, 3
    inc edx
    add eax, edx
loc_187b2:
    mov word [0xbf54c], ax
loc_187b8:
    mov eax, dword [ebp - 0x54]
    test eax, eax
    jl short loc_1881b
    and eax, strict dword 0xc000
    cmp eax, strict dword 0xc000
    jne short loc_1881b
    mov edx, dword [ebp - 0x54]
    and edx, strict dword 0xfff
    mov dword [ebp - 0x54], edx
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    cmp word [eax + 0x191382], 1
    jne short loc_1881b
    cmp word [eax + 0x191392], 0
    jl short loc_1881b
    mov eax, dword [ebp - 0x2a]
    xor ebx, ebx
    mov edx, dword [0xbcd50]
    mov dword [ebp - 0x54], ebx
    sar eax, 0x10
    mov ebx, dword [0xbcd4c]
    call 0x4dde9
    mov dword [ebp - 0x50], eax
loc_1881b:
    mov ecx, dword [ebp - 0x58]
    test ecx, ecx
    jl near loc_18939
    mov eax, ecx
    and eax, strict dword 0xc000
    cmp eax, strict dword 0xc000
    jne near loc_18939
    mov ebx, ecx
    and ebx, strict dword 0xfff
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov ax, word [nosplit eax*4 + 0x191374]
    xor ah, ah
    and al, 0x21
    cmp ax, strict word 0x21
    jne short loc_18867
    mov ch, 1
    xor edi, edi
    mov byte [ebp - 0x18], ch
loc_18867:
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    lea edx, [eax*4]
    mov eax, 0x191368
    add eax, edx
    call BADGUY
    test ax, ax
    je near loc_18939
    cmp byte [edx + 0x19137c], 0x18
    jbe near loc_18939
    mov ebx, dword [esi + 0x2f6]
    sar ebx, 0x10
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov eax, dword [nosplit eax*4 + 0x191370]
    sub eax, dword [edx + 0x191370]
    test eax, eax
    jns short loc_188c8
    neg eax
loc_188c8:
    cmp eax, strict dword 0x5400
    jge short loc_18939
    mov ecx, dword [0xbcd4c]
    mov ebx, dword [edx + 0x19136c]
    mov eax, dword [edx + 0x191368]
    mov edx, dword [0xbcd50]
    sub ebx, ecx
    sub eax, edx
    mov edx, ebx
    call GET_ANGLE
    lea edx, [eax + 0x200]
    mov ebx, dword [0xbcd48]
    and edx, strict dword 0x7ff
    and eax, strict dword 0x7ff
    mov ecx, dword [0xbcd44]
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    sar eax, 0x10
    shl edx, 4
    shl eax, 4
    sub ebx, edx
    sub ecx, eax
    mov dword [0xbcd48], ebx
    mov dword [0xbcd44], ecx
loc_18939:
    mov edx, dword [esi + 0x2f6]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    cmp word [nosplit eax*4 + 0x191392], 0
    jg near loc_18a1c
    cmp di, 2
    jne short loc_189c0
    cmp byte [esi + 0x53d], 0
    jne short loc_1898f
    mov ebx, dword [ebp - 0x4c]
    mov eax, dword [0xbccc4]
    sub eax, ebx
    test eax, eax
    jns short loc_1897e
    neg eax
loc_1897e:
    cmp eax, strict dword 0x1400
    jle short loc_1898f
    add dword [0xbccc4], strict dword 0x15c
loc_1898f:
    push dword 0x10001
    push dword 0x400
    push dword 0x400
    push dword 0xa4
    push byte 0
    mov ecx, 0xbf54e
    mov ebx, 0xbccc4
    push byte 0
    mov edx, 0xbcd4c
    mov eax, 0xbcd50
    call CLIP_MOVE
loc_189c0:
    mov ebx, 0xbf54e
    mov edx, dword [0xbcd4c]
    mov eax, dword [0xbcd50]
    call 0x4500f
    push dword 0x10001
    push dword 0x1400
    push dword 0x400
    mov ecx, 0xbf54e
    mov ebx, 0xbccc4
    push dword 0x80
    mov edx, 0xbcd4c
    mov eax, 0xbcd50
    call PUSH_MOVE
    mov ebx, 0x64
    xor ecx, ecx
    mov word [0xbf548], bx
    mov word [0xbf54c], cx
    jmp near loc_195bc
loc_18a1c:
    mov bx, word [esi + 0x2f6]
    mov ecx, 4
    test bx, bx
    jge near loc_19325
    cmp word [esi + 0x302], 0
    jge short loc_18a44
    add word [0xbf552], 0x80
loc_18a44:
    mov edx, 0x28
    cmp di, 2
    jne near loc_18bc3
    xor edx, edx
    mov bh, byte [ebp - 0x44]
    mov word [0xbf550], dx
    test bh, 1
    je short loc_18abd
    cmp dword [esi + 0x5ad], 0
    jne short loc_18a7d
    cmp dword [esi + 0x5d1], 0
    jne short loc_18a7d
    mov eax, 1
    jmp short loc_18a7f
loc_18a7d:
    xor eax, eax
loc_18a7f:
    test eax, eax
    je short loc_18abd
    cmp dword [0xbccc0], 0
    jle short loc_18a94
    xor ebx, ebx
    mov dword [0xbccc0], ebx
loc_18a94:
    mov eax, dword [0xbccc0]
    sub eax, strict dword 0x15c
    mov dword [0xbccc0], eax
    cmp eax, strict dword 0xfffffa00
    jge near loc_18b5a
    mov dword [0xbccc0], 0xfffffa00
    jmp near loc_18b5a
loc_18abd:
    test byte [ebp - 0x44], 2
    je short loc_18b18
    cmp dword [esi + 0x5ad], 0
    jne short loc_18adc
    cmp dword [esi + 0x5d1], 0
    jne short loc_18adc
    mov eax, 1
    jmp short loc_18ade
loc_18adc:
    xor eax, eax
loc_18ade:
    test eax, eax
    je short loc_18b18
    cmp dword [0xbccc0], 0
    jge short loc_18af2
    xor eax, eax
    mov dword [0xbccc0], eax
loc_18af2:
    mov edx, dword [0xbccc0]
    add edx, strict dword 0x15c
    mov dword [0xbccc0], edx
    cmp edx, strict dword 0x600
    jle short loc_18b5a
    mov dword [0xbccc0], 0x600
    jmp short loc_18b5a
loc_18b18:
    mov eax, dword [0xbccc0]
    test eax, eax
    jge short loc_18b38
    lea edx, [eax + 0x100]
    mov dword [0xbccc0], edx
    test edx, edx
    jle short loc_18b38
    xor eax, eax
    mov dword [0xbccc0], eax
loc_18b38:
    mov edx, dword [0xbccc0]
    test edx, edx
    jle short loc_18b5a
    lea ebx, [edx - 0x100]
    mov dword [0xbccc0], ebx
    test ebx, ebx
    jge short loc_18b5a
    xor edx, edx
    mov dword [0xbccc0], edx
loc_18b5a:
    mov eax, dword [0xbccc0]
    cmp eax, strict dword 0x800
    jle short loc_18b70
    mov edx, eax
    sar edx, 1
    mov dword [0xbccc0], edx
loc_18b70:
    mov eax, dword [0xbccc0]
    mov ebx, dword [0xbccc4]
    add ebx, eax
    mov eax, dword [ebp - 0x4c]
    sub eax, strict dword 0xf00
    mov dword [0xbccc4], ebx
    cmp eax, ebx
    jge short loc_18b9c
    sub eax, ebx
    sar eax, 1
    lea edx, [ebx + eax]
    mov dword [0xbccc4], edx
loc_18b9c:
    mov eax, dword [ebp - 0x50]
    mov ebx, dword [0xbccc4]
    add eax, strict dword 0x400
    cmp eax, ebx
    jle near loc_19090
    mov dword [0xbccc4], eax
    xor eax, eax
    mov dword [0xbccc0], eax
    jmp near loc_19090
loc_18bc3:
    cmp byte [esi + 0x552], 0
    je near loc_18ccb
    xor bl, bl
    xor eax, eax
    mov byte [0xc0041], bl
    mov word [0xbf550], ax
    xor bh, bh
    mov al, byte [esi + 0x552]
    mov byte [0xc003f], bh
    cmp al, 0xb
    jae short loc_18c0b
    xor eax, eax
    mov al, byte [esi + 0x552]
    mov edx, dword [0xbccc4]
    shl eax, 7
    sub edx, eax
    mov dword [0xbccc4], edx
loc_18c0b:
    cmp byte [ebp - 0x1c], 0
    je short loc_18c18
    mov eax, 0x200
    jmp short loc_18c1d
loc_18c18:
    mov eax, 0x800
loc_18c1d:
    test byte [ebp - 0x44], 1
    je short loc_18c48
    cmp dword [esi + 0x5ad], 0
    jne short loc_18c3c
    cmp dword [esi + 0x5d1], 0
    jne short loc_18c3c
    mov edx, 1
    jmp short loc_18c3e
loc_18c3c:
    xor edx, edx
loc_18c3e:
    test edx, edx
    je short loc_18c48
    sub dword [0xbccc4], eax
loc_18c48:
    test byte [ebp - 0x44], 2
    je short loc_18c73
    cmp dword [esi + 0x5ad], 0
    jne short loc_18c67
    cmp dword [esi + 0x5d1], 0
    jne short loc_18c67
    mov edx, 1
    jmp short loc_18c69
loc_18c67:
    xor edx, edx
loc_18c69:
    test edx, edx
    je short loc_18c73
    add dword [0xbccc4], eax
loc_18c73:
    cmp byte [ebp - 0x1c], 0
    jne short loc_18c8b
    test di, di
    je short loc_18c84
    cmp di, 2
    jne short loc_18c8b
loc_18c84:
    mov eax, 0x20
    jmp short loc_18c90
loc_18c8b:
    mov eax, 0x10
loc_18c90:
    mov edx, dword [ebp - 0x4c]
    shl eax, 8
    sub edx, eax
    mov ebx, dword [0xbccc4]
    mov eax, edx
    cmp edx, ebx
    jge short loc_18cb0
    sub eax, ebx
    sar eax, 1
    add ebx, eax
    mov dword [0xbccc4], ebx
loc_18cb0:
    mov eax, dword [ebp - 0x50]
    mov edx, dword [0xbccc4]
    add eax, strict dword 0x1200
    cmp eax, edx
    jle near loc_19090
    jmp near loc_1908b
loc_18ccb:
    cmp di, 2
    je near loc_19090
    cmp di, 1
    jne short loc_18cf6
    cmp byte [esi + 0x553], 0
    jne short loc_18cf6
    cmp byte [ebp - 0x1c], 0
    jne short loc_18cf1
    mov edx, 0x22
    jmp short loc_18cf6
loc_18cf1:
    mov edx, 0xc
loc_18cf6:
    mov eax, edx
    mov ebx, dword [ebp - 0x4c]
    shl eax, 8
    sub ebx, eax
    mov eax, ebx
    cmp eax, dword [0xbccc4]
    jle near loc_18ddc
    mov ebx, dword [ebp - 0x2a]
    sar ebx, 0x10
    mov eax, ebx
    call 0x23f74
    mov dword [ebp - 0x48], eax
    mov eax, ebx
    mov ebx, dword [ebp - 0x48]
    call 0x23f28
    or eax, ebx
    jne near loc_18ddc
    test byte [ebp - 0x44], 3
    jne near loc_18da3
    cmp dword [esi + 0x5ad], 0
    jne short loc_18d53
    cmp dword [esi + 0x5d1], 0
    jne short loc_18d53
    mov eax, 1
    jmp short loc_18d55
loc_18d53:
    xor eax, eax
loc_18d55:
    test eax, eax
    je short loc_18da3
    cmp byte [0xc0041], 0
    je short loc_18da3
    mov eax, dword [ebp - 0x2a]
    sar eax, 0x10
    mov dword [ebp - 0x48], eax
    mov ebx, dword [ebp - 0x48]
    shl eax, 2
    add eax, ebx
    test byte [nosplit eax*8 + 0x20a076], 2
    je short loc_18da3
    mov eax, edx
    mov edx, dword [ebp - 0x4c]
    shl eax, 8
    sub edx, eax
    mov ebx, dword [0xbccc4]
    mov eax, edx
    sub edx, strict dword 0x1000
    cmp edx, ebx
    jg short loc_18da3
    mov dword [0xbccc4], eax
    jmp near loc_18f63
loc_18da3:
    mov eax, dword [0xbf330]
    mov edx, dword [0xbccc0]
    add eax, 0x50
    xor bh, bh
    add edx, eax
    mov byte [0xc0041], bh
    mov dword [0xbccc0], edx
    cmp edx, strict dword 0x1800
    jl near loc_18f63
    mov dword [0xbccc0], 0x1800
    jmp near loc_18f63
loc_18ddc:
    cmp di, 1
    je short loc_18e05
    cmp di, 2
    je short loc_18e05
    cmp byte [0xc0041], 0
    jne short loc_18e05
    mov eax, dword [0xbccc0]
    cmp eax, strict dword 0xc00
    jle short loc_18e05
    sar eax, 0xa
    mov byte [0xc003f], al
loc_18e05:
    mov byte [0xc0041], 1
    cmp edx, 0x28
    jne short loc_18e59
    mov eax, dword [ebp - 0x4c]
    shl edx, 8
    sub eax, edx
    mov edx, eax
    sub edx, dword [0xbccc4]
    sar edx, 1
    mov eax, edx
    test eax, eax
    jns short loc_18e2b
    neg eax
loc_18e2b:
    cmp eax, strict dword 0x100
    jge short loc_18e34
    xor edx, edx
loc_18e34:
    mov ebx, dword [0xbccc4]
    mov eax, dword [0xbccc0]
    add ebx, edx
    sub eax, strict dword 0x300
    mov dword [0xbccc4], ebx
    mov dword [0xbccc0], eax
    test eax, eax
    jge short loc_18ea7
    xor ebx, ebx
    jmp short loc_18ea1
loc_18e59:
    cmp word [0xbf550], 0
    jne short loc_18ea7
    mov eax, dword [ebp - 0x4c]
    shl edx, 7
    sub eax, edx
    mov edx, dword [0xbccc4]
    sub eax, edx
    sar eax, 1
    lea ebx, [edx + eax]
    mov dl, byte [esi + 0x53d]
    mov dword [0xbccc4], ebx
    test dl, dl
    jne short loc_18ea7
    mov eax, dword [ebp - 0x4c]
    sub eax, strict dword 0x1000
    cmp eax, ebx
    jge short loc_18ea7
    mov ebx, dword [0xbccc0]
    sar ebx, 1
    mov dword [0xbccc4], eax
loc_18ea1:
    mov dword [0xbccc0], ebx
loc_18ea7:
    test byte [ebp - 0x44], 2
    je short loc_18ed6
    cmp dword [esi + 0x5ad], 0
    jne short loc_18ec6
    cmp dword [esi + 0x5d1], 0
    jne short loc_18ec6
    mov eax, 1
    jmp short loc_18ec8
loc_18ec6:
    xor eax, eax
loc_18ec8:
    test eax, eax
    je short loc_18ed6
    add dword [0xbccc4], strict dword 0xb00
loc_18ed6:
    test byte [ebp - 0x44], 1
    jne short loc_18f0e
    cmp dword [esi + 0x5ad], 0
    jne short loc_18ef5
    cmp dword [esi + 0x5d1], 0
    jne short loc_18ef5
    mov eax, 1
    jmp short loc_18ef7
loc_18ef5:
    xor eax, eax
loc_18ef7:
    test eax, eax
    je short loc_18f0e
    cmp byte [0xc0040], 1
    jne short loc_18f0e
    xor dh, dh
    mov byte [0xc0040], dh
    jmp short loc_18f63
loc_18f0e:
    test byte [ebp - 0x44], 1
    je short loc_18f63
    cmp dword [esi + 0x5ad], 0
    jne short loc_18f2d
    cmp dword [esi + 0x5d1], 0
    jne short loc_18f2d
    mov eax, 1
    jmp short loc_18f2f
loc_18f2d:
    xor eax, eax
loc_18f2f:
    test eax, eax
    je short loc_18f63
    cmp byte [0xc0040], 0
    jne short loc_18f63
    cmp word [0xbf550], 0
    jne short loc_18f63
    mov eax, dword [ebp - 0x4c]
    sub eax, dword [ebp - 0x50]
    cmp eax, strict dword 0x3800
    jle short loc_18f63
    mov word [0xbf550], 1
    mov byte [0xc0040], 1
loc_18f63:
    cmp word [0xbf550], 0
    je near loc_1903a
    test byte [ebp - 0x44], 1
    jne short loc_18fa7
    cmp dword [esi + 0x5ad], 0
    jne short loc_18f90
    cmp dword [esi + 0x5d1], 0
    jne short loc_18f90
    mov eax, 1
    jmp short loc_18f92
loc_18f90:
    xor eax, eax
loc_18f92:
    test eax, eax
    je short loc_18fa7
    cmp byte [0xc0040], 1
    jne short loc_18fa7
    xor dl, dl
    mov byte [0xc0040], dl
loc_18fa7:
    mov ax, word [0xbf550]
    cmp ax, strict word 0x500
    jge near loc_1902a
    cmp di, 1
    jne short loc_18fd9
    cmp ax, strict word 0x300
    jle short loc_18fd9
    xor edx, edx
    mov ebx, 0xfffffe00
    mov word [0xbf550], dx
    mov dword [0xbccc0], ebx
    jmp short loc_1903a
loc_18fd9:
    mov eax, dword [0xbf54e]
    sar eax, 0x10
    add eax, strict dword 0x780
    and eax, strict dword 0x7ff
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    mov ebx, 0xc
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov edx, dword [0xbccc0]
    sub edx, eax
    mov ax, word [0xbf550]
    mov dword [0xbccc0], edx
    xor dh, dh
    add eax, strict dword 0xb4
    mov byte [0xc0041], dh
    mov word [0xbf550], ax
    jmp short loc_1903a
loc_1902a:
    xor edx, edx
    xor eax, eax
    mov word [0xbf550], dx
    mov dword [0xbccc0], eax
loc_1903a:
    mov eax, dword [0xbccc0]
    mov edx, dword [0xbccc4]
    add edx, eax
    mov eax, dword [ebp - 0x50]
    add eax, strict dword 0x400
    mov dword [0xbccc4], edx
    cmp eax, edx
    jle short loc_19090
    xor ebx, ebx
    mov eax, dword [0xbccc0]
    mov word [0xbf550], bx
    test eax, eax
    jge short loc_19079
    xor edx, edx
    mov dword [0xbcd44], edx
    mov dword [0xbcd48], edx
loc_19079:
    mov dword [0xbccc0], 0x80
    mov eax, dword [ebp - 0x50]
    add eax, strict dword 0x400
loc_1908b:
    mov dword [0xbccc4], eax
loc_19090:
    cmp word [esi + 0x300], 0
    jne short loc_190de
    cmp word [esi + 0x530], 2
    jg short loc_190de
    cmp byte [0xc003f], 0
    jne short loc_190de
    cmp word [esi + 0x2e2], 0
    jg short loc_190de
    cmp word [esi + 0x2e0], 0
    jg short loc_190de
    cmp word [esi + 0x2c8], 8
    jne short loc_190ee
    mov dx, word [esi + 0x2ec]
    cmp dx, 1
    jle short loc_190ee
    cmp dx, 4
    jge short loc_190ee
loc_190de:
    xor ecx, ecx
    mov dword [0xbcd48], ecx
    mov dword [0xbcd44], ecx
    jmp short loc_19145
loc_190ee:
    mov eax, dword [ebp - 0x2c]
    mov dl, byte [eax]
    test dl, dl
    je short loc_19145
    movsx edx, dl
    add edx, edx
    cmp di, 2
    jne short loc_19129
    mov eax, edx
    sar eax, 3
    mov ebx, ecx
    sub edx, eax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul edx, eax
    mov eax, dword [0xbf550]
    sar eax, 0x10
    add eax, edx
    mov word [0xbf552], ax
    jmp short loc_1913e
loc_19129:
    mov ebx, ecx
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, edx
    add word [0xbf552], ax
loc_1913e:
    and byte [0xbf553], 7
loc_19145:
    cmp dword [0xbcd48], 0
    jne short loc_1916c
    cmp dword [0xbcd44], 0
    jne short loc_1916c
    mov eax, dword [ebp - 0x2c]
    cmp word [eax + 2], 0
    jne short loc_1916c
    cmp word [eax + 4], 0
    je near loc_19325
loc_1916c:
    mov bx, word [esi + 0x522]
    test bx, bx
    jle short loc_19181
    cmp bx, 0x190
    jge short loc_19181
    add ecx, ecx
loc_19181:
    mov eax, dword [ebp - 0x2c]
    mov eax, dword [eax]
    sar eax, 0x10
    imul eax, ecx
    mov ebx, dword [0xbcd48]
    shl eax, 6
    add ebx, eax
    mov eax, dword [ebp - 0x2c]
    mov eax, dword [eax + 2]
    sar eax, 0x10
    imul eax, ecx
    mov ecx, dword [0xbcd44]
    shl eax, 6
    mov dx, word [esi + 0x2c8]
    add ecx, eax
    mov dword [0xbcd48], ebx
    mov dword [0xbcd44], ecx
    test dx, dx
    jne short loc_191d9
    cmp word [esi + 0x2ec], 0xa
    jle short loc_191d9
    cmp byte [0xc0041], 0
    jne short loc_19207
loc_191d9:
    cmp byte [0xc0041], 0
    je short loc_19236
    test byte [ebp - 0x44], 2
    je short loc_19236
    cmp dword [esi + 0x5ad], 0
    jne short loc_19201
    cmp dword [esi + 0x5d1], 0
    jne short loc_19201
    mov eax, 1
    jmp short loc_19203
loc_19201:
    xor eax, eax
loc_19203:
    test eax, eax
    je short loc_19236
loc_19207:
    mov edx, dword [0x939c]
    mov eax, dword [0xbcd48]
    sub edx, strict dword 0x2000
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [0x939c]
    mov dword [0xbcd48], eax
    mov eax, dword [0xbcd44]
    sub edx, strict dword 0x2000
    jmp short loc_1928c
loc_19236:
    cmp di, 2
    jne short loc_1926b
    mov edx, dword [0x939c]
    mov eax, dword [0xbcd48]
    sub edx, strict dword 0x1400
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [0x939c]
    mov dword [0xbcd48], eax
    mov eax, dword [0xbcd44]
    sub edx, strict dword 0x1400
    jmp short loc_1928c
loc_1926b:
    mov edx, dword [0x939c]
    mov eax, dword [0xbcd48]
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [0x939c]
    mov dword [0xbcd48], eax
    mov eax, dword [0xbcd44]
loc_1928c:
    imul edx
    shrd eax, edx, 0x10
    mov dword [0xbcd44], eax
    mov eax, dword [0xbcd48]
    cdq
    xor eax, edx
    sub eax, edx
    cmp eax, strict dword 0x800
    jge short loc_192c7
    mov eax, dword [0xbcd44]
    cdq
    xor eax, edx
    sub eax, edx
    cmp eax, strict dword 0x800
    jge short loc_192c7
    xor ebx, ebx
    mov dword [0xbcd44], ebx
    mov dword [0xbcd48], ebx
loc_192c7:
    cmp byte [ebp - 0x1c], 0
    je short loc_19325
    mov eax, dword [0x939c]
    mov edx, dword [0x939c]
    sar eax, 1
    sub edx, eax
    mov eax, edx
    mov edx, dword [0x939c]
    sar edx, 2
    add edx, eax
    mov eax, dword [0xbcd48]
    imul edx
    shrd eax, edx, 0x10
    mov dword [0xbcd48], eax
    mov eax, dword [0x939c]
    mov edx, dword [0x939c]
    sar eax, 1
    sub edx, eax
    mov eax, edx
    mov edx, dword [0x939c]
    sar edx, 2
    add edx, eax
    mov eax, dword [0xbcd44]
    imul edx
    shrd eax, edx, 0x10
    mov dword [0xbcd44], eax
loc_19325:
    cmp di, 1
    je short loc_19331
    cmp byte [ebp - 0x18], 1
    jne short loc_19338
loc_19331:
    mov eax, 0x400
    jmp short loc_1933d
loc_19338:
    mov eax, 0x1400
loc_1933d:
    push dword 0x10001
    push eax
    push dword 0x400
    push dword 0xa4
    mov eax, dword [0xbcd44]
    mov ecx, 0xbf54e
    push eax
    mov edx, dword [0xbcd48]
    mov ebx, 0xbccc4
    push edx
    mov eax, 0xbcd50
    mov edx, 0xbcd4c
    call CLIP_MOVE
    push dword 0x10001
    push dword 0x400
    push dword 0x400
    mov ecx, 0xbf54e
    mov ebx, 0xbccc4
    push dword 0xa4
    mov edx, 0xbcd4c
    mov eax, 0xbcd50
    call PUSH_MOVE
    cmp byte [esi + 0x552], 0
    jne short loc_193c5
    cmp di, 1
    je short loc_193c5
    cmp di, 2
    je short loc_193c5
    cmp byte [ebp - 0x1c], 0
    je short loc_193c5
    add dword [0xbccc4], strict dword 0x1e00
loc_193c5:
    test byte [ebp - 0x42], 4
    jne short loc_193d4
    cmp byte [0xc003f], 0
    je short loc_193db
loc_193d4:
    mov byte [0xc003e], 9
loc_193db:
    mov cl, byte [ebp - 0x43]
    test cl, 0x20
    je short loc_19405
    mov byte [0xc003e], 9
    test byte [ebp - 0x44], 0x20
    je short loc_193f8
    add word [0xbf548], 6
loc_193f8:
    add word [0xbf548], 6
    jmp near loc_194a0
loc_19405:
    test cl, 0x40
    je short loc_19428
    mov byte [0xc003e], 9
    test byte [ebp - 0x44], 0x20
    je near loc_19498
    sub word [0xbf548], 6
    jmp near loc_19498
loc_19428:
    test byte [ebp - 0x44], 8
    je short loc_19465
    cmp dword [esi + 0x5ad], 0
    jne short loc_19447
    cmp dword [esi + 0x5d1], 0
    jne short loc_19447
    mov eax, 1
    jmp short loc_19449
loc_19447:
    xor eax, eax
loc_19449:
    test eax, eax
    je short loc_19465
    test byte [ebp - 0x44], 0x20
    je short loc_1945b
    add word [0xbf548], 6
loc_1945b:
    add word [0xbf548], 6
    jmp short loc_194a0
loc_19465:
    test byte [ebp - 0x44], 0x10
    je short loc_194a0
    cmp dword [esi + 0x5ad], 0
    jne short loc_19484
    cmp dword [esi + 0x5d1], 0
    jne short loc_19484
    mov eax, 1
    jmp short loc_19486
loc_19484:
    xor eax, eax
loc_19486:
    test eax, eax
    je short loc_194a0
    test byte [ebp - 0x44], 0x20
    je short loc_19498
    sub word [0xbf548], 6
loc_19498:
    sub word [0xbf548], 6
loc_194a0:
    cmp byte [0xc003e], 0
    jbe short loc_194e3
    mov ah, byte [ebp - 0x43]
    test ah, 0x20
    jne short loc_194e3
    test ah, 0x40
    jne short loc_194e3
    mov ecx, dword [0xbf546]
    sar ecx, 0x10
    mov ebx, 3
    mov edx, ecx
    mov eax, ecx
    sar edx, 0x1f
    idiv ebx
    dec byte [0xc003e]
    mov edx, 0x21
    sub edx, eax
    lea eax, [edx + ecx]
    mov word [0xbf548], ax
loc_194e3:
    cmp byte [esi + 0x55a], 0
    je short loc_19507
    mov edx, dword [ebp - 0x2c]
    mov eax, dword [0xbf546]
    movsx edx, byte [edx + 1]
    sar eax, 0x10
    sar edx, 1
    add eax, edx
    mov word [0xbf548], ax
    jmp short loc_19542
loc_19507:
    mov dx, word [0xbf548]
    cmp dx, 0x5f
    jle short loc_19523
    cmp dx, 0x69
    jge short loc_19523
    mov word [0xbf548], 0x64
loc_19523:
    mov eax, dword [0xbf54a]
    sar eax, 0x10
    cmp eax, -5
    jle short loc_19542
    cmp word [0xbf54c], 5
    jge short loc_19542
    xor eax, eax
    mov word [0xbf54c], ax
loc_19542:
    mov bh, byte [0xc003f]
    test bh, bh
    jbe short loc_1956d
    mov cl, bh
    xor eax, eax
    dec cl
    mov al, cl
    mov dx, word [0xbf548]
    shl eax, 4
    sub edx, eax
    mov byte [0xc003f], cl
    mov word [0xbf548], dx
loc_1956d:
    cmp word [0xbf548], 0x12b
    jle short loc_19583
    mov word [0xbf548], 0x12b
    jmp short loc_19599
loc_19583:
    mov eax, dword [0xbf546]
    sar eax, 0x10
    cmp eax, -0x63
    jge short loc_19599
    mov word [0xbf548], 0xff9d
loc_19599:
    cmp word [esi + 0x2e0], 0
    jle short loc_195bc
    mov dx, word [0xbf548]
    mov ch, 9
    sub edx, 0x30
    mov byte [0xc003e], ch
    mov word [0xbf548], dx
loc_195bc:
    mov edx, dword [0xbcd40]
    and edx, strict dword 0xff
    lea eax, [edx*4]
    mov ebx, dword [0xbcd50]
    mov dword [eax + 0x1c680], ebx
    mov ebx, dword [0xbcd4c]
    mov dword [eax + 0x1ca80], ebx
    mov ebx, dword [0xbccc4]
    mov dword [eax + 0x1c280], ebx
    lea ebx, [nosplit edx*2]
    mov dx, word [0xbf552]
    mov word [ebx + 0x1ce80], dx
    mov edx, dword [0xbf546]
    sar edx, 0x10
    mov dword [eax + 0x1d080], edx
    mov edx, dword [esi + 0x2f6]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    mov esi, dword [0xbcd40]
    shl eax, 2
    inc esi
    sub eax, edx
    mov edx, dword [ebp - 0x24]
    mov dword [0xbcd40], esi
    mov word [nosplit eax*4 + 0x191374], dx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
