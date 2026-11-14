bits 32
org 0x19650

%define PRINT_NOTICE 0x5130c
%define SET_PLAYER_QUOTE 0x14e68
%define GAME_EXIT 0x14f28
%define CLOSE_DEMO_WRITE 0x17d68
%define RECORD_DEMO 0x17d54
%define KRAND 0x46fa0
%define CORRECT_PREDICTED_MOVEMENT 0x182d8
%define DEFINE_CONTROL_FLAG 0x5c958
%define SET_DEBUG_LOCATION 0x5ab32
%define PRINTF 0x5ac04
%define SOURCE_NAME 0x14a0
%define SAVE_NAME 0x14a8
%define SAVED_MESSAGE 0x14c4
%define QUIT_MESSAGE 0x14dc
%define PLAYER_QUIT_FORMAT 0x14e0
%define HOST_QUIT_MESSAGE 0x14f0

do_move_things:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    call 0x579a0
    mov ax, word [0xcf658]
    mov word [ebp - 0x18], ax
    test ax, ax
    jl near loc_197c0
loc_19673:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul edx, eax, 0xa
    test byte [edx + 0xb8bf8], 2
    je near loc_197ab
    mov eax, dword [edx + 0xb8bf6]
    shr eax, 0x12
    and eax, 1
    mov byte [0xc003c], al
    mov eax, dword [edx + 0xb8bf6]
    shr eax, 0x13
    mov bh, 2
    and eax, 0xf
    mov byte [0xc0037], bh
    mov byte [0xc003d], al
    mov al, byte [ebp - 0x18]
    mov cl, byte [0xc003c]
    mov byte [0xc0035], al
    test cl, cl
    je near loc_19791
    mov eax, dword [0xc003a]
    sar eax, 0x18
    call 0x2581c
    xor al, al
    mov cx, word [0xcf65e]
    mov byte [0xc0037], al
    movsx ax, byte [0xc0035]
    cmp ax, cx
    je short loc_19755
    push byte 0x3c
    mov eax, dword [0xc0032]
    mov edx, 0xbf578
    sar eax, 0x18
    mov ecx, SOURCE_NAME
    shl eax, 5
    mov ebx, 4
    add edx, eax
    mov eax, 0x93ec0
    call 0x5a6fa
    push byte 4
    mov ecx, 0x3d
    mov ebx, SOURCE_NAME
    mov edx, SAVE_NAME
    mov eax, 0x93ec0
    call 0x5e403
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, 0x8be10
    add edx, eax
    mov eax, 0x7a
    call SET_PLAYER_QUOTE
    jmp short loc_197c0
loc_19755:
    push byte 0x42
    mov ecx, SOURCE_NAME
    mov ebx, 4
    mov edx, SAVED_MESSAGE
    mov eax, 0x93ec0
    call 0x5a6fa
    mov edx, dword [0xcf65c]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov eax, 0x7a
    add edx, strict dword 0x8be10
    call SET_PLAYER_QUOTE
    jmp short loc_197c0
loc_19791:
    mov eax, dword [0xc003a]
    sar eax, 0x18
    call 0x25808
    mov al, 1
    mov byte [0xc0037], cl
    jmp near loc_19bc9
loc_197ab:
    mov ax, word [nosplit eax*2 + 0xcf540]
    mov word [ebp - 0x18], ax
    test ax, ax
    jge near loc_19673
loc_197c0:
    mov esi, 0xffffffff
    mov edx, dword [0xbd764]
    mov ah, byte [0xc0042]
    add edx, 4
    mov word [0xbfafb], si
    mov dword [0xbd764], edx
    test ah, ah
    jbe short loc_197ef
    mov dl, ah
    dec dl
    mov byte [0xc0042], dl
loc_197ef:
    mov di, word [0xbf564]
    test di, di
    jle short loc_19804
    mov eax, edi
    dec eax
    mov word [0xbf564], ax
loc_19804:
    mov ebx, dword [0xbccb8]
    test ebx, ebx
    jle short loc_19829
    lea ecx, [ebx - 1]
    mov dword [0xbccb8], ecx
    test ecx, ecx
    jne short loc_19829
    mov dh, 1
    mov byte [0xc003b], dh
    mov byte [0xc003a], dh
loc_19829:
    mov bh, byte [0x972e]
    mov ax, word [0xcf658]
    xor bh, 1
    mov word [ebp - 0x18], ax
    mov byte [0x972e], bh
    test ax, ax
    jl near loc_198c8
loc_1984b:
    mov edx, dword [ebp - 0x1a]
    sar edx, 0x10
    imul eax, edx, 0xa
    mov esi, dword [0xbd70c]
    and esi, strict dword 0xff
    imul esi, esi, strict dword 0xa0
    mov edi, 0xb8bf0
    mov ecx, 0xa
    add esi, strict dword 0x9beb0
    add edi, eax
    add esi, eax
    cmp ecx, 4
    jae short loc_1988c
    test cl, 1
    je short loc_19885
    movsb
loc_19885:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw with Watcom prefix order
    jmp short loc_198b7
loc_1988c:
    test edi, 1
    je short loc_19896
    movsb
    dec ecx
loc_19896:
    test edi, 2
    je short loc_198a3
    movsw
    sub ecx, 2
loc_198a3:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_198b1
    movsw
loc_198b1:
    test bl, 1
    je short loc_198b7
    movsb
loc_198b7:
    mov ax, word [nosplit edx*2 + 0xcf540]
    mov word [ebp - 0x18], ax
    test ax, ax
    jge short loc_1984b
loc_198c8:
    inc dword [0xbd70c]
    call 0x23d70
    mov ax, word [0xcf658]
    mov esi, 0xffffffff
    mov word [ebp - 0x18], ax
    test ax, ax
    jl near loc_19a57
loc_198eb:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul eax, eax, 0xa
    test byte [eax + 0xb8bf9], 4
    jne short loc_19905
    mov esi, dword [ebp - 0x18]
    jmp near loc_19a3c
loc_19905:
    mov eax, dword [ebp - 0x18]
    cmp ax, word [0xcf65e]
    jne short loc_1991b
    mov eax, QUIT_MESSAGE
    call GAME_EXIT
loc_1991b:
    mov edi, dword [ebp - 0x18]
    cmp di, word [0xbf562]
    jne short loc_1994c
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    mov ax, word [nosplit eax*2 + 0xcf540]
    mov word [0xbf562], ax
    test ax, ax
    jge short loc_1994c
    mov ax, word [0xcf658]
    mov word [0xbf562], ax
loc_1994c:
    mov eax, dword [ebp - 0x18]
    cmp ax, word [0xcf658]
    jne short loc_19970
    mov eax, dword [0xcf656]
    sar eax, 0x10
    mov ax, word [nosplit eax*2 + 0xcf540]
    mov word [0xcf658], ax
    jmp short loc_19989
loc_19970:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    movsx edx, si
    mov ax, word [nosplit eax*2 + 0xcf540]
    mov word [nosplit edx*2 + 0xcf540], ax
loc_19989:
    mov ch, 1
    mov bx, word [0xcf65c]
    mov eax, dword [0xbffe3]
    dec ebx
    dec eax
    mov word [0xcf65c], bx
    mov dword [0xbffe3], eax
    call CLOSE_DEMO_WRITE
    mov byte [0xc003a], ch
    mov byte [0xc003b], ch
    call 0x2c814
    push dword SOURCE_NAME
    mov edi, dword [ebp - 0x1a]
    push dword 0x81
    sar edi, 0x10
    call 0x5d849
    mov eax, edi
    imul edi, edi, strict dword 0x623
    shl eax, 5
    add eax, strict dword 0xbf578
    push eax
    push dword PLAYER_QUIT_FORMAT
    push dword 0x8bcc0
    call 0x5d8cc
    mov eax, 0x8be10
    add esp, 0xc
    add eax, edi
    call 0x29578
    mov eax, dword [edi + 0x8c106]
    mov edx, 0x8bcc0
    sar eax, 0x10
    mov ecx, 0xa0
    call 0x40ecd
    mov dword [0xbd9b0], edx
    mov word [0xbf564], cx
    test si, si
    jge short loc_19a3c
    cmp byte [0x93a1], 0
    jne short loc_19a3c
    mov eax, HOST_QUIT_MESSAGE
    call GAME_EXIT
loc_19a3c:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    mov ax, word [nosplit eax*2 + 0xcf540]
    mov word [ebp - 0x18], ax
    test ax, ax
    jge near loc_198eb
loc_19a57:
    cmp word [0xcf65c], 2
    jl near loc_19b01
    mov eax, dword [0xbd70c]
    and eax, 7
    cmp eax, 7
    jne near loc_19b01
    mov ax, word [0xcf658]
    mov dh, byte [0x216f68]
    mov word [ebp - 0x18], ax
    test ax, ax
    jl short loc_19ace
loc_19a8b:
    mov edi, dword [ebp - 0x1a]
    sar edi, 0x10
    imul eax, edi, strict dword 0x623
    mov dl, byte [eax + 0x8c024]
    add dl, byte [eax + 0x8c028]
    mov bh, byte [eax + 0x8c02c]
    mov cl, byte [eax + 0x8c0a4]
    add dl, bh
    mov al, byte [eax + 0x8c030]
    add dl, cl
    add al, dl
    add dh, al
    mov ax, word [nosplit edi*2 + 0xcf540]
    mov word [ebp - 0x18], ax
    test ax, ax
    jge short loc_19a8b
loc_19ace:
    mov esi, dword [0xcf65c]
    sar esi, 0x10
    lea eax, [esi*4]
    mov edi, dword [eax + 0x1c040]
    mov ebx, dword [eax + 0x1c040]
    and edi, strict dword 0xff
    shl esi, 8
    inc ebx
    mov byte [edi + esi + 0x1b040], dh
    mov dword [eax + 0x1c040], ebx
loc_19b01:
    cmp dword [0xbffab], 1
    jne short loc_19b0f
    call RECORD_DEMO
loc_19b0f:
    cmp word [0xbfaf7], 0
    jne short loc_19b29
    call KRAND
    mov word [0xbf566], ax
    call 0x24c58
loc_19b29:
    mov ax, word [0xcf658]
    mov word [ebp - 0x18], ax
    test ax, ax
    jl short loc_19b64
loc_19b38:
    cmp word [0xbfaf7], 0
    jne short loc_19b4d
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    call 0x2a0f0
loc_19b4d:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    mov ax, word [nosplit eax*2 + 0xcf540]
    mov word [ebp - 0x18], ax
    test ax, ax
    jge short loc_19b38
loc_19b64:
    cmp word [0xbfaf7], 0
    jne short loc_19baf
    call 0x24bcc
    call 0x25528
    call 0x24e28
    call 0x251d8
    call 0x25550
    call 0x56ea8
    call 0x581ec
    call 0x58790
    call 0x59638
    mov eax, dword [0xbffeb]
    call 0x519e8
    call 0x5524c
    call 0x28e70
loc_19baf:
    call CORRECT_PREDICTED_MOVEMENT
    cmp byte [0x972e], 1
    jne short loc_19bc7
    call 0x2c1e8
    call 0x51a50
loc_19bc7:
    xor al, al
loc_19bc9:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

do_orders:
    push ebp
    mov ebp, esp
    mov eax, 0x1598
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

do_bonus_2:
    push ebp
    mov ebp, esp
    mov eax, 0x15b0
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

vglass:
    push ebp
    mov ebp, esp
    mov eax, 0x15c8
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 4
    nop

lots_of_glass:
    push ebp
    mov ebp, esp
    mov eax, 0x15e0
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

lots_of_popcorn:
    push ebp
    mov ebp, esp
    mov eax, 0x15fc
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

sprite_glass:
    push ebp
    mov ebp, esp
    mov eax, 0x161c
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

ceiling_glass:
    push ebp
    mov ebp, esp
    mov eax, 0x1638
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

lots_of_colour_glass:
    push ebp
    mov ebp, esp
    mov eax, 0x1654
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

setup_game_buttons:
    push ebp
    mov ebp, esp
    push edx
    xor edx, edx
    xor eax, eax
    call DEFINE_CONTROL_FLAG
%assign action 1
%rep 51
    mov eax, action
    xor edx, edx
    call DEFINE_CONTROL_FLAG
%assign action action + 1
%endrep
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    nop

do_bonus:
    push ebp
    mov ebp, esp
    mov eax, 0x1678
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

get_time:
    push ebp
    mov ebp, esp
    mov eax, dword [0x216f7c]
    mov esp, ebp
    pop ebp
    ret

center_center:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push dword SOURCE_NAME
    push dword 0x13b
    call SET_DEBUG_LOCATION
    push dword 0x1690
    call PRINTF
    add esp, 4
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

upper_left:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push dword SOURCE_NAME
    push dword 0x141
    call SET_DEBUG_LOCATION
    push dword 0x16b8
    call PRINTF
    add esp, 4
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

lower_right:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push dword SOURCE_NAME
    push dword 0x147
    call SET_DEBUG_LOCATION
    push dword 0x16f0
    call PRINTF
    add esp, 4
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

center_throttle:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push dword SOURCE_NAME
    push dword 0x14d
    call SET_DEBUG_LOCATION
    push dword 0x1728
    call PRINTF
    add esp, 4
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

center_rudder:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push dword SOURCE_NAME
    push dword 0x153
    call SET_DEBUG_LOCATION
    push dword 0x1758
    call PRINTF
    add esp, 4
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 10 db 0    ; Padding after the calibration helpers
