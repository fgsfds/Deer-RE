bits 32
org 0x55184

%define PRINT_NOTICE 0x5130c
%define LOG_NUMBER 0x51350
%define KRAND 0x46fa0
%define ROTATE_SPRITE 0x47f83
%define HITSCAN 0x414ef
%define INSERT_SPRITE 0x40d50
%define CHANGE_SPRITE_SECT 0x410f9

move_water_sprites:
    push ebp
    mov ebp, esp
    call 0x550f0
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov eax, 2
    call 0x57aa0
    test eax, eax
    je near loc_55238
    mov edx, dword [0xa3a0]
    xor ecx, ecx
    test edx, edx
    jle near loc_5521e
    xor edx, edx
loc_551bc:
    mov eax, dword [edx + 0x21827e]
    sar eax, 0x10
    test eax, eax
    jl short loc_551d0
    cmp eax, strict dword 0x1000
    jl short loc_551dc
loc_551d0:
    mov eax, 0x45fc
    call PRINT_NOTICE
    jmp short loc_55210
loc_551dc:
    mov ebx, dword [0xa39c]
    test ebx, ebx
    jl short loc_551eb
    cmp ebx, 6
    jl short loc_551f7
loc_551eb:
    mov eax, 0x4630
    call PRINT_NOTICE
    jmp short loc_55210
loc_551f7:
    imul eax, eax, 0x2c
    mov esi, ebx
    mov bl, byte [edx + 0x218282]
    mov bh, byte [esi + 0xa394]
    add bl, bh
    mov byte [eax + 0x19137c], bl
loc_55210:
    mov ebx, dword [0xa3a0]
    inc ecx
    add edx, 3
    cmp ecx, ebx
    jl short loc_551bc
loc_5521e:
    mov ecx, dword [0xa39c]
    inc ecx
    mov dword [0xa39c], ecx
    cmp ecx, 6
    jl short loc_55238
    xor edi, edi
    mov dword [0xa39c], edi
loc_55238:
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
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    times 13 db 0    ; Alignment

dispatch_55260:
    dd loc_55325 - 0x10000
    dd loc_552e3 - 0x10000
    dd loc_5532d - 0x10000
    dd loc_5532d - 0x10000
    dd loc_55319 - 0x10000
    dd loc_552e3 - 0x10000
    dd loc_5532d - 0x10000
    dd loc_5532d - 0x10000
    dd loc_55319 - 0x10000
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov ecx, dword [0xa3bc]
    mov ebx, eax
    test eax, eax
    jl short loc_5529d
    cmp eax, 0xf
    jl short loc_552a7
loc_5529d:
    mov eax, 0xffffffff
    jmp near loc_5533b
loc_552a7:
    cmp eax, ecx
    je near loc_5533b
    lea eax, [ecx*4]
    lea edx, [ecx + eax]
    shl edx, 2
    mov eax, dword [0x216f7c]
    mov esi, dword [0xa3c4]
    mov edi, dword [edx + 0xa3d0]
    sub eax, esi
    cmp eax, edi
    jbe short loc_55339
    lea eax, [ecx - 6]
    cmp eax, 8
    ja short loc_5532d
    jmp dword [cs:nosplit eax*4 + dispatch_55260 - 0x10000]
loc_552e3:
    mov eax, dword [0xcf65c]
    mov edx, 0x4664
    sar eax, 0x10
    call 0x51408
    mov edx, dword [0xcf65c]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov edx, dword [edx + 0x8c106]
    mov eax, 3
    sar edx, 0x10
    call 0x51c68
    jmp short loc_5532d
loc_55319:
    mov dword [0xa3c0], 1
    jmp short loc_5532d
loc_55325:
    xor edx, edx
    mov dword [0xa3c0], edx
loc_5532d:
    mov ecx, ebx
    mov eax, dword [0x216f7c]
    mov dword [0xa3c4], eax
loc_55339:
    mov eax, ecx
loc_5533b:
    mov dword [0xa3bc], ecx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

dispatch_5534c:
    dd loc_556e9 - 0x10000
    dd loc_556a3 - 0x10000
    dd loc_5565a - 0x10000
    dd loc_55613 - 0x10000
    dd loc_555cc - 0x10000
    dd loc_55586 - 0x10000
    dd loc_55540 - 0x10000
    dd loc_554fa - 0x10000
    dd loc_554b4 - 0x10000

shotgun_fire:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x38
    mov edx, eax
    xor ebx, ebx
    mov word [ebp - 0x20], bx
    mov word [ebp - 0x1c], bx
    mov word [ebp - 0x18], bx
    xor ebx, ebx
    mov edi, dword [0xa3c0]
    mov dword [ebp - 0x44], ebx
    mov dword [ebp - 0x48], ebx
    mov dword [ebp - 0x4c], ebx
    test edi, edi
    jne short loc_553b3
    cmp dword [0xa3bc], 5
    jne short loc_553b3
    mov eax, 0x10
    call 0x5a250
loc_553b3:
    cmp dword [0xa3bc], 5
    jne near loc_558c6
    cmp dword [0xa3c0], 0
    je near loc_558c6
    mov eax, 6
    call 0x55284
    cmp eax, 6
    jne near loc_558c6
    movsx ebx, dx
    mov eax, ebx
    imul ebx, ebx, strict dword 0x623
    mov edx, 0x4678
    mov edi, 9
    call 0x51408
    add ebx, strict dword 0x8be10
    mov edx, 0x4688
    mov eax, ebx
    mov dword [ebp - 0x34], edi
    call 0x5144c
    mov edx, dword [ebx + 0x2f6]
    mov eax, 4
    sar edx, 0x10
    mov esi, ebx
    call 0x51c68
loc_55424:
    mov eax, dword [esi + 0x214]
    mov dword [ebp - 0x28], eax
    mov eax, dword [esi + 0x218]
    mov edx, dword [esi + 0x244]
    mov dword [ebp - 0x40], eax
    mov eax, dword [esi + 0x21c]
    add eax, edx
    mov ebx, dword [0xa3c8]
    mov dword [ebp - 0x2c], eax
    cmp ebx, 7
    jne short loc_55473
    mov eax, 2
    mov ebx, 4
    mov edx, 8
    mov edi, 0x1000
    mov dword [ebp - 0x24], edx
    mov dword [ebp - 0x38], edi
    mov edx, 0x800
    jmp short loc_5548f
loc_55473:
    mov eax, 2
    mov edi, 4
    mov edx, 0x200
    mov ecx, 0x400
    mov ebx, eax
    mov dword [ebp - 0x24], edi
    mov dword [ebp - 0x38], ecx
loc_5548f:
    mov edi, 0x64
    sub edi, dword [esi + 0x220]
    mov ecx, dword [ebp - 0x34]
    dec ecx
    shl edi, 0xb
    cmp ecx, 8
    ja near loc_558c6
    shl ecx, 2
    jmp dword [cs:ecx + dispatch_5534c - 0x10000]
loc_554b4:
    add ax, word [esi + 0x294]
    sub eax, ebx
    and ah, 7
    movsx ebx, ax
    add ebx, strict dword 0x200
    and ah, 7
    and ebx, strict dword 0x7ff
    cwde
    add edi, edx
    mov ebx, dword [nosplit ebx*2 + 0x1bd566]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar ebx, 0x10
    sar eax, 0x10
    mov dword [ebp - 0x3c], ebx
    mov dword [ebp - 0x30], eax
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp near loc_55746
loc_554fa:
    add ax, word [esi + 0x294]
    add eax, ebx
    and ah, 7
    movsx ebx, ax
    add ebx, strict dword 0x200
    and ah, 7
    and ebx, strict dword 0x7ff
    cwde
    add edi, edx
    mov ebx, dword [nosplit ebx*2 + 0x1bd566]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar ebx, 0x10
    sar eax, 0x10
    mov dword [ebp - 0x3c], ebx
    mov dword [ebp - 0x30], eax
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp near loc_55746
loc_55540:
    add ax, word [esi + 0x294]
    sub eax, ebx
    and ah, 7
    movsx ebx, ax
    add ebx, strict dword 0x200
    and ah, 7
    and ebx, strict dword 0x7ff
    cwde
    sub edi, edx
    mov ebx, dword [nosplit ebx*2 + 0x1bd566]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar ebx, 0x10
    sar eax, 0x10
    mov dword [ebp - 0x3c], ebx
    mov dword [ebp - 0x30], eax
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp near loc_55746
loc_55586:
    add ax, word [esi + 0x294]
    add eax, ebx
    and ah, 7
    movsx ebx, ax
    add ebx, strict dword 0x200
    and ah, 7
    and ebx, strict dword 0x7ff
    cwde
    sub edi, edx
    mov ebx, dword [nosplit ebx*2 + 0x1bd566]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar ebx, 0x10
    sar eax, 0x10
    mov dword [ebp - 0x3c], ebx
    mov dword [ebp - 0x30], eax
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp near loc_55746
loc_555cc:
    add ax, word [esi + 0x294]
    and ah, 7
    movsx edx, ax
    and ah, 7
    add edx, strict dword 0x200
    cwde
    and edx, strict dword 0x7ff
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar eax, 0x10
    sar edx, 0x10
    mov dword [ebp - 0x30], eax
    mov eax, dword [ebp - 0x38]
    mov dword [ebp - 0x3c], edx
    sub edi, eax
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp near loc_55746
loc_55613:
    add ax, word [esi + 0x294]
    and ah, 7
    movsx edx, ax
    add edx, strict dword 0x200
    and ah, 7
    and edx, strict dword 0x7ff
    cwde
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    sar eax, 0x10
    mov dword [ebp - 0x3c], edx
    mov edx, dword [ebp - 0x38]
    mov dword [ebp - 0x30], eax
    add edi, edx
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp near loc_55746
loc_5565a:
    mov cx, word [esi + 0x294]
    mov edx, dword [ebp - 0x24]
    add eax, ecx
    sub eax, edx
    and ah, 7
    movsx edx, ax
    add edx, strict dword 0x200
    and ah, 7
    and edx, strict dword 0x7ff
    cwde
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    sar eax, 0x10
    mov dword [ebp - 0x3c], edx
    mov dword [ebp - 0x30], eax
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp near loc_55746
loc_556a3:
    mov bx, word [esi + 0x294]
    mov ecx, dword [ebp - 0x24]
    add eax, ebx
    add eax, ecx
    and ah, 7
    movsx edx, ax
    add edx, strict dword 0x200
    and ah, 7
    and edx, strict dword 0x7ff
    cwde
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    sar eax, 0x10
    mov dword [ebp - 0x3c], edx
    mov dword [ebp - 0x30], eax
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp short loc_55746
loc_556e9:
    add ax, word [esi + 0x294]
    and ah, 7
    movsx edx, ax
    add edx, strict dword 0x200
    and ah, 7
    and edx, strict dword 0x7ff
    cwde
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    sar eax, 0x10
    mov dword [ebp - 0x3c], edx
    mov dword [ebp - 0x30], eax
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp short loc_55746
loc_55728:
    add ebx, 4
    mov ecx, dword [eax + 0x20a06c]
    add eax, 0x28
    mov dword [ebx + 0x21b28c], ecx
    mov ecx, 0xfff9c000
    inc edx
    mov dword [eax + 0x20a044], ecx
loc_55746:
    mov ecx, dword [0x217fcc]
    sar ecx, 0x10
    cmp edx, ecx
    jl short loc_55728
    push dword 0x1000040
    lea eax, [ebp - 0x4c]
    push eax
    lea eax, [ebp - 0x48]
    push eax
    lea eax, [ebp - 0x44]
    push eax
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0x18]
    push eax
    lea eax, [ebp - 0x20]
    push eax
    push edi
    mov ebx, dword [ebp - 0x30]
    mov ecx, dword [ebp - 0x3c]
    push ebx
    mov edx, dword [ebp - 0x40]
    mov eax, dword [ebp - 0x28]
    push ecx
    mov ecx, dword [esi + 0x298]
    mov ebx, dword [ebp - 0x2c]
    sar ecx, 0x10
    call HITSCAN
    xor ebx, ebx
    xor eax, eax
    xor edx, edx
    jmp short loc_557ab
loc_55798:
    add eax, 0x28
    mov ecx, dword [edx + 0x21b290]
    add edx, 4
    inc ebx
    mov dword [eax + 0x20a044], ecx
loc_557ab:
    mov ecx, dword [0x217fcc]
    sar ecx, 0x10
    cmp ebx, ecx
    jl short loc_55798
    mov edi, dword [ebp - 0x34]
    dec edi
    mov ebx, dword [ebp - 0x20]
    mov dword [ebp - 0x34], edi
    test bx, bx
    jge short loc_557d6
    mov eax, 0x4698
    call PRINT_NOTICE
    jmp near loc_558c6
loc_557d6:
    mov eax, dword [ebp - 0x4c]
    mov edx, dword [ebp - 0x48]
    mov ebx, dword [ebp - 0x22]
    mov ecx, dword [ebp - 0x44]
    push eax
    sar ebx, 0x10
    mov eax, dword [ebp - 0x1a]
    push edx
    mov edx, dword [ebp - 0x1e]
    sar eax, 0x10
    sar edx, 0x10
    call 0x51678
    cmp word [ebp - 0x1c], 0
    jl near loc_558b2
    mov eax, dword [ebp - 0x1e]
    mov edx, 0x46bc
    sar eax, 0x10
    call 0x513b8
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul eax, eax, 0x2c
    mov edx, dword [eax + 0x191372]
    sar edx, 0x10
    cmp edx, strict dword 0x8000
    jne short loc_55841
    mov eax, 0x46cc
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_55841:
    mov eax, dword [eax + 0x19137e]
    mov edx, 0x46ec
    sar eax, 0x10
    call 0x514c0
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    imul edx, eax, 0x2c
    mov edx, dword [edx + 0x19137e]
    sar edx, 0x10
    imul edx, edx, 0x28
    cmp word [edx + 0x20a08c], 0x7d0
    jne short loc_55888
    mov eax, 0x46fc
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_55888:
    mov edx, dword [0xa3c8]
    call 0x53854
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    call 0x58568
    cmp dword [ebp - 0x34], 0
    jg near loc_55424
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_558b2:
    mov eax, 4
    call 0x5a250
    cmp dword [ebp - 0x34], 0
    jg near loc_55424
loc_558c6:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    cmp dword [0xa3bc], 0
    jne short loc_558e3
    mov eax, 1
    jmp short loc_558e8
loc_558e3:
    mov eax, 3
loc_558e8:
    call 0x55284
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov edx, 1
    mov ebx, 6
    xor eax, eax
    xor ecx, ecx
    mov dword [0xa3cc], edx
    call 0x55284
    mov dword [0xa3c8], ebx
    mov dword [0xa3c0], ecx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, dword [0xa3c8]
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ecx
    push edx
    mov edx, dword [0xa3bc]
    test edx, edx
    je short loc_55948
    cmp edx, 5
    jne short loc_55980
loc_55948:
    mov eax, 0x4000
    xor ecx, ecx
    call 0x5a250
    mov dword [0xa3c0], ecx
    call 0x55988
    cmp dword [0xa3c8], 6
    sete al
    and eax, strict dword 0xff
    add eax, 6
    mov dword [0xa3c8], eax
    mov eax, 0x10
    call 0x59304
loc_55980:
    lea esp, [ebp - 8]
    pop edx
    pop ecx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ecx
    push edx
    push esi
    mov edx, dword [0xa3bc]
    test edx, edx
    je short loc_5599d
    cmp edx, 5
    jne short loc_559e1
loc_5599d:
    mov ecx, dword [0xa3cc]
    mov edx, dword [0xa3bc]
    test ecx, ecx
    je short loc_559cc
    mov eax, 7
    call 0x55284
    cmp eax, 7
    jne short loc_559c2
    mov dword [0xa4a8], edx
loc_559c2:
    xor esi, esi
    mov dword [0xa3cc], esi
    jmp short loc_559e1
loc_559cc:
    mov eax, 0xb
    call 0x55284
    cmp eax, 0xb
    jne short loc_559e1
    mov dword [0xa4f8], edx
loc_559e1:
    lea esp, [ebp - 0xc]
    pop esi
    pop edx
    pop ecx
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
    mov esi, eax
    mov edx, dword [0xa3bc]
    test edx, edx
    jl short loc_55a05
    cmp edx, 0xf
    jl short loc_55a14
loc_55a05:
    mov eax, 0x4720
    call PRINT_NOTICE
    jmp near loc_55b93
loc_55a14:
    test ax, ax
    jl short loc_55a22
    cmp ax, word [0xcf65c]
    jle short loc_55a36
loc_55a22:
    mov eax, 0x4740
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_55a36:
    cwde
    imul eax, eax, strict dword 0x623
    cmp dword [eax + 0x8c423], 0
    jne short loc_55a4f
    cmp dword [eax + 0x8c427], 0
    je short loc_55aa0
loc_55a4f:
    movsx eax, si
    imul eax, eax, strict dword 0x623
    mov edi, dword [eax + 0x8c427]
    mov edx, 0xa
    test edi, edi
    je short loc_55a6c
    mov edx, 5
loc_55a6c:
    mov eax, dword [0x216f7c]
    sub eax, dword [0xa53c]
    cmp eax, edx
    jbe short loc_55ac3
    mov ecx, dword [0xa540]
    inc ecx
    mov dword [0xa540], ecx
    cmp ecx, 8
    jl short loc_55a94
    xor eax, eax
    mov dword [0xa540], eax
loc_55a94:
    mov eax, dword [0x216f7c]
    mov dword [0xa53c], eax
    jmp short loc_55ac3
loc_55aa0:
    mov eax, dword [0xa540]
    test eax, eax
    je short loc_55ab2
    lea edx, [eax + 1]
    mov dword [0xa540], edx
loc_55ab2:
    cmp dword [0xa540], 8
    jl short loc_55ac3
    xor ecx, ecx
    mov dword [0xa540], ecx
loc_55ac3:
    cmp dword [0xa540], 8
    jl short loc_55ae0
    mov eax, 0x4760
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_55ae0:
    call 0x54d90
    mov edx, dword [0xa3bc]
    lea ebx, [edx*4]
    add ebx, edx
    mov ecx, dword [0xa540]
    shl ebx, 2
    mov edi, dword [nosplit ecx*4 + 0xa4fc]
    mov eax, dword [ebx + 0xa3d8]
    add eax, edi
    mov edi, dword [nosplit ecx*4 + 0xa51c]
    mov ecx, dword [0x215c84]
    mov edx, dword [ebx + 0xa3dc]
    push ecx
    add edx, edi
    mov edi, dword [0x215c8c]
    push edi
    mov ecx, dword [0x215c88]
    push ecx
    mov edi, dword [0x215c90]
    push edi
    push byte 0xa
    push byte 0
    shl eax, 0x10
    mov ecx, dword [ebx + 0xa3d4]
    push byte 0
    shl edx, 0x10
    push ecx
    mov ebx, 0xa000
    xor ecx, ecx
    call ROTATE_SPRITE
    cmp dword [0xa3bc], 5
    jne short loc_55b78
    movsx eax, si
    imul eax, eax, strict dword 0x623
    cmp dword [eax + 0x8c427], 0
    je short loc_55b78
    mov eax, 3
    jmp short loc_55b8e
loc_55b78:
    mov edx, dword [0xa3bc]
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [nosplit eax*4 + 0xa3e0]
loc_55b8e:
    call 0x55284
loc_55b93:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 3 db 0    ; Alignment

dispatch_55ba0:
    dd loc_55c6d - 0x10000
    dd loc_55c2b - 0x10000
    dd loc_55c75 - 0x10000
    dd loc_55c75 - 0x10000
    dd loc_55c75 - 0x10000
    dd loc_55c61 - 0x10000
    dd loc_55c2b - 0x10000
    dd loc_55c75 - 0x10000
    dd loc_55c75 - 0x10000
    dd loc_55c75 - 0x10000
    dd loc_55c61 - 0x10000
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov ecx, dword [0xa544]
    mov ebx, eax
    test eax, eax
    jl short loc_55be5
    cmp eax, 0x11
    jl short loc_55bef
loc_55be5:
    mov eax, 0xffffffff
    jmp near loc_55c83
loc_55bef:
    cmp eax, ecx
    je near loc_55c83
    lea eax, [ecx*4]
    lea edx, [ecx + eax]
    shl edx, 2
    mov eax, dword [0x216f7c]
    mov esi, dword [0xa54c]
    mov edi, dword [edx + 0xa558]
    sub eax, esi
    cmp eax, edi
    jbe short loc_55c81
    lea eax, [ecx - 6]
    cmp eax, 0xa
    ja short loc_55c75
    jmp dword [cs:nosplit eax*4 + dispatch_55ba0 - 0x10000]
loc_55c2b:
    mov eax, dword [0xcf65c]
    mov edx, 0x478c
    sar eax, 0x10
    call 0x51408
    mov edx, dword [0xcf65c]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov edx, dword [edx + 0x8c106]
    mov eax, 5
    sar edx, 0x10
    call 0x51c68
    jmp short loc_55c75
loc_55c61:
    mov dword [0xa548], 1
    jmp short loc_55c75
loc_55c6d:
    xor edx, edx
    mov dword [0xa548], edx
loc_55c75:
    mov ecx, ebx
    mov eax, dword [0x216f7c]
    mov dword [0xa54c], eax
loc_55c81:
    mov eax, ecx
loc_55c83:
    mov dword [0xa544], ecx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

rifle_fire:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x2c
    mov edx, eax
    xor ebx, ebx
    mov word [ebp - 0x20], bx
    mov word [ebp - 0x1c], bx
    mov word [ebp - 0x18], bx
    xor ebx, ebx
    mov edi, dword [0xa548]
    mov dword [ebp - 0x38], ebx
    mov dword [ebp - 0x3c], ebx
    mov dword [ebp - 0x40], ebx
    test edi, edi
    jne short loc_55cd7
    cmp dword [0xa544], 5
    jne short loc_55cd7
    mov eax, 0x10
    call 0x5a250
loc_55cd7:
    cmp dword [0xa548], 0
    je near loc_55f5c
    cmp dword [0xa544], 5
    jne near loc_55f5c
    mov eax, 6
    call 0x55bcc
    cmp eax, 6
    jne near loc_55f5c
    movsx ebx, dx
    mov eax, ebx
    imul ebx, ebx, strict dword 0x623
    mov edx, 0x47a0
    call 0x51408
    add ebx, strict dword 0x8be10
    mov edx, 0x47b0
    mov eax, ebx
    call 0x5144c
    mov edx, dword [ebx + 0x2f6]
    mov eax, 6
    sar edx, 0x10
    call 0x51c68
    mov eax, dword [ebx + 0x218]
    mov edi, dword [ebx + 0x244]
    mov dword [ebp - 0x34], eax
    add edi, dword [ebx + 0x21c]
    mov ax, word [ebx + 0x294]
    add eax, strict dword 2
    and ah, 7
    movsx edx, ax
    add edx, strict dword 0x200
    and ah, 7
    and edx, strict dword 0x7ff
    cwde
    mov dword [ebp - 0x24], ebx
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar edx, 0x10
    sar eax, 0x10
    mov dword [ebp - 0x28], edx
    mov dword [ebp - 0x2c], eax
    mov eax, 0x64
    mov edx, dword [ebx + 0x220]
    mov esi, dword [ebx + 0x214]
    sub eax, edx
    xor ebx, ebx
    shl eax, 0xb
    xor edx, edx
    mov dword [ebp - 0x30], eax
    xor eax, eax
    jmp short loc_55dd1
loc_55db3:
    add edx, 4
    mov ecx, dword [eax + 0x20a06c]
    add eax, 0x28
    mov dword [edx + 0x21c29c], ecx
    mov ecx, 0xfff9c000
    inc ebx
    mov dword [eax + 0x20a044], ecx
loc_55dd1:
    mov ecx, dword [0x217fcc]
    sar ecx, 0x10
    cmp ebx, ecx
    jb short loc_55db3
    push dword 0x1000040
    lea eax, [ebp - 0x40]
    push eax
    lea eax, [ebp - 0x3c]
    push eax
    lea eax, [ebp - 0x38]
    push eax
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0x18]
    push eax
    lea eax, [ebp - 0x20]
    push eax
    mov ebx, dword [ebp - 0x30]
    mov ecx, dword [ebp - 0x2c]
    push ebx
    mov edx, dword [ebp - 0x34]
    mov eax, dword [ebp - 0x28]
    push ecx
    mov ecx, dword [ebp - 0x24]
    mov ebx, edi
    push eax
    mov ecx, dword [ecx + 0x298]
    mov eax, esi
    sar ecx, 0x10
    call HITSCAN
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp short loc_55e3a
loc_55e27:
    add ebx, 0x28
    mov ecx, dword [eax + 0x21c2a0]
    add eax, 4
    inc edx
    mov dword [ebx + 0x20a044], ecx
loc_55e3a:
    mov ecx, dword [0x217fcc]
    sar ecx, 0x10
    cmp edx, ecx
    jb short loc_55e27
    cmp word [ebp - 0x20], 0
    jge short loc_55e5d
    mov eax, 0x47c0
    call PRINT_NOTICE
    jmp near loc_55f5c
loc_55e5d:
    mov esi, dword [ebp - 0x40]
    mov edi, dword [ebp - 0x3c]
    mov ebx, dword [ebp - 0x22]
    mov edx, dword [ebp - 0x1e]
    mov eax, dword [ebp - 0x1a]
    mov ecx, dword [ebp - 0x38]
    push esi
    sar ebx, 0x10
    sar edx, 0x10
    push edi
    sar eax, 0x10
    call 0x51678
    cmp word [ebp - 0x1c], 0
    jl near loc_55f52
    mov eax, dword [ebp - 0x1e]
    mov edx, 0x47e4
    sar eax, 0x10
    call 0x513b8
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    mov edx, dword [eax + 0x191372]
    sar edx, 0x10
    cmp edx, strict dword 0x8000
    jne short loc_55ed6
    mov eax, 0x47f4
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_55ed6:
    mov eax, dword [eax + 0x19137e]
    mov edx, 0x4814
    sar eax, 0x10
    call 0x514c0
    mov ebx, dword [ebp - 0x1e]
    sar ebx, 0x10
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov edx, dword [nosplit eax*4 + 0x19137e]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08c], 0x7d0
    jne short loc_55f30
    mov eax, 0x4824
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_55f30:
    mov edx, dword [0xa550]
    mov eax, ebx
    call 0x53854
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    call 0x58568
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_55f52:
    mov eax, 4
    call 0x5a250
loc_55f5c:
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
    cmp dword [0xa544], 0
    jne short loc_55f7b
    mov eax, 1
    jmp short loc_55f80
loc_55f7b:
    mov eax, 3
loc_55f80:
    call 0x55bcc
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov edx, 1
    mov ebx, 4
    xor eax, eax
    xor ecx, ecx
    mov dword [0xa554], edx
    call 0x55bcc
    mov dword [0xa550], ebx
    mov dword [0xa548], ecx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, dword [0xa550]
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ecx
    push edx
    mov edx, dword [0xa544]
    test edx, edx
    je short loc_55fe0
    cmp edx, 5
    jne short loc_56018
loc_55fe0:
    mov eax, 0x4000
    xor ecx, ecx
    call 0x5a250
    mov dword [0xa548], ecx
    call 0x56020
    cmp dword [0xa550], 4
    sete al
    and eax, strict dword 0xff
    add eax, 4
    mov dword [0xa550], eax
    mov eax, 0x10
    call 0x59304
loc_56018:
    lea esp, [ebp - 8]
    pop edx
    pop ecx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ecx
    push edx
    push esi
    mov edx, dword [0xa544]
    test edx, edx
    je short loc_56035
    cmp edx, 5
    jne short loc_56079
loc_56035:
    mov ecx, dword [0xa554]
    mov edx, dword [0xa544]
    test ecx, ecx
    je short loc_56064
    mov eax, 7
    call 0x55bcc
    cmp eax, 7
    jne short loc_5605a
    mov dword [0xa644], edx
loc_5605a:
    xor esi, esi
    mov dword [0xa554], esi
    jmp short loc_56079
loc_56064:
    mov eax, 0xc
    call 0x55bcc
    cmp eax, 0xc
    jne short loc_56079
    mov dword [0xa6a8], edx
loc_56079:
    lea esp, [ebp - 0xc]
    pop esi
    pop edx
    pop ecx
    pop ebp
    ret
    lea eax, [byte eax + 0]

pistol_fire:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 8
    mov esi, eax
    mov dword [ebp - 0x18], edx
    mov edx, dword [0xa544]
    test edx, edx
    jl short loc_560a2
    cmp edx, 0x11
    jl short loc_560b1
loc_560a2:
    mov eax, 0x4848
    call PRINT_NOTICE
    jmp near loc_562d1
loc_560b1:
    test ax, ax
    jl short loc_560bf
    cmp ax, word [0xcf65c]
    jle short loc_560d2
loc_560bf:
    mov eax, 0x4868
    call PRINT_NOTICE
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_560d2:
    cwde
    imul eax, eax, strict dword 0x623
    cmp dword [eax + 0x8c423], 0
    jne short loc_560eb
    cmp dword [eax + 0x8c427], 0
    je short loc_5613c
loc_560eb:
    movsx eax, si
    imul eax, eax, strict dword 0x623
    mov edi, dword [eax + 0x8c427]
    mov edx, 0xa
    test edi, edi
    je short loc_56108
    mov edx, 5
loc_56108:
    mov eax, dword [0x216f7c]
    sub eax, dword [0xa840]
    cmp eax, edx
    jbe short loc_5615f
    mov ecx, dword [0xa844]
    inc ecx
    mov dword [0xa844], ecx
    cmp ecx, 8
    jl short loc_56130
    xor eax, eax
    mov dword [0xa844], eax
loc_56130:
    mov eax, dword [0x216f7c]
    mov dword [0xa840], eax
    jmp short loc_5615f
loc_5613c:
    mov eax, dword [0xa844]
    test eax, eax
    je short loc_5614e
    lea edx, [eax + 1]
    mov dword [0xa844], edx
loc_5614e:
    cmp dword [0xa844], 8
    jl short loc_5615f
    xor ecx, ecx
    mov dword [0xa844], ecx
loc_5615f:
    cmp dword [0xa844], 8
    jl short loc_5617b
    mov eax, 0x4888
    call PRINT_NOTICE
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_5617b:
    mov edx, dword [0xa544]
    mov ebx, dword [ebp - 0x18]
    lea eax, [edx*4]
    mov edi, dword [0xa844]
    add eax, edx
    shl edi, 2
    shl eax, 2
    cmp ebx, 1
    jne short loc_561ba
    mov edx, dword [eax + 0xa560]
    mov ecx, dword [edi + 0xa800]
    mov ebx, dword [eax + 0xa55c]
    add edx, ecx
    mov eax, dword [eax + 0xa564]
    jmp short loc_561d4
loc_561ba:
    mov edx, dword [eax + 0xa6b4]
    mov ecx, dword [edi + 0xa800]
    mov ebx, dword [eax + 0xa6b0]
    add edx, ecx
    mov eax, dword [eax + 0xa6b8]
loc_561d4:
    mov dword [ebp - 0x14], edx
    mov edx, dword [edi + 0xa820]
    lea edi, [eax + edx]
    cmp dword [0xa544], 5
    jne short loc_56211
    cmp dword [ebp - 0x18], 1
    jne short loc_56211
    mov eax, dword [0xa844]
    mov edx, dword [nosplit eax*4 + 0xa820]
    mov eax, dword [nosplit eax*4 + 0xa800]
    add edx, 0x64
    add eax, strict dword 0xa0
    call 0x54fa4
    jmp short loc_56216
loc_56211:
    call 0x54d90
loc_56216:
    mov edx, dword [ebp - 0x14]
    mov ecx, dword [0x215c84]
    mov eax, dword [0x215c8c]
    push ecx
    shl edx, 0x10
    push eax
    mov dword [ebp - 0x14], edx
    mov edx, dword [0x215c88]
    push edx
    mov ecx, dword [0x215c90]
    push ecx
    push byte 0xa
    push byte 0
    shl edi, 0x10
    mov eax, dword [ebp - 0x14]
    push byte 0
    mov edx, edi
    xor ecx, ecx
    push ebx
    mov ebx, 0x8000
    mov edi, dword [ebp - 0x18]
    call ROTATE_SPRITE
    cmp edi, 1
    jne short loc_56288
    cmp dword [0xa544], 5
    jne short loc_56288
    movsx eax, si
    imul eax, eax, strict dword 0x623
    cmp dword [eax + 0x8c423], 0
    jne short loc_56281
    cmp dword [eax + 0x8c427], 0
    je short loc_56288
loc_56281:
    mov eax, 3
    jmp short loc_562cc
loc_56288:
    cmp dword [0xa544], 5
    jne short loc_562b6
    movsx eax, si
    imul eax, eax, strict dword 0x623
    cmp dword [eax + 0x8c427], 0
    je short loc_562b6
    mov eax, 3
    call 0x55bcc
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_562b6:
    mov edx, dword [0xa544]
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [nosplit eax*4 + 0xa568]
loc_562cc:
    call 0x55bcc
loc_562d1:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    times 6 db 0    ; Alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov ecx, dword [0xa848]
    mov ebx, eax
    test eax, eax
    jl short loc_562f9
    cmp eax, 0xf
    jl short loc_56300
loc_562f9:
    xor eax, eax
    jmp near loc_563b5
loc_56300:
    cmp eax, ecx
    je near loc_563b5
    lea eax, [ecx*4]
    lea edx, [ecx + eax]
    shl edx, 2
    mov eax, dword [0x216f7c]
    mov esi, dword [0xa850]
    mov edi, dword [edx + 0xa858]
    sub eax, esi
    cmp eax, edi
    jbe near loc_563b3
    mov eax, ecx
    cmp ecx, 0xa
    jb short loc_56340
    jbe short loc_56347
    cmp ecx, 0xe
    je short loc_5637c
    jmp short loc_563a7
loc_56340:
    cmp ecx, 2
    je short loc_56388
    jmp short loc_563a7
loc_56347:
    mov eax, dword [0xcf65c]
    mov edx, 0x48b4
    sar eax, 0x10
    call 0x51408
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    mov eax, 1
    sar edx, 0x10
    call 0x51c68
    jmp short loc_563a7
loc_5637c:
    mov dword [0xa84c], 6
    jmp short loc_563a7
loc_56388:
    mov edx, dword [0xa84c]
    test edx, edx
    jne short loc_5639e
    mov eax, 0x48c8
    call PRINT_NOTICE
    jmp short loc_563a7
loc_5639e:
    lea ecx, [edx - 1]
    mov dword [0xa84c], ecx
loc_563a7:
    mov ecx, ebx
    mov eax, dword [0x216f7c]
    mov dword [0xa850], eax
loc_563b3:
    mov eax, ecx
loc_563b5:
    mov dword [0xa848], ecx
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
    push esi
    push edi
    sub esp, 0x2c
    mov edx, eax
    xor ebx, ebx
    mov word [ebp - 0x18], bx
    mov word [ebp - 0x1c], bx
    mov word [ebp - 0x20], bx
    xor ebx, ebx
    mov edi, dword [0xa84c]
    mov dword [ebp - 0x38], ebx
    mov dword [ebp - 0x3c], ebx
    mov dword [ebp - 0x40], ebx
    test edi, edi
    jne short loc_5640b
    cmp dword [0xa848], 0
    jne short loc_5640b
    mov eax, 0x10
    call 0x5a250
loc_5640b:
    cmp dword [0xa84c], 0
    je near loc_566de
    cmp dword [0xa848], 0
    jne near loc_566de
    mov eax, 1
    call 0x562e0
    cmp eax, 1
    jne near loc_566de
    movsx ebx, dx
    mov eax, ebx
    imul ebx, ebx, strict dword 0x623
    mov edx, 0x48ec
    call 0x51408
    add ebx, strict dword 0x8be10
    mov edx, 0x4900
    mov eax, ebx
    call 0x5144c
    mov edx, dword [ebx + 0x2f6]
    mov eax, 2
    sar edx, 0x10
    call 0x51c68
    mov eax, dword [ebx + 0x214]
    mov dword [ebp - 0x30], eax
    mov eax, dword [ebx + 0x218]
    mov esi, dword [ebx + 0x244]
    mov dword [ebp - 0x34], eax
    mov eax, dword [ebx + 0x21c]
    add eax, esi
    mov dword [ebp - 0x2c], eax
    mov eax, dword [0xa854]
    mov edi, ebx
    cmp eax, 3
    jne short loc_564c1
    call 0x50fe0
    mov edx, 4
    and eax, 7
    mov ebx, 0x7ff
    sub edx, eax
    call 0x50fe0
    and eax, strict dword 0xfff
    jmp short loc_564df
loc_564c1:
    call 0x50fe0
    mov edx, 8
    and eax, 0xf
    mov ebx, 0x1000
    sub edx, eax
    call 0x50fe0
    and eax, strict dword 0x2000
loc_564df:
    sub ebx, eax
    add edx, 2
    mov eax, ebx
    add dx, word [edi + 0x294]
    and dh, 7
    movsx ebx, dx
    add ebx, strict dword 0x200
    and dh, 7
    and ebx, strict dword 0x7ff
    movsx edx, dx
    mov esi, 0x64
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    mov ebx, dword [nosplit ebx*2 + 0x1bd566]
    sar edx, 0x10
    sar ebx, 0x10
    mov dword [ebp - 0x28], edx
    mov edx, dword [edi + 0x220]
    mov dword [ebp - 0x24], ebx
    sub esi, edx
    xor ebx, ebx
    shl esi, 0xb
    xor edx, edx
    add esi, eax
    xor eax, eax
    jmp short loc_56557
loc_56539:
    add edx, 4
    mov ecx, dword [eax + 0x20a06c]
    add eax, 0x28
    mov dword [edx + 0x21d2ac], ecx
    mov ecx, 0xfff9c000
    inc ebx
    mov dword [eax + 0x20a044], ecx
loc_56557:
    mov ecx, dword [0x217fcc]
    sar ecx, 0x10
    cmp ebx, ecx
    jl short loc_56539
    push dword 0x1000040
    lea eax, [ebp - 0x40]
    push eax
    lea eax, [ebp - 0x3c]
    push eax
    lea eax, [ebp - 0x38]
    push eax
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0x20]
    push eax
    lea eax, [ebp - 0x18]
    push eax
    push esi
    mov ebx, dword [ebp - 0x28]
    mov ecx, dword [ebp - 0x24]
    push ebx
    mov edx, dword [ebp - 0x34]
    mov eax, dword [ebp - 0x30]
    push ecx
    mov ecx, dword [edi + 0x298]
    mov ebx, dword [ebp - 0x2c]
    sar ecx, 0x10
    call HITSCAN
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
    jmp short loc_565bc
loc_565a9:
    add ebx, 0x28
    mov ecx, dword [eax + 0x21d2b0]
    add eax, 4
    inc edx
    mov dword [ebx + 0x20a044], ecx
loc_565bc:
    mov ecx, dword [0x217fcc]
    sar ecx, 0x10
    cmp edx, ecx
    jl short loc_565a9
    cmp word [ebp - 0x18], 0
    jge short loc_565df
    mov eax, 0x4914
    call PRINT_NOTICE
    jmp near loc_566de
loc_565df:
    mov esi, dword [ebp - 0x40]
    mov edi, dword [ebp - 0x3c]
    mov ebx, dword [ebp - 0x1a]
    mov edx, dword [ebp - 0x1e]
    mov eax, dword [ebp - 0x22]
    mov ecx, dword [ebp - 0x38]
    push esi
    sar ebx, 0x10
    sar edx, 0x10
    push edi
    sar eax, 0x10
    call 0x51678
    cmp word [ebp - 0x1c], 0
    jl near loc_566d4
    mov eax, dword [ebp - 0x1e]
    mov edx, 0x4938
    sar eax, 0x10
    call 0x513b8
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    mov edx, dword [eax + 0x191372]
    sar edx, 0x10
    cmp edx, strict dword 0x8000
    jne short loc_56658
    mov eax, 0x494c
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_56658:
    mov eax, dword [eax + 0x19137e]
    mov edx, 0x496c
    sar eax, 0x10
    call 0x514c0
    mov ebx, dword [ebp - 0x1e]
    sar ebx, 0x10
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov edx, dword [nosplit eax*4 + 0x19137e]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    cmp word [nosplit eax*8 + 0x20a08c], 0x7d0
    jne short loc_566b2
    mov eax, 0x4980
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_566b2:
    mov edx, dword [0xa854]
    mov eax, ebx
    call 0x53854
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    call 0x58568
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_566d4:
    mov eax, 4
    call 0x5a250
loc_566de:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push edx
    xor eax, eax
    mov edx, 2
    call 0x562e0
    xor ebx, ebx
    mov dword [0xa854], edx
    mov dword [0xa84c], ebx
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    mov eax, dword [0xa854]
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ecx
    push edx
    mov edx, dword [0xa848]
    test edx, edx
    jne short loc_56778
    mov eax, 0x4000
    call 0x5a250
    mov ecx, dword [0xa848]
    mov dword [0xa84c], edx
    test ecx, ecx
    jne short loc_56757
    mov eax, 0xa
    call 0x562e0
loc_56757:
    cmp dword [0xa854], 2
    sete al
    and eax, strict dword 0xff
    add eax, 2
    mov dword [0xa854], eax
    mov eax, 0x10
    call 0x59304
loc_56778:
    lea esp, [ebp - 8]
    pop edx
    pop ecx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    cmp dword [0xa848], 0
    jne short loc_5679f
    cmp dword [0xa84c], 6
    je short loc_5679f
    mov eax, 0xa
    call 0x562e0
loc_5679f:
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edx, dword [0xa848]
    test edx, edx
    jl short loc_567bb
    cmp edx, 0xf
    jl short loc_567ca
loc_567bb:
    mov eax, 0x49a4
    call PRINT_NOTICE
    jmp near loc_56928
loc_567ca:
    test ax, ax
    jl short loc_567d8
    cmp ax, word [0xcf65c]
    jle short loc_567ec
loc_567d8:
    mov eax, 0x49c4
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_567ec:
    movsx edx, ax
    imul edx, edx, strict dword 0x623
    cmp dword [edx + 0x8c423], 0
    jne short loc_56807
    cmp dword [edx + 0x8c427], 0
    je short loc_56857
loc_56807:
    cwde
    imul eax, eax, strict dword 0x623
    mov ecx, dword [eax + 0x8c427]
    mov edx, 0xa
    test ecx, ecx
    je short loc_56822
    mov edx, 5
loc_56822:
    mov eax, dword [0x216f7c]
    sub eax, dword [0xa9c4]
    cmp eax, edx
    jbe short loc_5687a
    mov edi, dword [0xa9c8]
    inc edi
    mov dword [0xa9c8], edi
    cmp edi, 8
    jl short loc_5684b
    xor edx, edx
    mov dword [0xa9c8], edx
loc_5684b:
    mov eax, dword [0x216f7c]
    mov dword [0xa9c4], eax
    jmp short loc_5687a
loc_56857:
    mov edi, dword [0xa9c8]
    test edi, edi
    je short loc_56869
    lea eax, [edi + 1]
    mov dword [0xa9c8], eax
loc_56869:
    cmp dword [0xa9c8], 8
    jl short loc_5687a
    xor ebx, ebx
    mov dword [0xa9c8], ebx
loc_5687a:
    cmp dword [0xa9c8], 8
    jl short loc_56897
    mov eax, 0x49e8
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_56897:
    call 0x54d90
    mov edx, dword [0xa848]
    mov ecx, dword [0xa9c8]
    lea ebx, [edx*4]
    mov esi, dword [nosplit ecx*4 + 0xa984]
    add ebx, edx
    mov edi, dword [nosplit ecx*4 + 0xa9a4]
    shl ebx, 2
    mov ecx, dword [0x215c84]
    mov eax, dword [ebx + 0xa860]
    push ecx
    add eax, esi
    mov esi, dword [0x215c8c]
    mov edx, dword [ebx + 0xa864]
    push esi
    add edx, edi
    mov edi, dword [0x215c88]
    push edi
    mov ecx, dword [0x215c90]
    push ecx
    push byte 0xa
    push byte 0
    shl eax, 0x10
    mov esi, dword [ebx + 0xa85c]
    push byte 0
    shl edx, 0x10
    push esi
    mov ebx, 0xa000
    xor ecx, ecx
    call ROTATE_SPRITE
    mov edx, dword [0xa848]
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [nosplit eax*4 + 0xa868]
    call 0x562e0
loc_56928:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 14 db 0    ; Alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov ebx, eax
    test eax, eax
    jl short loc_56952
    cmp eax, 7
    jl short loc_56965
loc_56952:
    mov eax, 0x4a14
    mov edx, ebx
    call LOG_NUMBER
    xor eax, eax
    jmp near loc_56a11
loc_56965:
    mov edx, dword [0xa9cc]
    cmp eax, edx
    je near loc_56a11
    lea eax, [edx*4]
    add edx, eax
    shl edx, 2
    mov eax, dword [0x216f7c]
    mov ecx, dword [0xa9d4]
    mov esi, dword [edx + 0xa9dc]
    sub eax, ecx
    cmp eax, esi
    jbe near loc_56a0c
    mov eax, dword [0xa9cc]
    cmp eax, 4
    jb short loc_569ad
    jbe short loc_569b4
    cmp eax, 6
    je short loc_569e9
    jmp short loc_569fc
loc_569ad:
    cmp eax, 2
    je short loc_569f5
    jmp short loc_569fc
loc_569b4:
    mov eax, dword [0xcf65c]
    mov edx, 0x4a2c
    sar eax, 0x10
    call 0x51408
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    mov eax, 7
    sar edx, 0x10
    call 0x51c68
    jmp short loc_569fc
loc_569e9:
    mov dword [0xa9d0], 1
    jmp short loc_569fc
loc_569f5:
    xor eax, eax
    mov dword [0xa9d0], eax
loc_569fc:
    mov dword [0xa9cc], ebx
    mov eax, dword [0x216f7c]
    mov dword [0xa9d4], eax
loc_56a0c:
    mov eax, dword [0xa9cc]
loc_56a11:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

bow_fire:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov edx, eax
    cmp dword [0xa9d0], 0
    jne short loc_56a46
    mov ecx, dword [0xa9cc]
    cmp ecx, 1
    je short loc_56a3c
    test ecx, ecx
    jne short loc_56a46
loc_56a3c:
    mov eax, 0x10
    call 0x5a250
loc_56a46:
    cmp dword [0xa9d0], 0
    je short loc_56aa8
    cmp dword [0xa9cc], 1
    jne short loc_56aa8
    mov eax, 2
    call 0x56940
    cmp eax, 2
    jne short loc_56aa8
    movsx ebx, dx
    mov eax, ebx
    imul ecx, ebx, strict dword 0x623
    mov edx, 0x4a40
    call 0x51408
    add ecx, strict dword 0x8be10
    mov edx, 0x4a50
    mov eax, ecx
    call 0x5144c
    mov edx, dword [ecx + 0x2f6]
    mov eax, 8
    sar edx, 0x10
    call 0x51c68
    mov eax, ebx
    call 0x588d0
loc_56aa8:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push edx
    xor eax, eax
    xor edx, edx
    call 0x56940
    mov dword [0xa9d8], edx
    mov dword [0xa9d0], edx
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, dword [0xa9d8]
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ecx
    push edx
    mov edx, dword [0xa9cc]
    test edx, edx
    jne short loc_56b35
    mov eax, 0x4000
    call 0x5a250
    mov ecx, dword [0xa9cc]
    mov dword [0xa9d0], edx
    test ecx, ecx
    jne short loc_56b17
    mov eax, 4
    call 0x56940
loc_56b17:
    cmp dword [0xa9d8], 0
    sete al
    and eax, strict dword 0xff
    mov dword [0xa9d8], eax
    mov eax, 0x10
    call 0x59304
loc_56b35:
    lea esp, [ebp - 8]
    pop edx
    pop ecx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    cmp dword [0xa9cc], 0
    jne short loc_56b5b
    cmp dword [0xa9d0], 1
    je short loc_56b5b
    mov eax, 4
    call 0x56940
loc_56b5b:
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edx, dword [0xa9cc]
    test edx, edx
    jl short loc_56b77
    cmp edx, 7
    jl short loc_56b86
loc_56b77:
    mov eax, 0x4a60
    call PRINT_NOTICE
    jmp near loc_56ce4
loc_56b86:
    test ax, ax
    jl short loc_56b94
    cmp ax, word [0xcf65c]
    jle short loc_56ba8
loc_56b94:
    mov eax, 0x4a7c
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_56ba8:
    movsx edx, ax
    imul edx, edx, strict dword 0x623
    cmp dword [edx + 0x8c423], 0
    jne short loc_56bc3
    cmp dword [edx + 0x8c427], 0
    je short loc_56c13
loc_56bc3:
    cwde
    imul eax, eax, strict dword 0x623
    mov ecx, dword [eax + 0x8c427]
    mov edx, 0xa
    test ecx, ecx
    je short loc_56bde
    mov edx, 5
loc_56bde:
    mov eax, dword [0x216f7c]
    sub eax, dword [0xaaa8]
    cmp eax, edx
    jbe short loc_56c36
    mov edi, dword [0xaaac]
    inc edi
    mov dword [0xaaac], edi
    cmp edi, 8
    jl short loc_56c07
    xor edx, edx
    mov dword [0xaaac], edx
loc_56c07:
    mov eax, dword [0x216f7c]
    mov dword [0xaaa8], eax
    jmp short loc_56c36
loc_56c13:
    mov edi, dword [0xaaac]
    test edi, edi
    je short loc_56c25
    lea eax, [edi + 1]
    mov dword [0xaaac], eax
loc_56c25:
    cmp dword [0xaaac], 8
    jl short loc_56c36
    xor ebx, ebx
    mov dword [0xaaac], ebx
loc_56c36:
    cmp dword [0xaaac], 8
    jl short loc_56c53
    mov eax, 0x4a9c
    call PRINT_NOTICE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_56c53:
    call 0x54d90
    mov edx, dword [0xa9cc]
    mov ecx, dword [0xaaac]
    lea ebx, [edx*4]
    mov esi, dword [nosplit ecx*4 + 0xaa68]
    add ebx, edx
    mov edi, dword [nosplit ecx*4 + 0xaa88]
    shl ebx, 2
    mov ecx, dword [0x215c84]
    mov eax, dword [ebx + 0xa9e4]
    push ecx
    add eax, esi
    mov esi, dword [0x215c8c]
    mov edx, dword [ebx + 0xa9e8]
    push esi
    add edx, edi
    mov edi, dword [0x215c88]
    push edi
    mov ecx, dword [0x215c90]
    push ecx
    push byte 0xa
    push byte 0
    shl eax, 0x10
    mov esi, dword [ebx + 0xa9e0]
    push byte 0
    shl edx, 0x10
    push esi
    mov ebx, 0xa000
    xor ecx, ecx
    call ROTATE_SPRITE
    mov edx, dword [0xa9cc]
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [nosplit eax*4 + 0xa9ec]
    call 0x56940
loc_56ce4:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 2 db 0    ; Alignment
    push ebp
    mov ebp, esp
    push edx
    test eax, eax
    jl short loc_56d05
    mov edx, dword [0x217fcc]
    sar edx, 0x10
    cmp eax, edx
    jl short loc_56d09
loc_56d05:
    xor eax, eax
    jmp short loc_56d0e
loc_56d09:
    mov eax, 1
loc_56d0e:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x18
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, 0x4ac8
    add eax, strict dword 0x8be10
    call 0x5144c
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, 0x8be10
    add edx, eax
    mov eax, dword [0x2175cc]
    sar eax, 0x10
    mov dword [ebp - 0x24], edx
    mov dword [ebp - 0x2c], eax
    test eax, eax
    jl near loc_56e9b
loc_56d67:
    mov eax, dword [ebp - 0x2c]
    mov eax, dword [nosplit eax*2 + 0x18cf66]
    sar eax, 0x10
    mov ecx, dword [ebp - 0x2c]
    mov dword [ebp - 0x20], eax
    imul eax, ecx, 0x2c
    mov edx, 0x191368
    add edx, eax
    mov esi, dword [edx + 8]
    mov dword [ebp - 0x1c], edx
    add esi, strict dword 0x300
    mov ax, word [edx + 0x18]
    mov dword [edx + 8], esi
    test ax, ax
    jl short loc_56da5
    cmp ax, word [0x217fce]
    jl short loc_56daf
loc_56da5:
    mov eax, 0x4ad4
    jmp near loc_56e88
loc_56daf:
    movsx edx, ax
    imul edx, edx, 0x28
    mov eax, dword [ebp - 0x1c]
    mov eax, dword [eax + 8]
    cmp eax, dword [edx + 0x20a070]
    jle near loc_56e8d
    mov edx, dword [ebp - 0x24]
    call 0x50fe0
    and eax, strict dword 0x3fff
    add eax, dword [edx + 0x214]
    lea edi, [eax - 0x2000]
    call 0x50fe0
    and eax, strict dword 0x3fff
    add eax, dword [edx + 0x218]
    mov ebx, 0xffffffff
    lea esi, [eax - 0x2000]
    mov word [ebp - 0x18], bx
    mov eax, 0xfffe7000
    xor ecx, ecx
    mov dword [ebp - 0x28], eax
    jmp short loc_56e3e
loc_56e0b:
    mov ebx, ecx
    mov edx, esi
    mov eax, edi
    call 0x3b442
    test eax, eax
    je short loc_56e3d
    test ecx, ecx
    jl short loc_56e2a
    mov eax, dword [0x217fcc]
    sar eax, 0x10
    cmp ecx, eax
    jl short loc_56e2e
loc_56e2a:
    xor eax, eax
    jmp short loc_56e33
loc_56e2e:
    mov eax, 1
loc_56e33:
    test eax, eax
    je short loc_56e3d
    mov word [ebp - 0x18], cx
    jmp short loc_56e4a
loc_56e3d:
    inc ecx
loc_56e3e:
    mov eax, dword [0x217fcc]
    sar eax, 0x10
    cmp ecx, eax
    jl short loc_56e0b
loc_56e4a:
    mov ecx, dword [ebp - 0x18]
    test cx, cx
    jl short loc_56e8d
    cmp cx, word [0x217fce]
    jge short loc_56e8d
    mov eax, dword [ebp - 0x1c]
    mov dword [eax], edi
    mov edx, dword [ebp - 0x1c]
    mov dword [eax + 4], esi
    mov eax, dword [ebp - 0x28]
    mov dword [edx + 8], eax
    mov edx, dword [ebp - 0x1a]
    mov eax, dword [ebp - 0x2c]
    sar edx, 0x10
    call CHANGE_SPRITE_SECT
    mov eax, dword [ebp - 0x1c]
    cmp cx, word [eax + 0x18]
    je short loc_56e8d
    mov eax, 0x4af4
loc_56e88:
    call PRINT_NOTICE
loc_56e8d:
    mov eax, dword [ebp - 0x20]
    mov dword [ebp - 0x2c], eax
    test eax, eax
    jge near loc_56d67
loc_56e9b:
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
    call 0x56d14
    mov esp, ebp
    pop ebp
    ret
    times 12 db 0    ; Alignment
    push ebp
    mov ebp, esp
    push edx
    mov ax, word [0x2175d0]
    test ax, ax
    jl short loc_56ee9
loc_56ecf:
    movsx edx, ax
    mov ax, word [nosplit edx*2 + 0x18cf68]
    imul edx, edx, 0x2c
    inc word [edx + 0x191392]
    test ax, ax
    jge short loc_56ecf
loc_56ee9:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov ecx, 0xffffffff
    mov ax, word [0x2175d0]
    xor esi, esi
    test ax, ax
    jl short loc_56f52
loc_56f0a:
    movsx edx, ax
    mov bx, word [nosplit edx*2 + 0x18cf68]
    imul edx, edx, 0x2c
    mov di, word [edx + 0x191392]
    cmp cx, di
    jge short loc_56f28
    mov ecx, edi
    mov esi, eax
loc_56f28:
    movsx edx, ax
    imul edx, edx, 0x2c
    mov edx, dword [edx + 0x191390]
    mov edi, dword [0xaab8]
    sar edx, 0x10
    cmp edx, edi
    jle short loc_56f4b
    mov eax, 0x4b0c
    call LOG_NUMBER
loc_56f4b:
    mov eax, ebx
    test bx, bx
    jge short loc_56f0a
loc_56f52:
    mov eax, esi
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
    sub esp, 0x1c
    mov word [ebp - 0x1c], ax
    xor edx, edx
    mov dword [ebp - 0x24], edx
    mov dword [ebp - 0x28], edx
    mov dword [ebp - 0x2c], edx
    mov dword [ebp - 0x30], edx
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edi, 0x191368
    shl eax, 2
    mov edx, dword [0xaab8]
    add edi, eax
    cmp edx, dword [0xaab0]
    jle short loc_56fef
    mov eax, dword [edi + 0x16]
    xor edx, edx
    sar eax, 0x10
    call INSERT_SPRITE
    mov word [ebp - 0x18], ax
    test ax, ax
    jl short loc_56fc5
    cmp ax, strict word 0x1000
    jl short loc_56fe7
loc_56fc5:
    mov eax, 0x4b38
    call PRINT_NOTICE
    mov eax, dword [0xaab0]
    mov dword [0xaab8], eax
    mov edx, eax
    mov eax, 0x4b60
    call LOG_NUMBER
    jmp short loc_57012
loc_56fe7:
    inc dword [0xaab0]
    jmp short loc_57012
loc_56fef:
    call 0x56ef0
    mov word [ebp - 0x18], ax
    test ax, ax
    jl short loc_57003
    cmp ax, strict word 0x1000
    jl short loc_57012
loc_57003:
    mov eax, 0x4b84
    call PRINT_NOTICE
    jmp near loc_57136
loc_57012:
    mov ax, word [0x2175d0]
    test ax, ax
    jl short loc_57037
loc_5701d:
    movsx edx, ax
    mov ax, word [nosplit edx*2 + 0x18cf68]
    imul edx, edx, 0x2c
    inc word [edx + 0x191392]
    test ax, ax
    jge short loc_5701d
loc_57037:
    mov edx, dword [ebp - 0x1a]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov esi, 0x191368
    shl eax, 2
    add esi, eax
    mov edx, 0x4bb0
    mov eax, esi
    call 0x513e4
    push dword 0x10001
    push dword 0x80
    lea eax, [ebp - 0x30]
    push eax
    lea eax, [ebp - 0x2c]
    mov ecx, dword [edi + 0x16]
    push eax
    lea eax, [ebp - 0x28]
    mov ebx, dword [edi + 8]
    push eax
    lea eax, [ebp - 0x24]
    mov edx, dword [edi + 4]
    push eax
    sar ecx, 0x10
    mov eax, dword [edi]
    call 0x46fb4
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add edx, eax
    shl edx, 3
    mov eax, dword [ebp - 0x2c]
    mov ecx, dword [edx + 0x20a070]
    cmp eax, ecx
    jge short loc_570b3
    lea eax, [ecx - 8]
    mov dword [ebp - 0x2c], eax
loc_570b3:
    mov eax, dword [ebp - 0x1a]
    mov ecx, dword [ebp - 0x2c]
    mov ebx, dword [edi + 4]
    sar eax, 0x10
    mov edx, dword [edi]
    mov dword [ebp - 0x20], eax
    call 0x40b6d
    mov edx, 0x322
    mov eax, dword [ebp - 0x20]
    call 0x41158
    mov ax, word [edi + 0x1c]
    mov word [esi + 0xc], 0x20
    mov word [esi + 0x2a], 0
    mov word [esi + 0x1c], ax
    mov eax, dword [ebp - 0x1c]
    mov edi, dword [0xbffeb]
    mov word [esi + 0x1e], ax
    cmp edi, 3
    setne al
    mov byte [esi + 0x11], 0
    mov byte [esi + 0x16], 0
    mov byte [esi + 0x17], 0
    mov word [esi + 0x20], 0
    mov word [esi + 0x22], 0
    mov word [esi + 0x24], 0
    mov byte [esi + 0x10], 0xe4
    mov byte [esi + 0x14], 0xe
    mov byte [esi + 0x15], 0x12
    xor ah, ah
    mov byte [esi + 0x12], 0x20
    add eax, strict dword 0x1ba8
    mov word [esi + 0xe], ax
loc_57136:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push edx
    mov ax, word [0x2175d4]
    test ax, ax
    jl short loc_57169
loc_5714f:
    movsx edx, ax
    mov ax, word [nosplit edx*2 + 0x18cf68]
    imul edx, edx, 0x2c
    inc word [edx + 0x191392]
    test ax, ax
    jge short loc_5714f
loc_57169:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov ecx, 0xffffffff
    mov ax, word [0x2175d4]
    xor esi, esi
    test ax, ax
    jl short loc_571d2
loc_5718a:
    movsx edx, ax
    mov bx, word [nosplit edx*2 + 0x18cf68]
    imul edx, edx, 0x2c
    mov di, word [edx + 0x191392]
    cmp cx, di
    jge short loc_571a8
    mov ecx, edi
    mov esi, eax
loc_571a8:
    movsx edx, ax
    imul edx, edx, 0x2c
    mov edx, dword [edx + 0x191390]
    mov edi, dword [0xaac4]
    sar edx, 0x10
    cmp edx, edi
    jle short loc_571cb
    mov eax, 0x4bc4
    call LOG_NUMBER
loc_571cb:
    mov eax, ebx
    test bx, bx
    jge short loc_5718a
loc_571d2:
    mov eax, esi
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
    sub esp, 0x1c
    mov word [ebp - 0x1c], ax
    xor edx, edx
    mov dword [ebp - 0x24], edx
    mov dword [ebp - 0x28], edx
    mov dword [ebp - 0x2c], edx
    mov dword [ebp - 0x30], edx
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edi, 0x191368
    shl eax, 2
    mov edx, dword [0xaac4]
    add edi, eax
    cmp edx, dword [0xaabc]
    jle short loc_5726f
    mov eax, dword [edi + 0x16]
    xor edx, edx
    sar eax, 0x10
    call INSERT_SPRITE
    mov word [ebp - 0x18], ax
    test ax, ax
    jl short loc_57245
    cmp ax, strict word 0x1000
    jl short loc_57267
loc_57245:
    mov eax, 0x4bf0
    call PRINT_NOTICE
    mov eax, dword [0xaabc]
    mov dword [0xaac4], eax
    mov edx, eax
    mov eax, 0x4c18
    call LOG_NUMBER
    jmp short loc_57292
loc_57267:
    inc dword [0xaabc]
    jmp short loc_57292
loc_5726f:
    call 0x57170
    mov word [ebp - 0x18], ax
    test ax, ax
    jl short loc_57283
    cmp ax, strict word 0x1000
    jl short loc_57292
loc_57283:
    mov eax, 0x4c3c
    call PRINT_NOTICE
    jmp near loc_573b6
loc_57292:
    mov ax, word [0x2175d4]
    test ax, ax
    jl short loc_572b7
loc_5729d:
    movsx edx, ax
    mov ax, word [nosplit edx*2 + 0x18cf68]
    imul edx, edx, 0x2c
    inc word [edx + 0x191392]
    test ax, ax
    jge short loc_5729d
loc_572b7:
    mov edx, dword [ebp - 0x1a]
    sar edx, 0x10
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov esi, 0x191368
    shl eax, 2
    add esi, eax
    mov edx, 0x4c68
    mov eax, esi
    call 0x513e4
    push dword 0x10001
    push dword 0x80
    lea eax, [ebp - 0x30]
    push eax
    lea eax, [ebp - 0x2c]
    mov ecx, dword [edi + 0x16]
    push eax
    lea eax, [ebp - 0x28]
    mov ebx, dword [edi + 8]
    push eax
    lea eax, [ebp - 0x24]
    mov edx, dword [edi + 4]
    push eax
    sar ecx, 0x10
    mov eax, dword [edi]
    call 0x46fb4
    mov edx, dword [edi + 0x16]
    sar edx, 0x10
    lea eax, [edx*4]
    add edx, eax
    shl edx, 3
    mov eax, dword [ebp - 0x2c]
    mov ecx, dword [edx + 0x20a070]
    cmp eax, ecx
    jge short loc_57333
    lea eax, [ecx - 8]
    mov dword [ebp - 0x2c], eax
loc_57333:
    mov eax, dword [ebp - 0x1a]
    mov ecx, dword [ebp - 0x2c]
    mov ebx, dword [edi + 4]
    sar eax, 0x10
    mov edx, dword [edi]
    mov dword [ebp - 0x20], eax
    call 0x40b6d
    mov edx, 0x324
    mov eax, dword [ebp - 0x20]
    call 0x41158
    mov ax, word [edi + 0x1c]
    mov word [esi + 0xc], 0x20
    mov word [esi + 0x2a], 0
    mov word [esi + 0x1c], ax
    mov eax, dword [ebp - 0x1c]
    mov edi, dword [0xbffeb]
    mov word [esi + 0x1e], ax
    cmp edi, 3
    setne al
    mov byte [esi + 0x11], 0
    mov byte [esi + 0x16], 0
    mov byte [esi + 0x17], 0
    mov word [esi + 0x20], 0
    mov word [esi + 0x22], 0
    mov word [esi + 0x24], 0
    mov byte [esi + 0x10], 0xe4
    mov byte [esi + 0x14], 0xe
    mov byte [esi + 0x15], 0x12
    xor ah, ah
    mov byte [esi + 0x12], 0x20
    add eax, strict dword 0x1bac
    mov word [esi + 0xe], ax
loc_573b6:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
