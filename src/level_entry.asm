bits 32
org 0x2db2c

%define RESTORE_PLAYER_REGISTERS 0x2d729
%define RESET_WEAPONS 0x2cfa4
%define RESET_INVENTORY 0x2d098
%define LOAD_BOARD 0x30790
%define FLUSH_PERMS 0x47f72
%define SEND_PACKET 0x300b0
%define GET_PACKETS 0x11fb0
%define OPEN_GAME_FILE 0x310bf
%define READ_GAME_FILE 0x31201
%define CLOSE_GAME_FILE 0x313c4
%define PRINT_NOTICE 0x5130c
%define GAME_EXIT 0x14f28
%define SPAWN 0x15ee0
%define KRAND 0x46fa0
%define ROTATE_SPRITE 0x47f83

new_game:
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    mov cl, al
    mov ch, dl
    xor ah, ah
    mov byte [0xc0049], ah
    call wait_for_everybody
    mov esi, dword [0xbffc3]
    mov edx, 0x8be10
    cmp esi, 2
    je short loc_2db98
    cmp word [0xbfaff], 0
    jl short loc_2db98
    cmp dword [0xbffe3], 1
    jle short loc_2db98
    cmp dword [0xbfb4b], 1
    je short loc_2db98
    cmp byte [0xc1030], 1
    ja short loc_2db82
    cmp word [0xcf65c], 1
    jle short loc_2db8e
loc_2db82:
    mov eax, 1
    call 0x19eec
    jmp short loc_2db98
loc_2db8e:
    mov eax, 1
    call 0x19be8
loc_2db98:
    mov esi, 0x374
    xor eax, eax
    mov edi, dword [0xbfb47]
    mov al, ch
    mov dword [edx], 0x300
    mov dword [0xbffeb], eax
    xor eax, eax
    mov byte [edx + 0x53c], 0
    mov al, cl
    mov dword [0xbccb8], esi
    mov dword [0xbffef], eax
    xor eax, eax
    mov ecx, 0xffffffff
    mov al, bl
    mov word [0xbfaff], cx
    mov dword [0xbffe7], eax
    xor eax, eax
    mov word [0x9998], cx
    mov word [0xbfb01], ax
    mov word [0xbfaf9], ax
    cmp edi, 1
    je short loc_2dc37
    mov word [edx + 0x2c8], 1
    mov byte [edx + 0x55c], 1
    mov byte [edx + 0x55b], 1
    mov word [edx + 0x2a2], 0x30
    mov byte [edx + 0x56a], 1
    mov word [edx + 0x2be], 1
    mov word [edx + 0x2a0], 1
    mov word [edx + 0x2ca], cx
loc_2dc37:
    xor cl, cl
    mov eax, dword [0xbffe3]
    mov byte [0xc0044], cl
    cmp eax, 1
    jle short loc_2dc85
    cmp word [0xcf65c], 2
    jge short loc_2dc99
    xor ebx, ebx
    xor edx, edx
    mov word [0xcf658], bx
loc_2dc5e:
    mov eax, edx
    movsx edx, dx
    inc eax
    mov word [nosplit edx*2 + 0xcf540], ax
    mov edx, eax
    cmp ax, strict word 0x10
    jl short loc_2dc5e
    mov eax, dword [0xbffe3]
    mov word [nosplit eax*2 + 0xcf53e], 0xffff
    jmp short loc_2dc99
loc_2dc85:
    xor edi, edi
    mov eax, 0xffffffff
    mov word [0xcf658], di
    mov word [0xcf540], ax
loc_2dc99:
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
    lea eax, [byte eax + 0]

reset_player_sprites:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, strict dword 0x764
    mov byte [ebp - 0x18], al
    push byte 0xa
    push byte 0
    push byte 0
    mov eax, dword [0x8c0a2]
    push byte 0
    sar eax, 0x10
    push eax
    push byte 0
    push byte 0
    mov ecx, dword [0x8c02c]
    mov ebx, dword [0x8c028]
    push byte 0
    mov edx, dword [0x8c024]
    mov eax, dword [0x8c0a8]
    push dword 0xf05
    sar eax, 0x10
    call 0x15c74
    cmp dword [0xbffab], 2
    je near loc_2de37
    xor edx, edx
    mov word [ebp - 0x20], dx
loc_2dd03:
    mov edx, dword [ebp - 0x22]
    sar edx, 0x10
    imul eax, edx, strict dword 0x623
    mov al, byte [eax + 0x8c36a]
    mov ebx, dword [0xbffe3]
    mov byte [edx + ebp - 0x38], al
    cmp ebx, 1
    jle near loc_2de25
    cmp dword [0xbfb4b], 1
    jne near loc_2de25
    cmp word [0xbfaff], 0
    jl near loc_2de25
    xor eax, eax
loc_2dd45:
    mov ecx, dword [ebp - 0x22]
    sar ecx, 0x10
    imul ebx, ecx, strict dword 0x623
    imul ecx, ecx, 0x74
    movsx edx, ax
    lea esi, [nosplit edx*2]
    lea edi, [ebx + esi]
    mov dword [ebp - 0x28], edi
    lea edi, [ecx + esi]
    mov esi, dword [ebp - 0x28]
    mov si, word [esi + 0x8c0b0]
    inc eax
    mov word [edi + ebp - 0x750], si
    lea esi, [ecx + edx]
    mov dl, byte [edx + ebx + 0x8c36b]
    mov byte [esi + ebp - 0x72c], dl
    cmp ax, strict word 0x11
    jl short loc_2dd45
    mov ax, word [ebx + 0x8c334]
    mov word [ecx + ebp - 0x754], ax
    mov ax, word [ebx + 0x8c0d8]
    mov word [ecx + ebp - 0x752], ax
    mov al, byte [ebx + 0x8c360]
    mov byte [ecx + ebp - 0x71b], al
    mov ax, word [ebx + 0x8c102]
    mov word [ecx + ebp - 0x718], ax
    mov ax, word [ebx + 0x8c332]
    mov word [ecx + ebp - 0x716], ax
    mov ax, word [ebx + 0x8c0e2]
    mov word [ecx + ebp - 0x714], ax
    mov ax, word [ebx + 0x8c330]
    mov word [ecx + ebp - 0x712], ax
    mov ax, word [ebx + 0x8c11c]
    mov word [ecx + ebp - 0x710], ax
    mov ax, word [ebx + 0x8c32e]
    mov word [ecx + ebp - 0x70e], ax
    mov ax, word [ebx + 0x8c346]
    mov word [ecx + ebp - 0x70c], ax
loc_2de25:
    mov ebx, dword [ebp - 0x20]
    inc ebx
    mov word [ebp - 0x20], bx
    cmp bx, 0x10
    jl near loc_2dd03
loc_2de37:
    mov esi, 1
    xor eax, eax
    mov edi, 0x8be10
    call 0x2ca60
loc_2de48:
    movsx eax, si
    imul eax, eax, strict dword 0x623
    push byte 4
    mov ecx, 0x3474
    mov ebx, 0x623
    mov edx, edi
    push dword 0x335
    add eax, edi
    inc esi
    call 0x5e9ab
    cmp si, 0x10
    jl short loc_2de48
    cmp dword [0xbffab], 2
    je near loc_2dfbb
    xor edi, edi
    mov word [ebp - 0x24], di
loc_2de85:
    mov edx, dword [ebp - 0x26]
    sar edx, 0x10
    imul eax, edx, strict dword 0x623
    mov dl, byte [edx + ebp - 0x38]
    mov edi, dword [0xbffe3]
    mov byte [eax + 0x8c36a], dl
    cmp edi, 1
    jle near loc_2dfa9
    cmp dword [0xbfb4b], 1
    jne near loc_2dfa9
    cmp word [0xbfaff], 0
    jl near loc_2dfa9
    xor eax, eax
loc_2dec7:
    mov ecx, dword [ebp - 0x26]
    sar ecx, 0x10
    imul ebx, ecx, 0x74
    imul ecx, ecx, strict dword 0x623
    movsx edx, ax
    lea esi, [nosplit edx*2]
    lea edi, [ebx + esi]
    mov dword [ebp - 0x28], edi
    lea edi, [ecx + esi]
    mov esi, dword [ebp - 0x28]
    mov si, word [esi + ebp - 0x750]
    inc eax
    mov word [edi + 0x8c0b0], si
    lea esi, [ebx + edx]
    lea edi, [ecx + edx]
    mov dl, byte [esi + ebp - 0x72c]
    mov byte [edi + 0x8c36b], dl
    cmp ax, strict word 0x11
    jl short loc_2dec7
    mov ax, word [ebx + ebp - 0x754]
    mov word [ecx + 0x8c334], ax
    mov ax, word [ebx + ebp - 0x752]
    mov word [ecx + 0x8c0d8], ax
    mov al, byte [ebx + ebp - 0x71b]
    mov byte [ecx + 0x8c360], al
    mov ax, word [ebx + ebp - 0x718]
    mov word [ecx + 0x8c102], ax
    mov ax, word [ebx + ebp - 0x716]
    mov word [ecx + 0x8c332], ax
    mov ax, word [ebx + ebp - 0x714]
    mov word [ecx + 0x8c0e2], ax
    mov ax, word [ebx + ebp - 0x712]
    mov word [ecx + 0x8c330], ax
    mov ax, word [ebx + ebp - 0x710]
    mov word [ecx + 0x8c11c], ax
    mov ax, word [ebx + ebp - 0x70e]
    mov word [ecx + 0x8c32e], ax
    mov ax, word [ebx + ebp - 0x70c]
    mov word [ecx + 0x8c346], ax
loc_2dfa9:
    mov eax, dword [ebp - 0x24]
    inc eax
    mov word [ebp - 0x24], ax
    cmp ax, strict word 0x10
    jl near loc_2de85
loc_2dfbb:
    mov ecx, 9
    xor ah, ah
    mov si, word [0x216fa0]
    mov byte [0xc004a], ah
    mov word [0x99e8], cx
    mov cx, word [0xcf658]
    test si, si
    jl near loc_2e1f3
loc_2dfe6:
    movsx eax, si
    mov dx, word [nosplit eax*2 + 0x18cf68]
    imul eax, eax, 0x2c
    mov dword [ebp - 0x1c], edx
    mov edx, 0x191368
    mov bl, byte [0xc004a]
    add edx, eax
    cmp bl, 0x10
    jne short loc_2e013
    mov eax, 0x3480
    call GAME_EXIT
loc_2e013:
    xor ebx, ebx
    mov bl, byte [0xc004a]
    shl ebx, 4
    mov eax, dword [edx]
    mov dword [ebx + 0x8bd10], eax
    mov eax, dword [edx + 4]
    mov dword [ebx + 0x8bd14], eax
    mov eax, dword [edx + 8]
    mov dword [ebx + 0x8bd18], eax
    mov ax, word [edx + 0x1c]
    mov word [ebx + 0x8bd1c], ax
    mov ax, word [edx + 0x18]
    mov word [ebx + 0x8bd1e], ax
    inc byte [0xc004a]
    test cx, cx
    jl near loc_2e1df
    mov byte [edx + 0x10], 0
    mov byte [edx + 0x14], 0x18
    mov byte [edx + 0x15], 0x11
    mov word [edx + 0xc], 0x101
    mov byte [edx + 0x16], 0
    mov byte [edx + 0x12], 0x40
    mov al, byte [ebp - 0x18]
    mov word [edx + 0x1e], si
    test al, 8
    je short loc_2e097
    movsx eax, cx
    imul eax, eax, strict dword 0x623
    mov bx, word [eax + 0x8c0ae]
    test bx, bx
    jne short loc_2e0b3
loc_2e097:
    movsx eax, cx
    imul ebx, eax, strict dword 0x623
    mov ax, word [0xbf378]
    mov word [ebx + 0x8c0ae], ax
    mov word [edx + 0x2a], ax
    jmp short loc_2e0b7
loc_2e0b3:
    mov word [edx + 0x2a], bx
loc_2e0b7:
    mov eax, dword [0xbfafd]
    sar eax, 0x10
    mov word [edx + 0x22], cx
    cmp eax, -1
    jne short loc_2e125
    cmp byte [edx + 0x11], 0
    jne short loc_2e10b
    movsx edi, cx
    imul ebx, edi, strict dword 0x623
    mov al, byte [0x99e8]
    mov byte [ebx + 0x8c384], al
    mov byte [edx + 0x11], al
    mov byte [edi + 0xbf778], al
    mov di, word [0x99e8]
    inc edi
    mov word [0x99e8], di
    cmp di, 0x11
    jne short loc_2e13d
    mov word [0x99e8], 9
    jmp short loc_2e13d
loc_2e10b:
    movsx eax, cx
    imul edi, eax, strict dword 0x623
    mov bl, byte [edx + 0x11]
    mov byte [eax + 0xbf778], bl
    mov byte [edi + 0x8c384], bl
    jmp short loc_2e13d
loc_2e125:
    movsx edi, cx
    imul eax, edi, strict dword 0x623
    mov bl, byte [edi + 0xbf778]
    mov byte [eax + 0x8c384], bl
    mov byte [edx + 0x11], bl
loc_2e13d:
    movsx edi, cx
    imul ebx, edi, strict dword 0x623
    mov word [ebx + 0x8c33c], cx
    movsx ecx, si
    imul ecx, ecx, 0x47
    mov word [ebx + 0x8c108], si
    mov word [ecx + 0x2043f], si
    mov eax, dword [edx]
    mov dword [ebx + 0x8c024], eax
    mov dword [ebx + 0x8c048], eax
    mov dword [ebx + 0x8c040], eax
    mov dword [ecx + 0x2045b], eax
    mov eax, dword [edx + 4]
    mov dword [ebx + 0x8c028], eax
    mov dword [ebx + 0x8c04c], eax
    mov dword [ebx + 0x8c044], eax
    mov dword [ecx + 0x2045f], eax
    mov eax, dword [edx + 8]
    mov dword [ebx + 0x8c02c], eax
    mov dword [ebx + 0x8c050], eax
    mov dword [ecx + 0x20463], eax
    mov ax, word [edx + 0x1c]
    mov word [ebx + 0x8c0a4], ax
    mov word [ebx + 0x8c0a6], ax
    add ebx, strict dword 0x8be10
    mov ecx, dword [edx + 4]
    mov eax, dword [edx]
    add ebx, strict dword 0x29a
    mov edx, ecx
    call 0x4500f
    mov cx, word [nosplit edi*2 + 0xcf540]
    jmp short loc_2e1e7
loc_2e1df:
    movsx eax, si
    call 0x40ecd
loc_2e1e7:
    mov esi, dword [ebp - 0x1c]
    test si, si
    jge near loc_2dfe6
loc_2e1f3:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push edi
    xor eax, eax
loc_2e209:
    movsx edx, ax
    imul edx, edx, strict dword 0x623
    xor ebx, ebx
    mov word [edx + 0x8c0d6], bx
    inc eax
    mov word [edx + 0x8c0d4], bx
    cmp ax, strict word 0x10
    jl short loc_2e209
    mov ecx, 0x200
    mov edi, 0x1c080
    xor eax, eax
    cmp ecx, 4
    jae short loc_2e247
    test cl, 1
    je short loc_2e240
    stosb
loc_2e240:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2e272
loc_2e247:
    test edi, 1
    je short loc_2e251
    stosb
    dec ecx
loc_2e251:
    test edi, 2
    je short loc_2e25e
    stosw
    sub ecx, 2
loc_2e25e:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2e26c
    stosw
loc_2e26c:
    test bl, 1
    je short loc_2e272
    stosb
loc_2e272:
    lea esp, [ebp - 0x10]
    pop edi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push edx
    xor edx, edx
    mov dword [0xbd704], edx
    mov dword [0xbd708], edx
    mov dword [0xbd6fc], edx
    mov dword [0xbd700], edx
    mov dword [0x216f7c], edx
    mov ah, 1
    mov dword [0xbd6f8], edx
    mov dword [0xbd764], edx
    mov byte [0xc0049], ah
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

generate_sprite_remaps:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, strict dword 0x30c
    xor edx, edx
    mov eax, 0x34a4
    mov dl, byte [0xc0043]
    call OPEN_GAME_FILE
    mov esi, eax
    cmp eax, -1
    je short loc_2e2f2
    mov ebx, 1
    lea edx, [ebp - 0x1c]
    call READ_GAME_FILE
    jmp short loc_2e2fc
loc_2e2f2:
    mov eax, 0x34b0
    call GAME_EXIT
loc_2e2fc:
    xor edx, edx
    mov edi, 0xa6ab0
    mov dword [ebp - 0x20], edx
    jmp short loc_2e35a
loc_2e308:
    mov ebx, 1
    lea edx, [ebp - 0x18]
    mov eax, esi
    call READ_GAME_FILE
    mov ebx, 0x100
    mov edx, edi
    mov eax, esi
    xor ecx, ecx
    call READ_GAME_FILE
    push byte 1
    mov eax, dword [ebp - 0x1b]
    mov edx, edi
    xor ebx, ebx
    push byte 0
    sar eax, 0x18
    call 0x4a387
    cmp byte [ebp - 0x18], 8
    jne short loc_2e357
    push byte 1
    mov ecx, 0x20
    mov eax, 0x36
    push byte 0x20
    mov edx, edi
    mov ebx, ecx
    call 0x4a387
loc_2e357:
    inc dword [ebp - 0x20]
loc_2e35a:
    xor eax, eax
    mov ebx, dword [ebp - 0x20]
    mov al, byte [ebp - 0x1c]
    cmp eax, ebx
    jg short loc_2e308
    mov ebx, 0x300
    mov edx, 0xc0420
    mov eax, esi
    call READ_GAME_FILE
    mov ebx, 0x300
    mov edx, 0xc0d20
    mov eax, esi
    call READ_GAME_FILE
    mov ebx, 0x300
    mov edx, 0xc0120
    mov eax, esi
    call READ_GAME_FILE
    mov ebx, 0x300
    mov edx, 0xc0720
    mov eax, esi
    call READ_GAME_FILE
    mov ebx, 0x300
    mov edx, 0xc0a20
    mov eax, esi
    call READ_GAME_FILE
    xor ah, ah
    xor ecx, ecx
    mov byte [0x20a067], ah
    mov byte [0x20a066], ah
    mov byte [0x20a065], ah
    mov byte [0xc101f], ah
    mov byte [0xc101e], ah
    mov byte [0xc101d], ah
    mov byte [0xc071f], ah
    mov byte [0xc071e], ah
    mov byte [0xc071d], ah
    mov eax, esi
    mov dword [ebp - 0x20], ecx
    call CLOSE_GAME_FILE
loc_2e3ff:
    mov eax, dword [ebp - 0x20]
    mov dl, byte [ebp - 0x20]
    mov byte [eax + ebp - 0x320], dl
    lea edx, [eax + 1]
    mov dword [ebp - 0x20], edx
    cmp edx, strict dword 0x300
    jl short loc_2e3ff
    xor ecx, ecx
    mov edx, 0x20
    mov dword [ebp - 0x20], ecx
loc_2e424:
    mov eax, dword [ebp - 0x20]
    mov bl, byte [ebp - 0x20]
    lea esi, [eax + 1]
    add bl, dl
    mov dword [ebp - 0x20], esi
    mov byte [eax + ebp - 0x320], bl
    cmp edx, esi
    jg short loc_2e424
    push byte 1
    lea edx, [ebp - 0x320]
    mov eax, 7
    push byte 0
    xor ecx, ecx
    xor ebx, ebx
    call 0x4a387
    xor eax, eax
    mov dword [ebp - 0x20], eax
loc_2e45a:
    mov eax, dword [ebp - 0x20]
    mov dl, byte [ebp - 0x20]
    mov byte [eax + ebp - 0x320], dl
    lea edx, [eax + 1]
    mov dword [ebp - 0x20], edx
    cmp edx, strict dword 0x300
    jl short loc_2e45a
    push byte 1
    lea edx, [ebp - 0x320]
    mov eax, 0x1e
    push byte 0
    xor ecx, ecx
    xor ebx, ebx
    call 0x4a387
    push byte 1
    lea edx, [ebp - 0x320]
    mov eax, 0x1f
    push byte 0
    xor ecx, ecx
    xor ebx, ebx
    call 0x4a387
    push byte 1
    lea edx, [ebp - 0x320]
    mov eax, 0x20
    push byte 0
    xor ecx, ecx
    xor ebx, ebx
    call 0x4a387
    push byte 1
    lea edx, [ebp - 0x320]
    mov eax, 0x21
    push byte 0
    xor ecx, ecx
    xor ebx, ebx
    call 0x4a387
    push byte 1
    lea edx, [ebp - 0x320]
    mov eax, 0x69
    push byte 0
    xor ecx, ecx
    xor ebx, ebx
    call 0x4a387
    mov ecx, 0x40
    mov eax, 0x3f
    mov dword [ebp - 0x20], ecx
loc_2e4fa:
    mov edx, dword [ebp - 0x20]
    mov bl, byte [ebp - 0x20]
    dec eax
    sub bl, 0x18
    lea esi, [edx + 1]
    mov byte [edx + ebp - 0x320], al
    mov dword [ebp - 0x20], esi
    mov byte [edx + ebp - 0x310], bl
    cmp esi, 0x50
    jl short loc_2e4fa
    mov dh, 0x50
    mov bl, 0x51
    xor eax, eax
    mov byte [ebp - 0x2d0], dh
    mov byte [ebp - 0x2cf], bl
    mov dword [ebp - 0x20], eax
    mov edx, 0x20
loc_2e537:
    mov bl, byte [ebp - 0x20]
    mov eax, dword [ebp - 0x20]
    add bl, dl
    mov byte [eax + ebp - 0x320], bl
    lea ebx, [eax + 1]
    mov dword [ebp - 0x20], ebx
    cmp edx, ebx
    jg short loc_2e537
    push byte 1
    lea edx, [ebp - 0x320]
    mov eax, 0x22
    xor ecx, ecx
    push byte 0
    xor ebx, ebx
    xor esi, esi
    call 0x4a387
    mov dword [ebp - 0x20], esi
loc_2e56d:
    mov eax, dword [ebp - 0x20]
    mov dl, byte [ebp - 0x20]
    lea edi, [eax + 1]
    mov byte [eax + ebp - 0x320], dl
    mov dword [ebp - 0x20], edi
    cmp edi, strict dword 0x300
    jl short loc_2e56d
    xor edx, edx
    mov dword [ebp - 0x20], edx
loc_2e58d:
    mov eax, dword [ebp - 0x20]
    mov dl, byte [ebp - 0x20]
    lea ebx, [eax + 1]
    add dl, 0x81
    mov dword [ebp - 0x20], ebx
    mov byte [eax + ebp - 0x320], dl
    cmp ebx, 0x10
    jl short loc_2e58d
    mov dword [ebp - 0x20], 0x10
loc_2e5af:
    mov eax, dword [ebp - 0x20]
    mov dl, byte [ebp - 0x20]
    lea edi, [eax + 1]
    add dl, 0xc0
    mov dword [ebp - 0x20], edi
    mov byte [eax + ebp - 0x320], dl
    cmp edi, 0x20
    jl short loc_2e5af
    push byte 1
    lea edx, [ebp - 0x320]
    mov eax, 0x23
    push byte 0
    xor ecx, ecx
    xor ebx, ebx
    call 0x4a387
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

wait_for_everybody:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    cmp word [0xcf65c], 2
    jl near 0x2d729
    mov dl, 0xfa
    xor ah, ah
    mov ecx, dword [0xcf656]
    mov byte [0xc6c5a], ah
    sar ecx, 0x10
    mov byte [0x8ba80], dl
    test ecx, ecx
    jl short loc_2e648
loc_2e61d:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    cmp ecx, eax
    je short loc_2e63a
    mov ebx, 1
    mov edx, 0x8ba80
    mov eax, ecx
    call SEND_PACKET
loc_2e63a:
    mov ecx, dword [nosplit ecx*2 + 0xcf53e]
    sar ecx, 0x10
    test ecx, ecx
    jge short loc_2e61d
loc_2e648:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    inc byte [eax + 0x7f390]
    cmp byte [0x21ebd1], 0
    je short loc_2e66e
loc_2e65f:
    mov byte [0xc6c5a], 1
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2e66e:
    call GET_PACKETS
    mov eax, dword [0xcf656]
    sar eax, 0x10
    test eax, eax
    jl short loc_2e6a4
loc_2e67f:
    mov edx, dword [0xcf65c]
    sar edx, 0x10
    mov bl, byte [eax + 0x7f390]
    cmp bl, byte [edx + 0x7f390]
    jb short loc_2e6a4
    mov eax, dword [nosplit eax*2 + 0xcf53e]
    sar eax, 0x10
    test eax, eax
    jge short loc_2e67f
loc_2e6a4:
    test eax, eax
    jl near 0x2d729
    cmp byte [0x21ebd1], 0
    jne short loc_2e65f
    jmp short loc_2e66e
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    sub esp, 4
    mov dword [ebp - 0x10], eax
    mov ecx, dword [0x216f7c]
    mov byte [0xa6ab0], 9
    mov al, byte [ebp - 0x10]
    mov byte [0xa6ab1], al
    mov eax, dword [ebp - 0x10]
    and eax, strict dword 0xff00
    sar eax, 8
    mov byte [0xa6ab2], al
    mov eax, dword [ebp - 0x10]
    and eax, strict dword 0xff0000
    sar eax, 0x10
    mov byte [0xa6ab3], al
    mov eax, dword [ebp - 0x10]
    and eax, strict dword 0x7f000000
    sar eax, 0x18
    mov byte [0xa6ab4], al
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    add eax, eax
    cmp word [eax + 0xcf540], 0
    jge short loc_2e724
    mov eax, dword [0xcf656]
    jmp short loc_2e72a
loc_2e724:
    mov eax, dword [eax + 0xcf53e]
loc_2e72a:
    sar eax, 0x10
    mov ebx, 5
    mov edx, 0xa6ab0
    call SEND_PACKET
    mov edx, 0xffffffff
    mov dword [0xbd6f4], edx
    cmp edx, dword [0xbd6f4]
    jne short loc_2e76e
loc_2e74f:
    cmp ecx, dword [0x216f7c]
    jg short loc_2e765
    call GET_PACKETS
    mov ecx, dword [0x216f7c]
    add ecx, 8
loc_2e765:
    cmp dword [0xbd6f4], -1
    je short loc_2e74f
loc_2e76e:
    mov eax, dword [ebp - 0x10]
    cmp eax, dword [0xbd6f4]
    setne al
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

get_sound:
    push ebp
    mov ebp, esp
    mov eax, 0x34d8
    call PRINT_NOTICE
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    nop

precache_necessary_sounds:
    push ebp
    mov ebp, esp
    mov eax, 0x34f0
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov dx, word [0x217fcc]
    xor esi, esi
    test dx, dx
    jle near loc_2e858
loc_2e7c6:
    movsx ebx, si
    shl ebx, 5
    mov eax, dword [ebx + 0x1be576]
    sar eax, 0x10
    shl eax, 2
    mov edx, dword [eax + 0x169e68]
    test edx, edx
    jne short loc_2e847
    jne short loc_2e800
    mov ax, word [ebx + 0x1be578]
    mov edx, eax
    cwde
    mov cl, dl
    mov dl, 1
    and cl, 7
    sar eax, 3
    shl dl, cl
    or byte [eax + 0x1699e8], dl
loc_2e800:
    movsx eax, si
    shl eax, 5
    cmp word [eax + 0x1be57a], 0
    jl short loc_2e847
    mov ebx, dword [eax + 0x1be578]
    sar ebx, 0x10
    cmp dword [nosplit ebx*4 + 0x169e68], 0
    jne short loc_2e847
    mov ax, word [eax + 0x1be57a]
    mov edx, eax
    cwde
    mov cl, dl
    mov dl, 1
    sar eax, 3
    and cl, 7
    mov bl, byte [eax + 0x1699e8]
    shl dl, cl
    or bl, dl
    mov byte [eax + 0x1699e8], bl
loc_2e847:
    mov bx, word [0x217fcc]
    inc esi
    cmp si, bx
    jl near loc_2e7c6
loc_2e858:
    mov cx, word [0x217fce]
    xor esi, esi
    test cx, cx
    jle near loc_2e94c
    xor edi, edi
loc_2e86c:
    movsx eax, si
    imul eax, eax, 0x28
    mov ebx, dword [eax + 0x20a07e]
    sar ebx, 0x10
    cmp edi, dword [nosplit ebx*4 + 0x169e68]
    jne short loc_2e8a8
    mov ax, word [eax + 0x20a080]
    mov edx, eax
    cwde
    mov cl, dl
    mov dl, 1
    sar eax, 3
    and cl, 7
    mov bh, byte [eax + 0x1699e8]
    shl dl, cl
    or bh, dl
    mov byte [eax + 0x1699e8], bh
loc_2e8a8:
    movsx eax, si
    imul eax, eax, 0x28
    mov ebx, dword [eax + 0x20a076]
    sar ebx, 0x10
    cmp edi, dword [nosplit ebx*4 + 0x169e68]
    jne short loc_2e8dc
    mov ax, word [eax + 0x20a078]
    mov edx, eax
    cwde
    mov cl, dl
    mov dl, 1
    and cl, 7
    sar eax, 3
    shl dl, cl
    or byte [eax + 0x1699e8], dl
loc_2e8dc:
    movsx eax, si
    mov dx, word [nosplit eax*2 + 0x21778e]
    test dx, dx
    jl short loc_2e93c
loc_2e8ec:
    movsx ebx, dx
    imul eax, ebx, 0x2c
    cmp byte [eax + 0x19137c], 0
    je short loc_2e92c
    cmp byte [eax + 0x19137d], 0
    je short loc_2e92c
    mov ecx, dword [eax + 0x191372]
    sar ecx, 0x10
    test ch, 0x80
    jne short loc_2e92c
    mov eax, dword [eax + 0x191374]
    sar eax, 0x10
    cmp dword [nosplit eax*4 + 0x169e68], 0
    jne short loc_2e92c
    mov eax, ebx
    call 0x2d630
loc_2e92c:
    movsx eax, dx
    mov dx, word [nosplit eax*2 + 0x18af68]
    test dx, dx
    jge short loc_2e8ec
loc_2e93c:
    mov ax, word [0x217fce]
    inc esi
    cmp si, ax
    jl near loc_2e86c
loc_2e94c:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp dword [0xbffab], 2
    je near loc_2eabe
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ecx, 0x209d68
    xor esi, esi
    mov dword [eax + 0x8c37d], ecx
    xor edi, edi
loc_2e98a:
    mov ecx, esi
    mov ebx, edi
    mov edx, edi
    mov eax, edi
    add esi, 7
    call 0x27980
    cmp esi, 0x3f
    jl short loc_2e98a
    xor esi, esi
    mov edi, dword [0xbfb4f]
    mov dword [0xbfb4f], esi
    call 0x2c814
    xor eax, eax
    call 0x4d427
    call 0x2676c
    cmp byte [0x95b8], 0
    je short loc_2ea06
    cmp dword [0xbffeb], 7
    jne short loc_2ea06
    cmp dword [0xbffef], 0
    jne short loc_2ea06
    push dword 0x3518
    mov edx, 0x8c
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call 0x25e2c
    push dword 0x95b8
    mov edx, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    mov eax, edx
    jmp near loc_2ea86
loc_2ea06:
    cmp word [0x99ea], 0
    je short loc_2ea3d
    push dword 0x352c
    mov edx, 0x8c
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call 0x25e2c
    push dword 0x3538
    mov edx, 0xa4
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    jmp short loc_2ea86
loc_2ea3d:
    push dword 0x354c
    mov edx, 0x8c
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call 0x25e2c
    mov eax, dword [0xbffef]
    lea esi, [eax*8]
    sub esi, eax
    mov eax, dword [0xbffeb]
    add eax, esi
    mov esi, eax
    shl esi, 5
    add esi, eax
    mov edx, 0xa4
    add esi, strict dword 0xbd144
    xor ecx, ecx
    push esi
    xor ebx, ebx
    mov eax, 0xa0
loc_2ea86:
    call 0x25e2c
    call 0x3a2b0
    mov esi, 0x3f
loc_2ea95:
    mov ecx, esi
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    sub esi, 7
    call 0x27980
    test esi, esi
    jg short loc_2ea95
    call 0x5adcc
    mov dword [0xbfb4f], edi
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2eabe:
    xor eax, eax
    call 0x4d427
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ebx, 0x209d68
    xor ecx, ecx
    xor edx, edx
    mov dword [eax + 0x8c37d], ebx
    xor ebx, ebx
    xor eax, eax
    call 0x27980
    call 0x2676c
    push dword 0x3558
    mov edx, 0x9b
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call 0x25e2c
    call 0x3a2b0
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push edi
    mov ecx, 1
    mov edi, 0x19000
    xor edx, edx
    xor ah, ah
    mov dword [0xbcca8], edx
    mov dword [0xbccbc], edx
    mov byte [0xc0038], ah
    mov dword [0x93ac], ecx
    mov dword [0xbcd40], edx
    mov dword [0xbf390], edx
    mov dword [0xbd70c], edx
    mov dword [0xbd710], edx
    mov dword [0xbd724], edx
    mov dword [0xbd720], edx
    mov dword [0xbd718], edx
    mov dword [0xbd71c], edx
    mov dword [0xbcc98], edx
    mov ecx, 0x40
    xor eax, eax
    mov dword [0xbcc9c], edx
    cmp ecx, 4
    jae short loc_2eb9a
    test cl, 1
    je short loc_2eb93
    stosb
loc_2eb93:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2ebc5
loc_2eb9a:
    test edi, 1
    je short loc_2eba4
    stosb
    dec ecx
loc_2eba4:
    test edi, 2
    je short loc_2ebb1
    stosw
    sub ecx, 2
loc_2ebb1:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2ebbf
    stosw
loc_2ebbf:
    test bl, 1
    je short loc_2ebc5
    stosb
loc_2ebc5:
    mov ecx, 0xa
    mov edi, 0xbf530
    xor eax, eax
    cmp ecx, 4
    jae short loc_2ebe3
    test cl, 1
    je short loc_2ebdc
    stosb
loc_2ebdc:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2ec0e
loc_2ebe3:
    test edi, 1
    je short loc_2ebed
    stosb
    dec ecx
loc_2ebed:
    test edi, 2
    je short loc_2ebfa
    stosw
    sub ecx, 2
loc_2ebfa:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2ec08
    stosw
loc_2ec08:
    test bl, 1
    je short loc_2ec0e
    stosb
loc_2ec0e:
    mov ecx, 0xa0
    mov edi, 0xb8bf0
    xor eax, eax
    cmp ecx, 4
    jae short loc_2ec2c
    test cl, 1
    je short loc_2ec25
    stosb
loc_2ec25:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2ec57
loc_2ec2c:
    test edi, 1
    je short loc_2ec36
    stosb
    dec ecx
loc_2ec36:
    test edi, 2
    je short loc_2ec43
    stosw
    sub ecx, 2
loc_2ec43:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2ec51
    stosw
loc_2ec51:
    test bl, 1
    je short loc_2ec57
    stosb
loc_2ec57:
    mov ecx, 0xa000
    mov edi, 0x9beb0
    xor eax, eax
    cmp ecx, 4
    jae short loc_2ec75
    test cl, 1
    je short loc_2ec6e
    stosb
loc_2ec6e:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2eca0
loc_2ec75:
    test edi, 1
    je short loc_2ec7f
    stosb
    dec ecx
loc_2ec7f:
    test edi, 2
    je short loc_2ec8c
    stosw
    sub ecx, 2
loc_2ec8c:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2ec9a
    stosw
loc_2ec9a:
    test bl, 1
    je short loc_2eca0
    stosb
loc_2eca0:
    mov ecx, 0x10
    mov edi, 0x67438
    xor eax, eax
    rep stosd
    mov ecx, 0x10
    mov edi, 0x1c040
    rep stosd
    mov ax, word [0xcf658]
    test ax, ax
    jl short loc_2ecdc
loc_2ecc5:
    cwde
    xor ebx, ebx
    mov dword [nosplit eax*4 + 0x19000], ebx
    mov ax, word [nosplit eax*2 + 0xcf540]
    test ax, ax
    jge short loc_2ecc5
loc_2ecdc:
    lea esp, [ebp - 0x10]
    pop edi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

enter_level:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov byte [ebp - 0x18], al
    test al, 2
    jne short loc_2ed04
    mov eax, dword [0xbffc3]
    mov dword [0xbffab], eax
loc_2ed04:
    mov eax, dword [0xbffbb]
    mov dword [0xbff9f], eax
    mov eax, dword [0xbffb7]
    mov dword [0xbffa3], eax
    mov eax, dword [0xbffbf]
    mov dword [0xbffa7], eax
    mov eax, dword [0xbffc7]
    mov dword [0xbffaf], eax
    mov eax, dword [0xbfb47]
    mov dword [0xbfb4b], eax
    mov eax, dword [0xbfff3]
    mov dword [0xbfff7], eax
    mov eax, dword [0xbffcf]
    mov dl, byte [ebp - 0x18]
    mov dword [0xbffd3], eax
    test dl, 2
    jne short loc_2ed63
    cmp dword [0xbffab], 2
    jne short loc_2ed63
    xor ebx, ebx
    mov dword [0xbffab], ebx
loc_2ed63:
    xor ecx, ecx
    mov dx, word [0xbfb4f]
    mov dword [0xbfb4f], ecx
    call 0x2e958
    call 0x2c814
    movsx eax, dx
    mov dword [0xbfb4f], eax
    call 0x51684
    cmp word [0x99ea], 0
    je short loc_2edd8
    push dword 0x8c0aa
    mov ecx, 0x8c02c
    mov ebx, 0x8c028
    push dword 0x8c0a4
    mov edx, 0x8c024
    mov eax, 0x3560
    call 0x39535
    cmp eax, -1
    jne near loc_2eebb
    push dword 0x3474
    push dword 0x4f4
    call 0x5d849
    push dword 0x95b8
    jmp near loc_2ee9f
loc_2edd8:
    cmp byte [0x95b8], 0
    je short loc_2ee35
    cmp dword [0xbffdb], 7
    jne short loc_2ee35
    cmp dword [0xbffdf], 0
    jne short loc_2ee35
    push dword 0x8c0aa
    mov ecx, 0x8c02c
    mov ebx, 0x8c028
    push dword 0x8c0a4
    mov edx, 0x8c024
    mov eax, 0x95b8
    call 0x39535
    cmp eax, -1
    jne near loc_2eebb
    push dword 0x3474
    push dword 0x4fd
    call 0x5d849
    push dword 0x95b8
    jmp short loc_2ee9f
loc_2ee35:
    mov edx, dword [0xbffef]
    push dword 0x8c0aa
    lea eax, [edx*8]
    mov ecx, 0x8c02c
    sub eax, edx
    mov edx, dword [0xbffeb]
    mov ebx, 0x8c028
    add eax, edx
    push dword 0x8c0a4
    shl eax, 7
    mov edx, 0x8c024
    add eax, strict dword 0x1d580
    call 0x39535
    cmp eax, -1
    jne short loc_2eebb
    push dword 0x3474
    push dword 0x503
    call 0x5d849
    mov eax, dword [0xbffef]
    mov ebx, dword [0xbffeb]
    shl eax, 3
    add eax, ebx
    shl eax, 7
    add eax, strict dword 0x1d580
    push eax
loc_2ee9f:
    push dword 0x356c
    push dword 0xa6ab0
    call 0x5d8cc
    add esp, 0xc
    mov eax, 0xa6ab0
    call GAME_EXIT
loc_2eebb:
    mov ecx, 0x480
    mov edi, 0x1699e8
    xor edx, edx
    xor eax, eax
    mov dl, byte [ebp - 0x18]
    cmp ecx, 4
    jae short loc_2eede
    test cl, 1
    je short loc_2eed7
    stosb
loc_2eed7:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2ef09
loc_2eede:
    test edi, 1
    je short loc_2eee8
    stosb
    dec ecx
loc_2eee8:
    test edi, 2
    je short loc_2eef5
    stosw
    sub ecx, 2
loc_2eef5:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2ef03
    stosw
loc_2ef03:
    test bl, 1
    je short loc_2ef09
    stosb
loc_2ef09:
    mov eax, edx
    call 0x2d73c
    mov eax, edx
    xor bl, bl
    call reset_player_sprites
    mov byte [0xa23c], bl
    mov byte [0x21805a], bl
    call 0x2e7ac
    call 0x2c9b8
    cmp word [0x998c], 0
    jl short loc_2ef4d
loc_2ef39:
    mov eax, dword [0x998a]
    sar eax, 0x10
    imul eax, eax, 0xd
    cmp byte [eax + 0xbd9cc], 0xc8
    jae short loc_2ef39
loc_2ef4d:
    mov word [0x998c], 0xffff
    call 0x5f464
    call 0x2c650
    xor eax, eax
    call 0x5f1b4
    mov eax, dword [0xbffeb]
    mov ch, byte [ebp - 0x18]
    call 0x53154
    test ch, 4
    jne short loc_2efa3
    test ch, 8
    jne short loc_2efa3
    test ch, 0x20
    je short loc_2efb8
    cmp dword [0xbffab], 2
    jne short loc_2efa3
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c34c], 2
    jmp short loc_2efb8
loc_2efa3:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov byte [eax + 0x8c34c], 4
loc_2efb8:
    cmp dword [0xbffab], 1
    jne short loc_2efcc
    test byte [ebp - 0x18], 0x20
    jne short loc_2efcc
    call 0x17d40
loc_2efcc:
    mov bx, word [0xcf658]
    test bx, bx
    jl near loc_2f066
loc_2efdc:
    movsx eax, bx
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c106]
    sar eax, 0x10
    imul eax, eax, 0x2c
    mov eax, dword [eax + 0x19137e]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov ax, word [eax + 0x20a080]
    cmp ax, strict word 0x4fc
    jb short loc_2f014
    jbe short loc_2f01a
    cmp ax, strict word 0x8ad
    je short loc_2f01a
    jmp short loc_2f052
loc_2f014:
    cmp ax, strict word 0x84
    jne short loc_2f052
loc_2f01a:
    movsx edx, bx
    mov eax, edx
    call RESET_WEAPONS
    mov eax, edx
    imul edx, edx, strict dword 0x623
    xor ch, ch
    xor edi, edi
    call RESET_INVENTORY
    mov byte [edx + 0x8c36c], ch
    mov word [edx + 0x8c0b2], di
    mov word [edx + 0x8c0d8], di
    xor cl, cl
    mov word [edx + 0x8c0fc], cx
loc_2f052:
    movsx ebx, bx
    mov bx, word [nosplit ebx*2 + 0xcf540]
    test bx, bx
    jge near loc_2efdc
loc_2f066:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c024]
    mov dword [0xbcd54], edx
    mov dword [0xbcd50], edx
    mov edx, dword [eax + 0x8c028]
    mov dword [0xbcd58], edx
    mov dword [0xbcd4c], edx
    mov edx, dword [eax + 0x8c02c]
    mov dword [0xbcd3c], edx
    mov dword [0xbccc4], edx
    mov dx, word [eax + 0x8c0a4]
    mov word [0xbf554], dx
    mov word [0xbf552], dx
    mov dx, word [eax + 0x8c030]
    mov word [0xbf54a], dx
    mov word [0xbf548], dx
    mov dx, word [eax + 0x8c0de]
    mov ecx, 0x209d68
    mov word [0xbf556], dx
    mov word [0xbf54c], dx
    mov dx, word [eax + 0x8c0aa]
    xor edi, edi
    mov word [0xbf54e], dx
    mov dx, word [eax + 0x8c0ec]
    xor ebx, ebx
    mov word [0xbf550], dx
    mov dl, byte [eax + 0x8c350]
    mov dword [0xbccc0], edi
    mov byte [0xc0040], dl
    mov dl, byte [eax + 0x8c352]
    mov dword [0xbcd44], edi
    mov byte [0xc0041], dl
    mov dl, byte [eax + 0x8c385]
    mov dword [eax + 0x8c37d], ecx
    mov byte [0xc003f], dl
    mov dl, byte [eax + 0x8c38f]
    xor ecx, ecx
    mov byte [0xc003e], dl
    xor eax, eax
    xor edx, edx
    mov dword [0xbcd48], edi
    call 0x27980
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor esi, esi
    add eax, strict dword 0x8be10
    xor cl, cl
    call 0x29540
    call FLUSH_PERMS
    mov ax, word [0xbffeb]
    mov byte [0x972e], cl
    inc eax
    mov word [0xbf566], si
    mov word [0xbfaff], ax
    call 0x2eb18
    mov ax, word [0x93b0]
    dec eax
    test ax, ax
    jl short loc_2f1c6
loc_2f1ad:
    movsx edx, ax
    mov ebx, dword [nosplit edx*4 + 0x19040]
    mov ebx, dword [ebx]
    dec eax
    mov dword [nosplit edx*4 + 0x15000], ebx
    test ax, ax
    jge short loc_2f1ad
loc_2f1c6:
    mov al, 1
    xor ecx, ecx
    xor ebx, ebx
    xor edx, edx
    mov byte [0xc1031], al
    call LOAD_BOARD
    call wait_for_everybody
    xor eax, eax
    call 0x27980
    call 0x2c814
    xor eax, eax
    call 0x4d427
    call 0x15774
    mov eax, dword [0xbf560]
    mov edx, 0x10000
    sar eax, 0x10
    call 0x15828
    mov eax, dword [0xbf560]
    mov edi, 0x6b3d0
    sar eax, 0x10
    mov ecx, 0x10
    call 0x15234
    call 0x3a2b0
    mov eax, 0x1010101
    cmp ecx, 4
    jae short loc_2f23a
    test cl, 1
    je short loc_2f233
    stosb
loc_2f233:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw with Watcom prefix order
    jmp short loc_2f265
loc_2f23a:
    test edi, 1
    je short loc_2f244
    stosb
    dec ecx
loc_2f244:
    test edi, 2
    je short loc_2f251
    stosw
    sub ecx, 2
loc_2f251:
    mov ebx, ecx
    shr ecx, 2
    rep stosd
    test bl, 2
    je short loc_2f25f
    stosw
loc_2f25f:
    test bl, 1
    je short loc_2f265
    stosb
loc_2f265:
    cmp byte [0xc6c5a], 1
    jne short loc_2f278
    mov eax, 0x3580
    call GAME_EXIT
loc_2f278:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor esi, esi
    mov word [eax + 0x8c10c], si
    xor esi, esi
    call 0x2e200
    mov dword [0xbd704], esi
    mov dword [0xbd708], esi
    mov dword [0xbd6fc], esi
    mov dword [0xbd700], esi
    mov dword [0x216f7c], esi
    mov dl, 1
    mov dword [0xbd6f8], esi
    mov dword [0xbd764], esi
    mov byte [0xc0049], dl
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 14 db 0    ; Object alignment
