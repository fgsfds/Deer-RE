bits 32
org 0x11880

%define GAME_TIMER_TICK 0x1880
%define REGISTER_TIMER 0x5e698
%define START_TIMER 0x5e850
%define REMOVE_TIMER 0x5e7e0
%define STOP_TIMER 0x5e630
%define ROTATE_SPRITE 0x47f83
%define COUNTER 0x216f7c
%define TIMER_HANDLE 0x9694
%define TILE_WIDTH_BEFORE 0x17cee6
%define SCREEN_HEIGHT 0x216f84
%define SCREEN_WIDTH 0x216f88
%define TO_UPPER 0x5e8c3
%define ITOA 0x5e940
%define TILE_WIDTH 0x17cee8

next_counter:
    push dword ebp
    mov ebp, esp
    mov eax, dword [COUNTER]
    inc dword [COUNTER]
    mov esp, ebp
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

start_game_timer:
    push dword ebp
    mov ebp, esp
    push dword ebx
    push dword ecx
    push dword edx
    mov ebx, 1
    mov edx, 0x78
    mov eax, GAME_TIMER_TICK
    xor ecx, ecx
    call REGISTER_TIMER
    mov dword [TIMER_HANDLE], eax
    call START_TIMER
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

stop_game_timer:
    push dword ebp
    mov ebp, esp
    push dword ebx
    push dword edx
    mov edx, dword [TIMER_HANDLE]
    test edx, edx
    je short loc_118da
    mov eax, edx
    call REMOVE_TIMER
loc_118da:
    xor ebx, ebx
    mov dword [TIMER_HANDLE], ebx
    call STOP_TIMER
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

draw_text:
    push dword ebp
    mov ebp, esp
    push dword esi
    push dword edi
    sub esp, 0x10
    mov edi, eax
    mov dword [ebp - 0x14], edx
    mov esi, ebx
    mov byte [ebp - 0xc], cl
    cmp eax, strict dword 0xa0
    sete al
    mov ecx, esi
    xor ebx, ebx
    test al, al
    je near loc_1197a
loc_11916:
    mov ah, byte [esi]
    test ah, ah
    je short loc_1196c
    cmp ah, 0x20
    jne short loc_11927
    add ebx, 5
    inc esi
    jmp short loc_11916
loc_11927:
    xor edx, edx
    mov dl, ah
    add edx, 0x1e1
    cmp dx, 0x202
    jl short loc_1196c
    cmp dx, 0x25f
    jg short loc_1196c
    cmp ah, 0x30
    jb short loc_1194e
    cmp ah, 0x39
    ja short loc_1194e
    add ebx, 8
    jmp short loc_11969
loc_1194e:
    movsx edx, dx
    mov edx, dword [nosplit edx*2 + TILE_WIDTH_BEFORE]
    sar edx, 0x10
    mov eax, edx
    sar edx, 0x1f
    db 0x2b, 0xc2            ; sub eax, edx, register-load encoding
    sar eax, 1
    movsx ebx, bx
    add ebx, eax
loc_11969:
    inc esi
    jmp short loc_11916
loc_1196c:
    movsx eax, bx
    mov edi, 0xa0
    sar eax, 1
    mov esi, ecx
    sub edi, eax
loc_1197a:
    mov eax, dword [ebp - 0x14]
    shl eax, 0x10
    mov dword [ebp - 0x18], eax
loc_11983:
    mov dl, byte [esi]
    test dl, dl
    je near loc_11a1e
    cmp dl, 0x20
    jne short loc_11998
    add edi, 5
    inc esi
    jmp short loc_11983
loc_11998:
    xor eax, eax
    mov al, dl
    add eax, strict dword 0x1e1
    mov word [ebp - 0x10], ax
    cmp ax, 0x202
    jl near loc_11a1e
    cmp ax, 0x25f
    jg short loc_11a1e
    mov eax, dword [SCREEN_HEIGHT]
    dec eax
    push dword eax
    mov eax, dword [SCREEN_WIDTH]
    dec eax
    push dword eax
    push byte 0
    push byte 0
    push byte 0x1a
    xor eax, eax
    push byte 0
    mov al, byte [ebp - 0xc]
    push dword eax
    mov eax, dword [ebp - 0x12]
    mov ebx, 0x8000
    sar eax, 0x10
    mov edx, dword [ebp - 0x18]
    push dword eax
    mov eax, edi
    xor ecx, ecx
    shl eax, 0x10
    call ROTATE_SPRITE
    mov bl, byte [esi]
    cmp bl, 0x30
    jb short loc_119fd
    cmp bl, 0x39
    ja short loc_119fd
    add edi, 8
    jmp short loc_11a18
loc_119fd:
    mov eax, dword [ebp - 0x12]
    sar eax, 0x10
    mov edx, dword [nosplit eax*2 + TILE_WIDTH_BEFORE]
    sar edx, 0x10
    mov eax, edx
    sar edx, 0x1f
    db 0x2b, 0xc2            ; sub eax, edx, register-load encoding
    sar eax, 1
    add edi, eax
loc_11a18:
    inc esi
    jmp near loc_11983
loc_11a1e:
    mov eax, edi
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
    nop

draw_text_with_apostrophe:
    push dword ebp
    mov ebp, esp
    push dword esi
    push dword edi
    sub esp, 0x10
    mov edi, eax
    mov dword [ebp - 0x18], edx
    mov esi, ebx
    mov byte [ebp - 0xc], cl
    cmp eax, strict dword 0xa0
    sete al
    mov ecx, esi
    xor ebx, ebx
    test al, al
    je near loc_11ab2
loc_11a4e:
    mov ah, byte [esi]
    test ah, ah
    je short loc_11aa4
    cmp ah, 0x20
    jne short loc_11a5f
    add ebx, 5
    inc esi
    jmp short loc_11a4e
loc_11a5f:
    xor edx, edx
    mov dl, ah
    add edx, 0x1e1
    cmp dx, 0x202
    jl short loc_11aa4
    cmp dx, 0x25f
    jg short loc_11aa4
    cmp ah, 0x30
    jb short loc_11a86
    cmp ah, 0x39
    ja short loc_11a86
    add ebx, 8
    jmp short loc_11aa1
loc_11a86:
    movsx edx, dx
    mov edx, dword [nosplit edx*2 + TILE_WIDTH_BEFORE]
    sar edx, 0x10
    mov eax, edx
    sar edx, 0x1f
    db 0x2b, 0xc2            ; sub eax, edx, register-load encoding
    sar eax, 1
    movsx ebx, bx
    add ebx, eax
loc_11aa1:
    inc esi
    jmp short loc_11a4e
loc_11aa4:
    movsx eax, bx
    mov edi, 0xa0
    sar eax, 1
    mov esi, ecx
    sub edi, eax
loc_11ab2:
    mov eax, dword [ebp - 0x18]
    shl eax, 0x10
    mov dword [ebp - 0x14], eax
loc_11abb:
    mov dl, byte [esi]
    test dl, dl
    je near loc_11a1e
    cmp dl, 0x20
    jne short loc_11ad0
    add edi, 5
    inc esi
    jmp short loc_11abb
loc_11ad0:
    cmp dl, 0x27
    jne short loc_11add
    mov word [ebp - 0x10], 0x241
    jmp short loc_11aea
loc_11add:
    xor eax, eax
    mov al, dl
    add eax, strict dword 0x1e1
    mov word [ebp - 0x10], ax
loc_11aea:
    mov ebx, dword [ebp - 0x10]
    cmp bx, 0x202
    jl near loc_11a1e
    cmp bx, 0x25f
    jg near loc_11a1e
    mov eax, dword [SCREEN_HEIGHT]
    dec eax
    push dword eax
    mov eax, dword [SCREEN_WIDTH]
    dec eax
    push dword eax
    push byte 0
    push byte 0
    xor edx, edx
    push byte 0x1a
    mov dl, byte [ebp - 0xc]
    push dword edx
    mov ebx, 0x8000
    mov eax, dword [ebp - 0x12]
    push dword edx
    sar eax, 0x10
    xor ecx, ecx
    push dword eax
    mov eax, edi
    mov edx, dword [ebp - 0x14]
    shl eax, 0x10
    call ROTATE_SPRITE
    mov bh, byte [esi]
    cmp bh, 0x30
    jb short loc_11b4a
    cmp bh, 0x39
    ja short loc_11b4a
    add edi, 8
    jmp short loc_11b65
loc_11b4a:
    mov eax, dword [ebp - 0x12]
    sar eax, 0x10
    mov edx, dword [nosplit eax*2 + TILE_WIDTH_BEFORE]
    sar edx, 0x10
    mov eax, edx
    sar edx, 0x1f
    db 0x2b, 0xc2            ; sub eax, edx, register-load encoding
    sar eax, 1
    add edi, eax
loc_11b65:
    inc esi
    jmp near loc_11abb
    nop

draw_text_fixed_digits:
    push dword ebp
    mov ebp, esp
    push dword esi
    push dword edi
    sub esp, 0xc
    mov edi, eax
    mov esi, ebx
    mov byte [ebp - 0xc], cl
    cmp eax, strict dword 0xa0
    sete cl
    xor eax, eax
    test cl, cl
    je short loc_11bdf
loc_11b89:
    mov cl, byte [esi]
    test cl, cl
    je short loc_11bd3
    cmp cl, 0x20
    jne short loc_11b9c
    add eax, strict dword 5
    inc esi
    jmp short loc_11b89
loc_11b9c:
    movzx di, cl
    add edi, strict dword 0x1e1
    cmp di, 0x202
    jl short loc_11bd3
    cmp di, 0x25f
    jg short loc_11bd3
    cmp cl, 0x30
    jb short loc_11bc5
    cmp cl, 0x39
    ja short loc_11bc5
    add eax, strict dword 8
    jmp short loc_11bd0
loc_11bc5:
    movsx edi, di
    add ax, word [nosplit edi*2 + TILE_WIDTH]
loc_11bd0:
    inc esi
    jmp short loc_11b89
loc_11bd3:
    cwde
    mov edi, 0xa0
    sar eax, 1
    mov esi, ebx
    sub edi, eax
loc_11bdf:
    shl edx, 0x10
    mov dword [ebp - 0x14], edx
loc_11be5:
    mov al, byte [esi]
    test al, al
    je near loc_11c76
    cmp al, 0x20
    jne short loc_11bf9
    add edi, 5
    inc esi
    jmp short loc_11be5
loc_11bf9:
    xor eax, eax
    mov al, byte [esi]
    add eax, strict dword 0x1e1
    mov word [ebp - 0x10], ax
    cmp ax, 0x202
    jl short loc_11c76
    cmp ax, 0x25f
    jg short loc_11c76
    mov eax, dword [SCREEN_HEIGHT]
    dec eax
    push dword eax
    mov eax, dword [SCREEN_WIDTH]
    dec eax
    push dword eax
    push byte 0
    push byte 0
    xor eax, eax
    push byte 0x1a
    mov al, byte [ebp + 8]
    push dword eax
    xor eax, eax
    mov al, byte [ebp - 0xc]
    push dword eax
    mov eax, dword [ebp - 0x12]
    mov ebx, 0x10000
    sar eax, 0x10
    mov edx, dword [ebp - 0x14]
    push dword eax
    mov eax, edi
    xor ecx, ecx
    shl eax, 0x10
    call ROTATE_SPRITE
    mov dl, byte [esi]
    cmp dl, 0x30
    jb short loc_11c5e
    cmp dl, 0x39
    ja short loc_11c5e
    add edi, 8
    jmp short loc_11c70
loc_11c5e:
    mov eax, dword [ebp - 0x12]
    sar eax, 0x10
    mov eax, dword [nosplit eax*2 + TILE_WIDTH_BEFORE]
    sar eax, 0x10
    add edi, eax
loc_11c70:
    inc esi
    jmp near loc_11be5
loc_11c76:
    mov eax, edi
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    lea eax, [byte eax+0]

draw_text_through_selected_glyph:
    push dword ebp
    mov ebp, esp
    push dword esi
    push dword edi
    sub esp, 0x18
    mov esi, eax
    mov dword [ebp - 0x20], edx
    mov byte [ebp - 0xc], cl
    mov eax, ebx
    cmp esi, strict dword 0xa0
    sete bl
    mov ecx, eax
    xor edx, edx
    xor edi, edi
    test bl, bl
    je short loc_11cfa
loc_11ca9:
    cmp byte [eax], 0
    je short loc_11cea
    cmp di, word [ebp + 8]
    je short loc_11cea
    mov bh, byte [eax]
    lea esi, [eax + 1]
    cmp bh, 0x20
    jne short loc_11cc5
    add edx, 5
    mov eax, esi
    jmp short loc_11ca9
loc_11cc5:
    mov al, bh
    xor ah, ah
    add eax, strict dword 0x1e1
    cmp ax, 0x202
    jl short loc_11cea
    cmp ax, 0x25f
    jg short loc_11cea
    cwde
    inc edi
    mov bx, word [nosplit eax*2 + TILE_WIDTH]
    mov eax, esi
    add edx, ebx
    jmp short loc_11ca9
loc_11cea:
    movsx esi, dx
    mov edx, 0xa0
    sar esi, 1
    sub edx, esi
    mov eax, ecx
    mov esi, edx
loc_11cfa:
    xor ecx, ecx
    mov dword [ebp - 0x10], ecx
    cmp byte [eax], 0
    je near loc_11dcf
    mov edx, dword [ebp - 0x20]
    shl edx, 0x10
    mov dword [ebp - 0x1c], edx
loc_11d11:
    lea edx, [eax + 1]
    mov dword [ebp - 0x18], edx
    mov dl, byte [eax]
    cmp dl, 0x20
    jne short loc_11d29
    mov eax, dword [ebp - 0x18]
    add esi, 5
    jmp near loc_11dc6
loc_11d29:
    mov al, dl
    xor ah, ah
    add eax, strict dword 0x1e1
    cmp ax, 0x202
    jl near loc_11dcf
    cmp ax, 0x25f
    jg near loc_11dcf
    mov ecx, dword [ebp - 0x10]
    mov ebx, dword [SCREEN_WIDTH]
    mov edx, dword [SCREEN_HEIGHT]
    mov edi, esi
    dec ebx
    dec edx
    shl edi, 0x10
    cmp cx, word [ebp + 8]
    jne short loc_11d87
    push dword edx
    push dword ebx
    push byte 0
    push byte 0
    push byte 0x1a
    xor edx, edx
    push byte 1
    mov dl, byte [ebp - 0xc]
    cwde
    push dword edx
    xor ecx, ecx
    mov ebx, 0x10000
    push dword eax
    mov edx, dword [ebp - 0x1c]
    mov eax, edi
    call ROTATE_SPRITE
    jmp short loc_11dcf
loc_11d87:
    push dword edx
    push dword ebx
    push byte 0
    push byte 0
    push byte 0x1a
    cwde
    xor edx, edx
    push byte 0
    mov dl, byte [ebp - 0xc]
    xor ecx, ecx
    push dword edx
    mov dword [ebp - 0x14], eax
    mov ebx, 0x10000
    push dword eax
    mov edx, dword [ebp - 0x1c]
    mov eax, edi
    call ROTATE_SPRITE
    mov eax, dword [ebp - 0x14]
    mov edi, dword [ebp - 0x10]
    mov eax, dword [nosplit eax*2 + TILE_WIDTH_BEFORE]
    inc edi
    sar eax, 0x10
    mov dword [ebp - 0x10], edi
    add esi, eax
    mov eax, dword [ebp - 0x18]
loc_11dc6:
    cmp byte [eax], 0
    jne near loc_11d11
loc_11dcf:
    mov eax, esi
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    db 0x8b, 0xc0            ; mov eax, eax alignment

draw_small_uppercase_text:
    push dword ebp
    mov ebp, esp
    push dword esi
    push dword edi
    sub esp, 8
    mov edi, eax
    mov esi, ebx
    mov ah, byte [ebx]
    mov byte [ebp - 0xc], cl
    test ah, ah
    je short loc_11e57
    shl edx, 0x10
    mov dword [ebp - 0x10], edx
loc_11df7:
    xor eax, eax
    mov al, byte [esi]
    call TO_UPPER
    mov byte [esi], al
    cmp al, 0x20
    jne short loc_11e0c
    add edi, 5
    inc esi
    jmp short loc_11e52
loc_11e0c:
    xor edx, edx
    mov dl, al
    mov eax, dword [SCREEN_HEIGHT]
    dec eax
    push dword eax
    mov eax, dword [SCREEN_WIDTH]
    dec eax
    push dword eax
    push byte 0
    xor eax, eax
    push byte 0
    mov al, byte [ebp + 8]
    push dword eax
    xor eax, eax
    mov al, byte [ebp - 0xc]
    push dword eax
    mov ebx, 0x8000
    add edx, strict dword 0x2ad
    push byte 0
    movsx eax, dx
    xor ecx, ecx
    push dword eax
    mov eax, edi
    mov edx, dword [ebp - 0x10]
    shl eax, 0x10
    inc esi
    call ROTATE_SPRITE
    add edi, 4
loc_11e52:
    cmp byte [esi], 0
    jne short loc_11df7
loc_11e57:
    mov eax, edi
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    db 0x8b, 0xc0            ; mov eax, eax alignment

draw_small_uppercase_text_with_flags:
    push dword ebp
    mov ebp, esp
    push dword esi
    push dword edi
    sub esp, 8
    mov edi, eax
    mov esi, ebx
    mov ah, byte [ebx]
    mov byte [ebp - 0xc], cl
    test ah, ah
    je short loc_11ee3
    shl edx, 0x10
    mov dword [ebp - 0x10], edx
loc_11e7f:
    xor eax, eax
    mov al, byte [esi]
    call TO_UPPER
    mov byte [esi], al
    cmp al, 0x20
    jne short loc_11e94
    add edi, 5
    inc esi
    jmp short loc_11ede
loc_11e94:
    xor edx, edx
    mov dl, al
    mov eax, dword [SCREEN_HEIGHT]
    dec eax
    push dword eax
    mov eax, dword [SCREEN_WIDTH]
    dec eax
    push dword eax
    push byte 0
    xor eax, eax
    push byte 0
    mov al, byte [ebp + 0xc]
    push dword eax
    xor eax, eax
    mov al, byte [ebp + 8]
    push dword eax
    xor eax, eax
    mov ebx, 0x8000
    mov al, byte [ebp - 0xc]
    add edx, strict dword 0x2ad
    push dword eax
    movsx eax, dx
    xor ecx, ecx
    push dword eax
    mov eax, edi
    mov edx, dword [ebp - 0x10]
    shl eax, 0x10
    inc esi
    call ROTATE_SPRITE
    add edi, 4
loc_11ede:
    cmp byte [esi], 0
    jne short loc_11e7f
loc_11ee3:
    mov eax, edi
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 8
    db 0x8b, 0xc0            ; mov eax, eax alignment

draw_decimal_text:
    push dword ebp
    mov ebp, esp
    push dword esi
    push dword edi
    sub esp, 0xc
    mov esi, eax
    mov edi, edx
    mov eax, ebx
    mov ebx, 0xa
    lea edx, [ebp - 0x14]
    call ITOA
    lea ebx, [ebp - 0x14]
    and ecx, strict dword 0xff
    mov edx, edi
    mov eax, esi
    call draw_text
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
