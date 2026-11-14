bits 32
org 0x16740

%define GET_ANGLE 0x3b4fc
%define BADGUY 0x14814
%define COPY_WITH_SOURCE_LOCATION 0x5e9ab
%define ANIMATION_TRACE 0xea0
%define SOURCE_NAME 0xeb4
%define SPRITE_SORT_COUNT 0x216f78
%define TEMP_SPRITES 0x1fe568
%define SPRITES 0x191368
%define VIEW_PLAYER 0xbf560
%define ACTOR_SCRIPT_POINTERS 0x82280

animation_dispatch:
    dd loc_16bba - 0x10000, loc_16be6 - 0x10000, loc_16be6 - 0x10000
    dd loc_16c25 - 0x10000, loc_16cf1 - 0x10000, loc_16c6d - 0x10000
    dd loc_16cbf - 0x10000

animate_sprites:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x34
    mov dword [ebp - 0x34], eax
    mov dword [ebp - 0x38], edx
    mov word [ebp - 0x14], bx
    mov dword [ebp - 0x30], ecx
    xor edx, edx
    mov eax, dword [VIEW_PLAYER]
    mov dword [ebp - 0x10], edx
    sar eax, 0x10
    mov edx, ANIMATION_TRACE
    xor ecx, ecx
    call 0x51408
    jmp near loc_1692d
loc_1678f:
    imul eax, eax, 0x2c
    mov esi, TEMP_SPRITES
    add esi, eax
    mov ax, word [esi + 0x1e]
    cwde
    imul eax, eax, 0x2c
    mov ebx, SPRITES
    add ebx, eax
    mov ax, word [esi + 0xe]
    cmp ax, strict word 0x1351
    jb short loc_167cb
    jbe short loc_167d5
    cmp ax, strict word 0x1603
    jb near loc_168a8
    jbe short loc_167d5
    cmp ax, strict word 0x1a02
    je short loc_167d5
    jmp near loc_168a8
loc_167cb:
    cmp ax, strict word 0x10a4
    jne near loc_168a8
loc_167d5:
    mov eax, dword [esi + 0xa]
    sar eax, 0x10
    test ah, 0x80
    jne near loc_168a8
    test word [esi + 0xc], 0x101
    je near loc_168a8
    mov eax, dword [VIEW_PLAYER]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edi, dword [esi]
    mov eax, dword [eax + 0x8c024]
    sub eax, edi
    test eax, eax
    jns short loc_1680e
    neg eax
loc_1680e:
    mov edx, eax
    mov eax, dword [VIEW_PLAYER]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edi, dword [esi + 4]
    mov eax, dword [eax + 0x8c028]
    sub eax, edi
    test eax, eax
    jns short loc_1682f
    neg eax
loc_1682f:
    add eax, edx
    cmp eax, strict dword 0xb400
    jge short loc_168a8
    mov edi, dword [VIEW_PLAYER]
    sar edi, 0x10
    imul edi, edi, strict dword 0x623
    mov eax, dword [esi + 4]
    mov edx, dword [edi + 0x8c028]
    sub eax, edx
    mov edx, eax
    mov eax, dword [esi]
    sub eax, dword [edi + 0x8c024]
    call GET_ANGLE
    and ah, 7
    mov edx, eax
    mov eax, dword [VIEW_PLAYER]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c0a2]
    sar eax, 0x10
    mov dword [ebp - 0x2c], eax
    movsx eax, dx
    mov edx, dword [ebp - 0x2c]
    sub edx, eax
    mov eax, edx
    test eax, eax
    jns short loc_16890
    neg eax
loc_16890:
    cmp eax, strict dword 0x80
    jge short loc_1689e
    mov eax, 0x20
    jmp short loc_168a3
loc_1689e:
    mov eax, 0x40
loc_168a3:
    call 0x5a250
loc_168a8:
    test byte [esi + 0xc], 0x10
    jne short loc_168c8
    mov eax, esi
    call BADGUY
    test ax, ax
    je short loc_168c1
    cmp word [esi + 0x2a], 0
    jg short loc_168c8
loc_168c1:
    cmp word [esi + 0x1a], 0xa
    jne short loc_168e8
loc_168c8:
    mov eax, dword [ebx + 0x16]
    sar eax, 0x10
    cmp byte [eax + 0xc6850], 1
    jne short loc_1692c
    cmp word [ebx + 0x1a], 1
    je short loc_1692c
    mov byte [ebx + 0x10], 0x10
    mov byte [esi + 0x10], 0x10
    jmp short loc_1692c
loc_168e8:
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    imul eax, eax, 0x28
    test byte [eax + 0x20a074], 1
    je short loc_16909
    mov eax, ebx
    call BADGUY
    test ax, ax
    mov ebx, dword [ebx + 0xd]
    jmp short loc_1690f
loc_16909:
    mov ebx, dword [eax + 0x20a081]
loc_1690f:
    sar ebx, 0x18
    cmp ebx, -0x7f
    jge short loc_1691c
    mov ebx, 0xffffff81
loc_1691c:
    cmp ebx, strict dword 0x80
    jle short loc_16929
    mov ebx, 0x7f
loc_16929:
    mov byte [esi + 0x10], bl
loc_1692c:
    inc ecx
loc_1692d:
    mov edx, dword [SPRITE_SORT_COUNT]
    movsx eax, cx
    cmp eax, edx
    jl near loc_1678f
    xor ebx, ebx
    mov eax, 0x10000
    mov word [ebp - 0x20], bx
    mov ebx, dword [ebp - 0x30]
    sub eax, ebx
    mov dword [ebp - 0x28], eax
    jmp near loc_16f99
loc_16956:
    imul eax, eax, 0x2c
    mov esi, TEMP_SPRITES
    add esi, eax
    mov ax, word [esi + 0x1e]
    mov word [ebp - 0x18], ax
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul eax, eax, 0x2c
    mov edi, 0x191368
    add edi, eax
    cmp word [esi + 0x1a], 0x63
    je near loc_16f95
    cmp word [edi + 0x1a], 1
    je near loc_16a4c
    cmp word [edi + 0xe], 0xf05
    jne near loc_16a4c
    mov eax, dword [edi + 0x20]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c0e2]
    sar edx, 0x10
    cmp edx, -1
    jne near loc_16a4c
    cmp word [edi + 0x1e], 0
    jl near loc_16a4c
    mov edx, dword [eax + 0x8c024]
    mov ebx, dword [eax + 0x8c048]
    mov eax, dword [ebp - 0x28]
    sub edx, ebx
    imul edx
    shrd eax, edx, 0x10
    sub dword [esi], eax
    mov edx, dword [edi + 0x20]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov eax, dword [edx + 0x8c028]
    mov ebx, dword [edx + 0x8c04c]
    mov edx, eax
    mov eax, dword [ebp - 0x28]
    sub edx, ebx
    imul edx
    shrd eax, edx, 0x10
    sub dword [esi + 4], eax
    mov ebx, dword [edi + 0x20]
    sar ebx, 0x10
    imul ebx, ebx, strict dword 0x623
    mov eax, dword [ebx + 0x8c02c]
    mov edx, dword [ebx + 0x8c050]
    sub eax, edx
    mov edx, eax
    mov eax, dword [ebp - 0x30]
    imul edx
    shrd eax, edx, 0x10
    mov edx, eax
    mov eax, dword [ebx + 0x8c050]
    add eax, edx
    mov dword [esi + 8], eax
    lea ebx, [eax + 0x2800]
    mov dword [esi + 8], ebx
    mov byte [edi + 0x14], 0x18
    mov byte [edi + 0x15], 0x11
    jmp near loc_16ac9
loc_16a4c:
    cmp word [edi + 0x1a], 0
    jne short loc_16a5b
    cmp word [edi + 0xe], 0x512
    jne short loc_16a7d
loc_16a5b:
    mov bx, word [edi + 0x1a]
    cmp bx, 0xa
    je short loc_16a7d
    cmp bx, 6
    je short loc_16a7d
    cmp bx, 4
    je short loc_16a7d
    cmp bx, 5
    je short loc_16a7d
    cmp bx, 1
    jne short loc_16ac9
loc_16a7d:
    mov ebx, dword [ebp - 0x1a]
    sar ebx, 0x10
    imul ebx, ebx, 0x47
    mov edx, dword [edi]
    mov ecx, dword [ebx + 0x2045b]
    mov eax, dword [ebp - 0x28]
    sub edx, ecx
    imul edx
    shrd eax, edx, 0x10
    sub dword [esi], eax
    mov edx, dword [edi + 4]
    mov ecx, dword [ebx + 0x2045f]
    mov eax, dword [ebp - 0x28]
    sub edx, ecx
    imul edx
    shrd eax, edx, 0x10
    sub dword [esi + 4], eax
    mov edx, dword [edi + 8]
    mov ecx, dword [ebx + 0x20463]
    mov eax, dword [ebp - 0x28]
    sub edx, ecx
    imul edx
    shrd eax, edx, 0x10
    sub dword [esi + 8], eax
loc_16ac9:
    mov ecx, dword [ebp - 0x1a]
    sar ecx, 0x10
    imul ecx, ecx, 0x47
    mov ax, word [edi + 0x18]
    mov word [ebp - 0x1c], ax
    mov eax, dword [ecx + 0x20473]
    mov dword [ebp - 0x3c], eax
    mov ax, word [edi + 0xe]
    mov ecx, dword [ecx + 0x20477]
    cmp ax, strict word 0x6ee
    jb short loc_16b5f
    jbe short loc_16b01
    cmp ax, strict word 0xf05
    je near loc_16b75
    jmp short loc_16b5f
loc_16b01:
    mov eax, dword [ebp - 0x38]
    mov edx, dword [edi + 4]
    mov ebx, dword [ebp - 0x34]
    sub edx, eax
    mov eax, dword [edi]
    sub eax, ebx
    call GET_ANGLE
    mov edx, dword [edi + 0x1a]
    sar edx, 0x10
    cwde
    add edx, strict dword 0xc80
    sub edx, eax
    and edx, strict dword 0x7ff
    mov ebx, 0xaa
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    cmp ax, strict word 6
    jle short loc_16b50
    mov edx, 0xc
    mov bh, byte [esi + 0xc]
    sub edx, eax
    or bh, 4
    mov eax, edx
    mov byte [esi + 0xc], bh
    jmp short loc_16b54
loc_16b50:
    and byte [esi + 0xc], 0xfb
loc_16b54:
    add eax, strict dword 0x6ee
    mov word [esi + 0xe], ax
    jmp short loc_16b75
loc_16b5f:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov dl, byte [eax + 0x20a085]
    test dl, dl
    je short loc_16b75
    mov byte [esi + 0x11], dl
loc_16b75:
    mov eax, dword [edi + 0xc]
    sar eax, 0x10
    cmp dword [nosplit eax*4 + ACTOR_SCRIPT_POINTERS], 0
    je near loc_16dd7
    mov ax, word [esi + 0xc]
    xor ah, ah
    and al, 0x30
    cmp ax, strict word 0x30
    je near loc_16dd7
    test ecx, ecx
    je near loc_16dca
    mov ebx, dword [ecx + 8]
    lea eax, [ebx - 2]
    cmp eax, 6
    ja near loc_16cf1
    jmp dword [cs:nosplit eax*4 + 0x6740]
loc_16bba:
    mov eax, dword [edi + 0x1a]
    sar eax, 0x10
    mov dword [ebp - 0x2c], eax
    mov edx, dword [ebp - 0x2c]
    mov eax, dword [ebp - 0x16]
    add edx, strict dword 0xc80
    sar eax, 0x10
    sub edx, eax
    mov eax, edx
    and eax, strict dword 0x7ff
    sar eax, 8
    and eax, 1
    jmp near loc_16d5c
loc_16be6:
    mov eax, dword [edi + 0x1a]
    mov edx, dword [ebp - 0x16]
    sar eax, 0x10
    sar edx, 0x10
    add eax, strict dword 0xc80
    sub eax, edx
    and eax, strict dword 0x7ff
    sar eax, 7
    and eax, 7
    cmp ax, strict word 3
    jle short loc_16c1c
    or byte [esi + 0xc], 4
    mov edx, 7
    sub edx, eax
    mov eax, edx
    jmp near loc_16d5c
loc_16c1c:
    and byte [esi + 0xc], 0xfb
    jmp near loc_16d5c
loc_16c25:
    mov eax, dword [ebp - 0x38]
    mov edx, dword [edi + 4]
    sub edx, eax
    mov eax, dword [edi]
    sub eax, dword [ebp - 0x34]
    call GET_ANGLE
    mov edx, dword [edi + 0x1a]
    cwde
    sar edx, 0x10
    mov dword [ebp - 0x2c], eax
    lea eax, [edx + 0xc80]
    sub eax, dword [ebp - 0x2c]
    and eax, strict dword 0x7ff
    sar eax, 8
    and eax, 7
    cmp ax, strict word 4
    jle short loc_16c1c
    mov edx, 8
    sub edx, eax
    mov eax, edx
    or byte [esi + 0xc], 4
    jmp near loc_16d5c
loc_16c6d:
    mov eax, dword [ebp - 0x38]
    mov edx, dword [edi + 4]
    sub edx, eax
    mov eax, dword [edi]
    sub eax, dword [ebp - 0x34]
    call GET_ANGLE
    mov edx, dword [edi + 0x1a]
    sar edx, 0x10
    cwde
    add edx, strict dword 0xc80
    sub edx, eax
    mov dword [ebp - 0x2c], 0xaa
    and edx, strict dword 0x7ff
    mov eax, edx
    sar edx, 0x1f
    idiv dword [ebp - 0x2c]
    cmp ax, strict word 6
    jle near loc_16c1c
    mov edx, 0xc
    sub edx, eax
    mov eax, edx
    or byte [esi + 0xc], 4
    jmp near loc_16d5c
loc_16cbf:
    mov eax, dword [edi + 0x1a]
    sar eax, 0x10
    mov dword [ebp - 0x2c], eax
    mov edx, dword [ebp - 0x2c]
    mov eax, dword [ebp - 0x16]
    add edx, strict dword 0xc80
    sar eax, 0x10
    sub edx, eax
    mov eax, edx
    and eax, strict dword 0x7ff
    mov dl, byte [esi + 0xc]
    sar eax, 8
    and dl, 0xfb
    and eax, 7
    mov byte [esi + 0xc], dl
    jmp short loc_16d5c
loc_16cf1:
    mov eax, edi
    call BADGUY
    mov dword [ebp - 0x10], eax
    test ax, ax
    je short loc_16d57
    cmp word [edi + 0x1a], 2
    jne short loc_16d57
    cmp word [edi + 0x2a], 0
    jle short loc_16d57
    mov eax, dword [ebp - 0x38]
    mov edx, dword [edi + 4]
    sub edx, eax
    mov eax, dword [edi]
    sub eax, dword [ebp - 0x34]
    call GET_ANGLE
    mov edx, dword [edi + 0x1a]
    cwde
    sar edx, 0x10
    mov dword [ebp - 0x2c], eax
    lea eax, [edx + 0xc80]
    sub eax, dword [ebp - 0x2c]
    and eax, strict dword 0x7ff
    sar eax, 8
    and eax, 7
    cmp ax, strict word 4
    jle near loc_16c1c
    mov edx, 8
    sub edx, eax
    mov eax, edx
    or byte [esi + 0xc], 4
    jmp short loc_16d5c
loc_16d57:
    xor eax, eax
    mov dword [ebp - 0x10], eax
loc_16d5c:
    mov edx, dword [ebp - 0x3c]
    imul edx, ebx
    mov dword [ebp - 0xc], edx
    cmp word [ebp - 0x10], 0
    mov dx, word [ecx]
    mov ecx, dword [ebp - 0xc]
    add eax, edx
    mov dx, word [esi + 0xe]
    add eax, ecx
    add edx, eax
    mov word [esi + 0xe], dx
    test ebx, ebx
    jle short loc_16daa
    xor edx, edx
loc_16d84:
    mov eax, dword [esi + 0xc]
    sar eax, 0x10
    mov cx, word [nosplit eax*2 + 0x17cee8]
    cmp dx, cx
    jne short loc_16daa
    mov ax, word [esi + 0xe]
    cmp cx, ax
    jge short loc_16daa
    mov ecx, eax
    sub ecx, ebx
    mov word [esi + 0xe], cx
    jmp short loc_16d84
loc_16daa:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul eax, eax, 0x47
    cmp word [eax + 0x20447], 0
    jl short loc_16dd7
    mov dx, word [esi + 0xe]
    mov word [eax + 0x20447], dx
    jmp short loc_16dd7
loc_16dca:
    cmp byte [0xc0044], 1
    jne short loc_16dd7
    or byte [esi + 0xc], 4
loc_16dd7:
    cmp word [edi + 0x1a], 0xd
    je short loc_16dee
    mov eax, edi
    call BADGUY
    test ax, ax
    je near loc_16f55
loc_16dee:
    test byte [edi + 0xc], 0x30
    jne near loc_16f55
    cmp word [esi + 0x1a], 0x63
    je near loc_16f55
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul eax, eax, 0x47
    mov dx, word [eax + 0x20447]
    test dx, dx
    jge short loc_16e27
    mov esi, edx
    inc esi
    mov word [eax + 0x20447], si
    jmp near loc_16f95
loc_16e27:
    mov ebx, dword [ebp - 0x1c]
    xor edx, edx
    test bx, bx
    jl short loc_16e6b
    cmp bx, word [0x217fce]
    jge short loc_16e6b
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov ebx, dword [eax + 0x20a078]
    mov eax, dword [eax + 0x20a080]
    sar ebx, 0x10
    sar eax, 0x10
    sub ebx, eax
    mov eax, ebx
    test eax, eax
    jns short loc_16e5f
    neg eax
loc_16e5f:
    cmp eax, strict dword 0x240
    jle short loc_16e6b
    mov edx, 1
loc_16e6b:
    test edx, edx
    jne near loc_16f55
    cmp dword [0xbfb2f], 0
    je near loc_16f55
    mov ecx, dword [SPRITE_SORT_COUNT]
    cmp ecx, strict dword 0x3fe
    jge near loc_16f55
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov eax, dword [eax + 0x20a070]
    mov dword [ebp - 0x24], eax
    mov edx, dword [ebp - 0x24]
    mov eax, dword [edi + 8]
    sub eax, edx
    cmp eax, strict dword 0x800
    jge near loc_16f55
    mov eax, dword [VIEW_PLAYER]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    cmp edx, dword [eax + 0x8c02c]
    jle near loc_16f55
    imul eax, ecx, 0x2c
    push byte 4
    mov ebx, 0x2c
    mov edx, esi
    push dword 0xf3
    mov ecx, SOURCE_NAME
    add eax, strict dword TEMP_SPRITES
    call COPY_WITH_SOURCE_LOCATION
    imul eax, dword [SPRITE_SORT_COUNT], 0x2c
    mov word [eax + 0x1fe582], 0x63
    xor edx, edx
    mov dl, byte [esi + 0x15]
    sar edx, 3
    mov byte [eax + 0x1fe57d], dl
    cmp byte [esi + 0x15], 4
    jae short loc_16f19
    mov byte [esi + 0x15], 4
loc_16f19:
    imul eax, dword [SPRITE_SORT_COUNT], 0x2c
    mov cl, byte [eax + 0x1fe574]
    or cl, 2
    mov edx, dword [ebp - 0x24]
    mov byte [eax + 0x1fe574], cl
    mov ch, 4
    mov bh, 0x7f
    mov byte [eax + 0x1fe579], ch
    mov ecx, dword [SPRITE_SORT_COUNT]
    mov dword [eax + 0x1fe570], edx
    inc ecx
    mov byte [eax + 0x1fe578], bh
    mov dword [SPRITE_SORT_COUNT], ecx
loc_16f55:
    cmp word [edi + 0x1a], 0x326
    jne short loc_16f63
    mov word [esi + 0x1a], 0x3ff
loc_16f63:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul edx, eax, 0x47
    mov ax, word [esi + 0xe]
    mov word [edx + 0x20447], ax
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    imul eax, eax, 0x28
    cmp word [eax + 0x20a080], 0x441
    jne short loc_16f95
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
loc_16f95:
    inc word [ebp - 0x20]
loc_16f99:
    mov eax, dword [ebp - 0x22]
    mov ebx, dword [SPRITE_SORT_COUNT]
    sar eax, 0x10
    cmp eax, ebx
    jl near loc_16956
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
    times 12 db 0    ; Padding between game5 and game6 code
