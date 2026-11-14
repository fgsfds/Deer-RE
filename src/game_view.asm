bits 32
org 0x15318

%define GET_ZS_OF_SLOPE 0x4dfb5
%define INSIDE 0x3b442
%define HITSCAN 0x414ef
%define GET_ANGLE 0x3b4fc
%define FLUSH_PERMS 0x47f72
%define PRINT_NOTICE 0x5130c
%define DO_INTERPOLATIONS 0x23e7c
%define RESTORE_INTERPOLATIONS 0x23ef0
%define SET_ASPECT 0x47d5d
%define DRAW_ROOMS 0x336b2
%define ANIMATE_SPRITES 0x1675c
%define DRAW_MASKS 0x3b895
%define SECTOR_EFFECT_DRAW_NOTICE 0xdcc
%define SECTOR_EFFECT_NOTICE 0xde8
%define INVALID_PLAYER_NOTICE 0xe00
%define NULL_PLAYER_NOTICE 0xe28
%define INVALID_SECTOR_NOTICE 0xe44
%define LOCATE_THE_LOCATOR_NOTICE 0xe64
%define NUM_PLAYERS 0xcf65c
%define SCREEN_HEIGHT 0x216f84
%define PLAYERS 0x8be10

update_sector_z:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x1c
    mov dword [ebp - 0xc], eax
    mov edi, edx
    mov dword [ebp - 0x10], ebx
    mov dword [ebp - 0x1c], ecx
    lea eax, [ebp - 0x24]
    mov ebx, edx
    mov edx, dword [ebp - 0xc]
    push eax
    movsx eax, word [ecx]
    lea ecx, [ebp - 0x20]
    call GET_ZS_OF_SLOPE
    mov eax, dword [ebp - 0x10]
    cmp eax, dword [ebp - 0x20]
    jl short loc_15364
    cmp eax, dword [ebp - 0x24]
    jg short loc_15364
    mov ebx, dword [ebp - 0x1c]
    mov eax, dword [ebp - 0xc]
    mov edx, edi
    movsx ebx, word [ebx]
    call INSIDE
    test eax, eax
    jne near loc_15466
loc_15364:
    mov eax, dword [ebp - 0x1c]
    mov dx, word [eax]
    test dx, dx
    jl near loc_1540c
    cmp dx, word [0x217fce]
    jge near loc_1540c
    movsx ebx, dx
    lea eax, [ebx*4]
    add eax, ebx
    mov ebx, dword [nosplit eax*8 + 0x20a066]
    mov ecx, 0x1be568
    sar ebx, 0x10
    mov eax, dword [nosplit eax*8 + 0x20a068]
    shl ebx, 5
    sar eax, 0x10
    add ecx, ebx
    mov dword [ebp - 0x14], eax
    mov dword [ebp - 0x18], ecx
loc_153b0:
    mov esi, dword [ebp - 0x18]
    mov esi, dword [esi + 0xa]
    sar esi, 0x10
    test esi, esi
    jl short loc_153fa
    lea eax, [ebp - 0x24]
    lea ecx, [ebp - 0x20]
    mov edx, dword [ebp - 0xc]
    push eax
    mov ebx, edi
    mov eax, esi
    call GET_ZS_OF_SLOPE
    mov eax, dword [ebp - 0x10]
    cmp eax, dword [ebp - 0x20]
    jl short loc_153fa
    cmp eax, dword [ebp - 0x24]
    jg short loc_153fa
    mov eax, dword [ebp - 0xc]
    movsx ebx, si
    mov edx, edi
    call INSIDE
    cmp eax, 1
    jne short loc_153fa
    mov eax, dword [ebp - 0x1c]
    mov word [eax], si
    jmp near loc_15466
loc_153fa:
    mov ebx, dword [ebp - 0x18]
    add ebx, 0x20
    mov ecx, dword [ebp - 0x14]
    mov dword [ebp - 0x18], ebx
    dec ecx
    mov dword [ebp - 0x14], ecx
    jne short loc_153b0
loc_1540c:
    mov esi, dword [0x217fcc]
    sar esi, 0x10
    dec esi
    test esi, esi
    jl short loc_1545e
loc_1541a:
    lea eax, [ebp - 0x24]
    lea ecx, [ebp - 0x20]
    mov edx, dword [ebp - 0xc]
    push eax
    mov ebx, edi
    mov eax, esi
    call GET_ZS_OF_SLOPE
    mov eax, dword [ebp - 0x10]
    cmp eax, dword [ebp - 0x20]
    jl short loc_15459
    cmp eax, dword [ebp - 0x24]
    jg short loc_15459
    mov eax, dword [ebp - 0xc]
    movsx ebx, si
    mov edx, edi
    call INSIDE
    cmp eax, 1
    jne short loc_15459
    mov eax, dword [ebp - 0x1c]
    mov word [eax], si
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
loc_15459:
    dec esi
    test esi, esi
    jge short loc_1541a
loc_1545e:
    mov eax, dword [ebp - 0x1c]
    mov word [eax], 0xffff
loc_15466:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
    lea eax, [byte eax + 0]

view:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x38
    mov dword [ebp - 0x30], edx
    mov dword [ebp - 0x20], ebx
    mov dword [ebp - 0x24], ecx
    mov edx, dword [ebp + 0xa]
    sar edx, 0x10
    lea ebx, [edx + 0x600]
    add edx, strict dword 0x400
    and edx, strict dword 0x7ff
    mov edi, dword [nosplit edx*2 + 0x1bd566]
    mov edx, dword [ebp + 0xe]
    sar edx, 0x10
    shl edx, 7
    sub edx, strict dword 0x3200
    mov dword [ebp - 0x2c], edx
    mov edx, dword [eax + 0x2f6]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edx, 0x191368
    shl eax, 2
    add edx, eax
    and ebx, strict dword 0x7ff
    mov ax, word [edx + 0xc]
    mov esi, dword [nosplit ebx*2 + 0x1bd566]
    mov dword [ebp - 0xc], eax
    and eax, strict dword 0xfffffefe
    mov dword [ebp - 0x28], edx
    mov word [edx + 0xc], ax
    mov edx, dword [ebp - 0x20]
    mov eax, dword [ebp - 0x30]
    mov ebx, dword [ecx]
    mov ecx, dword [ebp + 8]
    mov edx, dword [edx]
    mov eax, dword [eax]
    sar esi, 0x10
    call update_sector_z
    push dword 0x1000040
    lea eax, [ebp - 0x40]
    sar esi, 4
    push eax
    lea eax, [ebp - 0x3c]
    sar edi, 0x10
    push eax
    lea eax, [ebp - 0x38]
    sar edi, 4
    push eax
    lea eax, [ebp - 0x14]
    mov edx, dword [ebp - 0x2c]
    push eax
    lea eax, [ebp - 0x10]
    mov ecx, dword [ebp + 8]
    push eax
    lea eax, [ebp - 0x18]
    mov ebx, dword [ebp - 0x24]
    push eax
    movsx ecx, word [ecx]
    mov eax, dword [ebp - 0x20]
    push edx
    mov ebx, dword [ebx]
    mov eax, dword [eax]
    push edi
    mov dword [ebp - 0x34], eax
    mov eax, dword [ebp - 0x30]
    push esi
    mov edx, dword [ebp - 0x34]
    mov eax, dword [eax]
    call HITSCAN
    mov eax, dword [ebp + 8]
    cmp word [eax], 0
    jl near loc_15760
    mov edx, dword [ebp - 0x30]
    mov eax, dword [ebp - 0x38]
    mov ebx, dword [edx]
    sub eax, ebx
    mov dword [ebp - 0x1c], eax
    mov eax, dword [ebp - 0x20]
    mov edx, dword [eax]
    mov eax, esi
    mov ecx, dword [ebp - 0x3c]
    test eax, eax
    jns short loc_15580
    neg eax
loc_15580:
    sub ecx, edx
    mov edx, eax
    mov eax, edi
    test eax, eax
    jns short loc_1558c
    neg eax
loc_1558c:
    add edx, eax
    mov eax, dword [ebp - 0x1c]
    mov dword [ebp - 0x34], edx
    test eax, eax
    jns short loc_1559a
    neg eax
loc_1559a:
    mov edx, eax
    mov eax, ecx
    mov ebx, dword [ebp - 0x34]
    test eax, eax
    jns short loc_155a7
    neg eax
loc_155a7:
    add eax, edx
    cmp eax, ebx
    jge near loc_156c6
    mov edx, dword [ebp + 8]
    mov eax, dword [ebp - 0x18]
    mov word [edx], ax
    cmp word [ebp - 0x10], 0
    jl near loc_1565b
    mov eax, dword [ebp - 0x12]
    sar eax, 0x10
    shl eax, 5
    mov edx, dword [eax + 0x1be56e]
    sar edx, 0x10
    shl edx, 5
    mov ebx, dword [eax + 0x1be56c]
    mov dword [ebp - 0x34], edx
    mov edx, dword [edx + 0x1be56c]
    sub edx, ebx
    mov ebx, edx
    mov edx, dword [ebp - 0x34]
    mov edx, dword [edx + 0x1be568]
    sub edx, dword [eax + 0x1be568]
    mov eax, edx
    mov edx, ebx
    call GET_ANGLE
    cwde
    lea edx, [eax + 0x600]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    imul eax, esi
    and edx, strict dword 0x7ff
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    imul edx, edi
    add edx, eax
    mov eax, esi
    test eax, eax
    jns short loc_15636
    neg eax
loc_15636:
    mov ebx, eax
    mov eax, edi
    test eax, eax
    jns short loc_15640
    neg eax
loc_15640:
    cmp ebx, eax
    jle short loc_15651
    mov eax, esi
    imul edx
    shrd eax, edx, 0x1c
    sub dword [ebp - 0x1c], eax
    jmp short loc_1568e
loc_15651:
    mov eax, edi
    imul edx
    shrd eax, edx, 0x1c
    jmp short loc_1568c
loc_1565b:
    cmp word [ebp - 0x14], 0
    jge short loc_1568e
    mov eax, esi
    test eax, eax
    jns short loc_1566a
    neg eax
loc_1566a:
    mov edx, eax
    mov eax, edi
    test eax, eax
    jns short loc_15674
    neg eax
loc_15674:
    cmp edx, eax
    jle short loc_15687
    mov eax, esi
    mov edx, dword [ebp - 0x1c]
    sar eax, 5
    sub edx, eax
    mov dword [ebp - 0x1c], edx
    jmp short loc_1568e
loc_15687:
    mov eax, edi
    sar eax, 5
loc_1568c:
    sub ecx, eax
loc_1568e:
    mov eax, esi
    test eax, eax
    jns short loc_15696
    neg eax
loc_15696:
    mov edx, eax
    mov eax, edi
    test eax, eax
    jns short loc_156a0
    neg eax
loc_156a0:
    cmp edx, eax
    jle short loc_156ab
    mov eax, dword [ebp - 0x1c]
    mov ebx, esi
    jmp short loc_156af
loc_156ab:
    mov ebx, edi
    mov eax, ecx
loc_156af:
    mov edx, eax
    sar edx, 0x10
    shl eax, 0x10
    idiv ebx
    cmp eax, dword [0x9524]
    jge short loc_156c6
    mov dword [0x9524], eax
loc_156c6:
    mov edx, dword [0x9524]
    mov eax, esi
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [ebp - 0x30]
    mov ecx, dword [edx]
    add ecx, eax
    mov eax, edi
    mov dword [edx], ecx
    mov edx, dword [0x9524]
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [ebp - 0x20]
    mov esi, dword [edx]
    add esi, eax
    mov eax, dword [ebp - 0x2c]
    mov dword [edx], esi
    mov edx, dword [0x9524]
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [ebp - 0x24]
    add dword [edx], eax
    mov eax, dword [0x216f7c]
    mov edx, dword [0x9528]
    sub eax, edx
    mov ebx, dword [0x9524]
    shl eax, 0xa
    add eax, ebx
    cmp eax, strict dword 0x10000
    jge short loc_15735
    mov eax, dword [0x216f7c]
    sub eax, edx
    shl eax, 0xa
    add eax, ebx
    jmp short loc_1573a
loc_15735:
    mov eax, 0x10000
loc_1573a:
    mov dword [0x9524], eax
    mov eax, dword [0x216f7c]
    mov ebx, dword [ebp - 0x24]
    mov edx, dword [ebp - 0x20]
    mov ecx, dword [ebp + 8]
    mov dword [0x9528], eax
    mov eax, dword [ebp - 0x30]
    mov ebx, dword [ebx]
    mov edx, dword [edx]
    mov eax, dword [eax]
    call update_sector_z
loc_15760:
    mov edx, dword [ebp - 0x28]
    mov eax, dword [ebp - 0xc]
    mov word [edx + 0xc], ax
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 0xc
    nop

draw_background:
    push ebp
    mov ebp, esp
    push ecx
    push edx
    call FLUSH_PERMS
    cmp byte [0xc0049], 0
    jne short loc_15790
    cmp dword [0xbffab], 2
    jne short loc_157ed
loc_15790:
    cmp dword [0xbfb4b], 1
    je short loc_157d1
    cmp dword [0xbffe3], 1
    jle short loc_157b5
    mov ecx, 0xc8
    mov edx, 8
    mov eax, dword [SCREEN_HEIGHT]
    imul edx
    idiv ecx
loc_157b5:
    cmp dword [0xbffe3], 4
    jle short loc_157d1
    mov ecx, 0xc8
    mov edx, 8
    mov eax, dword [SCREEN_HEIGHT]
    imul edx
    idiv ecx
loc_157d1:
    cmp dword [0xbfb4f], 8
    jl short loc_157ed
    mov ecx, 0xc8
    mov edx, 0xa6
    mov eax, dword [SCREEN_HEIGHT]
    imul edx
    idiv ecx
loc_157ed:
    call 0x2676c
    lea esp, [ebp - 8]
    pop edx
    pop ecx
    pop ebp
    ret
    lea eax, [byte eax + 0]

sector_effect_150_draw:
    push ebp
    mov ebp, esp
    mov eax, SECTOR_EFFECT_DRAW_NOTICE
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret 0xc
    lea eax, [byte eax + 0]

sector_effect_150:
    push ebp
    mov ebp, esp
    mov eax, SECTOR_EFFECT_NOTICE
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 8
    nop

display_rooms:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 0x20
    test ax, ax
    jl short loc_15840
    cmp ax, word [NUM_PLAYERS]
    jl short loc_1584f
loc_15840:
    mov eax, INVALID_PLAYER_NOTICE
    call PRINT_NOTICE
    jmp near loc_15c51
loc_1584f:
    movsx ebx, ax
    imul ebx, ebx, strict dword 0x623
    mov esi, PLAYERS
    add esi, ebx
    jne short loc_15874
    mov eax, NULL_PLAYER_NOTICE
    call PRINT_NOTICE
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_15874:
    cmp byte [0xbfaf4], 2
    je near loc_15c51
    cmp byte [0xbf575], 0
    jne near loc_15c51
    mov ebx, dword [esi + 0x298]
    sar ebx, 0x10
    cmp ebx, -1
    je near loc_15c51
    test edx, edx
    jle short loc_158a8
    mov edi, edx
    jmp short loc_158aa
loc_158a8:
    xor edi, edi
loc_158aa:
    cmp edi, strict dword 0x10000
    jge short loc_158ba
    test edx, edx
    jg short loc_158bf
    xor edx, edx
    jmp short loc_158bf
loc_158ba:
    mov edx, 0x10000
loc_158bf:
    mov cx, word [esi + 0x284]
    mov edi, edx
    test cx, cx
    je short loc_158d9
    mov edx, dword [0xbfb03]
    mov dword [esi + 0x268], edx
loc_158d9:
    mov edx, dword [esi + 0x268]
    mov dword [0x215c9c], edx
    cmp word [0xbfaf7], 0
    jne short loc_15904
    cwde
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c104]
    sar eax, 0x10
    cmp eax, -1
    jle short loc_15909
loc_15904:
    mov edi, 0x10000
loc_15909:
    mov ax, word [esi + 0x29a]
    mov word [ebp - 0x14], ax
    test ax, ax
    jl short loc_1591f
    cmp ax, strict word 0x400
    jl short loc_15932
loc_1591f:
    mov eax, INVALID_SECTOR_NOTICE
    call PRINT_NOTICE
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_15932:
    mov eax, edi
    call DO_INTERPOLATIONS
    mov eax, 0x10000
    mov edx, dword [0x216f6c]
    call SET_ASPECT
    mov eax, dword [esi + 0x214]
    sub eax, dword [esi + 0x238]
    mov edx, edi
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [esi + 0x238]
    add edx, eax
    mov dword [ebp - 0x20], edx
    mov eax, dword [esi + 0x218]
    mov ebx, dword [esi + 0x23c]
    mov edx, edi
    sub eax, ebx
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [esi + 0x23c]
    add edx, eax
    mov dword [ebp - 0x24], edx
    mov eax, dword [esi + 0x21c]
    mov ecx, dword [esi + 0x240]
    mov edx, edi
    sub eax, ecx
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [esi + 0x240]
    add edx, eax
    mov dword [ebp - 0x28], edx
    mov eax, dword [esi + 0x292]
    mov edx, dword [esi + 0x294]
    sar eax, 0x10
    sar edx, 0x10
    add eax, strict dword 0x400
    sub eax, edx
    and eax, strict dword 0x7ff
    mov edx, edi
    sub eax, strict dword 0x400
    imul edx
    shrd eax, edx, 0x10
    mov dx, word [esi + 0x296]
    add edx, eax
    mov bx, word [esi + 0x224]
    mov word [ebp - 0x1c], dx
    mov eax, dword [esi + 0x2cc]
    mov dx, word [esi + 0x228]
    sar eax, 0x10
    add ebx, edx
    mov edx, dword [esi + 0x220]
    mov ecx, dword [esi + 0x224]
    add eax, edx
    mov edx, dword [esi + 0x228]
    sub eax, ecx
    sub eax, edx
    mov edx, edi
    imul edx
    shrd eax, edx, 0x10
    add ebx, eax
    mov word [ebp - 0x18], bx
    mov ax, word [esi + 0x29c]
    mov ebx, dword [ebp - 0x1c]
    add ebx, eax
    mov cx, word [esi + 0x2d4]
    mov word [ebp - 0x1c], bx
    test cx, cx
    jl short loc_15aa8
    mov ax, word [esi + 0x294]
    add ax, word [esi + 0x29c]
    mov bx, word [esi + 0x2ce]
    mov word [ebp - 0x1c], ax
    mov ax, word [esi + 0x220]
    add eax, ebx
    mov word [ebp - 0x18], ax
    mov eax, dword [esi + 0x214]
    mov dword [ebp - 0x20], eax
    mov eax, dword [esi + 0x218]
    mov dword [ebp - 0x24], eax
    mov eax, dword [esi + 0x21c]
    mov dword [ebp - 0x28], eax
    mov edx, dword [esi + 0x2d2]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov ax, word [nosplit eax*4 + 0x191380]
    mov edi, 0x10000
    mov word [ebp - 0x14], ax
    jmp short loc_15afc
loc_15aa8:
    cmp word [esi + 0x2fc], 0
    jne short loc_15ada
    mov eax, dword [esi + 0x244]
    mov ebx, dword [esi + 0x248]
    mov edx, edi
    sub eax, ebx
    imul edx
    shrd eax, edx, 0x10
    mov ecx, dword [esi + 0x248]
    mov edx, dword [ebp - 0x28]
    add eax, ecx
    add edx, eax
    mov dword [ebp - 0x28], edx
    jmp short loc_15afc
loc_15ada:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    push eax
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    lea ecx, [ebp - 0x28]
    push eax
    lea eax, [ebp - 0x14]
    lea ebx, [ebp - 0x24]
    push eax
    lea edx, [ebp - 0x20]
    mov eax, esi
    call view
loc_15afc:
    mov edx, dword [esi + 0x2f6]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov eax, dword [eax + 0x2044f]
    mov dword [ebp - 0x30], eax
    mov edx, dword [esi + 0x2f6]
    sar edx, 0x10
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov eax, dword [eax + 0x2044b]
    mov dword [ebp - 0x2c], eax
    cmp word [esi + 0x2d4], 0
    jl short loc_15b71
    mov edx, dword [esi + 0x2d2]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    movsx ax, byte [nosplit eax*4 + 0x191378]
    add eax, strict dword 0x64
    mov word [ebp - 0x18], ax
    jmp short loc_15bb0
loc_15b71:
    cmp byte [esi + 0x553], 0
    jne short loc_15bb0
    mov eax, dword [esi + 0x260]
    mov ebx, dword [ebp - 0x28]
    add eax, strict dword 0x400
    cmp eax, ebx
    jle short loc_15b96
    mov eax, dword [ebp - 0x30]
    add eax, strict dword 0x400
    jmp short loc_15bad
loc_15b96:
    mov eax, dword [esi + 0x25c]
    sub eax, strict dword 0x400
    cmp eax, ebx
    jge short loc_15bb0
    mov eax, dword [ebp - 0x2c]
    sub eax, strict dword 0x400
loc_15bad:
    mov dword [ebp - 0x28], eax
loc_15bb0:
    cmp word [ebp - 0x14], 0
    jl short loc_15bf3
    lea eax, [ebp - 0x2c]
    lea ecx, [ebp - 0x30]
    mov ebx, dword [ebp - 0x24]
    push eax
    mov eax, dword [ebp - 0x16]
    mov edx, dword [ebp - 0x20]
    sar eax, 0x10
    call GET_ZS_OF_SLOPE
    mov eax, dword [ebp - 0x30]
    mov esi, dword [ebp - 0x28]
    add eax, strict dword 0x400
    cmp eax, esi
    jle short loc_15be1
    mov dword [ebp - 0x28], eax
loc_15be1:
    mov eax, dword [ebp - 0x2c]
    mov edx, dword [ebp - 0x28]
    sub eax, strict dword 0x400
    cmp eax, edx
    jge short loc_15bf3
    mov dword [ebp - 0x28], eax
loc_15bf3:
    cmp word [ebp - 0x18], 0x12b
    jle short loc_15c03
    mov word [ebp - 0x18], 0x12b
    jmp short loc_15c14
loc_15c03:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    cmp eax, -0x63
    jge short loc_15c14
    mov word [ebp - 0x18], 0xff9d
loc_15c14:
    mov eax, dword [ebp - 0x16]
    mov esi, dword [ebp - 0x1e]
    sar eax, 0x10
    mov ebx, dword [ebp - 0x28]
    push eax
    mov eax, dword [ebp - 0x1a]
    mov edx, dword [ebp - 0x24]
    sar eax, 0x10
    sar esi, 0x10
    push eax
    mov ecx, esi
    mov eax, dword [ebp - 0x20]
    call DRAW_ROOMS
    mov edx, dword [ebp - 0x24]
    mov eax, dword [ebp - 0x20]
    mov ecx, edi
    mov ebx, esi
    call ANIMATE_SPRITES
    call DRAW_MASKS
    call RESTORE_INTERPOLATIONS
loc_15c51:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

locate_the_locator:
    push ebp
    mov ebp, esp
    mov eax, LOCATE_THE_LOCATOR_NOTICE
    call PRINT_NOTICE
    mov eax, 0xffffffff
    mov esp, ebp
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
