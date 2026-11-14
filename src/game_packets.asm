bits 32
org 0x11f24

%define SEND_PACKET 0x300b0
%define GET_PACKET 0x30428
%define GAME_EXIT 0x14f28
%define READY_TO_SEND 0xc0049
%define TOTAL_CLOCK 0x216f7c
%define CONNECT_HEAD_BEFORE 0xcf656
%define LOCAL_PLAYER 0xcf65c
%define CONNECT_NEXT_BEFORE 0xcf53e
%define PACKET_BUFFER 0x8ba80
%define MOVE_FIFO_END 0x67438
%define PLAYER_QUIT_FLAG 0x6b3d0
%define OTHER_MIN_LAG 0xbcc9c
%define INPUT_FIFO 0x9beb0
%define SYNC_HEAD 0x1c040
%define SYNC_VALUES 0x1b040
%define PRINTF 0x5ac04
%define RESET_WEAPONS 0x2cfa4
%define RESET_INVENTORY 0x2d098
%define NEW_GAME 0x2db2c
%define ENTER_LEVEL 0x2ece8
%define MOVES_PER_PACKET 0x93a2
%define PLAYER_READY_FLAG 0x7f390
%define ESCAPE_KEY_STATE 0x21ebd1
%define RECEIVED_QUOTE 0xc00d0
%define PLAYER_NAME_BEFORE 0xbf576
%define SOURCE_NAME 0x860
%define VERSION_ERROR 0x868
%define PACKET_LENGTH_WARNING 0x89c
%define QUIT_MESSAGE 0x8cc

allow_time_to_correct_errors_when_quitting:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    xor ah, ah
    xor esi, esi
    mov byte [READY_TO_SEND], ah
    mov edi, 1
loc_11f3b:
    mov ecx, dword [TOTAL_CLOCK]
    add ecx, 4
    cmp ecx, dword [TOTAL_CLOCK]
    jle short loc_11f59
loc_11f4c:
    call get_packets
    cmp ecx, dword [TOTAL_CLOCK]
    jg short loc_11f4c
loc_11f59:
    cmp byte [ESCAPE_KEY_STATE], 0
    jne short restore_registers
    mov ecx, dword [CONNECT_HEAD_BEFORE]
    mov dh, 0x7f
    sar ecx, 0x10
    mov byte [PACKET_BUFFER], dh
    test ecx, ecx
    jl short loc_11f9f
loc_11f77:
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    cmp ecx, eax
    je short loc_11f91
    mov edx, PACKET_BUFFER
    mov ebx, edi
    mov eax, ecx
    call SEND_PACKET
loc_11f91:
    mov ecx, dword [nosplit ecx*2 + CONNECT_NEXT_BEFORE]
    sar ecx, 0x10
    test ecx, ecx
    jge short loc_11f77
loc_11f9f:
    inc esi
    cmp esi, 8
    jl short loc_11f3b
; Shared register restore used by the packet and timer routines.
restore_registers:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

get_packets:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x40
    cmp word [LOCAL_PLAYER], 2
    jl short restore_registers
receive_next_packet:
    mov edx, PACKET_BUFFER
    lea eax, [ebp - 0x1c]
    call GET_PACKET
    mov esi, eax
    mov word [ebp - 0x18], ax
    test ax, ax
    jle short restore_registers
    mov dl, byte [PACKET_BUFFER]
    cmp dl, 8
    jb short loc_12023
    jbe near receive_user_map
    cmp dl, 0x11
    jb short loc_1200f
    jbe near receive_peer_sync
    cmp dl, 0xfa
    jb short receive_next_packet
    jbe near receive_ready
    cmp dl, 0xff
    je near receive_quit
    jmp short receive_next_packet
loc_1200f:
    cmp dl, 9
    jbe near receive_weapon_choices
    cmp dl, 0x10
    je near reset_peer_sync
    jmp short receive_next_packet
loc_12023:
    cmp dl, 4
    jb short loc_1203f
    jbe near receive_quote
    cmp dl, 6
    jb near receive_new_game
    jbe near receive_player_name
    jmp short receive_next_packet
loc_1203f:
    test dl, dl
    jbe short receive_master_sync
    cmp dl, 1
    je near receive_slave_sync
    jmp near receive_next_packet
receive_master_sync:
    mov eax, dword [ebp - 0x1e]
    mov ecx, 1
    sar eax, 0x10
    mov dword [ebp - 0x34], ecx
    test byte [nosplit eax*4 + MOVE_FIFO_END], 0x1f
    jne short loc_120b6
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    mov edx, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar edx, 0x10
    test edx, edx
    jl short loc_120b6
loc_1207f:
    cmp byte [edx + PLAYER_QUIT_FLAG], 0
    je short loc_120a8
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    cmp edx, eax
    jne short loc_120a5
    mov eax, dword [ebp - 0x34]
    mov eax, dword [eax + 0x8ba7d]
    sar eax, 0x18
    mov dword [OTHER_MIN_LAG], eax
loc_120a5:
    inc dword [ebp - 0x34]
loc_120a8:
    mov edx, dword [nosplit edx*2 + CONNECT_NEXT_BEFORE]
    sar edx, 0x10
    test edx, edx
    jge short loc_1207f
loc_120b6:
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    mov edx, dword [nosplit eax*4 + MOVE_FIFO_END]
    and edx, strict dword 0xff
    imul edx, edx, strict dword 0xa0
    mov ebx, dword [nosplit eax*4 + MOVE_FIFO_END]
    dec ebx
    and ebx, strict dword 0xff
    imul ebx, ebx, strict dword 0xa0
    mov ecx, INPUT_FIFO
    add ecx, ebx
    mov ebx, INPUT_FIFO
    mov dword [ebp - 0x40], ecx
    add ebx, edx
    mov edx, dword [ebp - 0x34]
    mov dword [ebp - 0x48], ebx
    mov dword [ebp - 0x50], edx
    mov edx, eax
    test eax, eax
    jl short loc_12123
loc_12105:
    xor eax, eax
    mov esi, dword [ebp - 0x34]
    mov al, byte [edx + PLAYER_QUIT_FLAG]
    mov edx, dword [nosplit edx*2 + CONNECT_NEXT_BEFORE]
    add esi, eax
    sar edx, 0x10
    mov dword [ebp - 0x34], esi
    test edx, edx
    jge short loc_12105
loc_12123:
    mov edx, dword [CONNECT_HEAD_BEFORE]
    sar edx, 0x10
    test edx, edx
    jl near loc_12399
loc_12134:
    cmp byte [edx + PLAYER_QUIT_FLAG], 0
    je near loc_12387
    mov ebx, dword [ebp - 0x50]
    xor eax, eax
    mov al, byte [ebx + PACKET_BUFFER]
    mov dword [ebp - 0x3c], eax
    mov eax, dword [LOCAL_PLAYER]
    lea edi, [ebx + 1]
    sar eax, 0x10
    mov dword [ebp - 0x50], edi
    cmp edx, eax
    jne short loc_121c2
    mov eax, dword [ebp - 0x3c]
    and eax, 1
    lea ebx, [nosplit eax*2]
    mov eax, dword [ebp - 0x3c]
    and eax, 2
    add ebx, eax
    mov eax, dword [ebp - 0x3c]
    and eax, 4
    sar eax, 2
    add ebx, eax
    mov eax, dword [ebp - 0x3c]
    and eax, 8
    sar eax, 3
    add ebx, eax
    mov eax, dword [ebp - 0x3c]
    and eax, 0x10
    sar eax, 4
    add ebx, eax
    mov eax, dword [ebp - 0x3c]
    and eax, 0x20
    sar eax, 5
    add eax, ebx
    mov ebx, dword [ebp - 0x3c]
    and ebx, 0x40
    sar ebx, 6
    add ebx, eax
    mov eax, dword [ebp - 0x3c]
    and eax, strict dword 0x80
    sar eax, 7
    add eax, ebx
    add dword [ebp - 0x34], eax
    jmp near loc_12387
loc_121c2:
    imul eax, edx, 0xa
    mov ebx, dword [ebp - 0x48]
    mov esi, dword [ebp - 0x40]
    mov ecx, 0xa
    add ebx, eax
    add esi, eax
    mov edi, ebx
    mov dword [ebp - 0x54], ebx
    cmp ecx, 4
    jae short loc_121eb
    test cl, 1
    je short loc_121e4
    movsb
loc_121e4:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw with Watcom prefix order
    jmp short loc_12216
loc_121eb:
    test edi, 1
    je short loc_121f5
    movsb
    dec ecx
loc_121f5:
    test edi, 2
    je short loc_12202
    movsw
    sub ecx, 2
loc_12202:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_12210
    movsw
loc_12210:
    test bl, 1
    je short loc_12216
    movsb
loc_12216:
    test byte [ebp - 0x3c], 1
    je short loc_12246
    mov ebx, dword [ebp - 0x34]
    xor eax, eax
    mov al, byte [ebx + 0x8ba81]
    mov ecx, dword [ebp - 0x34]
    mov ebx, eax
    xor eax, eax
    shl ebx, 8
    mov al, byte [ecx + PACKET_BUFFER]
    add eax, ebx
    mov ebx, dword [ebp - 0x54]
    mov word [ebx + 2], ax
    lea eax, [ecx + 2]
    mov dword [ebp - 0x34], eax
loc_12246:
    test byte [ebp - 0x3c], 2
    je short loc_1227e
    mov ebx, dword [ebp - 0x34]
    xor eax, eax
    mov al, byte [ebx + 0x8ba81]
    mov ecx, dword [ebp - 0x34]
    mov ebx, eax
    xor eax, eax
    shl ebx, 8
    mov al, byte [ecx + PACKET_BUFFER]
    add ebx, eax
    imul eax, edx, 0xa
    mov esi, dword [ebp - 0x34]
    mov ecx, dword [ebp - 0x48]
    add esi, 2
    add eax, ecx
    mov dword [ebp - 0x34], esi
    mov word [eax + 4], bx
loc_1227e:
    test byte [ebp - 0x3c], 4
    je short loc_1229d
    imul eax, edx, 0xa
    mov ebx, dword [ebp - 0x34]
    mov ecx, dword [ebp - 0x48]
    lea edi, [ebx + 1]
    add ecx, eax
    mov al, byte [ebx + PACKET_BUFFER]
    mov dword [ebp - 0x34], edi
    mov byte [ecx], al
loc_1229d:
    test byte [ebp - 0x3c], 8
    je short loc_122c4
    imul eax, edx, 0xa
    add eax, dword [ebp - 0x48]
    mov esi, dword [ebp - 0x34]
    xor ebx, ebx
    mov ecx, dword [eax + 6]
    mov bl, byte [esi + PACKET_BUFFER]
    xor cl, cl
    or ebx, ecx
    lea ecx, [esi + 1]
    mov dword [eax + 6], ebx
    mov dword [ebp - 0x34], ecx
loc_122c4:
    test byte [ebp - 0x3c], 0x10
    je short loc_122ee
    imul eax, edx, 0xa
    add eax, dword [ebp - 0x48]
    mov esi, dword [ebp - 0x34]
    xor ecx, ecx
    mov ebx, dword [eax + 6]
    mov cl, byte [esi + PACKET_BUFFER]
    xor bh, bh
    shl ecx, 8
    lea edi, [esi + 1]
    or ebx, ecx
    mov dword [ebp - 0x34], edi
    mov dword [eax + 6], ebx
loc_122ee:
    test byte [ebp - 0x3c], 0x20
    je short loc_1231e
    imul eax, edx, 0xa
    mov ebx, dword [ebp - 0x48]
    mov esi, dword [ebp - 0x34]
    xor ecx, ecx
    add eax, ebx
    mov cl, byte [esi + PACKET_BUFFER]
    mov ebx, dword [eax + 6]
    shl ecx, 0x10
    and ebx, strict dword 0xff00ffff
    or ebx, ecx
    lea ecx, [esi + 1]
    mov dword [eax + 6], ebx
    mov dword [ebp - 0x34], ecx
loc_1231e:
    test byte [ebp - 0x3c], 0x40
    je short loc_1234c
    imul eax, edx, 0xa
    add eax, dword [ebp - 0x48]
    mov esi, dword [ebp - 0x34]
    xor ebx, ebx
    mov ecx, dword [eax + 6]
    mov bl, byte [esi + PACKET_BUFFER]
    and ecx, strict dword 0xffffff
    shl ebx, 0x18
    lea edi, [esi + 1]
    or ebx, ecx
    mov dword [ebp - 0x34], edi
    mov dword [eax + 6], ebx
loc_1234c:
    test byte [ebp - 0x3c], 0x80
    je short loc_1236c
    imul eax, edx, 0xa
    mov ebx, dword [ebp - 0x34]
    lea ecx, [ebx + 1]
    mov dword [ebp - 0x34], ecx
    mov ecx, dword [ebp - 0x48]
    add ecx, eax
    mov al, byte [ebx + PACKET_BUFFER]
    mov byte [ecx + 1], al
loc_1236c:
    imul eax, edx, 0xa
    add eax, dword [ebp - 0x48]
    test byte [eax + 9], 4
    je short loc_12380
    xor bh, bh
    mov byte [edx + PLAYER_QUIT_FLAG], bh
loc_12380:
    inc dword [nosplit edx*4 + MOVE_FIFO_END]
loc_12387:
    mov edx, dword [nosplit edx*2 + CONNECT_NEXT_BEFORE]
    sar edx, 0x10
    test edx, edx
    jge near loc_12134
loc_12399:
    mov eax, dword [ebp - 0x1a]
    mov ecx, dword [ebp - 0x34]
    sar eax, 0x10
    cmp eax, ecx
    je short loc_123fa
    mov edx, dword [CONNECT_HEAD_BEFORE]
    sar edx, 0x10
    test edx, edx
    jl short loc_123f5
loc_123b3:
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    cmp edx, eax
    je short loc_123e7
    mov ebx, dword [ebp - 0x34]
    mov eax, dword [nosplit edx*4 + SYNC_HEAD]
    mov edi, edx
    and eax, strict dword 0xff
    shl edi, 8
    mov bl, byte [ebx + PACKET_BUFFER]
    mov byte [edi + eax + SYNC_VALUES], bl
    inc dword [nosplit edx*4 + SYNC_HEAD]
loc_123e7:
    mov edx, dword [nosplit edx*2 + CONNECT_NEXT_BEFORE]
    sar edx, 0x10
    test edx, edx
    jge short loc_123b3
loc_123f5:
    inc dword [ebp - 0x34]
    jmp short loc_12399
loc_123fa:
    mov edx, dword [CONNECT_HEAD_BEFORE]
    sar edx, 0x10
    test edx, edx
    jl near loc_124cf
loc_1240b:
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    cmp edx, eax
    je near loc_124bd
    lea eax, [edx*4]
    mov dword [ebp - 0x28], eax
    imul eax, edx, 0xa
    mov dword [ebp - 0x44], eax
    mov eax, dword [ebp - 0x48]
    mov ecx, dword [ebp - 0x44]
    mov ebx, 1
    add eax, ecx
    mov dword [ebp - 0x24], ebx
    mov dword [ebp - 0x30], eax
    jmp short loc_124af
loc_12440:
    mov eax, dword [ebp - 0x28]
    mov eax, dword [eax + MOVE_FIFO_END]
    and eax, strict dword 0xff
    imul eax, eax, strict dword 0xa0
    mov edi, dword [ebp - 0x44]
    mov ecx, 0xa
    add eax, strict dword strict dword INPUT_FIFO
    mov esi, dword [ebp - 0x30]
    add edi, eax
    cmp ecx, 4
    jae short loc_12478
    test cl, 1
    je short loc_12471
    movsb
loc_12471:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw with Watcom prefix order
    jmp short loc_124a3
loc_12478:
    test edi, 1
    je short loc_12482
    movsb
    dec ecx
loc_12482:
    test edi, 2
    je short loc_1248f
    movsw
    sub ecx, 2
loc_1248f:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_1249d
    movsw
loc_1249d:
    test bl, 1
    je short loc_124a3
    movsb
loc_124a3:
    mov eax, dword [ebp - 0x28]
    inc dword [eax + MOVE_FIFO_END]
    inc dword [ebp - 0x24]
loc_124af:
    xor eax, eax
    mov esi, dword [ebp - 0x24]
    mov al, byte [MOVES_PER_PACKET]
    cmp eax, esi
    jg short loc_12440
loc_124bd:
    mov edx, dword [nosplit edx*2 + CONNECT_NEXT_BEFORE]
    sar edx, 0x10
    test edx, edx
    jge near loc_1240b
loc_124cf:
    xor eax, eax
    mov edx, dword [0xbf390]
    mov al, byte [MOVES_PER_PACKET]
    add edx, eax
    mov dword [0xbf390], edx
    jmp near receive_next_packet
receive_slave_sync:
    xor eax, eax
    mov esi, dword [ebp - 0x1e]
    mov al, byte [0x8ba81]
    sar esi, 0x10
    mov dword [ebp - 0x4c], eax
    mov ebx, dword [nosplit esi*4 + MOVE_FIFO_END]
    mov eax, dword [nosplit esi*4 + MOVE_FIFO_END]
    imul esi, esi, 0xa
    dec ebx
    and ebx, strict dword 0xff
    imul ebx, ebx, strict dword 0xa0
    and eax, strict dword 0xff
    imul eax, eax, strict dword 0xa0
    mov ecx, INPUT_FIFO
    add ecx, eax
    mov dword [ebp - 0x38], ecx
    lea edi, [ecx + esi]
    add ebx, strict dword INPUT_FIFO
    mov ecx, 0xa
    add esi, ebx
    cmp ecx, 4
    jae short loc_1254e
    test cl, 1
    je short loc_12547
    movsb
loc_12547:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw with Watcom prefix order
    jmp short loc_12579
loc_1254e:
    test edi, 1
    je short loc_12558
    movsb
    dec ecx
loc_12558:
    test edi, 2
    je short loc_12565
    movsw
    sub ecx, 2
loc_12565:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_12573
    movsw
loc_12573:
    test bl, 1
    je short loc_12579
    movsb
loc_12579:
    mov bl, byte [ebp - 0x4c]
    mov edx, 2
    test bl, 1
    je short loc_125af
    xor eax, eax
    xor edx, edx
    mov al, byte [0x8ba83]
    mov dl, byte [0x8ba82]
    shl eax, 8
    add edx, eax
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0xa
    add eax, dword [ebp - 0x38]
    mov word [eax + 2], dx
    mov edx, 4
loc_125af:
    test byte [ebp - 0x4c], 2
    je short loc_125dd
    xor eax, eax
    xor ebx, ebx
    mov al, byte [edx + 0x8ba81]
    mov bl, byte [edx + PACKET_BUFFER]
    shl eax, 8
    add ebx, eax
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0xa
    add eax, dword [ebp - 0x38]
    add edx, 2
    mov word [eax + 4], bx
loc_125dd:
    test byte [ebp - 0x4c], 4
    je short loc_125fc
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0xa
    mov ecx, dword [ebp - 0x38]
    mov ebx, edx
    add ecx, eax
    mov al, byte [ebx + PACKET_BUFFER]
    inc edx
    mov byte [ecx], al
loc_125fc:
    test byte [ebp - 0x4c], 8
    je short loc_12621
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0xa
    add eax, dword [ebp - 0x38]
    xor ecx, ecx
    mov ebx, dword [eax + 6]
    mov cl, byte [edx + PACKET_BUFFER]
    xor bl, bl
    or ebx, ecx
    inc edx
    mov dword [eax + 6], ebx
loc_12621:
    test byte [ebp - 0x4c], 0x10
    je short loc_1264b
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0xa
    mov ecx, dword [ebp - 0x38]
    xor ebx, ebx
    add eax, ecx
    mov bl, byte [edx + PACKET_BUFFER]
    mov ecx, dword [eax + 6]
    shl ebx, 8
    xor ch, ch
    or ebx, ecx
    inc edx
    mov dword [eax + 6], ebx
loc_1264b:
    test byte [ebp - 0x4c], 0x20
    je short loc_12679
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0xa
    mov esi, dword [ebp - 0x38]
    xor ebx, ebx
    add eax, esi
    mov bl, byte [edx + PACKET_BUFFER]
    mov ecx, dword [eax + 6]
    shl ebx, 0x10
    and ecx, strict dword 0xff00ffff
    or ebx, ecx
    inc edx
    mov dword [eax + 6], ebx
loc_12679:
    test byte [ebp - 0x4c], 0x40
    je short loc_126a7
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0xa
    mov edi, dword [ebp - 0x38]
    xor ebx, ebx
    add eax, edi
    mov bl, byte [edx + PACKET_BUFFER]
    mov ecx, dword [eax + 6]
    shl ebx, 0x18
    and ecx, strict dword 0xffffff
    or ebx, ecx
    inc edx
    mov dword [eax + 6], ebx
loc_126a7:
    test byte [ebp - 0x4c], 0x80
    je short loc_126c7
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0xa
    mov ecx, dword [ebp - 0x38]
    mov ebx, edx
    add ecx, eax
    mov al, byte [ebx + PACKET_BUFFER]
    inc edx
    mov byte [ecx + 1], al
loc_126c7:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    inc dword [nosplit eax*4 + MOVE_FIFO_END]
loc_126d4:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    cmp edx, eax
    je short loc_1271a
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    lea esi, [nosplit eax*4]
    mov edi, dword [esi + SYNC_HEAD]
    shl eax, 8
    and edi, strict dword 0xff
    mov ebx, edx
    add edi, eax
    mov al, byte [ebx + PACKET_BUFFER]
    mov byte [edi + SYNC_VALUES], al
    mov edi, dword [esi + SYNC_HEAD]
    inc edi
    inc edx
    mov dword [esi + SYNC_HEAD], edi
    jmp short loc_126d4
loc_1271a:
    mov edx, 1
    xor eax, eax
    mov al, byte [MOVES_PER_PACKET]
    cmp edx, eax
    jge near receive_next_packet
loc_1272e:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    mov edi, dword [nosplit eax*4 + MOVE_FIFO_END]
    imul eax, eax, 0xa
    and edi, strict dword 0xff
    imul edi, edi, strict dword 0xa0
    mov esi, dword [ebp - 0x38]
    mov ecx, 0xa
    add edi, strict dword INPUT_FIFO
    add esi, eax
    add edi, eax
    cmp ecx, 4
    jae short loc_1276e
    test cl, 1
    je short loc_12767
    movsb
loc_12767:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw with Watcom prefix order
    jmp short loc_12799
loc_1276e:
    test edi, 1
    je short loc_12778
    movsb
    dec ecx
loc_12778:
    test edi, 2
    je short loc_12785
    movsw
    sub ecx, 2
loc_12785:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_12793
    movsw
loc_12793:
    test bl, 1
    je short loc_12799
    movsb
loc_12799:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    mov ebx, dword [nosplit eax*4 + MOVE_FIFO_END]
    inc ebx
    inc edx
    mov dword [nosplit eax*4 + MOVE_FIFO_END], ebx
    xor eax, eax
    mov al, byte [MOVES_PER_PACKET]
    cmp edx, eax
    jge near receive_next_packet
    jmp near loc_1272e
receive_quote:
    push dword 0x1d0
    mov ecx, SOURCE_NAME
    mov ebx, 0x50
    mov edx, 0x8ba81
    mov eax, RECEIVED_QUOTE
    call 0x5a6fa
    movsx eax, si
    xor ch, ch
    mov byte [eax + 0xc00cf], ch
    mov ecx, RECEIVED_QUOTE
    mov al, 1
    mov dword [0xbd9b0], ecx
    mov byte [0xc003b], al
    mov ecx, 0xa0
    mov byte [0xc003a], al
    mov word [0xbf564], cx
    jmp near receive_next_packet
receive_new_game:
    xor eax, eax
    mov al, byte [0x8ba81]
    mov dword [0xbffeb], eax
    mov dword [0xbffdb], eax
    xor eax, eax
    mov al, byte [0x8ba82]
    mov dword [0xbffef], eax
    mov dword [0xbffdf], eax
    xor eax, eax
    mov al, byte [0x8ba83]
    mov dword [0xbffe7], eax
    mov dword [0xbffd7], eax
    xor eax, eax
    mov al, byte [0x8ba84]
    mov dword [0xbffaf], eax
    mov dword [0xbffc7], eax
    xor eax, eax
    mov al, byte [0x8ba85]
    mov dword [0xbff9f], eax
    mov dword [0xbffbb], eax
    xor eax, eax
    mov al, byte [0x8ba86]
    mov dword [0xbffa3], eax
    mov dword [0xbffb7], eax
    xor eax, eax
    mov al, byte [0x8ba87]
    mov dword [0xbffa7], eax
    mov dword [0xbffbf], eax
    xor eax, eax
    mov al, byte [0x8ba88]
    mov dword [0xbfb47], eax
    xor eax, eax
    mov al, byte [0x8ba89]
    mov dword [0xbfff7], eax
    mov dword [0xbfff3], eax
    xor eax, eax
    mov edx, dword [CONNECT_HEAD_BEFORE]
    mov al, byte [0x8ba8a]
    sar edx, 0x10
    mov dword [0xbffd3], eax
    mov dword [0xbffcf], eax
    test edx, edx
    jl short loc_128e5
loc_128c6:
    movsx esi, dx
    mov eax, esi
    call RESET_WEAPONS
    mov eax, esi
    call RESET_INVENTORY
    mov edx, dword [nosplit edx*2 + CONNECT_NEXT_BEFORE]
    sar edx, 0x10
    test edx, edx
    jge short loc_128c6
loc_128e5:
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    mov bl, byte [0xbffe7]
    mov dl, byte [0xbffeb]
    mov al, byte [0xbffef]
    call NEW_GAME
    mov eax, dword [0xbfb47]
    mov dword [0xbfb4b], eax
    mov eax, 4
    call ENTER_LEVEL
    jmp near receive_next_packet
receive_player_name:
    cmp byte [0x8ba81], 0x6c
    je short loc_1292d
    mov eax, VERSION_ERROR
    call GAME_EXIT
loc_1292d:
    mov cl, byte [0x8ba82]
    mov edx, 2
    test cl, cl
    je short loc_1295f
loc_1293c:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    shl eax, 5
    lea esi, [eax + edx]
    mov ch, byte [edx + 0x8ba81]
    mov al, byte [edx + PACKET_BUFFER]
    inc edx
    mov byte [esi + PLAYER_NAME_BEFORE], al
    test ch, ch
    jne short loc_1293c
loc_1295f:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    shl eax, 5
    xor bl, bl
    mov byte [edx + eax + PLAYER_NAME_BEFORE], bl
    jmp near receive_next_packet
receive_weapon_choices:
    mov edx, 1
    mov eax, 4
    mov esi, dword [ebp - 0x1a]
    sar esi, 0x10
    cmp edx, esi
    jge near receive_next_packet
loc_1298e:
    mov edi, dword [ebp - 0x1e]
    sar edi, 0x10
    imul edi, edi, 0x44
    add eax, 4
    movzx esi, byte [edx + PACKET_BUFFER]
    inc edx
    mov dword [edi + eax + 0xbfb53], esi
    mov esi, dword [ebp - 0x1a]
    sar esi, 0x10
    cmp edx, esi
    jge near receive_next_packet
    jmp short loc_1298e
receive_user_map:
    xor eax, eax
    mov al, byte [0x8ba81]
    mov dword [0xbffeb], eax
    mov dword [0xbffdb], eax
    xor eax, eax
    mov al, byte [0x8ba82]
    mov dword [0xbffef], eax
    mov dword [0xbffdf], eax
    xor eax, eax
    mov al, byte [0x8ba83]
    mov dword [0xbffe7], eax
    mov dword [0xbffd7], eax
    xor eax, eax
    mov al, byte [0x8ba84]
    mov dword [0xbffaf], eax
    mov dword [0xbffc7], eax
    xor eax, eax
    mov al, byte [0x8ba85]
    mov dword [0xbff9f], eax
    mov dword [0xbffbb], eax
    xor eax, eax
    mov al, byte [0x8ba86]
    mov dword [0xbffa3], eax
    mov dword [0xbffb7], eax
    xor eax, eax
    mov al, byte [0x8ba87]
    mov dword [0xbffa7], eax
    mov dword [0xbffbf], eax
    xor eax, eax
    mov al, byte [0x8ba88]
    mov dword [0xbfb4b], eax
    mov dword [0xbfb47], eax
    xor eax, eax
    mov edi, 0x95b8
    mov al, byte [0x8ba89]
    movsx edx, si
    mov dword [0xbfff7], eax
    mov dword [0xbfff3], eax
    xor eax, eax
    mov esi, 0x8ba8a
    mov al, byte [0x8ba8a]
    lea ecx, [edx - 0xb]
    mov dword [0xbffd3], eax
    mov dword [0xbffcf], eax
    cmp ecx, 4
    jae short loc_12a85
    test cl, 1
    je short loc_12a7e
    movsb
loc_12a7e:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw with Watcom prefix order
    jmp short loc_12ab0
loc_12a85:
    test edi, 1
    je short loc_12a8f
    movsb
    dec ecx
loc_12a8f:
    test edi, 2
    je short loc_12a9c
    movsw
    sub ecx, 2
loc_12a9c:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_12aaa
    movsw
loc_12aaa:
    test bl, 1
    je short loc_12ab0
    movsb
loc_12ab0:
    xor bl, bl
    mov byte [edx + 0x95ad], bl
    mov edx, dword [CONNECT_HEAD_BEFORE]
    sar edx, 0x10
    test edx, edx
    jl short loc_12ae4
loc_12ac5:
    movsx esi, dx
    mov eax, esi
    call RESET_WEAPONS
    mov eax, esi
    call RESET_INVENTORY
    mov edx, dword [nosplit edx*2 + CONNECT_NEXT_BEFORE]
    sar edx, 0x10
    test edx, edx
    jge short loc_12ac5
loc_12ae4:
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    mov bl, byte [0xbffe7]
    mov dl, byte [0xbffeb]
    mov al, byte [0xbffef]
    call NEW_GAME
    mov eax, 4
    call ENTER_LEVEL
    jmp near receive_next_packet
reset_peer_sync:
    xor edx, edx
    mov eax, dword [ebp - 0x1e]
    mov dword [0xbcd40], edx
    mov dword [0xbf390], edx
    mov dword [0xbd70c], edx
    sar eax, 0x10
    mov dword [0xbccbc], edx
    mov dword [nosplit eax*4 + MOVE_FIFO_END], edx
    mov dword [nosplit eax*4 + SYNC_HEAD], edx
receive_peer_sync:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    mov ebx, 1
    mov dh, byte [nosplit eax*4 + MOVE_FIFO_END]
    mov dword [ebp - 0x20], ebx
    test dh, 0x1f
    jne short loc_12bab
    mov eax, dword [ebp - 0x1c]
    cmp ax, word [0xcf658]
    jne short loc_12bab
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    mov edx, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar edx, 0x10
    test edx, edx
    jl short loc_12bab
loc_12b79:
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    cmp edx, eax
    jne short loc_12b96
    mov eax, dword [ebp - 0x20]
    mov eax, dword [eax + 0x8ba7d]
    sar eax, 0x18
    mov dword [OTHER_MIN_LAG], eax
loc_12b96:
    mov esi, dword [ebp - 0x20]
    mov edx, dword [nosplit edx*2 + CONNECT_NEXT_BEFORE]
    inc esi
    sar edx, 0x10
    mov dword [ebp - 0x20], esi
    test edx, edx
    jge short loc_12b79
loc_12bab:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    mov ebx, dword [nosplit eax*4 + MOVE_FIFO_END]
    mov edx, dword [nosplit eax*4 + MOVE_FIFO_END]
    imul eax, eax, 0xa
    and edx, strict dword 0xff
    imul edx, edx, strict dword 0xa0
    dec ebx
    and ebx, strict dword 0xff
    imul ebx, ebx, strict dword 0xa0
    mov ecx, INPUT_FIFO
    add ecx, edx
    add ebx, strict dword INPUT_FIFO
    mov dword [ebp - 0x2c], ecx
    lea edi, [ecx + eax]
    lea esi, [ebx + eax]
    mov ecx, 0xa
    mov edx, dword [ebp - 0x20]
    cmp ecx, 4
    jae short loc_12c0b
    test cl, 1
    je short loc_12c04
    movsb
loc_12c04:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw with Watcom prefix order
    jmp short loc_12c36
loc_12c0b:
    test edi, 1
    je short loc_12c15
    movsb
    dec ecx
loc_12c15:
    test edi, 2
    je short loc_12c22
    movsw
    sub ecx, 2
loc_12c22:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_12c30
    movsw
loc_12c30:
    test bl, 1
    je short loc_12c36
    movsb
loc_12c36:
    xor eax, eax
    lea edi, [edx + 1]
    mov al, byte [edx + PACKET_BUFFER]
    mov dword [ebp - 0x20], edi
    test al, 1
    je short loc_12c77
    xor edx, edx
    mov ebx, edi
    mov dl, byte [edi + 0x8ba81]
    xor ebx, edi
    shl edx, 8
    mov bl, byte [edi + PACKET_BUFFER]
    add ebx, edx
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, 0xa
    mov ecx, dword [ebp - 0x2c]
    lea esi, [edi + 2]
    add edx, ecx
    mov dword [ebp - 0x20], esi
    mov word [edx + 2], bx
loc_12c77:
    test al, 2
    je short loc_12cac
    mov ebx, dword [ebp - 0x20]
    xor edx, edx
    mov ecx, dword [ebp - 0x20]
    mov dl, byte [ebx + 0x8ba81]
    xor ebx, ebx
    shl edx, 8
    mov bl, byte [ecx + PACKET_BUFFER]
    add ebx, edx
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, 0xa
    add edx, dword [ebp - 0x2c]
    mov word [edx + 4], bx
    lea edx, [ecx + 2]
    mov dword [ebp - 0x20], edx
loc_12cac:
    test al, 4
    je short loc_12ccf
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, 0xa
    mov ebx, dword [ebp - 0x20]
    lea ecx, [ebx + 1]
    mov dword [ebp - 0x20], ecx
    mov ecx, dword [ebp - 0x2c]
    add ecx, edx
    mov dl, byte [ebx + PACKET_BUFFER]
    mov byte [ecx], dl
loc_12ccf:
    test al, 8
    je short loc_12cfa
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, 0xa
    add edx, dword [ebp - 0x2c]
    mov esi, dword [ebp - 0x20]
    xor ebx, ebx
    mov ecx, dword [edx + 6]
    mov bl, byte [esi + PACKET_BUFFER]
    xor cl, cl
    lea edi, [esi + 1]
    or ebx, ecx
    mov dword [ebp - 0x20], edi
    mov dword [edx + 6], ebx
loc_12cfa:
    test al, 0x10
    je short loc_12d28
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, 0xa
    add edx, dword [ebp - 0x2c]
    mov esi, dword [ebp - 0x20]
    xor ebx, ebx
    mov ecx, dword [edx + 6]
    mov bl, byte [esi + PACKET_BUFFER]
    xor ch, ch
    shl ebx, 8
    or ebx, ecx
    lea ecx, [esi + 1]
    mov dword [edx + 6], ebx
    mov dword [ebp - 0x20], ecx
loc_12d28:
    test al, 0x20
    je short loc_12d5a
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, 0xa
    add edx, dword [ebp - 0x2c]
    mov esi, dword [ebp - 0x20]
    xor ebx, ebx
    mov ecx, dword [edx + 6]
    mov bl, byte [esi + PACKET_BUFFER]
    and ecx, strict dword 0xff00ffff
    shl ebx, 0x10
    lea edi, [esi + 1]
    or ebx, ecx
    mov dword [ebp - 0x20], edi
    mov dword [edx + 6], ebx
loc_12d5a:
    test al, 0x40
    je short loc_12d8e
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, 0xa
    mov ebx, dword [ebp - 0x2c]
    mov esi, dword [ebp - 0x20]
    xor ecx, ecx
    add edx, ebx
    mov cl, byte [esi + PACKET_BUFFER]
    mov ebx, dword [edx + 6]
    shl ecx, 0x18
    and ebx, strict dword 0xffffff
    or ebx, ecx
    lea ecx, [esi + 1]
    mov dword [edx + 6], ebx
    mov dword [ebp - 0x20], ecx
loc_12d8e:
    test al, 0x80
    je short loc_12db2
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, 0xa
    mov eax, dword [ebp - 0x20]
    mov edi, dword [ebp - 0x2c]
    lea esi, [eax + 1]
    add edx, edi
    mov al, byte [eax + PACKET_BUFFER]
    mov dword [ebp - 0x20], esi
    mov byte [edx + 1], al
loc_12db2:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    mov edx, 1
    add dword [nosplit eax*4 + MOVE_FIFO_END], edx
    jmp near loc_12e4b
loc_12dc9:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    mov esi, dword [nosplit eax*4 + MOVE_FIFO_END]
    imul eax, eax, 0xa
    and esi, strict dword 0xff
    imul esi, esi, strict dword 0xa0
    mov edi, INPUT_FIFO
    mov ecx, 0xa
    add edi, esi
    mov esi, dword [ebp - 0x2c]
    add edi, eax
    add esi, eax
    cmp ecx, 4
    jae short loc_12e0a
    test cl, 1
    je short loc_12e03
    movsb
loc_12e03:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw with Watcom prefix order
    jmp short loc_12e35
loc_12e0a:
    test edi, 1
    je short loc_12e14
    movsb
    dec ecx
loc_12e14:
    test edi, 2
    je short loc_12e21
    movsw
    sub ecx, 2
loc_12e21:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_12e2f
    movsw
loc_12e2f:
    test bl, 1
    je short loc_12e35
    movsb
loc_12e35:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    mov esi, dword [nosplit eax*4 + MOVE_FIFO_END]
    inc esi
    inc edx
    mov dword [nosplit eax*4 + MOVE_FIFO_END], esi
loc_12e4b:
    xor eax, eax
    mov al, byte [MOVES_PER_PACKET]
    cmp edx, eax
    jl near loc_12dc9
    mov esi, dword [ebp - 0x1a]
    mov ecx, dword [ebp - 0x20]
    sar esi, 0x10
    cmp esi, ecx
    jge short loc_12e89
    push dword SOURCE_NAME
    push dword 0x243
    call 0x5ab32
    mov eax, dword [ebp - 0x20]
    sub eax, esi
    push eax
    push dword PACKET_LENGTH_WARNING
    call PRINTF
    add esp, 8
loc_12e89:
    mov eax, dword [ebp - 0x1a]
    mov edi, dword [ebp - 0x20]
    sar eax, 0x10
    cmp eax, edi
    je near receive_next_packet
    mov eax, dword [ebp - 0x1e]
    mov esi, edi
    sar eax, 0x10
    mov ebx, esi
    lea edx, [nosplit eax*4]
    inc ebx
    shl eax, 8
    mov dword [ebp - 0x20], ebx
    mov edi, dword [edx + SYNC_HEAD]
    mov ecx, dword [edx + SYNC_HEAD]
    and edi, strict dword 0xff
    inc ecx
    add edi, eax
    mov al, byte [esi + PACKET_BUFFER]
    mov dword [edx + SYNC_HEAD], ecx
    mov byte [edi + SYNC_VALUES], al
    jmp short loc_12e89
receive_ready:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    inc byte [eax + PLAYER_READY_FLAG]
    jmp near receive_next_packet
receive_quit:
    mov eax, QUIT_MESSAGE
    call GAME_EXIT
    jmp near receive_next_packet
    nop
