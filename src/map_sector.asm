bits 32
org 0x27980

%define ROTATE_SPRITE 0x47f83
%define PRINT_NOTICE 0x5130c
%define DRAW_LINE_256 0x451d7
%define SET_PALETTE 0x4aa2a

pal_to:
    push ebp
    mov ebp, esp
    push esi
    sub esp, strict dword 0x314
    mov byte [ebp - 0x10], al
    mov byte [ebp - 8], dl
    mov byte [ebp - 0xc], bl
    mov dword [ebp - 0x14], ecx
    mov ebx, ecx
    xor eax, eax
    and ebx, 0x7f
loc_2799d:
    mov edx, dword [0xcf65c]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    xor ecx, ecx
    mov edx, dword [edx + 0x8c37d]
    movzx esi, byte [ebp - 0x10]
    mov cl, byte [edx + eax]
    sub esi, ecx
    imul esi, ebx
    sar esi, 6
    add ecx, esi
    mov dword [ebp - 0x18], ecx
    mov cl, byte [ebp - 0x18]
    mov byte [eax + ebp - 0x318], cl
    xor ecx, ecx
    movzx esi, byte [ebp - 8]
    mov cl, byte [edx + eax + 1]
    sub esi, ecx
    imul esi, ebx
    sar esi, 6
    add ecx, esi
    mov dword [ebp - 0x18], ecx
    mov cl, byte [ebp - 0x18]
    mov byte [eax + ebp - 0x317], cl
    mov dl, byte [edx + eax + 2]
    xor ecx, ecx
    and edx, strict dword 0xff
    mov cl, byte [ebp - 0xc]
    sub ecx, edx
    imul ecx, ebx
    sar ecx, 6
    add eax, 3
    add edx, ecx
    mov byte [eax + ebp - 0x319], dl
    cmp eax, strict dword 0x300
    jl short loc_2799d
    test byte [ebp - 0x14], 0x80
    jne short loc_27a44
    mov dl, byte [0x21805e]
    cmp dl, 1
    jne short loc_27a36
    cmp dl, byte [0x218054]
    jne short loc_27a44
loc_27a36:
    mov dx, 0x3da
loc_27a3a:
    in al, dx
    test al, 8
    jne short loc_27a3a
loc_27a3f:
    in al, dx
    test al, 8
    je short loc_27a3f
loc_27a44:
    mov eax, dword [0xbffb3]
    lea edx, [ebp - 0x318]
    sar eax, 2
    call SET_PALETTE
    lea esp, [ebp - 4]
    pop esi
    pop ebp
    ret
    lea eax, [byte eax + 0]

draw_overhead_map:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, strict dword 0x118
    mov dword [ebp - 0x118], eax
    mov dword [ebp - 0x114], edx
    mov dword [ebp - 0x110], ebx
    mov word [ebp - 0x18], cx
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    mov edx, eax
    neg edx
    and edx, strict dword 0x7ff
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    imul ebx, edx
    mov edx, 0x600
    sub edx, eax
    mov eax, edx
    and eax, strict dword 0x7ff
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    mov edx, dword [ebp - 0x110]
    sar eax, 0x10
    imul edx, eax
    mov dword [ebp - 0xfc], edx
    mov eax, ebx
    mov edx, dword [0x216f6c]
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [0x216f6c]
    mov dword [ebp - 0x100], eax
    mov eax, dword [ebp - 0xfc]
    mov dword [ebp - 0xf8], ebx
    imul edx
    shrd eax, edx, 0x10
    xor edx, edx
    mov dword [ebp - 0x104], eax
    mov dword [ebp - 0x94], edx
    mov dword [ebp - 0x5c], edx
    jmp near loc_27dd4
loc_27b07:
    mov eax, ecx
    xor edx, edx
    sar eax, 3
    and ecx, 7
    mov dl, byte [eax + 0x1694e8]
    mov eax, 1
    shl eax, cl
    test edx, eax
    je near loc_27dbe
    mov eax, dword [ebp - 0x5c]
    mov edx, dword [ebp - 0x5c]
    mov eax, dword [eax + 0x20a066]
    mov edx, dword [edx + 0x20a068]
    sar eax, 0x10
    sar edx, 0x10
    lea ebx, [eax + edx]
    mov edx, dword [ebp - 0x5c]
    mov edx, dword [edx + 0x20a06c]
    mov dword [ebp - 0xe8], edx
    mov edx, dword [ebp - 0x5c]
    mov edx, dword [edx + 0x20a070]
    mov dword [ebp - 0xf0], ebx
    mov dword [ebp - 0xec], edx
    mov edx, eax
    mov ebx, 0x1be568
    shl edx, 5
    mov dword [ebp - 0x98], eax
    add ebx, edx
    mov edx, dword [ebp - 0xf0]
    mov dword [ebp - 0x108], ebx
    cmp eax, edx
    jge near loc_27dbe
loc_27b8b:
    mov edx, dword [ebp - 0x108]
    mov edx, dword [edx + 8]
    sar edx, 0x10
    test edx, edx
    jl near loc_27d94
    mov eax, dword [ebp - 0x108]
    mov eax, dword [eax + 0xa]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov edi, dword [ebp - 0xe8]
    cmp edi, dword [eax + 0x20a06c]
    jne short loc_27bec
    mov ebx, dword [ebp - 0xec]
    cmp ebx, dword [eax + 0x20a070]
    jne short loc_27bec
    shl edx, 5
    mov eax, dword [ebp - 0x108]
    mov edx, dword [edx + 0x1be574]
    mov eax, dword [eax + 0xc]
    sar edx, 0x10
    sar eax, 0x10
    or eax, edx
    test al, 0x30
    je near loc_27d94
loc_27bec:
    mov eax, dword [ebp - 0x108]
    mov eax, dword [eax + 8]
    sar eax, 0x10
    mov edx, dword [ebp - 0x108]
    shl eax, 5
    mov edx, dword [edx + 0xc]
    mov eax, dword [eax + 0x1be574]
    sar edx, 0x10
    sar eax, 0x10
    or eax, edx
    test al, 1
    mov eax, dword [ebp - 0x108]
    mov eax, dword [eax + 0xa]
    sar eax, 0x10
    sar eax, 3
    xor edx, edx
    mov dl, byte [eax + 0x1694e8]
    mov eax, dword [ebp - 0x108]
    mov ax, word [eax + 0xc]
    xor ah, ah
    and al, 7
    movsx ecx, ax
    mov eax, 1
    shl eax, cl
    test edx, eax
    jne near loc_27d94
    mov ecx, dword [ebp - 0x108]
    mov esi, dword [ebp - 0x118]
    mov eax, dword [ebp - 0x108]
    mov edi, dword [ebp - 0x114]
    mov edx, dword [ebp - 0xf8]
    mov ecx, dword [ecx]
    mov eax, dword [eax + 4]
    sub ecx, esi
    sub eax, edi
    mov edi, dword [ebp - 0xfc]
    mov esi, eax
    mov dword [ebp - 0xc0], eax
    neg esi
    mov eax, ecx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [0x216f88]
    mov edi, dword [ebp - 0x104]
    shl edx, 0xb
    mov esi, ecx
    add eax, edx
    mov edx, dword [ebp - 0x100]
    mov dword [ebp - 0xa0], eax
    mov eax, dword [ebp - 0xc0]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [0x216f84]
    shl edx, 0xb
    add eax, edx
    mov dword [ebp - 0xa4], eax
    mov eax, dword [ebp - 0x108]
    mov eax, dword [eax + 6]
    sar eax, 0x10
    shl eax, 5
    mov ebx, dword [ebp - 0x114]
    add eax, strict dword 0x1be568
    mov edi, dword [ebp - 0xfc]
    mov edx, dword [ebp - 0x118]
    mov ecx, dword [eax]
    mov eax, dword [eax + 4]
    sub ecx, edx
    sub eax, ebx
    mov edx, dword [ebp - 0xf8]
    mov esi, eax
    mov dword [ebp - 0xc0], eax
    neg esi
    mov eax, ecx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [0x216f88]
    mov edi, dword [ebp - 0x104]
    shl edx, 0xb
    mov esi, ecx
    add eax, edx
    mov edx, dword [ebp - 0x100]
    mov dword [ebp - 0xa8], eax
    mov eax, dword [ebp - 0xc0]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [0x216f84]
    push byte 0x18
    shl edx, 0xb
    mov ebx, dword [ebp - 0xa8]
    add eax, edx
    mov edx, dword [ebp - 0xa4]
    mov dword [ebp - 0xac], eax
    mov ecx, eax
    mov eax, dword [ebp - 0xa0]
    call DRAW_LINE_256
loc_27d94:
    mov ebx, dword [ebp - 0x98]
    mov ecx, dword [ebp - 0x108]
    mov esi, dword [ebp - 0xf0]
    inc ebx
    add ecx, 0x20
    mov dword [ebp - 0x98], ebx
    mov dword [ebp - 0x108], ecx
    cmp ebx, esi
    jl near loc_27b8b
loc_27dbe:
    mov ecx, dword [ebp - 0x5c]
    mov esi, dword [ebp - 0x94]
    add ecx, 0x28
    inc esi
    mov dword [ebp - 0x5c], ecx
    mov dword [ebp - 0x94], esi
loc_27dd4:
    mov eax, dword [0x217fcc]
    mov ecx, dword [ebp - 0x94]
    sar eax, 0x10
    cmp eax, ecx
    jg near loc_27b07
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    xor esi, esi
    mov eax, dword [eax + 0x8c106]
    mov dword [ebp - 0x1c], esi
    sar eax, 0x10
    mov dword [ebp - 0x58], esi
    mov dword [ebp - 0x9c], eax
    jmp near loc_283a4
loc_27e14:
    mov eax, edi
    mov ecx, edi
    xor edx, edx
    sar eax, 3
    and ecx, 7
    mov dl, byte [eax + 0x1694e8]
    mov eax, 1
    shl eax, cl
    test edx, eax
    je near loc_28394
    mov eax, dword [ebp - 0x58]
    mov eax, dword [eax + 0x21778c]
    sar eax, 0x10
    mov dword [ebp - 0x24], eax
    test eax, eax
    jl near loc_28394
loc_27e4c:
    mov esi, dword [ebp - 0x24]
    imul ecx, esi, 0x2c
    mov edi, dword [ebp - 0x9c]
    add ecx, strict dword 0x191368
    cmp esi, edi
    je near loc_2837c
    mov eax, dword [ecx + 0xa]
    sar eax, 0x10
    test ah, 0x80
    jne near loc_2837c
    cmp word [ecx + 0xc], 0x101
    je near loc_2837c
    cmp byte [ecx + 0x14], 0
    je near loc_2837c
    mov byte [ebp - 0xc], 0x47
    test byte [ecx + 0xc], 1
    je short loc_27e99
    mov byte [ebp - 0xc], 0xea
loc_27e99:
    mov eax, dword [ecx]
    mov dword [ebp - 0xd8], eax
    mov eax, dword [ecx + 4]
    mov bx, word [ecx + 0xc]
    mov dword [ebp - 0xdc], eax
    test bx, 0x101
    je near loc_2837c
    mov esi, ebx
    and esi, 0x30
    cmp si, 0x10
    jb near loc_2837c
    jbe near loc_2837c
    cmp si, 0x20
    jne near loc_2837c
    mov eax, dword [ecx + 0xc]
    mov edi, dword [ecx + 0x14]
    sar eax, 0x10
    sar edi, 0x18
    mov ebx, dword [nosplit eax*4 + 0x173268]
    mov edx, dword [nosplit eax*4 + 0x173268]
    sar ebx, 8
    sar edx, 0x10
    and ebx, strict dword 0xff
    and edx, strict dword 0xff
    mov dword [ebp - 0x30], ebx
    movsx edx, dl
    mov bl, byte [ebp - 0x30]
    add edi, edx
    movsx esi, bl
    mov dx, word [ecx + 0xc]
    mov ebx, dword [ecx + 0x13]
    xor dh, dh
    sar ebx, 0x18
    and dl, 4
    add esi, ebx
    test dx, dx
    jle short loc_27f2a
    neg esi
loc_27f2a:
    mov dx, word [ecx + 0xc]
    xor dh, dh
    and dl, 8
    test dx, dx
    jle short loc_27f3a
    neg edi
loc_27f3a:
    mov edx, dword [ecx + 0x1a]
    sar edx, 0x10
    mov dword [ebp - 0x9c], edx
    add edx, strict dword 0x200
    and edx, strict dword 0x7ff
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    mov dword [ebp - 0xc8], edx
    mov edx, dword [ebp - 0x9c]
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    mov dword [ebp - 0xcc], edx
    mov edx, dword [nosplit eax*2 + 0x17cee6]
    mov eax, dword [nosplit eax*2 + 0x1816e6]
    sar eax, 0x10
    sar edx, 0x10
    mov dword [ebp - 0xd4], eax
    xor eax, eax
    mov dword [ebp - 0xd0], edx
    mov al, byte [ecx + 0x15]
    xor edx, edx
    mov dword [ebp - 0xe4], eax
    mov eax, dword [ebp - 0xd0]
    mov dl, byte [ecx + 0x14]
    sar eax, 1
    mov ecx, edx
    add eax, esi
    imul ecx, eax
    mov eax, dword [ebp - 0xd4]
    mov dword [ebp - 0xe0], edx
    sar eax, 1
    mov edx, dword [ebp - 0xe4]
    add eax, edi
    imul edx, eax
    mov esi, dword [ebp - 0xc8]
    mov eax, dword [ebp - 0xcc]
    mov dword [ebp - 0xc4], edx
    mov edi, edx
    mov edx, ecx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [ebp - 0xd8]
    mov esi, dword [ebp - 0xc8]
    mov edi, ecx
    neg esi
    add edx, eax
    mov eax, dword [ebp - 0xcc]
    mov dword [ebp - 0x30], edx
    mov edx, dword [ebp - 0xc4]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov esi, dword [ebp - 0xdc]
    mov ecx, dword [ebp - 0xd0]
    add esi, eax
    imul ecx, dword [ebp - 0xe0]
    mov eax, dword [ebp - 0xcc]
    mov edx, ecx
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [ebp - 0x30]
    sub edx, eax
    mov eax, dword [ebp - 0xc8]
    mov dword [ebp - 0xa8], edx
    mov edx, ecx
    imul edx
    shrd eax, edx, 0x10
    lea edx, [esi + eax]
    mov ecx, dword [ebp - 0xd4]
    mov dword [ebp - 0xac], edx
    imul ecx, dword [ebp - 0xe4]
    mov eax, dword [ebp - 0xc8]
    mov edx, ecx
    imul edx
    shrd eax, edx, 0x10
    mov dword [ebp - 0x9c], eax
    mov ebx, eax
    mov eax, dword [ebp - 0xa8]
    neg ebx
    add eax, ebx
    mov dword [ebp - 0xb0], eax
    mov eax, dword [ebp - 0x30]
    mov edi, dword [ebp - 0x118]
    add eax, ebx
    mov edx, ecx
    mov dword [ebp - 0xb8], eax
    mov eax, dword [ebp - 0xcc]
    mov dword [ebp - 0x9c], ebx
    imul edx
    shrd eax, edx, 0x10
    mov dword [ebp - 0x9c], eax
    mov ebx, eax
    mov eax, dword [ebp - 0xac]
    neg ebx
    mov ecx, dword [ebp - 0x30]
    add eax, ebx
    mov dword [ebp - 0x9c], ebx
    mov dword [ebp - 0xb4], eax
    lea eax, [ebx + esi]
    sub ecx, edi
    mov dword [ebp - 0xbc], eax
    mov eax, dword [ebp - 0x114]
    mov edi, dword [ebp - 0xfc]
    sub esi, eax
    mov edx, dword [ebp - 0xf8]
    mov dword [ebp - 0x48], esi
    mov eax, ecx
    neg esi
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [ebp - 0x104]
    mov edx, dword [ebp - 0x100]
    mov dword [ebp - 0x90], eax
    mov esi, ecx
    mov eax, dword [ebp - 0x48]
    mov ecx, dword [ebp - 0xa8]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [ebp - 0x118]
    mov ebx, dword [ebp - 0x114]
    mov edi, dword [ebp - 0xfc]
    mov dword [ebp - 0x8c], eax
    mov eax, dword [ebp - 0xac]
    sub ecx, edx
    sub eax, ebx
    mov edx, dword [ebp - 0xf8]
    mov esi, eax
    mov dword [ebp - 0x48], eax
    neg esi
    mov eax, ecx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [ebp - 0x104]
    mov edx, dword [ebp - 0x100]
    mov dword [ebp - 0x88], eax
    mov dword [ebp - 0xa8], eax
    mov esi, ecx
    mov eax, dword [ebp - 0x48]
    mov ecx, dword [ebp - 0xb0]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov esi, dword [ebp - 0x118]
    mov edi, dword [ebp - 0x114]
    mov edx, dword [ebp - 0xf8]
    mov dword [ebp - 0x84], eax
    mov dword [ebp - 0xac], eax
    mov eax, dword [ebp - 0xb4]
    sub ecx, esi
    sub eax, edi
    mov edi, dword [ebp - 0xfc]
    mov esi, eax
    mov dword [ebp - 0x48], eax
    neg esi
    mov eax, ecx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [ebp - 0x104]
    mov edx, dword [ebp - 0x100]
    mov dword [ebp - 0x80], eax
    mov esi, ecx
    mov eax, dword [ebp - 0x48]
    mov ecx, dword [ebp - 0xb8]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov dword [ebp - 0x7c], eax
    mov eax, dword [ebp - 0x118]
    mov edx, dword [ebp - 0x114]
    sub ecx, eax
    mov eax, dword [ebp - 0xbc]
    mov edi, dword [ebp - 0xfc]
    sub eax, edx
    mov edx, dword [ebp - 0xf8]
    mov esi, eax
    mov dword [ebp - 0x48], eax
    neg esi
    mov eax, ecx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov dword [ebp - 0x78], eax
    mov edi, dword [ebp - 0x104]
    mov edx, dword [ebp - 0x100]
    mov eax, dword [ebp - 0x48]
    mov esi, ecx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    movzx esi, byte [ebp - 0xc]
    mov ecx, dword [ebp - 0x84]
    mov ebx, dword [ebp - 0x88]
    mov edi, eax
    mov eax, dword [0x216f88]
    mov edx, dword [0x216f84]
    shl eax, 0xb
    shl edx, 0xb
    mov dword [ebp - 0x30], eax
    add ebx, eax
    mov eax, dword [ebp - 0x8c]
    add ecx, edx
    add edx, eax
    mov eax, dword [ebp - 0x90]
    push esi
    add eax, dword [ebp - 0x30]
    call DRAW_LINE_256
    mov ecx, dword [ebp - 0x7c]
    mov ebx, dword [ebp - 0x80]
    mov eax, dword [0x216f88]
    mov edx, dword [0x216f84]
    shl eax, 0xb
    shl edx, 0xb
    mov dword [ebp - 0x30], eax
    add ebx, eax
    mov eax, dword [ebp - 0x84]
    add ecx, edx
    add edx, eax
    mov eax, dword [ebp - 0x88]
    push esi
    add eax, dword [ebp - 0x30]
    call DRAW_LINE_256
    mov ebx, dword [ebp - 0x78]
    mov eax, dword [0x216f84]
    mov edx, dword [ebp - 0x7c]
    shl eax, 0xb
    push esi
    mov dword [ebp - 0x30], eax
    lea ecx, [eax + edi]
    add edx, dword [ebp - 0x30]
    mov eax, dword [0x216f88]
    mov dword [ebp - 0x30], edx
    shl eax, 0xb
    mov edx, dword [ebp - 0x80]
    add ebx, eax
    add eax, edx
    mov edx, dword [ebp - 0x30]
    call DRAW_LINE_256
    mov ecx, dword [ebp - 0x8c]
    mov eax, dword [0x216f84]
    mov ebx, dword [0x216f88]
    push esi
    mov esi, dword [ebp - 0x90]
    shl eax, 0xb
    shl ebx, 0xb
    add ecx, eax
    lea edx, [edi + eax]
    mov eax, dword [ebp - 0x78]
    add esi, ebx
    add eax, ebx
    mov ebx, esi
    call DRAW_LINE_256
loc_2837c:
    mov eax, dword [ebp - 0x24]
    mov eax, dword [nosplit eax*2 + 0x18af66]
    sar eax, 0x10
    mov dword [ebp - 0x24], eax
    test eax, eax
    jge near loc_27e4c
loc_28394:
    mov ebx, dword [ebp - 0x58]
    mov ecx, dword [ebp - 0x1c]
    add ebx, 2
    inc ecx
    mov dword [ebp - 0x58], ebx
    mov dword [ebp - 0x1c], ecx
loc_283a4:
    mov eax, dword [0x217fcc]
    mov edi, dword [ebp - 0x1c]
    sar eax, 0x10
    cmp eax, edi
    jg near loc_27e14
    xor eax, eax
    mov dword [ebp - 0x20], eax
    mov dword [ebp - 0x11c], eax
    jmp near loc_285e4
loc_283c7:
    mov eax, esi
    mov ecx, esi
    xor edx, edx
    sar eax, 3
    and ecx, 7
    mov dl, byte [eax + 0x1694e8]
    mov eax, 1
    shl eax, cl
    test edx, eax
    je near loc_285ce
    mov eax, dword [ebp - 0x11c]
    mov edx, dword [ebp - 0x11c]
    mov eax, dword [eax + 0x20a066]
    mov edx, dword [edx + 0x20a068]
    sar eax, 0x10
    sar edx, 0x10
    mov edi, 0xffffffff
    lea ebx, [eax + edx]
    mov dword [ebp - 0x2c], edi
    mov dword [ebp - 0x50], ebx
    mov edx, eax
    mov ebx, 0x1be568
    shl edx, 5
    mov dword [ebp - 0x28], eax
    add ebx, edx
    mov edx, dword [ebp - 0x50]
    mov dword [ebp - 0x54], ebx
    cmp eax, edx
    jge near loc_285ce
loc_28431:
    mov eax, dword [ebp - 0x54]
    cmp word [eax + 0xa], 0
    jge near loc_285b3
    mov eax, dword [eax + 0xe]
    sar eax, 0x10
    add eax, eax
    cmp word [eax + 0x17cee8], 0
    je near loc_285b3
    cmp word [eax + 0x1816e8], 0
    je near loc_285b3
    mov eax, dword [ebp - 0x28]
    cmp eax, dword [ebp - 0x2c]
    jne short loc_28482
    mov eax, dword [ebp - 0xa8]
    mov dword [ebp - 0x10c], eax
    mov eax, dword [ebp - 0xac]
    jmp near loc_28503
loc_28482:
    mov ecx, dword [ebp - 0x54]
    mov eax, dword [ebp - 0x118]
    mov ecx, dword [ecx]
    sub ecx, eax
    mov eax, dword [ebp - 0x54]
    mov edx, dword [ebp - 0x114]
    mov eax, dword [eax + 4]
    mov edi, dword [ebp - 0xfc]
    sub eax, edx
    mov edx, dword [ebp - 0xf8]
    mov esi, eax
    mov dword [ebp - 0x30], eax
    neg esi
    mov eax, ecx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [0x216f88]
    mov edi, dword [ebp - 0x104]
    shl edx, 0xb
    mov esi, ecx
    add eax, edx
    mov edx, dword [ebp - 0x100]
    mov dword [ebp - 0x10c], eax
    mov eax, dword [ebp - 0x30]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [0x216f84]
    shl edx, 0xb
    add eax, edx
loc_28503:
    mov dword [ebp - 0x44], eax
    mov eax, dword [ebp - 0x54]
    mov eax, dword [eax + 6]
    sar eax, 0x10
    mov dword [ebp - 0x2c], eax
    shl eax, 5
    mov ebx, dword [ebp - 0x118]
    add eax, strict dword 0x1be568
    mov esi, dword [ebp - 0x114]
    mov edi, dword [ebp - 0xfc]
    mov ecx, dword [eax]
    mov eax, dword [eax + 4]
    mov edx, dword [ebp - 0xf8]
    sub eax, esi
    sub ecx, ebx
    mov esi, eax
    mov dword [ebp - 0x30], eax
    neg esi
    mov eax, ecx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [0x216f88]
    mov edi, dword [ebp - 0x104]
    shl edx, 0xb
    mov esi, ecx
    add eax, edx
    mov edx, dword [ebp - 0x100]
    mov dword [ebp - 0xa8], eax
    mov eax, dword [ebp - 0x30]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [0x216f84]
    push byte 0x18
    shl edx, 0xb
    mov ebx, dword [ebp - 0xa8]
    add eax, edx
    mov edx, dword [ebp - 0x44]
    mov dword [ebp - 0xac], eax
    mov ecx, eax
    mov eax, dword [ebp - 0x10c]
    call DRAW_LINE_256
loc_285b3:
    mov ebx, dword [ebp - 0x28]
    mov ecx, dword [ebp - 0x54]
    mov esi, dword [ebp - 0x50]
    inc ebx
    add ecx, 0x20
    mov dword [ebp - 0x28], ebx
    mov dword [ebp - 0x54], ecx
    cmp ebx, esi
    jl near loc_28431
loc_285ce:
    mov edi, dword [ebp - 0x11c]
    mov eax, dword [ebp - 0x20]
    add edi, 0x28
    inc eax
    mov dword [ebp - 0x11c], edi
    mov dword [ebp - 0x20], eax
loc_285e4:
    mov eax, dword [0x217fcc]
    mov esi, dword [ebp - 0x20]
    sar eax, 0x10
    cmp eax, esi
    jg near loc_283c7
    mov si, word [0x216f8e]
    test si, si
    jl near loc_28769
loc_28607:
    movsx edi, si
    mov ax, word [nosplit edi*2 + 0x18cf68]
    imul edi, edi, 0x2c
    mov edx, dword [ebp - 0x118]
    mov ecx, dword [ebp - 0x114]
    mov dword [ebp - 0x10], eax
    mov esi, dword [edi + 0x191368]
    mov eax, dword [ebp - 0x1a]
    sub esi, edx
    mov edx, dword [edi + 0x191382]
    sar eax, 0x10
    sar edx, 0x10
    mov ebx, dword [edi + 0x19136c]
    sub edx, eax
    sub ebx, ecx
    mov eax, edx
    mov ecx, 0x10
    and eax, strict dword 0x7ff
    mov edx, dword [ebp - 0xf8]
    mov dword [ebp - 0xf4], eax
    mov eax, esi
    imul edx
    shrd eax, edx, cl
    mov edx, dword [ebp - 0xfc]
    mov dword [ebp - 0x30], eax
    mov eax, ebx
    imul edx
    shrd eax, edx, cl
    mov edx, dword [ebp - 0x30]
    sub edx, eax
    mov dword [ebp - 0x34], edx
    mov eax, ebx
    mov edx, dword [ebp - 0x100]
    imul edx
    shrd eax, edx, cl
    mov edx, dword [ebp - 0x104]
    mov ebx, eax
    mov eax, esi
    imul edx
    shrd eax, edx, cl
    mov si, word [edi + 0x191376]
    add ebx, eax
    movsx eax, si
    imul eax, eax, 0x2c
    mov edx, dword [0x216f6c]
    mov dword [ebp - 0x3c], ebx
    mov al, byte [eax + 0x19137d]
    and eax, strict dword 0xff
    mov edi, dword [ebp - 0x110]
    inc eax
    imul eax, edi
    imul edx
    shrd eax, edx, cl
    mov edx, eax
    cmp eax, strict dword 0x55f0
    jge short loc_286da
    mov edx, 0x55f0
    jmp short loc_286e6
loc_286da:
    cmp eax, strict dword 0x20000
    jle short loc_286e6
    mov edx, 0x20000
loc_286e6:
    mov ebx, dword [0x215c84]
    push ebx
    mov ecx, dword [0x215c8c]
    push ecx
    mov edi, dword [0x215c88]
    mov eax, dword [0x215c90]
    push edi
    movsx ebx, si
    push eax
    imul eax, ebx, 0x2c
    mov cx, word [eax + 0x191374]
    xor ch, ch
    and cl, 2
    movsx ecx, cx
    sar ecx, 1
    push ecx
    xor ecx, ecx
    mov cl, byte [eax + 0x191379]
    mov eax, dword [eax + 0x191375]
    push ecx
    sar eax, 0x18
    mov esi, dword [0x216f84]
    push eax
    shl esi, 0xf
    mov eax, dword [ebp - 0x3c]
    push ebx
    shl eax, 4
    mov ebx, dword [ebp - 0x34]
    add esi, eax
    mov eax, dword [0x216f88]
    shl ebx, 4
    shl eax, 0xf
    mov ecx, dword [ebp - 0xf4]
    add eax, ebx
    mov ebx, edx
    mov edx, esi
    mov esi, dword [ebp - 0x10]
    call ROTATE_SPRITE
    test si, si
    jge near loc_28607
loc_28769:
    mov si, word [0xcf658]
    test si, si
    jl near loc_28ab8
loc_28779:
    cmp byte [0xbf576], 0
    je short loc_2878f
    cmp si, word [0xbf562]
    je near loc_28aa4
loc_2878f:
    movsx eax, si
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c106]
    sar eax, 0x10
    imul eax, eax, 0x2c
    mov edx, dword [ebp - 0x118]
    mov edi, dword [eax + 0x191368]
    mov ebx, dword [ebp - 0x114]
    sub edi, edx
    mov edx, dword [eax + 0x19136c]
    mov eax, dword [eax + 0x191382]
    sub edx, ebx
    mov ebx, dword [ebp - 0x1a]
    sar eax, 0x10
    sar ebx, 0x10
    sub eax, ebx
    mov dword [ebp - 0x4c], edx
    mov ebx, eax
    mov ax, word [0xbf562]
    and ebx, strict dword 0x7ff
    cmp si, ax
    jne short loc_287ee
    xor edi, edi
    xor ebx, ebx
    mov dword [ebp - 0x4c], edi
loc_287ee:
    mov ecx, 0x10
    mov edx, dword [ebp - 0xf8]
    mov eax, edi
    imul edx
    shrd eax, edx, cl
    mov edx, dword [ebp - 0xfc]
    mov dword [ebp - 0x30], eax
    mov eax, dword [ebp - 0x4c]
    imul edx
    shrd eax, edx, cl
    mov edx, dword [ebp - 0x30]
    sub edx, eax
    mov eax, dword [ebp - 0x4c]
    mov dword [ebp - 0x38], edx
    mov edx, dword [ebp - 0x100]
    imul edx
    shrd eax, edx, cl
    mov edx, dword [ebp - 0x104]
    mov dword [ebp - 0x30], eax
    mov eax, edi
    imul edx
    shrd eax, edx, cl
    mov edx, dword [ebp - 0x30]
    add edx, eax
    mov dword [ebp - 0x40], edx
    cmp si, word [0xbf562]
    je short loc_28855
    cmp dword [0xbfb4b], 1
    jne near loc_28aa4
loc_28855:
    movsx eax, si
    imul eax, eax, strict dword 0x623
    cmp dword [eax + 0x8c3bd], 0
    je short loc_2886e
    mov edi, 0x1c01
    jmp short loc_288b6
loc_2886e:
    cmp dword [eax + 0x8c3e1], 0
    je short loc_2887e
    mov edi, 0x1c17
    jmp short loc_288b6
loc_2887e:
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    imul edx, edx, 0x2c
    cmp word [edx + 0x191388], 0x10
    jle short loc_288b1
    cmp byte [eax + 0x8c352], 0
    je short loc_288b1
    mov edi, dword [0x216f7c]
    sar edi, 4
    and edi, 3
    add edi, strict dword 0xf00
    jmp short loc_288b6
loc_288b1:
    mov edi, 0xf00
loc_288b6:
    movsx edx, si
    imul edx, edx, strict dword 0x623
    mov eax, dword [edx + 0x8c06c]
    sub eax, dword [edx + 0x8c02c]
    test eax, eax
    jns short loc_288d1
    neg eax
loc_288d1:
    mov edx, dword [edx + 0x8c106]
    sar edx, 0x10
    imul edx, edx, 0x2c
    mov ecx, dword [0x216f6c]
    sar eax, 8
    mov dword [ebp - 0x30], ecx
    mov dl, byte [edx + 0x19137d]
    and edx, strict dword 0xff
    add eax, edx
    imul eax, dword [ebp - 0x110]
    mov ecx, 0x10
    mov edx, dword [ebp - 0x30]
    imul edx
    shrd eax, edx, cl
    mov edx, eax
    cmp eax, strict dword 0x55f0
    jge short loc_2891b
    mov eax, 0x55f0
    jmp short loc_28927
loc_2891b:
    cmp eax, strict dword 0x20000
    jle short loc_28927
    mov eax, 0x20000
loc_28927:
    movsx edx, si
    imul edx, edx, strict dword 0x623
    mov ecx, dword [ebp - 0x38]
    shl ecx, 4
    mov dword [ebp - 0x6c], ecx
    mov ecx, dword [0x216f84]
    shl ecx, 0xf
    mov dword [ebp - 0x120], ecx
    mov ecx, dword [ebp - 0x40]
    mov dword [ebp - 0x74], edx
    mov edx, eax
    shl ecx, 4
    sar edx, 1
    mov dword [ebp - 0x68], ecx
    mov dword [ebp - 0x70], edx
    mov edx, dword [0x216f88]
    mov ecx, dword [ebp - 0x6c]
    shl edx, 0xf
    add ecx, edx
    mov edx, dword [ebp - 0x68]
    mov dword [ebp - 0x64], ecx
    mov ecx, dword [ebp - 0x120]
    add edx, ecx
    mov dword [ebp - 0x60], edx
    mov edx, dword [ebp - 0x74]
    cmp dword [edx + 0x8c3bd], 0
    je short loc_289df
    mov edx, dword [0x215c84]
    push edx
    mov ecx, dword [0x215c8c]
    push ecx
    mov eax, dword [0x215c88]
    push eax
    mov eax, dword [ebp - 0x74]
    mov eax, dword [eax + 0x8c106]
    sar eax, 0x10
    imul eax, eax, 0x2c
    mov edx, dword [0x215c90]
    push edx
    mov dx, word [eax + 0x191374]
    xor dh, dh
    and dl, 2
    movsx edx, dx
    sar edx, 1
    push edx
    xor edx, edx
    mov dl, byte [eax + 0x191379]
    mov eax, dword [eax + 0x191375]
    push edx
    sar eax, 0x18
    push eax
    mov ecx, ebx
    mov ebx, dword [ebp - 0x70]
    jmp near loc_28a98
loc_289df:
    cmp dword [edx + 0x8c3e1], 0
    je short loc_28a3d
    mov eax, dword [0x215c84]
    push eax
    mov edx, dword [0x215c8c]
    push edx
    mov ecx, dword [0x215c88]
    push ecx
    mov eax, dword [0x215c90]
    push eax
    mov eax, dword [ebp - 0x74]
    mov eax, dword [eax + 0x8c106]
    sar eax, 0x10
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x191374]
    xor dh, dh
    and dl, 2
    movsx edx, dx
    sar edx, 1
    push edx
    xor edx, edx
    mov dl, byte [eax + 0x191379]
    mov eax, dword [eax + 0x191375]
    push edx
    sar eax, 0x18
    push eax
    mov ecx, ebx
    mov ebx, dword [ebp - 0x70]
    jmp short loc_28a98
loc_28a3d:
    mov edx, dword [0x215c84]
    push edx
    mov ecx, dword [0x215c8c]
    push ecx
    mov edx, dword [0x215c88]
    push edx
    mov edx, dword [ebp - 0x74]
    mov edx, dword [edx + 0x8c106]
    sar edx, 0x10
    imul edx, edx, 0x2c
    mov ecx, dword [0x215c90]
    push ecx
    mov cx, word [edx + 0x191374]
    xor ch, ch
    and cl, 2
    mov word [ebp - 0x14], cx
    mov ecx, dword [ebp - 0x16]
    sar ecx, 0x10
    sar ecx, 1
    push ecx
    xor ecx, ecx
    mov cl, byte [edx + 0x191379]
    mov edx, dword [edx + 0x191375]
    push ecx
    sar edx, 0x18
    push edx
    mov ecx, ebx
    mov ebx, eax
loc_28a98:
    push edi
    mov edx, dword [ebp - 0x60]
    mov eax, dword [ebp - 0x64]
    call ROTATE_SPRITE
loc_28aa4:
    movsx esi, si
    mov si, word [nosplit esi*2 + 0xcf540]
    test si, si
    jge near loc_28779
loc_28ab8:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
    nop

animation_sounds:
    push ebp
    mov ebp, esp
    mov eax, 0x2e0c
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

logo_animation_sounds:
    push ebp
    mov ebp, esp
    mov eax, 0x2e2c
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

play_animation:
    push ebp
    mov ebp, esp
    mov eax, 0x2e4c
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop

play_map_animation:
    push ebp
    mov ebp, esp
    mov eax, 0x2e64
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

show_map_frame:
    push ebp
    mov ebp, esp
    mov eax, 0x2e80
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 15 db 0    ; Object alignment
    push ebp
    mov ebp, esp
    mov eax, 0x2e9c
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2eb8
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2ed4
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2efc
    call PRINT_NOTICE
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2f18
    call PRINT_NOTICE
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2f34
    call PRINT_NOTICE
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2f58
    call PRINT_NOTICE
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov ecx, eax
    mov ax, word [0xcf658]
    test ax, ax
    jl short loc_28bfa
loc_28bcf:
    movsx edx, ax
    imul ebx, edx, strict dword 0x623
    mov ebx, dword [ebx + 0x8c106]
    sar ebx, 0x10
    imul ebx, ebx, 0x2c
    cmp cx, word [ebx + 0x191380]
    je short loc_28bff
    mov ax, word [nosplit edx*2 + 0xcf540]
    test ax, ax
    jge short loc_28bcf
loc_28bfa:
    mov eax, 0xffffffff
loc_28bff:
    lea esp, [ebp - 0xc]
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
    push esi
    mov ebx, eax
    mov eax, dword [eax]
    mov ecx, dword [edx]
    sub eax, ecx
    mov ecx, eax
    mov eax, dword [ebx + 4]
    mov esi, dword [edx + 4]
    mov edx, eax
    mov eax, ecx
    sub edx, esi
    call 0x608a0
    inc eax
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov esi, dword [eax]
    mov ecx, dword [edx]
    mov ebx, dword [edx + 8]
    sub esi, ecx
    mov ecx, dword [eax + 4]
    mov eax, dword [eax + 8]
    mov edi, dword [edx + 4]
    sub eax, ebx
    sub ecx, edi
    mov ebx, eax
    mov edx, ecx
    sar ebx, 4
    mov eax, esi
    call 0x608fc
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 8
    mov ecx, eax
    mov edi, edx
    cmp dword [0xbffe3], 2
    jge short loc_28cf6
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov esi, dword [ecx]
    mov eax, dword [eax + 0x8c048]
    sub eax, esi
    test eax, eax
    jns short loc_28c9d
    neg eax
loc_28c9d:
    mov ebx, eax
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [ecx + 4]
    mov eax, dword [eax + 0x8c04c]
    sub eax, edx
    test eax, eax
    jns short loc_28cbe
    neg eax
loc_28cbe:
    add ebx, eax
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov esi, dword [ecx + 8]
    mov eax, dword [eax + 0x8c050]
    sub eax, esi
    add eax, strict dword 0x1c00
    test eax, eax
    jns short loc_28ce4
    neg eax
loc_28ce4:
    sar eax, 4
    add ebx, eax
    mov ax, word [0xcf65e]
    mov dword [edi], ebx
    jmp near loc_28d91
loc_28cf6:
    xor edx, edx
    mov ebx, 0x7fffffff
    mov dword [ebp - 0x14], edx
    mov dx, word [0xcf658]
    mov dword [ebp - 0x18], ebx
    test dx, dx
    jl near loc_28d89
loc_28d13:
    movsx ebx, dx
    imul ebx, ebx, strict dword 0x623
    mov esi, dword [ecx]
    mov eax, dword [ebx + 0x8c048]
    sub eax, esi
    test eax, eax
    jns short loc_28d2c
    neg eax
loc_28d2c:
    mov esi, eax
    mov eax, dword [ebx + 0x8c04c]
    sub eax, dword [ecx + 4]
    test eax, eax
    jns short loc_28d3d
    neg eax
loc_28d3d:
    add esi, eax
    mov eax, dword [ebx + 0x8c050]
    sub eax, dword [ecx + 8]
    add eax, strict dword 0x1c00
    test eax, eax
    jns short loc_28d53
    neg eax
loc_28d53:
    sar eax, 4
    add eax, esi
    cmp eax, dword [ebp - 0x18]
    jge short loc_28d79
    mov ebx, dword [ebx + 0x8c106]
    sar ebx, 0x10
    imul ebx, ebx, 0x2c
    cmp word [ebx + 0x191392], 0
    jle short loc_28d79
    mov dword [ebp - 0x14], edx
    mov dword [ebp - 0x18], eax
loc_28d79:
    movsx eax, dx
    mov dx, word [nosplit eax*2 + 0xcf540]
    test dx, dx
    jge short loc_28d13
loc_28d89:
    mov eax, dword [ebp - 0x18]
    mov dword [edi], eax
    mov eax, dword [ebp - 0x14]
loc_28d91:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 0xc
    mov word [ebp - 0x14], ax
    mov dword [ebp - 0x1c], edx
    mov dword [ebp - 0x18], 0x7fffffff
    mov dx, word [0xcf658]
    mov edi, eax
    test dx, dx
    jl near loc_28e5a
loc_28dc6:
    cmp dx, word [ebp - 0x14]
    je near loc_28e46
    movsx ebx, dx
    imul ebx, ebx, strict dword 0x623
    mov eax, dword [ebx + 0x8c106]
    sar eax, 0x10
    imul eax, eax, 0x2c
    cmp word [eax + 0x191392], 0
    jle short loc_28e46
    mov ecx, dword [ebp - 0x16]
    sar ecx, 0x10
    imul ecx, ecx, strict dword 0x623
    mov eax, dword [ebx + 0x8c048]
    sub eax, dword [ecx + 0x8c024]
    test eax, eax
    jns short loc_28e0d
    neg eax
loc_28e0d:
    mov esi, eax
    mov eax, dword [ebx + 0x8c04c]
    sub eax, dword [ecx + 0x8c028]
    test eax, eax
    jns short loc_28e21
    neg eax
loc_28e21:
    add esi, eax
    mov eax, dword [ebx + 0x8c050]
    sub eax, dword [ecx + 0x8c02c]
    test eax, eax
    jns short loc_28e35
    neg eax
loc_28e35:
    sar eax, 4
    mov ecx, dword [ebp - 0x18]
    add eax, esi
    cmp eax, ecx
    jge short loc_28e46
    mov edi, edx
    mov dword [ebp - 0x18], eax
loc_28e46:
    movsx edx, dx
    mov dx, word [nosplit edx*2 + 0xcf540]
    test dx, dx
    jge near loc_28dc6
loc_28e5a:
    mov edx, dword [ebp - 0x1c]
    mov eax, dword [ebp - 0x18]
    mov dword [edx], eax
    mov eax, edi
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

do_animations:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x1c
    mov edi, dword [0xbccc4]
    mov eax, dword [0xbd760]
    dec eax
    mov dword [ebp - 0x24], eax
    test eax, eax
    jl near loc_29121
    add eax, eax
    mov dword [ebp - 0x1c], eax
    mov eax, dword [ebp - 0x24]
    shl eax, 2
    mov dword [ebp - 0x30], eax
loc_28ea0:
    mov ecx, dword [ebp - 0x1c]
    mov eax, dword [ebp - 0x30]
    mov ebx, dword [ebp - 0x30]
    mov ecx, dword [ecx + 0x1ffb6]
    mov dword [0xbccc4], edi
    sar ecx, 0x10
    mov eax, dword [eax + 0x200b8]
    mov dword [ebp - 0x28], ecx
    mov ecx, dword [ebp - 0x30]
    mov ebx, dword [ebx + 0x201b8]
    mov edx, dword [eax]
    mov esi, dword [ecx + 0x202b8]
    shl ebx, 2
    cmp edx, esi
    jne near loc_28f9b
    call 0x23df8
    mov esi, dword [0xbd760]
    mov edx, dword [nosplit esi*4 + 0x200b4]
    mov dword [ecx + 0x200b8], edx
    mov edx, dword [nosplit esi*4 + 0x202b4]
    mov eax, dword [nosplit esi*4 + 0x201b4]
    mov dword [ecx + 0x202b8], edx
    mov edx, dword [ebp - 0x1c]
    mov dword [ecx + 0x201b8], eax
    mov ax, word [nosplit esi*2 + 0x1ffb6]
    mov word [edx + 0x1ffb8], ax
    mov eax, dword [edx + 0x1ffb6]
    sar eax, 0x10
    imul eax, eax, 0x28
    dec esi
    mov dx, word [eax + 0x20a08a]
    mov dword [0xbd760], esi
    cmp dx, 0x12
    je short loc_28f47
    cmp dx, 0x13
    jne short loc_28f6f
loc_28f47:
    mov eax, dword [ebp - 0x1c]
    mov eax, dword [eax + 0x1ffb6]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov edx, dword [ebp - 0x30]
    add eax, strict dword 0x20a068
    mov ebx, dword [edx + 0x200b8]
    add eax, 4
    cmp eax, ebx
    je near loc_290fa
loc_28f6f:
    imul eax, dword [ebp - 0x28], 0x28
    mov ax, word [eax + 0x20a08a]
    xor ah, ah
    cmp ax, strict word 0x16
    je near loc_290fa
    mov eax, dword [ebp - 0x2a]
    mov edx, 0xffffffff
    sar eax, 0x10
    call 0x28b44
    jmp near loc_290fa
loc_28f9b:
    lea eax, [edx + ebx]
    test ebx, ebx
    jle short loc_28faa
    cmp eax, esi
    jl short loc_28fb0
    mov eax, esi
    jmp short loc_28fb0
loc_28faa:
    cmp eax, esi
    jg short loc_28fb0
    mov eax, esi
loc_28fb0:
    mov dword [ebp - 0x20], eax
    mov eax, dword [ebp - 0x1c]
    mov eax, dword [eax + 0x1ffb6]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov edx, dword [ebp - 0x30]
    add eax, strict dword 0x20a068
    mov ecx, dword [edx + 0x200b8]
    add eax, 8
    cmp eax, ecx
    jne near loc_290e6
    mov edx, dword [0xcf656]
    sar edx, 0x10
    test edx, edx
    jl near loc_29089
    mov esi, dword [ebp - 0x28]
    imul eax, esi, 0x28
    mov dword [ebp - 0x18], eax
loc_28ff5:
    imul eax, edx, strict dword 0x623
    mov ecx, dword [eax + 0x8c0a8]
    mov esi, dword [ebp - 0x28]
    sar ecx, 0x10
    cmp ecx, esi
    jne short loc_29077
    mov ecx, dword [ebp - 0x18]
    mov esi, dword [eax + 0x8c02c]
    mov ecx, dword [ecx + 0x20a070]
    sub ecx, esi
    cmp ecx, strict dword 0x4000
    jge short loc_29077
    mov ecx, dword [eax + 0x8c106]
    sar ecx, 0x10
    imul ecx, ecx, 0x2c
    cmp word [ecx + 0x191386], 0
    jl short loc_29077
    add dword [eax + 0x8c02c], ebx
    mov ecx, dword [0xcf65c]
    xor esi, esi
    sar ecx, 0x10
    mov dword [eax + 0x8c064], esi
    cmp edx, ecx
    jne short loc_29077
    mov ecx, dword [0xbd70c]
    dec ecx
    mov dword [0xbccc0], esi
    and ecx, strict dword 0xff
    mov eax, dword [eax + 0x8c02c]
    add edi, ebx
    mov dword [nosplit ecx*4 + 0x1c280], eax
loc_29077:
    mov edx, dword [nosplit edx*2 + 0xcf53e]
    sar edx, 0x10
    test edx, edx
    jge near loc_28ff5
loc_29089:
    mov eax, dword [ebp - 0x28]
    mov eax, dword [nosplit eax*2 + 0x21778c]
    sar eax, 0x10
    test eax, eax
    jl short loc_290e6
    mov esi, dword [ebp - 0x28]
    imul edx, esi, 0x28
    mov dword [ebp - 0x2c], edx
loc_290a3:
    imul edx, eax, 0x2c
    cmp word [edx + 0x191382], 3
    je short loc_290d8
    imul ecx, eax, 0x47
    mov esi, dword [edx + 0x191370]
    mov dword [ecx + 0x20463], esi
    add esi, ebx
    mov dword [edx + 0x191370], esi
    mov edx, dword [ebp - 0x2c]
    mov edx, dword [edx + 0x20a070]
    add edx, ebx
    mov dword [ecx + 0x2044b], edx
loc_290d8:
    mov eax, dword [nosplit eax*2 + 0x18af66]
    sar eax, 0x10
    test eax, eax
    jge short loc_290a3
loc_290e6:
    mov eax, dword [ebp - 0x30]
    mov eax, dword [eax + 0x200b8]
    mov edx, dword [ebp - 0x20]
    mov dword [0xbccc4], edi
    mov dword [eax], edx
loc_290fa:
    mov edi, dword [0xbccc4]
    mov ebx, dword [ebp - 0x1c]
    mov ecx, dword [ebp - 0x30]
    mov esi, dword [ebp - 0x24]
    sub ebx, 2
    sub ecx, 4
    dec esi
    mov dword [ebp - 0x1c], ebx
    mov dword [ebp - 0x30], ecx
    mov dword [ebp - 0x24], esi
    test ebx, ebx
    jge near loc_28ea0
loc_29121:
    mov dword [0xbccc4], edi
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
    mov ebx, eax
    mov edx, dword [0xbd760]
    dec edx
    mov ecx, 0xffffffff
    test edx, edx
    jl short loc_29167
    lea eax, [edx*4]
loc_29153:
    cmp ebx, dword [eax + 0x200b8]
    jne short loc_2915f
    mov ecx, edx
    jmp short loc_29167
loc_2915f:
    sub eax, 4
    dec edx
    test eax, eax
    jge short loc_29153
loc_29167:
    mov eax, ecx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0xc
    mov dword [ebp - 0xc], eax
    mov esi, edx
    mov dword [ebp - 0x10], ebx
    mov dword [ebp - 0x14], ecx
    mov edx, dword [0xbd760]
    cmp edx, 0x3f
    jl short loc_2919c
    mov eax, 0xffffffff
    jmp near loc_29211
loc_2919c:
    mov ecx, edx
    xor edx, edx
    test ecx, ecx
    jle short loc_291c1
    lea ebx, [ecx*4]
    xor eax, eax
loc_291ad:
    cmp esi, dword [eax + 0x200b8]
    jne short loc_291b9
    mov ecx, edx
    jmp short loc_291c1
loc_291b9:
    add eax, 4
    inc edx
    cmp eax, ebx
    jl short loc_291ad
loc_291c1:
    mov edx, dword [ebp - 0xc]
    lea eax, [ecx*4]
    mov word [nosplit ecx*2 + 0x1ffb8], dx
    mov edx, dword [ebp - 0x10]
    mov dword [eax + 0x200b8], esi
    mov dword [eax + 0x202b8], edx
    cmp edx, dword [esi]
    jl short loc_291eb
    mov edx, dword [ebp - 0x14]
    jmp short loc_291f0
loc_291eb:
    mov edx, dword [ebp - 0x14]
    neg edx
loc_291f0:
    mov dword [eax + 0x201b8], edx
    mov edi, dword [0xbd760]
    cmp ecx, edi
    jne short loc_29208
    lea eax, [edi + 1]
    mov dword [0xbd760], eax
loc_29208:
    mov eax, esi
    call 0x23da4
    mov eax, ecx
loc_29211:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov dx, word [0xbf560]
    test dx, dx
    jle near loc_292f7
    movsx ecx, dx
    lea eax, [ecx*8]
    add eax, ecx
    shl eax, 3
    sub eax, ecx
    mov edx, dword [eax + 0x20467]
    cmp edx, 0xb
    jl near loc_292ee
    mov edx, dword [0xbf560]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    xor esi, esi
    mov dword [eax + 0x20467], esi
    lea eax, [ecx*4]
    sub eax, ecx
    shl eax, 2
    sub eax, ecx
    mov cx, word [edx + 0x8c0e4]
    lea ebx, [eax*4]
    test cx, cx
    jl short loc_29290
    mov word [ebx + 0x191386], cx
    jmp short loc_292f7
loc_29290:
    cmp word [ebx + 0x191386], 0
    jl short loc_292f7
    mov edx, dword [edx + 0x8c106]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    mov ecx, 0x191368
    sub eax, edx
    add ecx, ebx
    shl eax, 2
    mov edx, ecx
    add eax, strict dword 0x191368
    call 0x28c34
    cmp eax, strict dword 0x800
    jge short loc_292f7
    mov edx, dword [ebx + 0x191374]
    mov eax, dword [ebx + 0x191384]
    sar edx, 0x10
    sar eax, 0x10
    call 0x2c740
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_292ee:
    lea ebx, [edx + 1]
    mov dword [eax + 0x20467], ebx
loc_292f7:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    mov eax, 0x2f78
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x2f94
    call PRINT_NOTICE
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2fbc
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
    sub esp, 4
    mov dword [ebp - 0x18], eax
    mov cx, word [0x216fa2]
    test cx, cx
    jl near loc_293fc
    mov edi, dword [ebp - 0x18]
loc_2935d:
    movsx eax, cx
    imul ebx, eax, 0x2c
    mov dx, word [ebx + 0x19138e]
    mov si, word [nosplit eax*2 + 0x18cf68]
    cmp dx, di
    jne near loc_293f1
    mov dx, word [ebx + 0x191376]
    cmp dx, 9
    jb near loc_293f1
    jbe short loc_29397
    cmp dx, 0x1d00
    je short loc_293de
    jmp short loc_293f1
loc_29397:
    mov eax, dword [ebx + 0x19138e]
    sar eax, 0x10
    call 0x14868
    test ax, ax
    je short loc_293b3
    cmp dword [0xbffaf], 0
    jne short loc_293f1
loc_293b3:
    movsx ebx, cx
    mov edx, 0x576
    mov eax, ebx
    call 0x15ee0
    cwde
    imul eax, eax, 0x2c
    imul ebx, ebx, 0x2c
    sub dword [eax + 0x191370], strict dword 0x2000
    mov word [ebx + 0x191392], 0x36
    jmp short loc_293f1
loc_293de:
    cmp dword [0xbffaf], 0
    jne short loc_293f1
    mov edx, 0x77
    call 0x51390
loc_293f1:
    mov ecx, esi
    test si, si
    jge near loc_2935d
loc_293fc:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 10 db 0    ; Object alignment
    push ebp
    mov ebp, esp
    mov eax, 0x2fdc
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x3000
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x3028
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x304c
    call PRINT_NOTICE
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x306c
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x308c
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x30a8
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 8
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x30c4
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x30e4
    call PRINT_NOTICE
    xor al, al
    mov esp, ebp
    pop ebp
    ret
    times 13 db 0    ; Object alignment
    push ebp
    mov ebp, esp
    mov eax, 0x3104
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x3124
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x3148
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x3164
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x3180
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 15 db 0    ; Object alignment
    push ebp
    mov ebp, esp
    push edx
    mov edx, eax
    mov eax, 0x209d68
    test eax, eax
    je short loc_2955e
    mov dword [edx + 0x56d], eax
    mov byte [0xc1031], 1
    jmp short loc_29568
loc_2955e:
    mov eax, 0x319c
    call PRINT_NOTICE
loc_29568:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x31bc
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov edx, eax
    call 0x46fa0
    mov ebx, 0x80
    xor ah, ah
    sub ebx, eax
    mov byte [edx + 0x57f], 9
    mov eax, ebx
    mov ebx, dword [edx + 0x220]
    cwde
    add ebx, 0x40
    sar eax, 1
    mov dword [edx + 0x220], ebx
    mov word [edx + 0x29c], ax
    mov word [edx + 0x518], ax
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x31d8
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 0xc
    nop

scan_player_view:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    sub esp, 0x18
    mov esi, eax
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    cmp word [nosplit eax*4 + 0x191376], 0xf05
    jne short loc_29618
    mov ebx, 0x2800
    jmp short loc_2961a
loc_29618:
    xor ebx, ebx
loc_2961a:
    push dword 0x1000040
    lea eax, [ebp - 0x28]
    push eax
    lea eax, [ebp - 0x24]
    push eax
    lea eax, [ebp - 0x20]
    push eax
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0x18]
    push eax
    lea eax, [ebp - 0x14]
    movsx esi, si
    push eax
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    sub eax, esi
    lea esi, [eax*4]
    mov ax, word [esi + 0x191384]
    and ah, 7
    cwde
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    push byte 0
    sar eax, 0x10
    push eax
    mov eax, dword [esi + 0x191382]
    sar eax, 0x10
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    mov ecx, dword [esi + 0x19137e]
    push eax
    mov eax, dword [esi + 0x191370]
    mov edx, dword [esi + 0x19136c]
    sub eax, ebx
    sar ecx, 0x10
    mov ebx, eax
    mov eax, dword [esi + 0x191368]
    call 0x414ef
    mov edx, dword [ebp - 0x24]
    mov eax, dword [ebp - 0x20]
    mov ebx, dword [esi + 0x19136c]
    mov ecx, dword [esi + 0x191368]
    sub edx, ebx
    sub eax, ecx
    call 0x608a0
    lea esp, [ebp - 0x10]
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
    push esi
    push edi
    sub esp, 0x14
    mov edi, eax
    mov esi, edx
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    lea edx, [eax*4]
    mov eax, 0x191368
    add eax, edx
    call 0x14814
    test ax, ax
    je short loc_2970e
    mov edx, 0x2a00
    jmp short loc_29722
loc_2970e:
    cmp word [edx + 0x191376], 0xf05
    jne short loc_29720
    mov edx, 0x2700
    jmp short loc_29722
loc_29720:
    xor edx, edx
loc_29722:
    push dword 0x1000040
    lea eax, [ebp - 0x24]
    push eax
    lea eax, [ebp - 0x20]
    push eax
    lea eax, [ebp - 0x1c]
    push eax
    push esi
    lea eax, [ebp - 0x14]
    push eax
    lea eax, [ebp - 0x18]
    movsx esi, di
    push eax
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    sub eax, esi
    lea esi, [eax*4]
    mov ax, word [esi + 0x191384]
    and ah, 7
    cwde
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    push byte 0
    sar eax, 0x10
    push eax
    mov eax, dword [esi + 0x191382]
    sar eax, 0x10
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov ecx, dword [esi + 0x19137e]
    mov ebx, dword [esi + 0x191370]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar ecx, 0x10
    sar eax, 0x10
    sub ebx, edx
    push eax
    mov edx, dword [esi + 0x19136c]
    mov eax, dword [esi + 0x191368]
    call 0x414ef
    cmp word [ebp - 0x14], 0
    jl short loc_297dd
    mov eax, dword [ebp - 0x16]
    sar eax, 0x10
    shl eax, 5
    test byte [eax + 0x1be576], 0x10
    je short loc_297dd
    mov eax, 0x191368
    add eax, esi
    call 0x14814
    test ax, ax
    je short loc_297dd
    mov eax, 0x40000000
    jmp short loc_2980b
loc_297dd:
    movsx edx, di
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edx, dword [ebp - 0x20]
    sub edx, dword [nosplit eax*4 + 0x19136c]
    mov ebx, dword [ebp - 0x1c]
    mov ecx, dword [nosplit eax*4 + 0x191368]
    mov eax, ebx
    sub eax, ecx
    call 0x608a0
loc_2980b:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    sub esp, 0x14
    push dword 0x10001
    lea ebx, [ebp - 0x1c]
    push ebx
    lea ebx, [ebp - 0x18]
    push ebx
    lea ebx, [ebp - 0x14]
    push ebx
    lea ebx, [ebp - 0x10]
    push ebx
    push edx
    lea edx, [ebp - 0xc]
    push edx
    mov dx, word [eax + 0x294]
    and dh, 7
    movsx edx, dx
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    push byte 0
    sar edx, 0x10
    push edx
    mov edx, dword [eax + 0x292]
    sar edx, 0x10
    add edx, strict dword 0x200
    and edx, strict dword 0x7ff
    mov ecx, dword [eax + 0x298]
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar ecx, 0x10
    sar edx, 0x10
    mov ebx, dword [eax + 0x21c]
    push edx
    mov edx, dword [eax + 0x218]
    mov eax, dword [eax + 0x214]
    call 0x414ef
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

aim:
    push ebp
    mov ebp, esp
    mov eax, 0x31f0
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop
