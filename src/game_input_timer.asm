bits 32
org 0x12efc

%define SEND_PACKET 0x300b0
%define GET_PACKETS 0x11fb0
%define GET_OUTPUT_QUEUE_SIZE 0x3009c
%define COMPUTER_GET_INPUT 0x2b430
%define LAST_INPUT_CLOCK 0xbd6f8
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
%define RESTORE_PACKET_REGISTERS 0x11fa5
%define GET_INPUT 0x29a14
%define GET_MOTORCYCLE_INPUT 0x2a0bc
%define GET_BOAT_INPUT 0x2a0c4
%define ON_MOTORCYCLE 0x8c3bd
%define ON_BOAT 0x8c3e1
%define ACCUM_FORWARD 0xbd71c
%define ACCUM_STRAFE 0xbd718
%define ACCUM_TURN 0xbd720
%define ACCUM_PITCH 0xbd724
%define ACCUM_BUTTONS 0xbd710
%define MOVES_PER_PACKET 0x93a2
%define PLAYER_AI 0xbff9b
%define PLAYER_MIN_LAG 0x19000
%define MAX_LAG 0xbcc98

sample_and_send_input:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x28
    mov eax, dword [LAST_INPUT_CLOCK]
    add eax, 4
    cmp eax, dword [TOTAL_CLOCK]
    jg near RESTORE_PACKET_REGISTERS
    cmp byte [READY_TO_SEND], 0
    je near RESTORE_PACKET_REGISTERS
    mov dword [LAST_INPUT_CLOCK], eax
    call GET_PACKETS
    call GET_OUTPUT_QUEUE_SIZE
    cmp eax, 0x10
    jge near RESTORE_PACKET_REGISTERS
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    test eax, eax
    jl short loc_12f83
loc_12f4c:
    mov edx, dword [LOCAL_PLAYER]
    sar edx, 0x10
    cmp eax, edx
    je short loc_12f75
    mov edx, dword [nosplit edx*4 + MOVE_FIFO_END]
    mov ecx, dword [nosplit eax*4 + MOVE_FIFO_END]
    sub edx, strict dword 0xc8
    cmp edx, ecx
    jg near RESTORE_PACKET_REGISTERS
loc_12f75:
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jge short loc_12f4c
loc_12f83:
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    imul edx, eax, strict dword 0x623
    cmp dword [edx + ON_MOTORCYCLE], 0
    je short loc_12fa1
    call GET_MOTORCYCLE_INPUT
    jmp short accumulate_local_input
loc_12fa1:
    cmp dword [edx + ON_BOAT], 0
    je short loc_12fb1
    call GET_BOAT_INPUT
    jmp short accumulate_local_input
loc_12fb1:
    call GET_INPUT
accumulate_local_input:
    mov eax, dword [0xbf530]
    mov esi, dword [ACCUM_FORWARD]
    sar eax, 0x10
    mov edi, dword [ACCUM_STRAFE]
    add esi, eax
    mov eax, dword [0xbf532]
    mov edx, dword [ACCUM_TURN]
    sar eax, 0x10
    mov ebx, dword [ACCUM_PITCH]
    add edi, eax
    mov eax, dword [0xbf52d]
    mov ecx, dword [ACCUM_BUTTONS]
    sar eax, 0x18
    mov dword [ACCUM_FORWARD], esi
    add edx, eax
    mov eax, dword [0xbf52e]
    mov dword [ACCUM_STRAFE], edi
    sar eax, 0x18
    mov dword [ACCUM_TURN], edx
    add ebx, eax
    mov eax, dword [0xbf536]
    mov dword [ACCUM_PITCH], ebx
    or ecx, eax
    mov eax, dword [LOCAL_PLAYER]
    mov dword [ACCUM_BUTTONS], ecx
    sar eax, 0x10
    xor ecx, ecx
    lea ebx, [eax*4]
    mov cl, byte [MOVES_PER_PACKET]
    mov edx, eax
    shl eax, 2
    lea esi, [ecx - 1]
    add edx, eax
    mov edi, dword [ebx + MOVE_FIFO_END]
    add edx, edx
    test esi, edi
    je near store_averaged_input
    mov ecx, edi
    and ecx, strict dword 0xff
    mov ebx, dword [ebx + MOVE_FIFO_END]
    lea eax, [ecx*4]
    mov edi, INPUT_FIFO
    add eax, ecx
    dec ebx
    shl eax, 5
    and ebx, strict dword 0xff
    add edi, eax
    lea eax, [ebx*4]
    add eax, ebx
    mov esi, INPUT_FIFO
    shl eax, 5
    mov ecx, 0xa
    add esi, eax
    add edi, edx
    add esi, edx
    cmp ecx, 4
    jae short loc_130a8
    test cl, 1
    je short loc_130a1
    movsb
loc_130a1:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw with Watcom prefix order
    jmp short loc_130d3
loc_130a8:
    test edi, 1
    je short loc_130b2
    movsb
    dec ecx
loc_130b2:
    test edi, 2
    je short loc_130bf
    movsw
    sub ecx, 2
loc_130bf:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_130cd
    movsw
loc_130cd:
    test bl, 1
    je short loc_130d3
    movsb
loc_130d3:
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    inc dword [nosplit eax*4 + MOVE_FIFO_END]
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
store_averaged_input:
    mov esi, edi
    and esi, strict dword 0xff
    lea eax, [esi*4]
    add eax, esi
    shl eax, 5
    add eax, strict dword INPUT_FIFO
    lea esi, [eax + edx]
    mov eax, dword [ACCUM_FORWARD]
    mov edx, eax
    sar edx, 0x1f
    idiv ecx
    mov word [esi + 2], ax
    mov eax, dword [ACCUM_STRAFE]
    mov edx, eax
    sar edx, 0x1f
    idiv ecx
    mov word [esi + 4], ax
    mov eax, dword [ACCUM_TURN]
    mov edx, eax
    sar edx, 0x1f
    idiv ecx
    mov byte [esi], al
    mov eax, dword [ACCUM_PITCH]
    mov edx, eax
    sar edx, 0x1f
    idiv ecx
    mov byte [esi + 1], al
    mov eax, dword [ACCUM_BUTTONS]
    mov dword [esi + 6], eax
    xor eax, eax
    mov dword [ACCUM_BUTTONS], eax
    mov dword [ACCUM_PITCH], eax
    mov dword [ACCUM_TURN], eax
    mov dword [ACCUM_STRAFE], eax
    mov dword [ACCUM_FORWARD], eax
    mov eax, dword [ebx + MOVE_FIFO_END]
    inc eax
    mov dx, word [LOCAL_PLAYER]
    mov dword [ebx + MOVE_FIFO_END], eax
    cmp dx, 2
    jge near track_peer_lag
    cmp dword [0xbffe3], 1
    jle near RESTORE_PACKET_REGISTERS
    mov ebx, dword [CONNECT_HEAD_BEFORE]
    sar ebx, 0x10
    test ebx, ebx
    jl near RESTORE_PACKET_REGISTERS
loc_131a4:
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    cmp ebx, eax
    je short loc_131e3
    cmp dword [PLAYER_AI], 0
    je short loc_131dc
    imul edx, ebx, 0xa
    mov eax, dword [nosplit ebx*4 + MOVE_FIFO_END]
    and eax, strict dword 0xff
    imul eax, eax, strict dword 0xa0
    add eax, strict dword INPUT_FIFO
    add edx, eax
    mov eax, ebx
    call COMPUTER_GET_INPUT
loc_131dc:
    inc dword [nosplit ebx*4 + MOVE_FIFO_END]
loc_131e3:
    mov ebx, dword [nosplit ebx*2 + CONNECT_NEXT_BEFORE]
    sar ebx, 0x10
    test ebx, ebx
    jge short loc_131a4
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
track_peer_lag:
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    test eax, eax
    jl short loc_13262
loc_13207:
    mov edx, dword [LOCAL_PLAYER]
    sar edx, 0x10
    cmp eax, edx
    je short loc_13254
    mov edx, dword [nosplit edx*4 + MOVE_FIFO_END]
    lea ebx, [eax*4]
    dec edx
    mov edi, dword [ebx + MOVE_FIFO_END]
    mov ecx, dword [ebx + PLAYER_MIN_LAG]
    sub edx, edi
    cmp edx, ecx
    jle short loc_13239
    mov ebx, ecx
    jmp short loc_1323b
loc_13239:
    mov ebx, edx
loc_1323b:
    mov esi, dword [MAX_LAG]
    mov dword [nosplit eax*4 + PLAYER_MIN_LAG], ebx
    cmp edx, esi
    jge short loc_1324e
    mov edx, esi
loc_1324e:
    mov dword [MAX_LAG], edx
loc_13254:
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jge short loc_13207
loc_13262:
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    mov eax, dword [nosplit eax*4 + MOVE_FIFO_END]
    dec eax
    test al, 0x1f
    jne short loc_132b8
    mov eax, dword [MAX_LAG]
    mov esi, dword [0x93ac]
    xor edi, edi
    sub eax, esi
    mov dword [MAX_LAG], edi
    test eax, eax
    jle short loc_132a0
    add eax, 3
    sar eax, 2
    lea ebx, [esi + eax]
    mov dword [0x93ac], ebx
    jmp short loc_132b8
loc_132a0:
    jge short loc_132b8
    mov edx, 1
    sub edx, eax
    mov eax, edx
    sar eax, 2
    mov edx, esi
    sub edx, eax
    mov dword [0x93ac], edx
loc_132b8:
    cmp byte [0x93a1], 1
    jne near send_slave_or_master_packet
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    mov bl, 0x11
    mov eax, dword [nosplit eax*4 + MOVE_FIFO_END]
    mov byte [PACKET_BUFFER], bl
    dec eax
    jne short loc_132e6
    mov byte [PACKET_BUFFER], 0x10
loc_132e6:
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    mov ecx, 1
    mov eax, dword [nosplit eax*4 + MOVE_FIFO_END]
    sub eax, ecx
    test al, 0x1f
    jne near loc_13434
    mov ax, word [0xcf65e]
    cmp ax, word [0xcf658]
    je near loc_1338e
    mov ebx, dword [CONNECT_HEAD_BEFORE]
    sar ebx, 0x10
    mov esi, dword [OTHER_MIN_LAG]
    mov ebx, dword [nosplit ebx*4 + PLAYER_MIN_LAG]
    sub ebx, esi
    mov eax, ebx
    test eax, eax
    jns short loc_13337
    neg eax
loc_13337:
    cmp eax, 8
    jle short loc_13340
    sar ebx, 1
    jmp short loc_1335b
loc_13340:
    mov eax, ebx
    test eax, eax
    jns short loc_13348
    neg eax
loc_13348:
    cmp eax, 2
    jle short loc_13359
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    mov ebx, eax
    jmp short loc_1335b
loc_13359:
    xor ebx, ebx
loc_1335b:
    lea eax, [ebx*4]
    sub dword [TOTAL_CLOCK], eax
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    mov esi, dword [OTHER_MIN_LAG]
    mov edx, dword [nosplit eax*4 + PLAYER_MIN_LAG]
    add esi, ebx
    sub edx, ebx
    mov dword [OTHER_MIN_LAG], esi
    mov dword [nosplit eax*4 + PLAYER_MIN_LAG], edx
loc_1338e:
    mov ax, word [0xcf65e]
    cmp ax, word [0xcf658]
    jne near loc_1340e
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jl short loc_1340e
loc_133b7:
    lea edx, [eax*4]
    mov edi, dword [edx + PLAYER_MIN_LAG]
    cmp edi, -0x80
    jle short loc_133cd
    mov edx, edi
    jmp short loc_133d2
loc_133cd:
    mov edx, 0xffffff80
loc_133d2:
    cmp edx, 0x7f
    jge short loc_133f4
    lea edx, [eax*4]
    mov ebx, dword [edx + PLAYER_MIN_LAG]
    cmp ebx, -0x80
    jle short loc_133ed
    mov edx, ebx
    jmp short loc_133f9
loc_133ed:
    mov edx, 0xffffff80
    jmp short loc_133f9
loc_133f4:
    mov edx, 0x7f
loc_133f9:
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    inc ecx
    sar eax, 0x10
    mov byte [ecx + 0x8ba7f], dl
    test eax, eax
    jge short loc_133b7
loc_1340e:
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    test eax, eax
    jl short loc_13434
    mov esi, 0x7fffffff
loc_1341f:
    mov dword [nosplit eax*4 + PLAYER_MIN_LAG], esi
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jge short loc_1341f
loc_13434:
    mov edx, dword [LOCAL_PLAYER]
    sar edx, 0x10
    lea ebx, [edx*4]
    mov esi, dword [ebx + MOVE_FIFO_END]
    sub esi, 2
    and esi, strict dword 0xff
    lea eax, [esi*4]
    mov ebx, dword [ebx + MOVE_FIFO_END]
    add eax, esi
    mov esi, INPUT_FIFO
    shl eax, 5
    dec ebx
    add esi, eax
    lea eax, [edx*4]
    and ebx, strict dword 0xff
    add edx, eax
    lea eax, [ebx*4]
    add edx, edx
    add eax, ebx
    add esi, edx
    shl eax, 5
    xor bl, bl
    add eax, strict dword INPUT_FIFO
    mov byte [ecx + PACKET_BUFFER], bl
    add eax, edx
    mov di, word [esi + 2]
    mov edx, ecx
    mov bx, word [eax + 2]
    inc ecx
    cmp bx, di
    je short loc_134d3
    mov bl, byte [eax + 2]
    mov byte [ecx + PACKET_BUFFER], bl
    mov ebx, dword [eax]
    sar ebx, 0x10
    sar ebx, 8
    mov byte [ecx + 0x8ba81], bl
    mov bh, byte [edx + PACKET_BUFFER]
    inc ecx
    or bh, 1
    inc ecx
    mov byte [edx + PACKET_BUFFER], bh
loc_134d3:
    mov bx, word [eax + 4]
    cmp bx, word [esi + 4]
    je short loc_13506
    mov bl, byte [eax + 4]
    mov byte [ecx + PACKET_BUFFER], bl
    mov ebx, dword [eax + 2]
    sar ebx, 0x10
    sar ebx, 8
    mov byte [ecx + 0x8ba81], bl
    mov bl, byte [edx + PACKET_BUFFER]
    inc ecx
    or bl, 2
    inc ecx
    mov byte [edx + PACKET_BUFFER], bl
loc_13506:
    mov bl, byte [eax]
    cmp bl, byte [esi]
    je short loc_13522
    mov byte [ecx + PACKET_BUFFER], bl
    mov bl, byte [edx + PACKET_BUFFER]
    or bl, 4
    inc ecx
    mov byte [edx + PACKET_BUFFER], bl
loc_13522:
    mov ebx, dword [eax + 6]
    xor ebx, dword [esi + 6]
    test bl, 0xff
    je short loc_13546
    mov bl, byte [eax + 6]
    mov byte [ecx + PACKET_BUFFER], bl
    mov bh, byte [edx + PACKET_BUFFER]
    or bh, 8
    inc ecx
    mov byte [edx + PACKET_BUFFER], bh
loc_13546:
    mov ebx, dword [eax + 6]
    xor ebx, dword [esi + 6]
    test bh, 0xff
    je short loc_13579
    mov ebx, dword [eax + 6]
    shr ebx, 8
    and ebx, strict dword 0xff
    mov dword [ebp - 0x18], ebx
    mov bl, byte [ebp - 0x18]
    mov byte [ecx + PACKET_BUFFER], bl
    mov bl, byte [edx + PACKET_BUFFER]
    or bl, 0x10
    inc ecx
    mov byte [edx + PACKET_BUFFER], bl
loc_13579:
    mov ebx, dword [eax + 6]
    xor ebx, dword [esi + 6]
    test ebx, 0xff0000
    je short loc_135a9
    mov ebx, dword [eax + 6]
    shr ebx, 0x10
    and ebx, strict dword 0xff
    mov byte [ecx + PACKET_BUFFER], bl
    mov bh, byte [edx + PACKET_BUFFER]
    or bh, 0x20
    inc ecx
    mov byte [edx + PACKET_BUFFER], bh
loc_135a9:
    mov ebx, dword [eax + 6]
    xor ebx, dword [esi + 6]
    test ebx, 0xff000000
    je short loc_135d9
    mov ebx, dword [eax + 6]
    shr ebx, 0x18
    and ebx, strict dword 0xff
    mov byte [ecx + PACKET_BUFFER], bl
    mov bl, byte [edx + PACKET_BUFFER]
    or bl, 0x40
    inc ecx
    mov byte [edx + PACKET_BUFFER], bl
loc_135d9:
    mov bl, byte [eax + 1]
    cmp bl, byte [esi + 1]
    je short loc_135f6
    mov byte [ecx + PACKET_BUFFER], bl
    mov al, byte [edx + PACKET_BUFFER]
    or al, 0x80
    inc ecx
    mov byte [edx + PACKET_BUFFER], al
loc_135f6:
    mov esi, dword [LOCAL_PLAYER]
    sar esi, 0x10
    mov edx, dword [0xbcca8]
    cmp edx, dword [nosplit esi*4 + SYNC_HEAD]
    je short loc_13631
    mov eax, edx
    shl esi, 8
    and eax, strict dword 0xff
    inc ecx
    lea ebx, [edx + 1]
    mov al, byte [esi + eax + SYNC_VALUES]
    mov dword [0xbcca8], ebx
    mov byte [ecx + 0x8ba7f], al
    jmp short loc_135f6
loc_13631:
    mov esi, dword [CONNECT_HEAD_BEFORE]
    sar esi, 0x10
    test esi, esi
    jl near RESTORE_PACKET_REGISTERS
loc_13642:
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    cmp esi, eax
    je short loc_1365c
    mov edx, PACKET_BUFFER
    mov ebx, ecx
    mov eax, esi
    call SEND_PACKET
loc_1365c:
    mov esi, dword [nosplit esi*2 + CONNECT_NEXT_BEFORE]
    sar esi, 0x10
    test esi, esi
    jge short loc_13642
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
send_slave_or_master_packet:
    mov ax, word [0xcf65e]
    cmp ax, word [0xcf658]
    je near send_master_packets
    mov eax, dword [LOCAL_PLAYER]
    sar eax, 0x10
    mov eax, dword [nosplit eax*4 + MOVE_FIFO_END]
    dec eax
    test al, 0x1f
    jne near loc_13737
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    mov esi, dword [OTHER_MIN_LAG]
    mov ecx, dword [nosplit eax*4 + PLAYER_MIN_LAG]
    sub ecx, esi
    mov eax, ecx
    test eax, eax
    jns short loc_136be
    neg eax
loc_136be:
    cmp eax, 8
    jle short loc_136c7
    sar ecx, 1
    jmp short loc_136e4
loc_136c7:
    mov eax, ecx
    test eax, eax
    jns short loc_136cf
    neg eax
loc_136cf:
    cmp eax, 2
    jle short loc_136e2
    mov ebx, ecx
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    mov ecx, eax
    jmp short loc_136e4
loc_136e2:
    xor ecx, ecx
loc_136e4:
    lea eax, [ecx*4]
    sub dword [TOTAL_CLOCK], eax
    mov eax, dword [CONNECT_HEAD_BEFORE]
    mov ebx, dword [OTHER_MIN_LAG]
    sar eax, 0x10
    add ebx, ecx
    mov edx, dword [nosplit eax*4 + PLAYER_MIN_LAG]
    mov dword [OTHER_MIN_LAG], ebx
    sub edx, ecx
    mov ecx, eax
    mov dword [nosplit eax*4 + PLAYER_MIN_LAG], edx
    test eax, eax
    jl short loc_13737
    mov eax, 0x7fffffff
loc_13722:
    mov dword [nosplit ecx*4 + PLAYER_MIN_LAG], eax
    mov ecx, dword [nosplit ecx*2 + CONNECT_NEXT_BEFORE]
    sar ecx, 0x10
    test ecx, ecx
    jge short loc_13722
loc_13737:
    mov ch, 1
    mov ebx, dword [LOCAL_PLAYER]
    xor al, al
    sar ebx, 0x10
    mov byte [PACKET_BUFFER], ch
    lea esi, [ebx*4]
    mov byte [0x8ba81], al
    mov eax, 2
    mov ecx, dword [esi + MOVE_FIFO_END]
    sub ecx, eax
    and ecx, strict dword 0xff
    mov edi, INPUT_FIFO
    lea edx, [ecx*4]
    mov esi, dword [esi + MOVE_FIFO_END]
    add edx, ecx
    dec esi
    shl edx, 5
    and esi, strict dword 0xff
    add edi, edx
    lea edx, [esi*4]
    lea ecx, [ebx*4]
    add edx, esi
    add ecx, ebx
    shl edx, 5
    add ecx, ecx
    add edx, strict dword INPUT_FIFO
    lea ebx, [edi + ecx]
    add edx, ecx
    mov si, word [ebx + 2]
    cmp si, word [edx + 2]
    je short loc_137d6
    mov al, byte [edx + 2]
    mov byte [0x8ba82], al
    mov eax, dword [edx]
    sar eax, 0x10
    sar eax, 8
    mov byte [0x8ba83], al
    mov byte [0x8ba81], 1
    mov eax, 4
loc_137d6:
    mov cx, word [edx + 4]
    cmp cx, word [ebx + 4]
    je short loc_1380f
    mov cl, byte [edx + 4]
    mov byte [eax + PACKET_BUFFER], cl
    mov ecx, dword [edx + 2]
    sar ecx, 0x10
    sar ecx, 8
    mov dword [ebp - 0x18], ecx
    mov cl, byte [ebp - 0x18]
    mov byte [eax + 0x8ba81], cl
    mov cl, byte [0x8ba81]
    inc eax
    or cl, 2
    inc eax
    mov byte [0x8ba81], cl
loc_1380f:
    mov cl, byte [edx]
    cmp cl, byte [ebx]
    je short loc_1382b
    mov byte [eax + PACKET_BUFFER], cl
    mov cl, byte [0x8ba81]
    or cl, 4
    inc eax
    mov byte [0x8ba81], cl
loc_1382b:
    mov ecx, dword [edx + 6]
    xor ecx, dword [ebx + 6]
    test cl, 0xff
    je short loc_1384f
    mov cl, byte [edx + 6]
    mov byte [eax + PACKET_BUFFER], cl
    mov ch, byte [0x8ba81]
    or ch, 8
    inc eax
    mov byte [0x8ba81], ch
loc_1384f:
    mov ecx, dword [edx + 6]
    xor ecx, dword [ebx + 6]
    test ch, 0xff
    je short loc_13882
    mov ecx, dword [edx + 6]
    shr ecx, 8
    and ecx, strict dword 0xff
    mov dword [ebp - 0x18], ecx
    mov cl, byte [ebp - 0x18]
    mov byte [eax + PACKET_BUFFER], cl
    mov cl, byte [0x8ba81]
    or cl, 0x10
    inc eax
    mov byte [0x8ba81], cl
loc_13882:
    mov ecx, dword [edx + 6]
    xor ecx, dword [ebx + 6]
    test ecx, 0xff0000
    je short loc_138b8
    mov ecx, dword [edx + 6]
    shr ecx, 0x10
    and ecx, strict dword 0xff
    mov dword [ebp - 0x18], ecx
    mov cl, byte [ebp - 0x18]
    mov byte [eax + PACKET_BUFFER], cl
    mov ch, byte [0x8ba81]
    or ch, 0x20
    inc eax
    mov byte [0x8ba81], ch
loc_138b8:
    mov ecx, dword [edx + 6]
    xor ecx, dword [ebx + 6]
    test ecx, 0xff000000
    je short loc_138ee
    mov ecx, dword [edx + 6]
    shr ecx, 0x18
    and ecx, strict dword 0xff
    mov dword [ebp - 0x18], ecx
    mov cl, byte [ebp - 0x18]
    mov byte [eax + PACKET_BUFFER], cl
    mov cl, byte [0x8ba81]
    or cl, 0x40
    inc eax
    mov byte [0x8ba81], cl
loc_138ee:
    mov cl, byte [edx + 1]
    cmp cl, byte [ebx + 1]
    je short loc_1390c
    mov byte [eax + PACKET_BUFFER], cl
    mov dl, byte [0x8ba81]
    or dl, 0x80
    inc eax
    mov byte [0x8ba81], dl
loc_1390c:
    mov edx, dword [LOCAL_PLAYER]
    sar edx, 0x10
    mov ecx, dword [0xbcca8]
    cmp ecx, dword [nosplit edx*4 + SYNC_HEAD]
    je short loc_13948
    mov ebx, ecx
    shl edx, 8
    and ebx, strict dword 0xff
    inc eax
    lea esi, [ecx + 1]
    mov dl, byte [edx + ebx + SYNC_VALUES]
    mov dword [0xbcca8], esi
    mov byte [eax + 0x8ba7f], dl
    jmp short loc_1390c
loc_13948:
    mov ecx, dword [CONNECT_HEAD_BEFORE]
    mov edx, PACKET_BUFFER
    sar ecx, 0x10
    mov ebx, eax
    mov eax, ecx
    call SEND_PACKET
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
send_master_packets:
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    test eax, eax
    jl short wait_for_active_players
    mov edi, dword [0xbf390]
loc_1397b:
    cmp edi, dword [nosplit eax*4 + MOVE_FIFO_END]
    jl short loc_139d3
    mov eax, dword [CONNECT_HEAD_BEFORE]
    mov cl, 0x7f
    sar eax, 0x10
    mov byte [PACKET_BUFFER], cl
    mov ecx, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar ecx, 0x10
    test ecx, ecx
    jl near RESTORE_PACKET_REGISTERS
    mov esi, PACKET_BUFFER
    mov edi, 1
loc_139b0:
    mov ebx, edi
    mov edx, esi
    mov eax, ecx
    call SEND_PACKET
    mov ecx, dword [nosplit ecx*2 + CONNECT_NEXT_BEFORE]
    sar ecx, 0x10
    test ecx, ecx
    jge short loc_139b0
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_139d3:
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jge short loc_1397b
wait_for_active_players:
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    test eax, eax
    jl short loc_13a17
    mov edi, dword [0xbf390]
loc_139f3:
    cmp byte [eax + PLAYER_QUIT_FLAG], 0
    je short loc_13a09
    cmp edi, dword [nosplit eax*4 + MOVE_FIFO_END]
    jge near RESTORE_PACKET_REGISTERS
loc_13a09:
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jge short loc_139f3
loc_13a17:
    mov esi, dword [0xbf390]
    and esi, strict dword 0xff
    imul esi, esi, strict dword 0xa0
    mov eax, dword [0xbf390]
    dec eax
    and eax, strict dword 0xff
    imul eax, eax, strict dword 0xa0
    mov edx, INPUT_FIFO
    mov ecx, 1
    add edx, eax
    add esi, strict dword INPUT_FIFO
    mov dword [ebp - 0x1c], edx
    xor ah, ah
    mov dl, byte [0xbf390]
    mov byte [PACKET_BUFFER], ah
    test dl, 0x1f
    jne near loc_13b02
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jl short loc_13adc
loc_13a7c:
    cmp byte [eax + PLAYER_QUIT_FLAG], 0
    je short loc_13ace
    lea edx, [eax*4]
    mov ebx, dword [edx + PLAYER_MIN_LAG]
    cmp ebx, -0x80
    jle short loc_13a9b
    mov edx, ebx
    jmp short loc_13aa0
loc_13a9b:
    mov edx, 0xffffff80
loc_13aa0:
    cmp edx, 0x7f
    jge short loc_13ac2
    lea edx, [eax*4]
    mov edi, dword [edx + PLAYER_MIN_LAG]
    cmp edi, -0x80
    jle short loc_13abb
    mov edx, edi
    jmp short loc_13ac7
loc_13abb:
    mov edx, 0xffffff80
    jmp short loc_13ac7
loc_13ac2:
    mov edx, 0x7f
loc_13ac7:
    inc ecx
    mov byte [ecx + 0x8ba7f], dl
loc_13ace:
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jge short loc_13a7c
loc_13adc:
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    test eax, eax
    jl short loc_13b02
    mov edx, 0x7fffffff
loc_13aed:
    mov dword [nosplit eax*4 + PLAYER_MIN_LAG], edx
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jge short loc_13aed
loc_13b02:
    mov edx, dword [CONNECT_HEAD_BEFORE]
    sar edx, 0x10
    mov eax, ecx
    test edx, edx
    jl short loc_13b29
loc_13b11:
    xor ebx, ebx
    mov bl, byte [edx + PLAYER_QUIT_FLAG]
    mov edx, dword [nosplit edx*2 + CONNECT_NEXT_BEFORE]
    sar edx, 0x10
    add ecx, ebx
    test edx, edx
    jge short loc_13b11
loc_13b29:
    mov edx, dword [CONNECT_HEAD_BEFORE]
    sar edx, 0x10
    test edx, edx
    jl near loc_13d7d
loc_13b3a:
    cmp byte [edx + PLAYER_QUIT_FLAG], 0
    je near loc_13d6b
    imul edi, edx, 0xa
    xor bl, bl
    mov byte [eax + PACKET_BUFFER], bl
    lea ebx, [esi + edi]
    mov dword [ebp - 0x34], ebx
    add edi, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x34]
    mov bx, word [ebx + 2]
    cmp bx, word [edi + 2]
    je short loc_13b96
    mov ebx, dword [ebp - 0x34]
    mov bl, byte [ebx + 2]
    mov byte [ecx + PACKET_BUFFER], bl
    mov ebx, dword [ebp - 0x34]
    mov ebx, dword [ebx]
    sar ebx, 0x10
    sar ebx, 8
    mov byte [ecx + 0x8ba81], bl
    mov bh, byte [eax + PACKET_BUFFER]
    inc ecx
    or bh, 1
    inc ecx
    mov byte [eax + PACKET_BUFFER], bh
loc_13b96:
    imul edi, edx, 0xa
    lea ebx, [esi + edi]
    mov dword [ebp - 0x20], ebx
    add edi, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x20]
    mov bx, word [ebx + 4]
    cmp bx, word [edi + 4]
    je short loc_13bde
    mov ebx, dword [ebp - 0x20]
    mov bl, byte [ebx + 4]
    mov byte [ecx + PACKET_BUFFER], bl
    mov ebx, dword [ebp - 0x20]
    mov ebx, dword [ebx + 2]
    sar ebx, 0x10
    sar ebx, 8
    mov byte [ecx + 0x8ba81], bl
    mov bl, byte [eax + PACKET_BUFFER]
    inc ecx
    or bl, 2
    inc ecx
    mov byte [eax + PACKET_BUFFER], bl
loc_13bde:
    imul edi, edx, 0xa
    lea ebx, [esi + edi]
    mov dword [ebp - 0x38], ebx
    add edi, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x38]
    mov bl, byte [ebx]
    cmp bl, byte [edi]
    je short loc_13c0e
    mov ebx, dword [ebp - 0x38]
    mov bl, byte [ebx]
    mov byte [ecx + PACKET_BUFFER], bl
    mov bl, byte [eax + PACKET_BUFFER]
    or bl, 4
    inc ecx
    mov byte [eax + PACKET_BUFFER], bl
loc_13c0e:
    imul edi, edx, 0xa
    lea ebx, [esi + edi]
    mov dword [ebp - 0x24], ebx
    add edi, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x24]
    mov ebx, dword [ebx + 6]
    mov dword [ebp - 0x18], ebx
    mov ebx, dword [edi + 6]
    mov edi, dword [ebp - 0x18]
    xor edi, ebx
    mov ebx, edi
    test bl, 0xff
    je short loc_13c4e
    mov edi, dword [ebp - 0x24]
    mov bl, byte [edi + 6]
    mov byte [ecx + PACKET_BUFFER], bl
    mov bh, byte [eax + PACKET_BUFFER]
    or bh, 8
    inc ecx
    mov byte [eax + PACKET_BUFFER], bh
loc_13c4e:
    imul edi, edx, 0xa
    lea ebx, [esi + edi]
    mov dword [ebp - 0x30], ebx
    add edi, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x30]
    mov ebx, dword [ebx + 6]
    mov dword [ebp - 0x18], ebx
    mov ebx, dword [edi + 6]
    mov edi, dword [ebp - 0x18]
    xor edi, ebx
    mov ebx, edi
    test bh, 0xff
    je short loc_13c97
    mov ebx, dword [ebp - 0x30]
    mov ebx, dword [ebx + 6]
    shr ebx, 8
    and ebx, strict dword 0xff
    mov byte [ecx + PACKET_BUFFER], bl
    mov bl, byte [eax + PACKET_BUFFER]
    or bl, 0x10
    inc ecx
    mov byte [eax + PACKET_BUFFER], bl
loc_13c97:
    imul edi, edx, 0xa
    lea ebx, [esi + edi]
    mov dword [ebp - 0x2c], ebx
    add edi, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x2c]
    mov ebx, dword [ebx + 6]
    mov dword [ebp - 0x18], ebx
    mov ebx, dword [edi + 6]
    mov edi, dword [ebp - 0x18]
    xor edi, ebx
    test edi, 0xff0000
    je short loc_13ce7
    mov ebx, dword [ebp - 0x2c]
    mov ebx, dword [ebx + 6]
    shr ebx, 0x10
    and ebx, strict dword 0xff
    mov dword [ebp - 0x18], ebx
    mov bl, byte [ebp - 0x18]
    mov byte [ecx + PACKET_BUFFER], bl
    mov bh, byte [eax + PACKET_BUFFER]
    or bh, 0x20
    inc ecx
    mov byte [eax + PACKET_BUFFER], bh
loc_13ce7:
    imul edi, edx, 0xa
    lea ebx, [esi + edi]
    mov dword [ebp - 0x28], ebx
    add edi, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x28]
    mov ebx, dword [ebx + 6]
    mov dword [ebp - 0x18], ebx
    mov ebx, dword [edi + 6]
    mov edi, dword [ebp - 0x18]
    xor edi, ebx
    test edi, 0xff000000
    je short loc_13d37
    mov ebx, dword [ebp - 0x28]
    mov ebx, dword [ebx + 6]
    shr ebx, 0x18
    and ebx, strict dword 0xff
    mov dword [ebp - 0x18], ebx
    mov bl, byte [ebp - 0x18]
    mov byte [ecx + PACKET_BUFFER], bl
    mov bl, byte [eax + PACKET_BUFFER]
    or bl, 0x40
    inc ecx
    mov byte [eax + PACKET_BUFFER], bl
loc_13d37:
    imul edi, edx, 0xa
    lea ebx, [esi + edi]
    mov dword [ebp - 0x3c], ebx
    add edi, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x3c]
    mov bl, byte [ebx + 1]
    cmp bl, byte [edi + 1]
    je short loc_13d6a
    mov ebx, dword [ebp - 0x3c]
    mov bl, byte [ebx + 1]
    mov byte [ecx + PACKET_BUFFER], bl
    mov bl, byte [eax + PACKET_BUFFER]
    or bl, 0x80
    inc ecx
    mov byte [eax + PACKET_BUFFER], bl
loc_13d6a:
    inc eax
loc_13d6b:
    mov edx, dword [nosplit edx*2 + CONNECT_NEXT_BEFORE]
    sar edx, 0x10
    test edx, edx
    jge near loc_13b3a
loc_13d7d:
    mov edi, dword [LOCAL_PLAYER]
    sar edi, 0x10
    mov edx, dword [0xbcca8]
    cmp edx, dword [nosplit edi*4 + SYNC_HEAD]
    je short loc_13db8
    mov eax, edx
    shl edi, 8
    and eax, strict dword 0xff
    inc ecx
    lea ebx, [edx + 1]
    mov al, byte [edi + eax + SYNC_VALUES]
    mov dword [0xbcca8], ebx
    mov byte [ecx + 0x8ba7f], al
    jmp short loc_13d7d
loc_13db8:
    mov eax, dword [CONNECT_HEAD_BEFORE]
    sar eax, 0x10
    mov edi, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar edi, 0x10
    test edi, edi
    jl short loc_13e05
loc_13dce:
    cmp byte [edi + PLAYER_QUIT_FLAG], 0
    je short loc_13df7
    mov edx, PACKET_BUFFER
    mov ebx, ecx
    mov eax, edi
    call SEND_PACKET
    imul eax, edi, 0xa
    test byte [esi + eax + 9], 4
    je short loc_13df7
    xor dh, dh
    mov byte [edi + PLAYER_QUIT_FLAG], dh
loc_13df7:
    mov edi, dword [nosplit edi*2 + CONNECT_NEXT_BEFORE]
    sar edi, 0x10
    test edi, edi
    jge short loc_13dce
loc_13e05:
    xor eax, eax
    mov ecx, dword [0xbf390]
    mov al, byte [MOVES_PER_PACKET]
    add ecx, eax
    mov dword [0xbf390], ecx
    jmp near wait_for_active_players
    nop
