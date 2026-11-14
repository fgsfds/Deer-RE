bits 32
org 0x263cc

%define GET_PACKETS 0x11fb0
%define GAME_EXIT 0x14f28
%define NEW_GAME 0x2db2c
%define ENTER_LEVEL 0x2ece8
%define FLUSH_PERMS 0x47f72
%define PROBE 0x25874
%define MENU_TEXT 0x25e2c
%define DRAW_BAR 0x26108
%define ROTATE_SPRITE 0x47f83
%define DRAW_TEXT 0x118f0

options_dispatch:
    dd loc_26440 - 0x10000
    dd loc_264fe - 0x10000
    dd loc_265a8 - 0x10000
    dd loc_266ab - 0x10000

draw_menu_options:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    call 0x51b68
    test eax, eax
    je short loc_26400
    cmp dword [0x99c0], 0
    jne short loc_26400
    mov eax, dword [0x216f7c]
    mov dword [0x99c0], eax
loc_26400:
    mov ebx, dword [0x99c0]
    test ebx, ebx
    je short loc_2642a
    mov edx, dword [0x216f7c]
    sub edx, ebx
    cmp edx, 0x28
    jle short loc_2642a
    xor esi, esi
    mov edi, 1
    mov dword [0x99c0], esi
    mov dword [0x99c4], edi
loc_2642a:
    mov eax, dword [0x99a0]
    cmp eax, 3
    ja near loc_2675a
    jmp dword [cs:nosplit eax*4 + options_dispatch - 0x10000]
loc_26440:
    mov edx, dword [0x216f7c]
    sub edx, dword [0x99b8]
    cmp edx, strict dword 0xf0
    jl near loc_2675a
    cmp dword [0x99c4], 0
    je near loc_2675a
    call 0x50fe0
    and eax, 0x3f
    cmp eax, 0x20
    jge near loc_2675a
    mov dword [0x99a0], 1
    call 0x50fe0
    mov edx, eax
    and edx, strict dword 0xff
    mov eax, 0xa0
    sub edx, strict dword 0x80
    sub eax, edx
    mov dword [0x99a4], eax
    call 0x50fe0
    mov edx, eax
    and edx, 0x7f
    add edx, strict dword 0x7c0
    and edx, strict dword 0x7ff
    mov word [0x99b0], dx
    call 0x50fe0
    mov edx, eax
    and edx, strict dword 0xfff
    sub edx, strict dword 0xffa
    mov dword [0x99ac], edx
    call 0x50fe0
    mov edx, eax
    and edx, 0xf
    add edx, strict dword 0x380
    mov word [0x99b2], dx
    xor ebx, ebx
    mov dword [0x99c4], ebx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_264fe:
    mov ebx, dword [0x99a8]
    cmp ebx, 0x36
    jge short loc_2652f
    mov edx, dword [0x216f7c]
    sub edx, dword [0x99b4]
    cmp edx, 2
    jle short loc_26543
    mov eax, dword [0x216f7c]
    lea edi, [ebx + 2]
    mov dword [0x99b4], eax
    mov dword [0x99a8], edi
    jmp short loc_26543
loc_2652f:
    mov dword [0x99a0], 2
    mov eax, dword [0x216f7c]
    mov dword [0x99bc], eax
loc_26543:
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    mov ebx, 0x8000
    push byte 0
    mov edx, 0xf0
    mov ecx, dword [0x99ae]
    push byte 0xa
    mov esi, dword [0x99a8]
    mov eax, dword [0x99b0]
    push byte 0
    sar eax, 0x10
    push byte 0
    sar ecx, 0x10
    push eax
    mov eax, dword [0x99ac]
    sub edx, esi
    sub ebx, eax
    mov eax, dword [0x99a4]
    shl edx, 0x10
    shl eax, 0x10
    call ROTATE_SPRITE
    xor ebx, ebx
    mov dword [0x99c4], ebx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_265a8:
    cmp dword [0x99c4], 1
    jne short loc_265d0
    call 0x50fe0
    and eax, 0x3f
    cmp eax, 0x20
    jle short loc_265c7
    dec word [0x99b2]
    jmp short loc_265fb
loc_265c7:
    inc word [0x99b2]
    jmp short loc_265fb
loc_265d0:
    call 0x50fe0
    and eax, 0x7f
    cmp eax, 0x30
    jne short loc_265fb
    mov edx, dword [0x216f7c]
    sub edx, dword [0x99bc]
    cmp edx, strict dword 0xf0
    jle short loc_265fb
    mov dword [0x99a0], 3
loc_265fb:
    cmp word [0x99b2], 0x380
    jge short loc_2660f
    mov word [0x99b2], 0x38f
loc_2660f:
    cmp word [0x99b2], 0x38f
    jle short loc_26623
    mov word [0x99b2], 0x380
loc_26623:
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    mov ebx, 0x8000
    push byte 0
    mov edx, 0xf0
    mov ecx, dword [0x99ae]
    push byte 0
    mov esi, dword [0x99ac]
    mov edi, dword [0x99a8]
    push byte 0xa
    sar ecx, 0x10
    push byte 0
    sub ebx, esi
    mov eax, dword [0x99b0]
    push byte 0
    sar eax, 0x10
    sub edx, edi
    push eax
    mov eax, dword [0x99a4]
    shl edx, 0x10
    shl eax, 0x10
    call ROTATE_SPRITE
    mov edx, dword [0x216f7c]
    sub edx, dword [0x99bc]
    cmp edx, strict dword 0x3c0
    jle near loc_2675a
    mov dword [0x99a0], 3
    xor ebx, ebx
    mov dword [0x99c4], ebx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_266ab:
    cmp dword [0x99a8], 0
    jle near loc_26748
    mov edx, dword [0x216f7c]
    sub edx, dword [0x99b4]
    cmp edx, 2
    jle short loc_266e2
    mov eax, dword [0x216f7c]
    mov ecx, dword [0x99a8]
    sub ecx, 2
    mov dword [0x99b4], eax
    mov dword [0x99a8], ecx
loc_266e2:
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    mov ebx, 0x8000
    push byte 0
    mov edx, 0xf0
    mov ecx, dword [0x99ae]
    push byte 0
    mov esi, dword [0x99ac]
    mov edi, dword [0x99a8]
    push byte 0xa
    sar ecx, 0x10
    push byte 0
    sub ebx, esi
    mov eax, dword [0x99b0]
    push byte 0
    sar eax, 0x10
    sub edx, edi
    push eax
    mov eax, dword [0x99a4]
    shl edx, 0x10
    shl eax, 0x10
    call ROTATE_SPRITE
    xor ebx, ebx
    mov dword [0x99c4], ebx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_26748:
    mov eax, dword [0x216f7c]
    xor edx, edx
    mov dword [0x99b8], eax
    mov dword [0x99a0], edx
loc_2675a:
    xor ebx, ebx
    mov dword [0x99c4], ebx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

update_view_size:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push byte 0x4a
    push byte 0
    push byte 0
    mov ebx, 0x10000
    mov edx, 0x640000
    push dword 0x1b80
    xor ecx, ecx
    mov eax, 0xa00000
    call ROTATE_SPRITE
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

menu_entry_helper:
    push ebp
    mov ebp, esp
    mov eax, dword [0xbd714]
    mov esp, ebp
    pop ebp
    ret

menu_dispatch:
    dd loc_26a6e - 0x10000
    dd loc_26ad0 - 0x10000
    dd loc_26b19 - 0x10000
    dd loc_26b7f - 0x10000
    dd loc_26bc6 - 0x10000
    dd loc_26c0b - 0x10000
    dd loc_26d89 - 0x10000
    dd loc_26d89 - 0x10000
    dd loc_26d1c - 0x10000
    dd loc_26d37 - 0x10000
    dd loc_26d54 - 0x10000
    dd loc_26d71 - 0x10000
    dd loc_26f08 - 0x10000
    dd loc_26f19 - 0x10000
    dd loc_26f25 - 0x10000
    dd loc_26f36 - 0x10000
    dd loc_27286 - 0x10000
    dd loc_27292 - 0x10000
    dd loc_2729e - 0x10000
    dd loc_272aa - 0x10000
    dd loc_272b6 - 0x10000

menus:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    cmp dword [0xc0078], 1
    jne short loc_26871
    cmp dword [0x21f300], 0
    je short loc_26871
    cmp word [0xc45c0], 0
    je short loc_26864
    mov cx, word [0xc45ba]
    test cx, cx
    jne short loc_26864
    call 0x60694
    shl eax, 3
    test ax, ax
    je short loc_2685b
    shl eax, 3
    mov word [0xc45c0], ax
    jmp short loc_2687a
loc_2685b:
    mov word [0xc45c0], cx
    jmp short loc_2687a
loc_26864:
    call 0x60694
    mov word [0xc45c0], ax
    jmp short loc_2687a
loc_26871:
    xor edx, edx
    mov word [0xc45c0], dx
loc_2687a:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dl, byte [eax + 0x8c34c]
    test dl, 1
    jne short loc_2689f
    mov byte [0x18af65], 1
    jmp near loc_2796f
loc_2689f:
    mov dh, dl
    xor edi, edi
    and dh, 0xef
    mov word [eax + 0x8c0f4], di
    mov byte [eax + 0x8c34c], dh
    cmp word [0xcf65c], 1
    jle short loc_268dd
    call GET_PACKETS
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp byte [eax + 0x8c34c], 4
    je near loc_2796f
loc_268dd:
    mov eax, dword [0x216f7c]
    shl eax, 4
    and eax, strict dword 0x7ff
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    mov edx, 4
    sar eax, 0xb
    sub edx, eax
    mov ecx, dword [0xbd714]
    mov word [0xc45b6], dx
    cmp ecx, strict dword 0x3e8
    jl short loc_2691b
    cmp ecx, strict dword 0xbb7
    jle short loc_26936
loc_2691b:
    mov edi, dword [0xbd714]
    cmp edi, strict dword 0x12c
    jl short loc_26931
    cmp edi, strict dword 0x171
    jle short loc_26936
loc_26931:
    call 0x2c814
loc_26936:
    mov eax, dword [0xbd714]
    cmp eax, 0x7d
    jb short loc_26995
    jbe near loc_27268
    cmp eax, strict dword 0x190
    jb short loc_26974
    jbe near loc_276e0
    cmp eax, strict dword 0x1f4
    jb near loc_2793b
    jbe near loc_27796
    cmp eax, strict dword 0x1f5
    je near loc_2789b
    jmp near loc_2793b
loc_26974:
    cmp eax, strict dword 0xc8
    jb near loc_2793b
    jbe near loc_27410
    cmp eax, strict dword 0x12c
    je near loc_275da
    jmp near loc_2793b
loc_26995:
    cmp eax, 0x32
    jb short loc_269bd
    jbe near loc_26ce6
    cmp eax, 0x6e
    jb near loc_2793b
    jbe near loc_26ee6
    cmp eax, 0x73
    je near loc_270cc
    jmp near loc_2793b
loc_269bd:
    test eax, eax
    jne near loc_2793b
    call draw_menu_options
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push byte 0xa
    mov esi, 0xa0
    mov ebx, 0x5000
    push byte 0
    mov edx, 0x200000
    xor ecx, ecx
    push byte 0
    movsx eax, si
    push dword 0x692
    shl eax, 0x10
    call ROTATE_SPRITE
    push byte 0
    mov ecx, 6
    mov ebx, 0x12
    mov edx, 0x54
    movsx eax, si
    call PROBE
    test ax, ax
    jl near loc_26c4b
    cmp dword [0xbffe3], 1
    jle short loc_26a51
    test ax, ax
    jne short loc_26a51
    cmp dword [0xbffab], 2
    je short loc_26a51
    mov word [0xc45b8], ax
    mov eax, 0x258
    call 0x25758
    jmp near loc_26c60
loc_26a51:
    mov word [0xc45b8], ax
    cmp ax, strict word 5
    ja near loc_26c60
    and eax, strict dword 0xffff
    jmp dword [cs:nosplit eax*4 + menu_dispatch - 0x10000]
loc_26a6e:
    cmp byte [0x93a2], 4
    jne short loc_26a8a
    mov ax, word [0xcf65e]
    cmp ax, word [0xcf658]
    jne near loc_26c60
loc_26a8a:
    xor eax, eax
    xor ebx, ebx
    xor edx, edx
    xor edi, edi
    mov dword [0x99a0], eax
    mov dword [0x99a4], eax
    mov dword [0x99a8], eax
    mov dword [0x99ac], eax
    mov word [0x99b2], dx
    xor eax, eax
    mov dword [0x99b4], edi
    mov word [0x99b0], ax
    mov eax, 0x6e
    mov dword [0x99b8], ebx
    call 0x25758
    jmp near loc_26c60
loc_26ad0:
    mov eax, 0x73
    xor edi, edi
    xor ebx, ebx
    xor ecx, ecx
    mov dword [0x99a0], edi
    mov dword [0x99a4], edi
    mov dword [0x99a8], edi
    mov dword [0x99ac], edi
    mov word [0x99b2], cx
    mov dword [0x99b4], edi
    xor ebx, edi
    mov dword [0x99b8], edi
    mov word [0x99b0], bx
    call 0x25758
    jmp near loc_26c60
loc_26b19:
    cmp byte [0x93a2], 4
    jne short loc_26b35
    mov ax, word [0xcf658]
    cmp ax, word [0xcf65e]
    jne near loc_26c60
loc_26b35:
    xor ecx, ecx
    xor eax, eax
    xor edx, edx
    mov dword [0x99a0], ecx
    mov dword [0x99a4], ecx
    mov dword [0x99a8], ecx
    mov dword [0x99ac], ecx
    mov dword [0x99b4], ecx
    mov dword [0x99b8], ecx
    xor eax, ecx
    xor edx, ecx
    mov word [0x99b0], ax
    mov eax, 0x12c
    mov word [0x99b2], dx
    call 0x25758
    jmp near loc_26c60
loc_26b7f:
    mov eax, 0xc8
    xor ebx, ebx
    xor edx, edx
    mov dword [0x99a0], ebx
    mov dword [0x99a4], ebx
    mov dword [0x99a8], ebx
    mov dword [0x99ac], ebx
    mov dword [0x99b4], edx
    xor ebx, ebx
    mov dword [0x99b8], edx
    mov word [0x99b0], bx
    mov word [0x99b2], bx
    call 0x25758
    jmp near loc_26c60
loc_26bc6:
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    mov dword [0x99a0], edx
    mov dword [0x99a4], edx
    mov dword [0x99a8], edx
    mov dword [0x99ac], edx
    mov word [0x99b0], ax
    mov dword [0x99b4], ebx
    mov dword [0x99b8], ebx
    xor edx, edx
    mov eax, 0x190
    mov word [0x99b2], dx
    call 0x25758
    jmp short loc_26c60
loc_26c0b:
    xor eax, eax
    xor ecx, ecx
    xor edi, edi
    mov dword [0x99a0], eax
    mov dword [0x99a4], eax
    mov dword [0x99a8], eax
    mov dword [0x99ac], eax
    mov word [0x99b2], di
    mov dword [0x99b4], eax
    mov dword [0x99b8], eax
    xor ecx, eax
    mov eax, 0x1f4
    mov word [0x99b0], cx
    call 0x25758
    jmp short loc_26c60
loc_26c4b:
    cwde
    cmp eax, -1
    jne short loc_26c60
    mov eax, 0x1f4
    call 0x25758
    call 0x5adcc
loc_26c60:
    push dword 0x2c30
    mov edx, 0x54
    movsx esi, si
    xor ecx, ecx
    xor ebx, ebx
    mov eax, esi
    call MENU_TEXT
    push dword 0x2c40
    mov edx, 0x66
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2c50
    mov edx, 0x78
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2c5c
    mov edx, 0x8a
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2c68
    mov edx, 0x9c
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2c70
    mov edx, 0xae
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    jmp near loc_2793b
loc_26ce6:
    mov esi, 0xa0
    push byte 0
    mov ecx, 5
    mov ebx, 0x12
    mov edx, 0x48
    movsx eax, si
    call PROBE
    inc eax
    cmp ax, strict word 5
    ja near loc_26dfb
    and eax, strict dword 0xffff
    jmp dword [cs:nosplit eax*4 + 0x167d4]
loc_26d1c:
    mov edx, 1
    mov eax, 0x12c
    mov word [0xc45bc], dx
    call 0x25758
    jmp near loc_26dfb
loc_26d37:
    mov word [0xc45bc], 2
    call 0x5adcc
    mov eax, 0xc8
    call 0x25758
    jmp near loc_26dfb
loc_26d54:
    mov word [0xc45bc], 3
    call 0x5adcc
    mov eax, 0x190
    call 0x25758
    jmp near loc_26dfb
loc_26d71:
    mov ecx, 4
    mov eax, 0x1f5
    mov word [0xc45bc], cx
    call 0x25758
    jmp short loc_26dfb
loc_26d89:
    call 0x592f0
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edi, dword [0xbffe3]
    mov dh, byte [eax + 0x8c34c]
    xor ebx, ebx
    and dh, 0xfe
    mov word [0xc45bc], bx
    mov byte [eax + 0x8c34c], dh
    cmp edi, 2
    jge short loc_26def
    cmp dword [0xbffab], 2
    je short loc_26def
    mov bl, 1
    mov eax, dword [0xbd6f8]
    mov byte [0xc0049], bl
    mov dword [0x216f7c], eax
    mov eax, dword [0x216f7c]
    mov edx, 0x10000
    mov dword [0x9528], eax
    mov dword [0x9524], edx
loc_26def:
    mov byte [0x18af67], 0xc7
    call 0x2c814
loc_26dfb:
    cmp dword [0xbffeb], 4
    jge short loc_26e75
    push dword 0x2c78
    mov edx, 0x48
    movsx esi, si
    xor ecx, ecx
    xor ebx, ebx
    mov eax, esi
    call MENU_TEXT
    push dword 0x2c50
    mov edx, 0x5a
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2c5c
    mov edx, 0x6c
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2c88
    mov edx, 0x7e
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2c90
    mov edx, 0x90
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    jmp near loc_2793b
loc_26e75:
    push dword 0x2c9c
    mov edx, 0x48
    movsx esi, si
    xor ecx, ecx
    xor ebx, ebx
    mov eax, esi
    call MENU_TEXT
    push dword 0x2cac
    mov edx, 0x5a
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2c5c
    mov edx, 0x6c
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2c88
    mov edx, 0x7e
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2cbc
    mov edx, 0x90
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    jmp near loc_2793b
loc_26ee6:
    mov ebx, 0xa0
    mov ax, word [0x9988]
    mov word [ebp - 0x18], bx
    cmp ax, strict word 3
    ja short loc_26f08
    and eax, strict dword 0xffff
    jmp dword [cs:nosplit eax*4 + 0x167ec]
loc_26f08:
    mov eax, 0x1bba
    mov esi, 0x1b81
    mov edx, 0x10
    jmp short loc_26f45
loc_26f19:
    mov eax, 0x1bbb
    mov esi, 0x1b82
    jmp short loc_26f40
loc_26f25:
    mov eax, 0x1bbc
    mov esi, 0x1b83
    mov edx, 0x10
    jmp short loc_26f45
loc_26f36:
    mov eax, 0x1bbd
    mov esi, 0x1b84
loc_26f40:
    mov edx, 0x7f0
loc_26f45:
    mov ebx, dword [0x216f84]
    dec ebx
    push ebx
    mov ebx, dword [0x216f88]
    dec ebx
    push ebx
    push byte 0
    push byte 0
    push byte 0x4a
    push byte 0
    movsx edi, dx
    push byte 2
    mov edx, 0x380000
    mov ecx, edi
    push eax
    mov ebx, 0x6000
    mov eax, 0xf00000
    call ROTATE_SPRITE
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push byte 0xa
    push byte 0
    push byte 2
    mov ebx, 0x6000
    mov edx, 0x2a0000
    push dword 0x1bc0
    mov ecx, edi
    mov eax, 0xf00000
    call ROTATE_SPRITE
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push dword 0x9a
    push byte 0
    push byte -0x40
    mov ebx, 0x8000
    mov edx, 0xa0000
    push esi
    xor ecx, ecx
    mov eax, 0x140000
    call ROTATE_SPRITE
    push byte 0
    mov eax, dword [ebp - 0x1a]
    mov ecx, 4
    mov ebx, 0x12
    mov edx, 0x74
    sar eax, 0x10
    call PROBE
    mov edx, eax
    test ax, ax
    jl short loc_27052
    mov ecx, 0x6e
    cwde
    xor ebx, ebx
    mov dword [0xbffeb], eax
    mov dword [0xbffbb], ebx
    mov dword [0xbffaf], ebx
    mov dword [0xbffc7], ebx
    mov dword [0xbffb7], ebx
    mov eax, 1
    mov dword [0xbffbf], ebx
    mov dword [0xbffd7], eax
    mov dword [0xbffe3], eax
    call 0x5adcc
    mov eax, 0x7d
    mov dword [0x99c8], ecx
    call 0x25758
    jmp short loc_27064
loc_27052:
    cwde
    cmp eax, -1
    jne short loc_27064
    xor eax, eax
    call 0x25758
    call 0x5adcc
loc_27064:
    test dx, dx
    jge near loc_2793b
    push dword 0x2ccc
    mov esi, dword [ebp - 0x1a]
    mov edx, 0x74
    xor ecx, ecx
    sar esi, 0x10
    xor ebx, ebx
    mov eax, esi
    call MENU_TEXT
    push dword 0x2cdc
    mov edx, 0x86
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2cf0
    mov edx, 0x98
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2d00
    mov edx, 0xaa
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    jmp near loc_2793b
loc_270cc:
    mov edx, 0xa0
    mov ax, word [0x9988]
    mov word [ebp - 0x20], dx
    test ax, ax
    jbe short loc_270e6
    cmp ax, strict word 1
    je short loc_270f7
loc_270e6:
    mov edx, 0x1bbe
    mov edi, 0x1b85
    mov eax, 0x10
    jmp short loc_27106
loc_270f7:
    mov edx, 0x1bbf
    mov edi, 0x1b86
    mov eax, 0x7f0
loc_27106:
    mov ebx, dword [0x216f84]
    dec ebx
    push ebx
    mov ebx, dword [0x216f88]
    dec ebx
    push ebx
    push byte 0
    push byte 0
    push byte 0x4a
    push byte 0
    movsx esi, ax
    push byte 2
    mov eax, 0xf00000
    mov ecx, esi
    push edx
    mov ebx, 0x6000
    mov edx, 0x380000
    call ROTATE_SPRITE
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push byte 0xa
    push byte 0
    push byte 2
    mov ebx, 0x6000
    mov edx, 0x2a0000
    push dword 0x1bc0
    mov ecx, esi
    mov eax, 0xf00000
    call ROTATE_SPRITE
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push dword 0x9a
    push byte 0
    push byte -0x40
    mov ebx, 0x8000
    mov edx, 0xa0000
    push edi
    xor ecx, ecx
    mov eax, 0x140000
    call ROTATE_SPRITE
    push byte 0
    mov eax, dword [ebp - 0x22]
    mov ecx, 2
    mov ebx, 0x12
    mov edx, 0x74
    sar eax, 0x10
    call PROBE
    mov edx, eax
    test ax, ax
    jl short loc_27218
    mov ecx, 1
    mov edi, 0x73
    cwde
    xor esi, esi
    add eax, 4
    mov dword [0xbffd7], ecx
    mov dword [0xbffbb], esi
    mov dword [0xbffaf], esi
    mov dword [0xbffc7], esi
    mov dword [0xbffb7], esi
    mov dword [0xbffbf], esi
    mov dword [0xbffe3], ecx
    mov dword [0xbffeb], eax
    call 0x5adcc
    mov eax, 0x7d
    mov dword [0x99c8], edi
    call 0x25758
    jmp short loc_2722a
loc_27218:
    cwde
    cmp eax, -1
    jne short loc_2722a
    xor eax, eax
    call 0x25758
    call 0x5adcc
loc_2722a:
    test dx, dx
    jge near loc_2793b
    push dword 0x2d10
    mov esi, dword [ebp - 0x22]
    mov edx, 0x74
    xor ecx, ecx
    sar esi, 0x10
    xor ebx, ebx
    mov eax, esi
    call MENU_TEXT
    push dword 0x2d20
    mov edx, 0x86
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    jmp near loc_2793b
loc_27268:
    mov ax, word [0x9988]
    mov edi, 0xa0
    cmp ax, strict word 4
    ja short loc_27286
    and eax, strict dword 0xffff
    jmp dword [cs:nosplit eax*4 + 0x167fc]
loc_27286:
    mov eax, 0x1bd4
    mov esi, 0x1b9a
    jmp short loc_272c0
loc_27292:
    mov eax, 0x1bd5
    mov esi, 0x1b9b
    jmp short loc_272c0
loc_2729e:
    mov eax, 0x1bd6
    mov esi, 0x1b9c
    jmp short loc_272c0
loc_272aa:
    mov eax, 0x1bd7
    mov esi, 0x1b9d
    jmp short loc_272c0
loc_272b6:
    mov eax, 0x1bd8
    mov esi, 0x1b9e
loc_272c0:
    mov edx, dword [0x216f84]
    dec edx
    push edx
    mov edx, dword [0x216f88]
    dec edx
    push edx
    push byte 0
    push byte 0
    push byte 0x4a
    push byte 0
    push byte 2
    mov ebx, 0x8000
    xor ecx, ecx
    push eax
    mov edx, 0x380000
    mov eax, 0xf00000
    call ROTATE_SPRITE
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push dword 0x9a
    push byte 0
    push byte -0x40
    mov ebx, 0x8000
    mov edx, 0x40000
    push esi
    xor ecx, ecx
    mov eax, 0x80000
    call ROTATE_SPRITE
    push byte 0
    mov ecx, 5
    mov ebx, 0x12
    mov edx, 0x78
    movsx eax, di
    call PROBE
    mov ecx, eax
    test ax, ax
    jl short loc_2737e
    mov edx, dword [0xbf560]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    cwde
    mov ebx, 1
    mov dword [edx + 0x8c42f], eax
    call 0x592f0
    xor edx, edx
    xor eax, eax
    mov dl, byte [0xbffeb]
    call NEW_GAME
    mov eax, 4
    call ENTER_LEVEL
    jmp short loc_27396
loc_2737e:
    cwde
    cmp eax, -1
    jne short loc_27396
    call 0x5adcc
    mov eax, dword [0x99c6]
    sar eax, 0x10
    call 0x25758
loc_27396:
    test cx, cx
    jge near loc_2793b
    push dword 0x2d30
    mov edx, 0x78
    movsx esi, di
    xor ecx, ecx
    xor ebx, ebx
    mov eax, esi
    call MENU_TEXT
    push dword 0x2d38
    mov edx, 0x8a
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2d40
    mov edx, 0x9c
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2d54
    mov edx, 0xae
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push dword 0x2d60
    mov edx, 0xc0
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    jmp near loc_2793b
loc_27410:
    push dword 0x2c5c
    mov edx, 0xf
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    mov cx, word [0x9988]
    mov esi, 0x28
    test cx, cx
    je short loc_2743f
    cmp cx, 1
    jne short loc_27446
loc_2743f:
    mov eax, 1
    jmp short loc_27448
loc_27446:
    xor eax, eax
loc_27448:
    push byte 0
    mov ecx, 3
    mov ebx, 0xf
    mov word [0xc45ba], ax
    movsx eax, si
    mov edx, 0x31
    add eax, 6
    call PROBE
    mov edi, eax
    cwde
    cmp eax, -1
    jne short loc_2749c
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 4
    je short loc_27495
    call 0x592f0
    mov eax, 0x32
    jmp short loc_27497
loc_27495:
    xor eax, eax
loc_27497:
    call 0x25758
loc_2749c:
    cmp word [0xc45ba], 0
    jne short loc_274c3
    cmp di, 2
    jne short loc_274c3
    mov eax, dword [0xc0078]
    cmp eax, 1
    jne short loc_274c3
    mov edx, dword [0xbfffb]
    sub eax, edx
    mov dword [0xbfffb], eax
loc_274c3:
    push dword 0x2d6c
    mov edx, 0x2e
    movsx eax, si
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    push byte 0
    push byte 0
    test di, di
    sete al
    mov ecx, 8
    and eax, strict dword 0xff
    mov ebx, 0xbffb3
    push eax
    movsx eax, si
    mov edx, 0x2e
    add eax, strict dword 0xcf
    call DRAW_BAR
    test di, di
    jne short loc_2752b
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c37d]
    mov eax, dword [0xbffb3]
    sar eax, 2
    call 0x4aa2a
loc_2752b:
    call 0x5c000
    push dword 0x2d78
    mov edx, 0x3d
    sar eax, 0xa
    xor ecx, ecx
    xor ebx, ebx
    mov word [ebp - 0x1c], ax
    movsx eax, si
    call MENU_TEXT
    push byte 0
    push byte 0
    cmp di, 1
    sete al
    mov ecx, 4
    lea ebx, [ebp - 0x1c]
    and eax, strict dword 0xff
    movsx esi, si
    push eax
    mov edx, 0x3d
    lea eax, [esi + 0xcf]
    call DRAW_BAR
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    mov edx, 0x4c
    shl eax, 0xa
    xor ecx, ecx
    call 0x5c00c
    push dword 0x2d8c
    xor ebx, ebx
    mov eax, esi
    call MENU_TEXT
    mov ebx, dword [0xbfffb]
    lea eax, [esi + 0xc8]
    test ebx, ebx
    je short loc_275c4
    push dword 0x2da0
    mov edx, 0x4c
    xor ecx, ecx
    xor ebx, ebx
    call MENU_TEXT
    jmp near loc_2793b
loc_275c4:
    push dword 0x2da4
    mov edx, 0x4c
    xor ecx, ecx
    call MENU_TEXT
    jmp near loc_2793b
loc_275da:
    call 0x25830
    test eax, eax
    jne short loc_275ec
    cmp byte [0x21ec09], 0
    je short loc_27632
loc_275ec:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 4
    je short loc_27621
    call 0x53600
    call 0x592f0
    mov eax, 0x32
    call 0x25758
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_27621:
    xor eax, eax
    call 0x25758
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_27632:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul ebx, eax, strict dword 0x623
    mov edx, dword [0x216f84]
    dec edx
    mov eax, dword [0x216f88]
    mov cl, byte [ebx + 0x8c34c]
    dec eax
    test cl, 4
    je short loc_276aa
    cmp dword [0xbffeb], 4
    jge short loc_2769b
    push edx
    push eax
    push byte 0
    push byte 0
    push byte 0xa
    push byte 0
    push byte 0
    mov ebx, 0x10000
    xor ecx, ecx
    push dword 0x6c2
    mov edx, 0x640000
    mov eax, 0xa00000
    call ROTATE_SPRITE
    xor eax, eax
    call 0x59304
    xor eax, eax
    call 0x5469c
    jmp near loc_2793b
loc_2769b:
    mov eax, 2
    call 0x5469c
    jmp near loc_2793b
loc_276aa:
    push edx
    push eax
    push byte 0
    push byte 0
    push byte 0xa
    push byte 0
    push byte 0
    mov ebx, 0x10000
    xor ecx, ecx
    push dword 0x6c2
    mov edx, 0x640000
    mov eax, 0xa00000
    call ROTATE_SPRITE
    mov eax, 1
    call 0x5469c
    jmp near loc_2793b
loc_276e0:
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push byte 0x4a
    push byte 0
    push byte 0
    mov ebx, 0x10000
    mov edx, 0x640000
    push dword 0x1b80
    xor ecx, ecx
    mov eax, 0xa00000
    call ROTATE_SPRITE
    mov eax, dword [0x216f84]
    dec eax
    push eax
    mov eax, dword [0x216f88]
    dec eax
    push eax
    push byte 0
    push byte 0
    push byte 0xa
    push byte 0
    push byte 0
    mov ebx, 0x10000
    mov edx, 0x640000
    push dword 0x6c9
    xor ecx, ecx
    mov eax, 0xa00000
    call ROTATE_SPRITE
    call 0x25830
    test eax, eax
    jne short loc_27758
    cmp byte [0x21ec09], 0
    je short loc_2778c
loc_27758:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 4
    je near loc_27621
    call 0x592f0
    mov eax, 0x32
    call 0x25758
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2778c:
    call FLUSH_PERMS
    jmp near loc_2793b
loc_27796:
    mov ebx, 0x2dac
    mov edx, 0x5a
    mov eax, 0xa0
    xor ecx, ecx
    call DRAW_TEXT
    mov ebx, 0x2dbc
    mov edx, 0x64
    mov eax, 0xa0
    xor ecx, ecx
    call DRAW_TEXT
    cmp byte [0x21ebe5], 0
    je near loc_2785c
    call 0x5adcc
    cmp byte [0x93a3], 0
    jne short loc_2781b
    cmp word [0xcf65c], 1
    jle short loc_2781b
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 4
    je short loc_27814
    mov byte [0x93a3], 1
    mov eax, dword [0x216f7c]
    add eax, 0x78
    mov dword [0x999c], eax
    jmp short loc_2782f
loc_27814:
    call 0x30044
    jmp short loc_27825
loc_2781b:
    cmp word [0xcf65c], 2
    jge short loc_2782f
loc_27825:
    mov eax, 0x2dc4
    call GAME_EXIT
loc_2782f:
    mov eax, dword [0x216f7c]
    cmp eax, dword [0x999c]
    jle near loc_2793b
    cmp byte [0x93a3], 1
    jne near loc_2793b
    mov eax, 0x2dc8
    call GAME_EXIT
    jmp near loc_2793b
loc_2785c:
    push byte 0
    mov edx, 0x7c
    mov eax, 0xba
    xor ecx, ecx
    xor ebx, ebx
    call PROBE
    cwde
    cmp eax, -1
    je short loc_27884
    cmp byte [0x21ec01], 0
    je near loc_2793b
loc_27884:
    xor dl, dl
    mov byte [0x21ec01], dl
    xor ebx, ebx
    xor eax, eax
    mov dword [0x999c], ebx
    jmp near loc_27936
loc_2789b:
    mov edx, dword [0xbffeb]
    mov esi, 0xa0
    cmp edx, 4
    jge short loc_278b2
    mov ebx, 0x2dd4
    jmp short loc_278b7
loc_278b2:
    mov ebx, 0x2df0
loc_278b7:
    mov edx, 0x5a
    mov eax, 0xa0
    xor ecx, ecx
    call DRAW_TEXT
    mov ebx, 0x2dbc
    mov edx, 0x64
    movsx eax, si
    xor ecx, ecx
    call DRAW_TEXT
    cmp byte [0x21ebe5], 0
    je short loc_27908
    call 0x5adcc
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c34c], 2
    call 0x53600
    xor eax, eax
    jmp short loc_27936
loc_27908:
    push byte 0
    mov edx, 0x7c
    mov eax, 0xba
    xor ecx, ecx
    xor ebx, ebx
    call PROBE
    cwde
    cmp eax, -1
    je short loc_2792c
    cmp byte [0x21ec01], 0
    je short loc_2793b
loc_2792c:
    call 0x592f0
    mov eax, 0x32
loc_27936:
    call 0x25758
loc_2793b:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov al, byte [eax + 0x8c34c]
    and al, 1
    cmp al, 1
    je short loc_2796f
    call 0x2c814
    mov eax, dword [0x216f7c]
    mov edx, 0x10000
    mov dword [0x9528], eax
    mov dword [0x9524], edx
loc_2796f:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 7 db 0    ; Padding before the next menu routine
