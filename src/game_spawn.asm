bits 32
org 0x15c74

%define INSERT_SPRITE 0x40d50
%define GAME_EXIT 0x14f28
%define CHANGE_SPRITE_STAT 0x51390
%define ACTOR_FELLA 0x147e0
%define KRAND 0x46fa0
%define SPRITE_LIMIT_ERROR 0xe84
%define SPRITE_X 0x191368
%define SPRITE_Y 0x19136c
%define SPRITE_Z 0x191370
%define SPRITE_SECTOR_BEFORE 0x19137e
%define SPRITE_CSTAT 0x191374
%define SPRITE_PICNUM 0x191376
%define SPRITE_HITAG 0x191390
%define SPRITE_EXTRA 0x191392
%define ACTOR_SCRIPT_POINTERS 0x82280

egs:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 4
    mov esi, edx
    mov edi, ecx
    cmp word [ebp + 0x24], 0
    jge short loc_15c8e
    xor eax, eax
    jmp near loc_15ec1
loc_15c8e:
    mov edx, dword [ebp + 0x25]
    cwde
    sar edx, 0x18
    call INSERT_SPRITE
    mov word [ebp - 0xc], ax
    test ax, ax
    jge short loc_15cad
    mov eax, SPRITE_LIMIT_ERROR
    call GAME_EXIT
loc_15cad:
    mov ecx, dword [ebp - 0xe]
    sar ecx, 0x10
    lea eax, [ecx*8]
    add eax, ecx
    shl eax, 3
    sub eax, ecx
    lea edx, [ecx*4]
    sub edx, ecx
    shl edx, 2
    sub edx, ecx
    mov dword [eax + 0x2045b], esi
    shl edx, 2
    mov dword [eax + 0x2045f], ebx
    add edx, strict dword SPRITE_X
    mov dword [eax + 0x20463], edi
    mov word [edx + 0xc], 0
    mov byte [edx + 0x11], 0
    mov byte [edx + 0x16], 0
    mov byte [edx + 0x17], 0
    mov word [edx + 0x22], 0
    mov byte [edx + 0x12], 0
    mov word [edx + 0x26], 0
    mov dword [edx], esi
    mov dword [edx + 4], ebx
    mov ebx, dword [ebp + 8]
    mov word [edx + 0xe], bx
    mov bl, byte [ebp + 0xc]
    mov byte [edx + 0x10], bl
    mov bl, byte [ebp + 0x10]
    mov byte [edx + 0x14], bl
    mov bl, byte [ebp + 0x14]
    mov byte [edx + 0x15], bl
    mov ebx, dword [ebp + 0x18]
    mov word [edx + 0x1c], bx
    mov ebx, dword [ebp + 0x1c]
    mov esi, dword [ebp + 0x22]
    mov word [edx + 0x20], bx
    mov ebx, dword [ebp + 0x20]
    sar esi, 0x10
    mov word [edx + 0x24], bx
    mov ebx, dword [ebp + 0x24]
    mov ecx, esi
    mov word [edx + 0x1e], bx
    lea ebx, [esi*4]
    mov dword [edx + 8], edi
    sub ebx, esi
    mov byte [edx + 0x11], 0
    shl ebx, 2
    xor ecx, esi
    sub ebx, esi
    mov dword [eax + 0x20457], ecx
    mov ecx, 0xffffffff
    mov bx, word [nosplit ebx*4 + SPRITE_PICNUM]
    mov word [eax + 0x20445], cx
    mov word [eax + 0x20439], bx
    xor ebx, ebx
    mov dword [eax + 0x20453], ebx
    xor ebx, ebx
    mov word [eax + 0x20449], bx
    mov ebx, dword [ebp + 0x24]
    mov word [eax + 0x2043f], bx
    xor bl, bl
    mov byte [eax + 0x20438], bl
    xor bh, bh
    mov word [eax + 0x20441], bx
    lea ebx, [esi*8]
    mov word [eax + 0x2043d], cx
    add ebx, esi
    xor ecx, ecx
    shl ebx, 3
    mov word [eax + 0x20443], cx
    sub ebx, esi
    mov word [eax + 0x20447], cx
    mov ecx, dword [ebx + 0x2044b]
    mov dword [eax + 0x2044b], ecx
    mov ebx, dword [ebx + 0x2044f]
    xor esi, esi
    mov dword [eax + 0x2044f], ebx
    mov ebx, dword [ebp + 6]
    mov dword [eax + 0x2047b], esi
    sar ebx, 0x10
    mov dword [eax + 0x20473], esi
    shl ebx, 2
    mov dword [eax + 0x2046f], esi
    mov edi, dword [ebx + ACTOR_SCRIPT_POINTERS]
    mov dword [eax + 0x20467], esi
    test edi, edi
    je short loc_15e45
    mov cx, word [edi]
    mov word [edx + 0x2a], cx
    mov ebx, dword [ebx + ACTOR_SCRIPT_POINTERS]
    mov ecx, dword [ebx + 4]
    mov dword [eax + 0x20477], ecx
    mov ecx, dword [ebx + 8]
    mov dword [eax + 0x2046b], ecx
    mov ax, word [ebx + 0xc]
    mov word [edx + 0x28], ax
    jmp short loc_15e5d
loc_15e45:
    mov dword [eax + 0x20477], esi
    mov dword [eax + 0x2046b], esi
    mov word [edx + 0x2a], 0
    mov word [edx + 0x28], 0
loc_15e5d:
    mov ebx, dword [ebp - 0xe]
    sar ebx, 0x10
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov edi, 1
    mov edx, dword [nosplit eax*4 + SPRITE_SECTOR_BEFORE]
    mov ax, word [nosplit eax*4 + 0x191380]
    sar edx, 0x10
    xor ah, ah
    sar edx, 3
    and al, 7
    movzx esi, byte [edx + 0x1694e8]
    movsx ecx, ax
    mov dl, 1
    shl edi, cl
    mov cl, byte [ebp - 0xc]
    mov eax, ebx
    and cl, 7
    sar eax, 3
    shl dl, cl
    test esi, edi
    je short loc_15eb6
    or byte [eax + 0x172e68], dl
    jmp short loc_15ebe
loc_15eb6:
    not dl
    and byte [eax + 0x172e68], dl
loc_15ebe:
    mov eax, dword [ebp - 0xc]
loc_15ec1:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 0x24
    db 0x8b, 0xc0            ; mov eax, eax alignment

wall_switch_check:
    push ebp
    mov ebp, esp
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    times 11 db 0    ; Padding between game3 and game4 code

spawn:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 0x10
    mov esi, eax
    mov word [ebp - 0x14], dx
    test ax, ax
    jl short loc_15f67
    push byte 0
    movsx edx, ax
    push edx
    push byte 0
    lea edi, [edx*4]
    push byte 0
    mov eax, dword [ebp - 0x16]
    sub edi, edx
    push byte 0
    shl edi, 2
    push byte 0
    sar eax, 0x10
    sub edi, edx
    push byte 0
    shl edi, 2
    push byte 0
    mov ecx, dword [edi + SPRITE_Z]
    mov ebx, dword [edi + SPRITE_Y]
    push eax
    mov eax, dword [edi + SPRITE_SECTOR_BEFORE]
    mov edx, dword [edi + SPRITE_X]
    sar eax, 0x10
    call egs
    movsx edx, ax
    mov ecx, eax
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, eax
    mov ax, word [edi + SPRITE_PICNUM]
    mov word [edx + 0x20439], ax
    jmp near loc_162c1
loc_15f67:
    mov ebx, dword [ebp - 0x16]
    sar ebx, 0x10
    mov ecx, edx
    mov edx, ebx
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    shl ebx, 3
    add ebx, edx
    shl ebx, 3
    shl eax, 2
    sub ebx, edx
    mov dx, word [eax + SPRITE_PICNUM]
    mov word [ebx + 0x20439], dx
    xor edx, edx
    mov word [ebx + 0x20449], dx
    mov edx, dword [eax + SPRITE_X]
    mov dword [ebx + 0x2045b], edx
    mov edx, dword [eax + SPRITE_Y]
    mov dword [ebx + 0x2045f], edx
    mov edx, dword [eax + SPRITE_Z]
    mov dword [ebx + 0x20463], edx
    mov edx, ecx
    mov word [ebx + 0x2043f], dx
    mov word [eax + 0x191386], dx
    xor dl, dl
    mov byte [ebx + 0x20438], dl
    xor dh, dh
    mov word [ebx + 0x20441], dx
    mov edi, 0xffffffff
    mov word [ebx + 0x20447], dx
    mov edx, dword [eax + SPRITE_SECTOR_BEFORE]
    mov word [ebx + 0x2043d], di
    sar edx, 0x10
    xor edi, edi
    mov dword [ebp - 0x1c], edx
    mov word [ebx + 0x20443], di
    mov edi, dword [ebp - 0x1c]
    shl edx, 2
    add edx, edi
    mov edi, dword [nosplit edx*8 + 0x20a070]
    mov edx, dword [nosplit edx*8 + 0x20a06c]
    mov dword [ebx + 0x2044b], edi
    mov dword [ebx + 0x2044f], edx
    xor edx, edx
    mov dword [ebx + 0x20453], edx
    mov dword [ebx + 0x20457], edx
    mov dword [ebx + 0x2047b], edx
    mov dword [ebx + 0x20477], edx
    mov dword [ebx + 0x20473], edx
    mov dword [ebx + 0x2046f], edx
    mov dword [ebx + 0x2046b], edx
    mov edi, 0xffffffff
    mov dword [ebx + 0x20467], edx
    mov dh, byte [eax + SPRITE_CSTAT]
    mov word [ebx + 0x20445], di
    test dh, 0x30
    je near loc_1620a
    mov dx, word [eax + SPRITE_PICNUM]
    cmp dx, 0x433
    jl short loc_16098
    cmp dx, 0x436
    jle near loc_1620a
loc_16098:
    movsx ebx, cx
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    lea edx, [eax*4]
    cmp byte [edx + 0x191378], 0x7f
    je near loc_16729
    mov eax, ebx
    call wall_switch_check
    cmp al, 1
    jne near loc_161b4
    test byte [edx + SPRITE_CSTAT], 0x10
    je near loc_161b4
    mov bx, word [edx + SPRITE_PICNUM]
    cmp bx, 0x52
    je short loc_1614f
    cmp bx, 0x81
    je short loc_1614f
    cmp byte [edx + 0x191379], 0
    je short loc_1614f
    mov ebx, dword [0xbffe3]
    cmp ebx, 2
    jl short loc_1610f
    cmp ebx, 1
    jle short loc_1614f
    cmp dword [0xbfb4b], 1
    jne short loc_1614f
loc_1610f:
    movsx edx, cx
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    xor esi, esi
    mov word [nosplit eax*4 + SPRITE_HITAG], si
    mov word [nosplit eax*4 + 0x19138e], si
    xor dh, dh
    mov word [nosplit eax*4 + SPRITE_CSTAT], si
    mov byte [nosplit eax*4 + 0x19137d], dh
    mov byte [nosplit eax*4 + 0x19137c], dh
    jmp near loc_16729
loc_1614f:
    movsx edx, cx
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    mov di, word [eax + SPRITE_CSTAT]
    or edi, strict dword 0x101
    mov bh, byte [eax + 0x191379]
    mov word [eax + SPRITE_CSTAT], di
    test bh, bh
    je near loc_16729
    mov dx, word [eax + SPRITE_PICNUM]
    cmp dx, 0x52
    je near loc_16729
    cmp dx, 0x81
    je near loc_16729
    xor dl, dl
    mov byte [eax + 0x191379], dl
    mov eax, ecx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_161b4:
    movsx edi, cx
    lea ebx, [edi*4]
    sub ebx, edi
    shl ebx, 2
    sub ebx, edi
    shl ebx, 2
    cmp word [ebx + SPRITE_HITAG], 0
    je short loc_1620a
    mov edx, 0xc
    mov eax, edi
    call CHANGE_SPRITE_STAT
    mov dx, word [ebx + SPRITE_CSTAT]
    mov ax, word [0xbf37c]
    or edx, strict dword 0x101
    mov word [ebx + SPRITE_EXTRA], ax
    mov word [ebx + SPRITE_CSTAT], dx
    mov eax, ecx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1620a:
    movsx edx, cx
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    mov bl, byte [eax + SPRITE_CSTAT]
    mov dx, word [eax + SPRITE_PICNUM]
    test bl, 1
    je short loc_16237
    or byte [eax + 0x191375], 1
loc_16237:
    movsx eax, dx
    shl eax, 2
    mov edx, dword [eax + ACTOR_SCRIPT_POINTERS]
    test edx, edx
    je short loc_162a2
    movsx eax, cx
    mov ebx, eax
    lea edi, [eax*4]
    sub edi, eax
    shl edi, 2
    sub edi, eax
    shl edi, 2
    mov ax, word [edx]
    mov word [edi + SPRITE_EXTRA], ax
    mov eax, ebx
    shl eax, 3
    add eax, ebx
    shl eax, 3
    sub eax, ebx
    mov ebx, dword [edx + 4]
    mov dword [eax + 0x20477], ebx
    mov ebx, dword [edx + 8]
    mov dword [eax + 0x2046b], ebx
    cmp dword [edx + 0xc], 0
    je short loc_162c1
    cmp word [edi + SPRITE_HITAG], 0
    jne short loc_162c1
    mov ax, word [edx + 0xc]
    mov word [edi + SPRITE_HITAG], ax
    jmp short loc_162c1
loc_162a2:
    movsx edx, cx
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    xor ebx, ebx
    mov dword [eax + 0x20477], ebx
    mov dword [eax + 0x2046b], ebx
loc_162c1:
    movsx edx, cx
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov ebx, SPRITE_X
    shl eax, 2
    add ebx, eax
    mov ax, word [ebx + 0xe]
    cmp ax, strict word 0x6a8
    jb short loc_16304
    jbe near loc_1650d
    cmp ax, strict word 0xf05
    jb short loc_1631a
    jbe near loc_166d6
    cmp ax, strict word 0x1f00
    je near loc_164d9
    jmp short loc_1631a
loc_16304:
    cmp ax, strict word 9
    jb short loc_1631a
    jbe near loc_166c5
    cmp ax, strict word 0x6a6
    je near loc_1650d
loc_1631a:
    mov eax, dword [ebx + 0xc]
    sar eax, 0x10
    cmp dword [nosplit eax*4 + ACTOR_SCRIPT_POINTERS], 0
    je near loc_16729
    movsx eax, si
    cmp eax, -1
    jne short loc_1635a
    mov eax, dword [ebx + 0x24]
    mov edi, dword [0xbffe7]
    sar eax, 0x10
    cmp eax, edi
    jle short loc_1635a
    mov byte [ebx + 0x15], 0
    mov al, byte [ebx + 0x15]
    mov edx, 5
    mov byte [ebx + 0x14], al
    jmp near loc_16721
loc_1635a:
    cmp byte [ebx + 0x14], 0
    je short loc_16366
    cmp byte [ebx + 0x15], 0
    jne short loc_16370
loc_16366:
    mov byte [ebx + 0x15], 1
    mov al, byte [ebx + 0x15]
    mov byte [ebx + 0x14], al
loc_16370:
    mov eax, dword [ebx + 0xc]
    sar eax, 0x10
    test byte [eax + 0x68fd0], 3
    je near loc_16479
    cmp dword [0xbffaf], 1
    jne short loc_163ae
    mov byte [ebx + 0x15], 0
    mov al, byte [ebx + 0x15]
    mov edx, 5
    mov byte [ebx + 0x14], al
    movsx eax, cx
    call CHANGE_SPRITE_STAT
    mov eax, ecx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_163ae:
    movsx edx, cx
    mov eax, edx
    call 0x1a340
    mov eax, dword [ebx + 0xc]
    sar eax, 0x10
    test byte [eax + 0x68fd0], 2
    je short loc_163e2
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov edx, eax
    mov ax, word [ebx + 0x18]
    mov word [edx + 0x20445], ax
loc_163e2:
    mov eax, ebx
    call ACTOR_FELLA
    test ax, ax
    je short loc_16403
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    inc word [eax + 0x8c38b]
loc_16403:
    mov byte [ebx + 0x12], 0x50
    test si, si
    jl short loc_1646f
    movsx edx, si
    lea edi, [edx*4]
    sub edi, edx
    shl edi, 2
    sub edi, edx
    shl edi, 2
    cmp word [edi + SPRITE_PICNUM], 9
    jne short loc_16465
    movsx eax, cx
    mov dword [ebp - 0x20], eax
    mov edx, eax
    shl eax, 2
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov dl, byte [edi + 0x191379]
    movzx di, dl
    mov byte [nosplit eax*4 + 0x191379], dl
    mov edx, dword [ebp - 0x20]
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov word [eax + 0x20443], di
loc_16465:
    mov edx, 1
    movsx eax, cx
    jmp short loc_16489
loc_1646f:
    mov edx, 2
    movsx eax, cx
    jmp short loc_16489
loc_16479:
    mov edx, 1
    mov byte [ebx + 0x12], 0x28
    movsx eax, cx
    mov word [ebx + 0x1e], cx
loc_16489:
    call CHANGE_SPRITE_STAT
    movsx edx, cx
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    xor edx, edx
    mov word [eax + 0x20449], dx
    test si, si
    jl near loc_16729
    movsx edx, si
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov ax, word [nosplit eax*4 + 0x191384]
    mov word [ebx + 0x1c], ax
    mov eax, ecx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_164d9:
    mov byte [ebx + 0x14], 0
    mov eax, 2
    mov byte [ebx + 0x15], 0
    call 0x2f3c0
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov word [eax + 0x8c094], 2
    mov eax, ecx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1650d:
    test si, si
    jl near loc_16729
    movsx edx, si
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    cmp word [eax + SPRITE_PICNUM], 0xf05
    jne near loc_16605
    mov ax, word [eax + 0x19138a]
    movsx edx, ax
    imul edx, edx, strict dword 0x623
    call KRAND
    xor ah, ah
    and al, 0x3f
    mov di, word [edx + 0x8c0a4]
    sub edi, eax
    mov eax, edi
    add eax, strict dword 8
    mov word [ebp - 0x18], ax
    call KRAND
    and eax, 1
    mov dword [ebp - 0x20], eax
    movsx eax, cx
    mov dword [ebp - 0x1c], eax
    mov edi, dword [ebp - 0x1c]
    shl eax, 3
    add eax, edi
    shl eax, 3
    sub eax, edi
    mov edi, dword [ebp - 0x20]
    mov dword [eax + 0x20467], edi
    cmp word [ebx + 0xe], 0x6a8
    jne short loc_165b9
    mov eax, dword [edx + 0x8c0dc]
    mov edi, dword [edx + 0x8c030]
    sar eax, 0x10
    add eax, edi
    shl eax, 4
    mov dword [ebp - 0x1c], eax
    mov eax, dword [edx + 0x8c054]
    add eax, strict dword 0x600
    jmp short loc_165db
loc_165b9:
    mov eax, dword [edx + 0x8c0dc]
    mov edi, dword [edx + 0x8c030]
    sar eax, 0x10
    add eax, edi
    shl eax, 4
    mov dword [ebp - 0x1c], eax
    mov eax, dword [edx + 0x8c054]
    add eax, strict dword 0x300
loc_165db:
    mov edx, dword [edx + 0x8c02c]
    add edx, eax
    mov eax, dword [ebp - 0x1c]
    sub eax, strict dword 0x640
    sub edx, eax
    mov dword [ebx + 8], edx
    call KRAND
    xor ah, ah
    mov edx, eax
    mov word [ebx + 0x24], ax
    neg edx
    mov word [ebx + 0x24], dx
    jmp short loc_1661b
loc_16605:
    mov eax, dword [eax + SPRITE_Z]
    mov dx, word [ebx + 0x1c]
    sub eax, strict dword 0x2100
    mov word [ebp - 0x18], dx
    mov dword [ebx + 8], eax
loc_1661b:
    mov edi, dword [ebp - 0x1a]
    movsx edx, si
    sar edi, 0x10
    lea eax, [edx*4]
    add edi, strict dword 0x200
    sub eax, edx
    and edi, strict dword 0x7ff
    shl eax, 2
    mov edi, dword [nosplit edi*2 + 0x1bd566]
    sub eax, edx
    sar edi, 0x10
    lea edx, [eax*4]
    sar edi, 7
    mov eax, dword [edx + SPRITE_X]
    add eax, edi
    mov dword [ebx], eax
    mov eax, dword [ebp - 0x18]
    and ah, 7
    cwde
    mov edi, dword [nosplit eax*2 + 0x1bd566]
    sar edi, 0x10
    mov eax, dword [edx + SPRITE_Y]
    sar edi, 7
    mov byte [ebx + 0x10], 0xf8
    add eax, edi
    mov dword [ebx + 4], eax
    mov eax, dword [ebp - 0x18]
    mov word [ebx + 0x20], 0x14
    db 0x81, 0xe8
    dd 0x200    ; Watcom encoding of sub eax, 0x200
    mov si, word [ebx + 0xe]
    mov word [ebx + 0x1c], ax
    cmp si, 0x6a6
    jne short loc_166a3
    mov byte [ebx + 0x15], 2
    jmp short loc_166a7
loc_166a3:
    mov byte [ebx + 0x15], 4
loc_166a7:
    mov al, byte [ebx + 0x15]
    mov byte [ebx + 0x14], al
    mov edx, 5
    movsx eax, cx
    call CHANGE_SPRITE_STAT
    mov eax, ecx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_166c5:
    mov word [ebx + 0x2a], 0x35
    mov eax, ecx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_166d6:
    mov byte [ebx + 0x15], 0
    mov al, byte [ebx + 0x15]
    mov byte [ebx + 0x14], al
    mov ax, word [0xbfb4b]
    cmp ax, strict word 2
    jne short loc_166ee
    xor eax, eax
loc_166ee:
    mov edx, dword [0xbffe3]
    cmp edx, 2
    jl short loc_16704
    cmp edx, 1
    jle short loc_1671c
    cmp ax, word [ebx + 0x26]
    je short loc_1671c
loc_16704:
    mov edx, 5
    movsx eax, cx
    call CHANGE_SPRITE_STAT
    mov eax, ecx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_1671c:
    mov edx, 0xa
loc_16721:
    movsx eax, cx
    call CHANGE_SPRITE_STAT
loc_16729:
    mov eax, ecx
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    times 12 db 0    ; Alignment before the next dispatch table
