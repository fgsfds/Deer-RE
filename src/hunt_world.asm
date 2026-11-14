bits 32
org 0x573c0

%define PRINT_NOTICE 0x5130c
%define LOG_NUMBER 0x51350
%define KRAND 0x46fa0
%define ROTATE_SPRITE 0x47f83
%define HITSCAN 0x414ef
%define INSERT_SPRITE 0x40d50
%define CHANGE_SPRITE_SECT 0x410f9

init_tracks:
    push ebp
    mov ebp, esp
    push ecx
    push edx
    xor edx, edx
    xor eax, eax
loc_573c9:
    cmp word [eax + 0x191376], 0
    je short loc_573d4
    inc edx
loc_573d4:
    add eax, 0x2c
    cmp eax, strict dword 0x2c000
    jne short loc_573c9
    mov eax, 0x1000
    sub eax, edx
    cmp eax, strict dword 0x280
    jg short loc_573f6
    mov eax, 0x4c7c
    call PRINT_NOTICE
loc_573f6:
    mov ecx, 0x180
    xor edx, edx
    mov eax, 0x100
    mov dword [0xaab0], edx
    mov dword [0xaab4], edx
    mov dword [0xaab8], ecx
    mov dword [0xaabc], edx
    mov dword [0xaac0], edx
    mov dword [0xaac4], eax
    call 0x50fe0
    and ah, 7
    mov word [0xaac8], ax
    lea esp, [ebp - 8]
    pop edx
    pop ecx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    mov ax, word [0xaac8]
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    mov ecx, edx
    movsx ebx, ax
    mov edx, 0x4cac
    mov eax, ebx
    call 0x513b8
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov ebx, 0x191368
    shl eax, 2
    add ebx, eax
    mov edx, 0x4cc4
    mov eax, ebx
    movsx ecx, cx
    call 0x513e4
    mov eax, ecx
    imul ecx, ecx, strict dword 0x623
    mov edx, 0x4cdc
    call 0x51408
    add ecx, strict dword 0x8be10
    mov edx, 0x4cf4
    mov eax, ecx
    call 0x5144c
    mov eax, dword [ebx + 4]
    mov edx, dword [ecx + 0x218]
    sub eax, edx
    mov edx, eax
    mov eax, dword [ebx]
    sub eax, dword [ecx + 0x214]
    call 0x3b4fc
    mov edx, dword [0xaac6]
    and ah, 7
    sar edx, 0x10
    cwde
    sub edx, eax
    mov eax, edx
    test eax, eax
    jns short loc_574de
    neg eax
loc_574de:
    cmp eax, strict dword 0x100
    setl al
    and eax, strict dword 0xff
    lea esp, [ebp - 8]
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
    movsx ebx, ax
    mov eax, ebx
    lea esi, [ebx*4]
    sub esi, ebx
    mov edx, 0x4d0c
    shl esi, 2
    call 0x513b8
    sub esi, ebx
    mov eax, 0x191368
    shl esi, 2
    mov edx, 0x4d20
    add eax, esi
    call 0x513e4
    mov ax, word [esi + 0x191380]
    movsx ecx, ax
    mov edx, 0x4d34
    mov eax, ecx
    call 0x514c0
    lea eax, [ecx*4]
    add ecx, eax
    mov eax, 0x20a068
    shl ecx, 3
    mov edx, 0x4d48
    add eax, ecx
    call 0x514ec
    mov edx, dword [ecx + 0x20a078]
    mov eax, dword [ecx + 0x20a080]
    sar edx, 0x10
    sar eax, 0x10
    sub edx, eax
    mov eax, edx
    test eax, eax
    jns short loc_5757b
    neg eax
loc_5757b:
    cmp eax, strict dword 0x240
    jg short loc_575bb
    mov ax, word [esi + 0x191376]
    cmp ax, strict word 0x1351
    jb short loc_575bb
    jbe short loc_575aa
    cmp ax, strict word 0x1603
    jne short loc_575bb
    cmp word [ecx + 0x20a08c], 0
    jne short loc_575bb
    mov eax, ebx
    call 0x56f60
    jmp short loc_575bb
loc_575aa:
    cmp word [ecx + 0x20a08c], 0
    jne short loc_575bb
    mov eax, ebx
    call 0x571e0
loc_575bb:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x1c
    mov word [ebp - 0x18], ax
    xor edx, edx
    mov edi, dword [0xaab4]
    mov dword [ebp - 0x24], edx
    mov dword [ebp - 0x28], edx
    mov dword [ebp - 0x2c], edx
    mov dword [ebp - 0x30], edx
    cmp edi, 0x18
    jge near loc_57739
    mov esi, dword [ebp - 0x1a]
    sar esi, 0x10
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    sub eax, esi
    mov edi, 0x191368
    shl eax, 2
    add edi, eax
    mov eax, dword [edi + 0x16]
    sar eax, 0x10
    call INSERT_SPRITE
    mov word [ebp - 0x1c], ax
    test ax, ax
    jl short loc_57628
    cmp ax, strict word 0x1000
    jl short loc_57637
loc_57628:
    mov eax, 0x4d5c
    call PRINT_NOTICE
    jmp near loc_57739
loc_57637:
    movsx esi, ax
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    sub eax, esi
    mov esi, 0x191368
    shl eax, 2
    add esi, eax
    mov edx, 0x4d88
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
    mov ebx, dword [edx + 0x20a070]
    cmp eax, ebx
    jge short loc_576b0
    lea eax, [ebx - 8]
    mov dword [ebp - 0x2c], eax
loc_576b0:
    mov eax, dword [ebp - 0x1e]
    mov ecx, dword [ebp - 0x2c]
    mov ebx, dword [edi + 4]
    sar eax, 0x10
    mov edx, dword [edi]
    mov dword [ebp - 0x20], eax
    call 0x40b6d
    mov edx, 0x323
    mov eax, dword [ebp - 0x20]
    call 0x41158
    mov ax, word [edi + 0x1c]
    mov word [esi + 0xc], 0
    mov word [esi + 0x1c], ax
    mov eax, dword [ebp - 0x18]
    mov ecx, dword [0xbffeb]
    mov word [esi + 0x1e], ax
    cmp ecx, 3
    setne al
    mov byte [esi + 0x11], 0
    mov byte [esi + 0x16], 0
    mov byte [esi + 0x17], 0
    mov word [esi + 0x20], 0
    mov word [esi + 0x22], 0
    mov word [esi + 0x24], 0
    mov byte [esi + 0x10], 8
    mov byte [esi + 0x14], 8
    mov byte [esi + 0x15], 5
    mov byte [esi + 0x12], 0x20
    xor ah, ah
    mov word [esi + 0x2a], 0
    add eax, strict dword 0x3d5
    mov word [esi + 0xe], ax
    inc dword [0xaab4]
loc_57739:
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
    push esi
    push edi
    sub esp, 0x1c
    mov word [ebp - 0x18], ax
    xor edx, edx
    mov edi, dword [0xaac0]
    mov dword [ebp - 0x24], edx
    mov dword [ebp - 0x28], edx
    mov dword [ebp - 0x2c], edx
    mov dword [ebp - 0x30], edx
    cmp edi, 0x18
    jge near loc_578b8
    mov esi, dword [ebp - 0x1a]
    sar esi, 0x10
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    sub eax, esi
    mov edi, 0x191368
    shl eax, 2
    add edi, eax
    mov eax, dword [edi + 0x16]
    sar eax, 0x10
    call INSERT_SPRITE
    mov word [ebp - 0x1c], ax
    test ax, ax
    jl short loc_577a8
    cmp ax, strict word 0x1000
    jl short loc_577b7
loc_577a8:
    mov eax, 0x4da0
    call PRINT_NOTICE
    jmp near loc_578b8
loc_577b7:
    movsx esi, ax
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    sub eax, esi
    mov esi, 0x191368
    shl eax, 2
    add esi, eax
    mov edx, 0x4dcc
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
    lea ebx, [edx*4]
    add ebx, edx
    shl ebx, 3
    mov eax, dword [ebp - 0x2c]
    mov edx, dword [ebx + 0x20a070]
    cmp eax, edx
    jge short loc_57830
    lea eax, [edx - 8]
    mov dword [ebp - 0x2c], eax
loc_57830:
    mov eax, dword [ebp - 0x1e]
    mov ecx, dword [ebp - 0x2c]
    mov ebx, dword [edi + 4]
    sar eax, 0x10
    mov edx, dword [edi]
    mov dword [ebp - 0x20], eax
    call 0x40b6d
    mov edx, 0x325
    mov eax, dword [ebp - 0x20]
    call 0x41158
    mov ax, word [edi + 0x1c]
    mov word [esi + 0xc], 0
    mov word [esi + 0x1c], ax
    mov eax, dword [ebp - 0x18]
    mov ebx, dword [0xbffeb]
    mov word [esi + 0x1e], ax
    cmp ebx, 3
    mov word [esi + 0xe], 0x3d7
    mov byte [esi + 0x11], 0
    mov byte [esi + 0x16], 0
    mov byte [esi + 0x17], 0
    mov word [esi + 0x20], 0
    mov word [esi + 0x22], 0
    mov word [esi + 0x24], 0
    mov byte [esi + 0x10], 8
    mov byte [esi + 0x14], 8
    mov byte [esi + 0x15], 5
    mov ecx, dword [0xaac0]
    mov byte [esi + 0x12], 0x20
    inc ecx
    mov word [esi + 0x2a], 0
    mov dword [0xaac0], ecx
loc_578b8:
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
    movsx ebx, ax
    mov eax, ebx
    lea esi, [ebx*4]
    sub esi, ebx
    mov edx, 0x4de4
    shl esi, 2
    call 0x513b8
    sub esi, ebx
    mov eax, 0x191368
    shl esi, 2
    mov edx, 0x4e00
    add eax, esi
    call 0x513e4
    mov ax, word [esi + 0x191380]
    movsx ecx, ax
    mov edx, 0x4e1c
    mov eax, ecx
    call 0x514c0
    lea eax, [ecx*4]
    add ecx, eax
    mov eax, 0x20a068
    shl ecx, 3
    mov edx, 0x4e38
    add eax, ecx
    call 0x514ec
    mov edx, dword [ecx + 0x20a078]
    mov eax, dword [ecx + 0x20a080]
    sar edx, 0x10
    sar eax, 0x10
    sub edx, eax
    mov eax, edx
    test eax, eax
    jns short loc_5794b
    neg eax
loc_5794b:
    cmp eax, strict dword 0x240
    jg short loc_5798b
    mov ax, word [esi + 0x191376]
    cmp ax, strict word 0x1351
    jb short loc_5798b
    jbe short loc_5797a
    cmp ax, strict word 0x1603
    jne short loc_5798b
    cmp word [ecx + 0x20a08c], 0
    jne short loc_5798b
    mov eax, ebx
    call 0x575c4
    jmp short loc_5798b
loc_5797a:
    cmp word [ecx + 0x20a08c], 0
    jne short loc_5798b
    mov eax, ebx
    call 0x57744
loc_5798b:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 12 db 0    ; Alignment

update_target_clock:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edx, dword [0xaad0]
    mov ebx, dword [0xaad4]
    mov ecx, dword [0xaacc]
    inc ecx
    inc edx
    mov dword [0xaacc], ecx
    cmp edx, 4
    jne short loc_57a28
    mov esi, dword [0xaadc]
    test esi, esi
    jbe short loc_579da
    lea edi, [esi - 1]
    mov dword [0xaadc], edi
loc_579da:
    mov eax, dword [0xaae0]
    test eax, eax
    jbe short loc_579ec
    lea edx, [eax - 1]
    mov dword [0xaae0], edx
loc_579ec:
    mov ecx, dword [0xaae4]
    test ecx, ecx
    jbe short loc_579ff
    lea esi, [ecx - 1]
    mov dword [0xaae4], esi
loc_579ff:
    mov edi, dword [0xaae8]
    test edi, edi
    jbe short loc_57a11
    lea eax, [edi - 1]
    mov dword [0xaae8], eax
loc_57a11:
    inc ebx
    xor edx, edx
    cmp ebx, 0xa
    jne short loc_57a28
    mov ecx, dword [0xaad8]
    inc ecx
    xor ebx, ebx
    mov dword [0xaad8], ecx
loc_57a28:
    mov dword [0xaad4], ebx
    mov dword [0xaad0], edx
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
    cmp dword [0xaadc], 0
    je short loc_57a52
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
loc_57a52:
    mov dword [0xaadc], eax
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    cmp dword [0xaae0], 0
    je short loc_57a72
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
loc_57a72:
    mov dword [0xaae0], eax
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    cmp dword [0xaae4], 0
    je short loc_57a92
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
loc_57a92:
    mov dword [0xaae4], eax
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    cmp dword [0xaae8], 0
    je short loc_57ab2
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
loc_57ab2:
    mov dword [0xaae8], eax
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    xor eax, eax
loc_57ac8:
    mov cl, al
    mov bl, 1
    and cl, 7
    mov edx, eax
    shl bl, cl
    sar edx, 3
    mov cl, bl
    mov bl, byte [edx + 0x1694e8]
    or bl, cl
    inc eax
    mov byte [edx + 0x1694e8], bl
    cmp eax, strict dword 0x400
    jl short loc_57ac8
    xor eax, eax
loc_57af0:
    mov bl, 1
    mov cl, al
    mov edx, eax
    and cl, 7
    sar edx, 3
    shl bl, cl
    mov bh, byte [edx + 0x169568]
    or bh, bl
    inc eax
    mov byte [edx + 0x169568], bh
    cmp eax, strict dword 0x2000
    jl short loc_57af0
    xor byte [0xaaec], 1
    lea esp, [ebp - 0xc]
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
    mov dword [0xaaec], edx
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x6c
    mov dword [ebp - 0x5c], eax
    mov dword [ebp - 0x60], edx
    cmp dword [0xaaec], 0
    je near loc_57f9c
    movsx eax, cx
    mov edx, eax
    neg edx
    and edx, strict dword 0x7ff
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    imul edx, ebx
    mov dword [ebp - 0x28], edx
    mov edx, 0x600
    sub edx, eax
    mov eax, edx
    and eax, strict dword 0x7ff
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    imul eax, ebx
    mov edx, dword [0x216f6c]
    mov dword [ebp - 0x24], eax
    mov eax, dword [ebp - 0x28]
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [0x216f6c]
    mov dword [ebp - 0x2c], eax
    mov eax, dword [ebp - 0x24]
    imul edx
    shrd eax, edx, 0x10
    mov ebx, dword [0x215c90]
    mov dword [ebp - 0x30], eax
    mov eax, dword [0x215c8c]
    sub eax, ebx
    mov ecx, dword [0x215c88]
    mov dword [ebp - 0x58], eax
    mov eax, dword [0x215c84]
    sub eax, ecx
    xor edi, edi
    mov dword [ebp - 0x54], eax
    mov eax, dword [ebp - 0x58]
    mov dword [ebp - 0x48], edi
    shl eax, 0xb
    mov dword [ebp - 0x4c], edi
    mov dword [ebp - 0x38], eax
    mov eax, dword [ebp - 0x54]
    mov dword [ebp - 0x44], edi
    shl eax, 0xb
    mov dword [ebp - 0x40], edi
    mov dword [ebp - 0x34], eax
    jmp near loc_57da2
loc_57bf7:
    mov eax, dword [ebp - 0x40]
    mov edx, dword [ebp - 0x40]
    mov eax, dword [eax + 0x20a066]
    mov edx, dword [edx + 0x20a068]
    sar eax, 0x10
    sar edx, 0x10
    mov edi, 0xffffffff
    lea ebx, [eax + edx]
    mov dword [ebp - 0x14], edi
    mov dword [ebp - 0x70], ebx
    mov edx, eax
    mov ebx, 0x1be568
    shl edx, 5
    mov dword [ebp - 0x10], eax
    add ebx, edx
    mov edx, dword [ebp - 0x70]
    mov dword [ebp - 0xc], ebx
    cmp eax, edx
    jge near loc_57d92
loc_57c3a:
    mov eax, dword [ebp - 0xc]
    cmp word [eax + 0xa], 0
    jge near loc_57d77
    mov eax, dword [ebp - 0x10]
    sar eax, 3
    mov al, byte [eax + 0x169568]
    mov ecx, dword [ebp - 0x10]
    mov edx, 1
    and ecx, 7
    and eax, strict dword 0xff
    shl edx, cl
    test eax, edx
    je near loc_57d77
    mov eax, dword [ebp - 0xc]
    mov eax, dword [eax + 0xe]
    sar eax, 0x10
    add eax, eax
    cmp word [eax + 0x17cee8], 0
    je near loc_57d77
    cmp word [eax + 0x1816e8], 0
    je near loc_57d77
    mov eax, dword [ebp - 0x10]
    cmp eax, dword [ebp - 0x14]
    jne short loc_57ca8
    mov eax, dword [ebp - 0x18]
    mov dword [ebp - 0x20], esi
    mov dword [ebp - 0x1c], eax
    jmp short loc_57d01
loc_57ca8:
    mov ecx, dword [ebp - 0xc]
    mov eax, dword [ebp - 0xc]
    mov edi, dword [ebp - 0x24]
    mov edx, dword [ebp - 0x28]
    mov eax, dword [eax + 4]
    mov ecx, dword [ecx]
    mov esi, eax
    mov dword [ebp - 0x6c], eax
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
    mov edx, dword [ebp - 0x38]
    mov edi, dword [ebp - 0x30]
    mov esi, ecx
    add edx, eax
    mov eax, dword [ebp - 0x6c]
    mov dword [ebp - 0x1c], edx
    mov edx, dword [ebp - 0x2c]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [ebp - 0x34]
    add edx, eax
    mov dword [ebp - 0x20], edx
loc_57d01:
    mov eax, dword [ebp - 0xc]
    mov eax, dword [eax + 6]
    sar eax, 0x10
    mov dword [ebp - 0x14], eax
    shl eax, 5
    add eax, strict dword 0x1be568
    mov edi, dword [ebp - 0x24]
    mov ecx, dword [eax]
    mov eax, dword [eax + 4]
    mov edx, dword [ebp - 0x28]
    mov esi, eax
    mov dword [ebp - 0x6c], eax
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
    mov edx, dword [ebp - 0x38]
    mov edi, dword [ebp - 0x30]
    mov esi, ecx
    add edx, eax
    mov eax, dword [ebp - 0x6c]
    mov dword [ebp - 0x18], edx
    mov edx, dword [ebp - 0x2c]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov esi, dword [ebp - 0x34]
    push byte 0x4a
    mov ebx, dword [ebp - 0x18]
    mov edx, dword [ebp - 0x20]
    add esi, eax
    mov eax, dword [ebp - 0x1c]
    mov ecx, esi
    call 0x451d7
loc_57d77:
    mov ecx, dword [ebp - 0x10]
    mov edi, dword [ebp - 0xc]
    mov edx, dword [ebp - 0x70]
    inc ecx
    add edi, 0x20
    mov dword [ebp - 0x10], ecx
    mov dword [ebp - 0xc], edi
    cmp ecx, edx
    jl near loc_57c3a
loc_57d92:
    mov ebx, dword [ebp - 0x40]
    mov ecx, dword [ebp - 0x44]
    add ebx, 0x28
    inc ecx
    mov dword [ebp - 0x40], ebx
    mov dword [ebp - 0x44], ecx
loc_57da2:
    mov eax, dword [0x217fcc]
    mov ecx, dword [ebp - 0x44]
    sar eax, 0x10
    cmp eax, ecx
    jg near loc_57bf7
    mov eax, dword [ebp - 0x54]
    shl eax, 0xf
    mov dword [ebp - 0x50], eax
    mov eax, dword [ebp - 0x58]
    xor esi, esi
    shl eax, 0xf
    mov dword [ebp - 0x3c], esi
    mov dword [ebp - 0x74], eax
loc_57dcc:
    mov eax, dword [ebp - 0x3c]
    xor ecx, ecx
    mov ax, word [eax + 0x191376]
    xor esi, esi
    cmp ax, strict word 0x1351
    jb short loc_57df2
    jbe short loc_57e01
    cmp ax, strict word 0x1603
    jb short loc_57e19
    jbe short loc_57dfa
    cmp ax, strict word 0x1a02
    je short loc_57e0f
    jmp short loc_57e19
loc_57df2:
    cmp ax, strict word 0x10a4
    je short loc_57e08
    jmp short loc_57e19
loc_57dfa:
    mov ecx, 0x1621
    jmp short loc_57e14
loc_57e01:
    mov ecx, 0x1366
    jmp short loc_57e14
loc_57e08:
    mov ecx, 0x10d7
    jmp short loc_57e14
loc_57e0f:
    mov ecx, 0x1a79
loc_57e14:
    mov esi, 1
loc_57e19:
    test esi, esi
    je near loc_57ec5
    mov eax, dword [ebp - 0x3c]
    mov edi, dword [ebp - 0x48]
    mov eax, dword [eax + 0x191368]
    sub eax, edi
    mov dword [ebp - 0x68], eax
    mov eax, dword [ebp - 0x3c]
    mov edx, dword [ebp - 0x4c]
    mov eax, dword [eax + 0x19136c]
    mov edi, dword [ebp - 0x24]
    sub eax, edx
    mov edx, dword [ebp - 0x28]
    mov dword [ebp - 0x6c], eax
    mov esi, eax
    mov eax, dword [ebp - 0x68]
    neg esi
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [ebp - 0x30]
    mov esi, dword [ebp - 0x68]
    mov edx, dword [ebp - 0x2c]
    mov dword [ebp - 0x64], eax
    mov eax, dword [ebp - 0x6c]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov ebx, dword [0x215c84]
    push ebx
    mov esi, dword [0x215c8c]
    push esi
    mov edi, dword [0x215c88]
    push edi
    mov edx, dword [0x215c90]
    push edx
    shl eax, 4
    push byte 0
    mov ebx, dword [ebp - 0x74]
    mov edx, dword [ebp - 0x50]
    push byte 0
    add edx, eax
    mov eax, dword [ebp - 0x64]
    push byte 0
    shl eax, 4
    push ecx
    add eax, ebx
    xor ecx, ecx
    mov ebx, 0x2000
    call ROTATE_SPRITE
loc_57ec5:
    mov ebx, dword [ebp - 0x3c]
    add ebx, 0x2c
    mov dword [ebp - 0x3c], ebx
    cmp ebx, strict dword 0x2c000
    jne near loc_57dcc
    mov eax, dword [ebp - 0x5c]
    sub eax, dword [ebp - 0x48]
    mov edi, dword [ebp - 0x4c]
    mov dword [ebp - 0x68], eax
    mov eax, dword [ebp - 0x60]
    mov edx, dword [ebp - 0x28]
    sub eax, edi
    mov edi, dword [ebp - 0x24]
    mov dword [ebp - 0x6c], eax
    mov esi, eax
    mov eax, dword [ebp - 0x68]
    neg esi
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [ebp - 0x30]
    mov esi, dword [ebp - 0x68]
    mov edx, dword [ebp - 0x2c]
    mov dword [ebp - 0x64], eax
    mov eax, dword [ebp - 0x6c]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [0x215c84]
    push edx
    mov edx, dword [0xbf560]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov ebx, dword [0x215c8c]
    push ebx
    mov ecx, dword [0x215c88]
    push ecx
    mov esi, dword [0x215c90]
    push esi
    push byte 0
    shl eax, 4
    mov ebx, dword [ebp - 0x64]
    push byte 0
    shl ebx, 4
    push byte 0
    mov ecx, dword [edx + 0x8c0a2]
    mov edx, dword [ebp - 0x54]
    push dword 0x1b94
    shl edx, 0xf
    sar ecx, 0x10
    add edx, eax
    mov eax, dword [ebp - 0x58]
    add ecx, strict dword 0x200
    shl eax, 0xf
    and ecx, strict dword 0x7ff
    add eax, ebx
    mov ebx, 0x10000
    call ROTATE_SPRITE
loc_57f9c:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
    times 13 db 0    ; Alignment
    push ebp
    mov ebp, esp
    push ebx
    push edx
    call 0x50fe0
    mov edx, eax
    mov ebx, 0xe0
    sar edx, 0x1f
    idiv ebx
    mov eax, edx
    add eax, strict dword 0x40
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edx, dword [0xaafc]
    cmp edx, 2
    je near loc_580bd
    cmp edx, 1
    jne short loc_5801b
    mov eax, dword [0x216f7c]
    sub eax, dword [0xab04]
    cmp eax, strict dword 0xf0
    jl near loc_580bd
    mov edi, 2
    call 0x53e18
    mov dword [0xaafc], edi
    jmp near loc_580bd
loc_5801b:
    mov eax, dword [0x216f7c]
    sub eax, dword [0xaaf8]
    cmp eax, 0x78
    jb near loc_580bd
    mov esi, dword [0xaaf4]
    test esi, esi
    jbe short loc_58044
    lea ecx, [esi - 1]
    mov dword [0xaaf4], ecx
    jmp short loc_580a9
loc_58044:
    mov edi, dword [0xaaf0]
    test edi, edi
    jbe short loc_58064
    mov edx, 0x3b
    lea ebx, [edi - 1]
    mov dword [0xaaf4], edx
    mov dword [0xaaf0], ebx
    jmp short loc_580a9
loc_58064:
    mov dword [0xaafc], 1
    mov eax, dword [0xcf65c]
    mov edx, 0x4e54
    sar eax, 0x10
    call 0x51408
    mov eax, dword [0x216f7c]
    mov edx, dword [0xcf65c]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov dword [0xab04], eax
    mov eax, 0x91
    add edx, strict dword 0x8be10
    call 0x14e68
loc_580a9:
    mov eax, dword [0x216f7c]
    mov dword [0xaaf8], eax
    mov eax, 0x20
    call 0x59304
loc_580bd:
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
    push esi
    push edi
    mov ebx, 0xa
    mov eax, dword [0xaaf0]
    xor edx, edx
    div ebx
    mov eax, dword [0xaaf0]
    mov esi, edx
    xor edx, edx
    div ebx
    mov edx, dword [0x216f84]
    push edx
    mov ebx, dword [0x216f88]
    push ebx
    push byte 0
    push byte 0
    push dword 0x8a
    push byte 0
    xor ecx, ecx
    push byte 0
    add eax, strict dword 0x679
    mov edx, 0xb80000
    push eax
    mov ebx, 0x4400
    mov eax, 0x1240000
    call ROTATE_SPRITE
    mov ecx, dword [0x216f84]
    push ecx
    mov edi, dword [0x216f88]
    push edi
    push byte 0
    push byte 0
    push dword 0x8a
    push byte 0
    add esi, strict dword 0x679
    push byte 0
    mov ebx, 0x4400
    mov edx, 0xb80000
    push esi
    mov eax, 0x1280000
    xor ecx, ecx
    call ROTATE_SPRITE
    mov ebx, 0xa
    mov eax, dword [0xaaf4]
    xor edx, edx
    div ebx
    mov eax, dword [0xaaf4]
    mov esi, edx
    xor edx, edx
    div ebx
    mov edx, dword [0x216f84]
    push edx
    mov ebx, dword [0x216f88]
    push ebx
    push byte 0
    push byte 0
    push dword 0x8a
    push byte 0
    xor ecx, ecx
    push byte 0
    add eax, strict dword 0x679
    mov edx, 0xb80000
    push eax
    mov ebx, 0x4400
    mov eax, 0x12e0000
    call ROTATE_SPRITE
    mov ecx, dword [0x216f84]
    push ecx
    mov edi, dword [0x216f88]
    push edi
    push byte 0
    push byte 0
    push dword 0x8a
    push byte 0
    add esi, strict dword 0x679
    push byte 0
    mov ebx, 0x4400
    mov edx, 0xb80000
    push esi
    mov eax, 0x1320000
    xor ecx, ecx
    call ROTATE_SPRITE
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
    sub esp, 0x18
    xor edx, edx
    mov edi, dword [0x2175da]
    mov dword [ebp - 0x2c], edx
    mov dword [ebp - 0x28], edx
    mov dword [ebp - 0x24], edx
    xor edx, edx
    sar edi, 0x10
    mov word [ebp - 0x18], dx
    test edi, edi
    jl near loc_5834c
loc_58219:
    mov eax, dword [nosplit edi*2 + 0x18cf66]
    sar eax, 0x10
    mov dword [ebp - 0x1c], eax
    movsx eax, di
    imul esi, edi, 0x2c
    mov edx, 0x4e70
    mov dword [ebp - 0x20], eax
    call 0x513b8
    mov eax, dword [0xaafc]
    add esi, strict dword 0x191368
    test eax, eax
    je short loc_5824c
    xor eax, eax
    jmp short loc_5828b
loc_5824c:
    mov eax, dword [esi]
    mov dword [ebp - 0x2c], eax
    mov eax, dword [esi + 4]
    mov dword [ebp - 0x28], eax
    mov eax, dword [esi + 8]
    mov dword [ebp - 0x24], eax
    mov ax, word [esi + 0x18]
    mov edx, dword [0x1be166]
    mov word [ebp - 0x18], ax
    mov eax, dword [esi + 0x1e]
    sar edx, 0x10
    sar eax, 0x10
    imul edx, eax
    push dword 0x1000040
    xor ecx, ecx
    xor ebx, ebx
    mov eax, dword [ebp - 0x20]
    sar edx, 0xe
    call 0x24024
loc_5828b:
    test ax, ax
    jne short loc_5829d
    mov ebx, dword [ebp - 0x18]
    cmp bx, word [esi + 0x18]
    je near loc_58341
loc_5829d:
    mov eax, dword [ebp - 0x2c]
    mov dword [esi], eax
    mov eax, dword [ebp - 0x28]
    mov edx, dword [ebp - 0x1a]
    mov dword [esi + 4], eax
    mov eax, dword [ebp - 0x24]
    sar edx, 0x10
    mov dword [esi + 8], eax
    mov eax, edi
    call CHANGE_SPRITE_SECT
    neg word [esi + 0x22]
    call 0x50fe0
    mov edx, eax
    mov ebx, 0xe0
    sar edx, 0x1f
    idiv ebx
    mov ebx, edx
    add ebx, 0x40
    mov word [esi + 0x20], bx
    mov eax, dword [esi + 0x20]
    sar eax, 0x10
    cmp eax, -1
    jne short loc_582ec
    mov eax, ebx
    neg eax
    mov word [esi + 0x20], ax
loc_582ec:
    xor byte [esi + 0xc], 4
    movsx eax, di
    call 0x584a4
    cmp word [esi + 0x2a], 0
    je short loc_58341
    mov dl, byte [esi + 0xd]
    or dl, 1
    mov byte [esi + 0xd], dl
    mov dh, dl
    mov word [esi + 0x2a], 0
    and dh, 0x7f
    mov byte [esi + 0xd], dh
    call 0x50fe0
    mov edx, eax
    mov ebx, 0xe0
    sar edx, 0x1f
    idiv ebx
    mov ebx, edx
    add ebx, 0x40
    mov word [esi + 0x20], bx
    mov eax, dword [esi + 0x20]
    sar eax, 0x10
    cmp eax, -1
    jne short loc_58341
    neg ebx
    mov word [esi + 0x20], bx
loc_58341:
    mov edi, dword [ebp - 0x1c]
    test edi, edi
    jge near loc_58219
loc_5834c:
    cmp dword [0xbffeb], 3
    jle short loc_5835a
    call 0x57fd4
loc_5835a:
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
    xor edx, edx
    mov dword [0xaaf0], eax
    mov dword [0xaaf8], edx
    mov dword [0xaaf4], edx
    mov dword [0xaafc], edx
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
    xor edx, edx
    mov eax, dword [0xbffeb]
    mov dword [0xaaf8], edx
    mov dword [0xaaf4], edx
    mov dword [0xaaf0], edx
    mov dword [0xaafc], edx
    mov dword [0xab00], edx
    cmp eax, 4
    jl near loc_5849a
    xor ecx, ecx
    xor ebx, ebx
    mov esi, 1
    mov edi, 0x101
loc_583cc:
    mov ax, word [ebx + 0x191376]
    xor edx, edx
    cmp ax, strict word 0x1bc6
    jb short loc_583eb
    jbe short loc_583f3
    cmp ax, strict word 0x1bc7
    jbe short loc_58407
    cmp ax, strict word 0x1bc8
    je short loc_5841b
    jmp short loc_58436
loc_583eb:
    cmp ax, strict word 0x434
    je short loc_5842f
    jmp short loc_58436
loc_583f3:
    mov ah, 0x12
    mov dl, 0x18
    mov byte [ebx + 0x19137c], ah
    mov byte [ebx + 0x19137d], dl
    mov edx, esi
    jmp short loc_58436
loc_58407:
    mov dh, 0xd
    mov al, 0xe
    mov byte [ebx + 0x19137c], dh
    mov byte [ebx + 0x19137d], al
    mov edx, esi
    jmp short loc_58436
loc_5841b:
    mov ah, 0x16
    mov dl, 0x10
    mov byte [ebx + 0x19137c], ah
    mov byte [ebx + 0x19137d], dl
    mov edx, esi
    jmp short loc_58436
loc_5842f:
    mov word [ebx + 0x191374], di
loc_58436:
    test edx, edx
    je short loc_5846b
    mov edx, 0x328
    mov eax, ecx
    call 0x41158
    mov word [ebx + 0x191374], 0x111
    call 0x57fb0
    mov word [ebx + 0x191388], ax
    xor edx, edx
    mov word [ebx + 0x19138a], si
    mov word [ebx + 0x191392], dx
loc_5846b:
    inc ecx
    add ebx, 0x2c
    cmp ecx, strict dword 0x1000
    jl near loc_583cc
    xor edx, edx
    mov ecx, 3
    mov dword [0xaaf8], edx
    mov dword [0xaaf4], edx
    mov dword [0xaaf0], ecx
    mov dword [0xaafc], edx
loc_5849a:
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
    push ebx
    push ecx
    push edx
    movsx ebx, ax
    mov edx, 0x4e84
    mov eax, ebx
    call 0x513b8
    call 0x50fe0
    mov edx, eax
    mov ecx, 5
    sar edx, 0x1f
    idiv ecx
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    shl eax, 2
    cmp edx, 1
    jb short loc_584e9
    jbe short loc_58506
    cmp edx, 2
    je short loc_5851f
    jmp short loc_58536
loc_584e9:
    test edx, edx
    jne short loc_58536
    mov word [eax + 0x191376], 0x1bc6
    mov byte [eax + 0x19137c], 0x12
    mov byte [eax + 0x19137d], 0x18
    jmp short loc_58536
loc_58506:
    mov word [eax + 0x191376], 0x1bc7
    mov byte [eax + 0x19137c], 0xd
    mov byte [eax + 0x19137d], 0xe
    jmp short loc_58536
loc_5851f:
    mov word [eax + 0x191376], 0x1bc8
    mov byte [eax + 0x19137c], 0x16
    mov byte [eax + 0x19137d], 0x10
loc_58536:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

target_hit_dispatch:
    dd loc_5869c - 0x10000
    dd loc_5869f - 0x10000
    dd loc_586a4 - 0x10000
    dd loc_586a9 - 0x10000
    dd loc_586ae - 0x10000
    dd loc_586de - 0x10000
    dd loc_586e1 - 0x10000
    dd loc_586f0 - 0x10000
    dd loc_586e6 - 0x10000
    dd loc_586ed - 0x10000

hit_target:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov esi, eax
    movsx ebx, ax
    mov edx, 0x4e9c
    mov eax, ebx
    call 0x513b8
    mov eax, dword [0xcf65c]
    mov edx, 0x4eac
    sar eax, 0x10
    call 0x51408
    cmp dword [0xaafc], 0
    jne near loc_58781
    lea ecx, [ebx*4]
    sub ecx, ebx
    shl ecx, 2
    sub ecx, ebx
    shl ecx, 2
    mov dx, word [ecx + 0x191376]
    cmp dx, 0x434
    jne short loc_585d6
    mov ecx, dword [0xab00]
    inc ecx
    mov eax, 1
    mov dword [0xab00], ecx
    jmp near loc_58772
loc_585d6:
    cmp word [ecx + 0x191382], 0x328
    jne near loc_58781
    mov ecx, edx
    cmp dx, 0x1bc7
    jb short loc_585fc
    jbe short loc_58607
    cmp dx, 0x1bc8
    je short loc_5860e
    jmp near loc_58781
loc_585fc:
    cmp dx, 0x1bc6
    jne near loc_58781
loc_58607:
    mov ecx, 1
    jmp short loc_58613
loc_5860e:
    mov ecx, 4
loc_58613:
    movsx edx, si
    lea edi, [edx*4]
    sub edi, edx
    shl edi, 2
    sub edi, edx
    shl edi, 2
    xor ebx, ebx
    mov eax, dword [edi + 0x191374]
    xor edx, edx
    sar eax, 0x10
    call 0x58c00
    mov ax, word [edi + 0x191388]
    cwde
    test eax, eax
    jns short loc_58647
    neg eax
loc_58647:
    mov edx, eax
    sar edx, 0x1f
    shl edx, 5
    db 0x1b, 0xc2    ; Watcom encoding of sbb eax, edx
    sar eax, 5
    add ecx, eax
    mov eax, dword [edi + 0x19137e]
    mov edx, 0x4ebc
    sar eax, 0x10
    call 0x514c0
    mov edx, dword [edi + 0x19137e]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [nosplit eax*8 + 0x20a08c]
    db 0x81, 0xe8
    dd 0x7d4    ; Watcom encoding of sub eax, 0x7d4
    cmp ax, strict word 4
    ja short loc_586b3
    and eax, strict dword 0xffff
    jmp dword [cs:nosplit eax*4 + target_hit_dispatch - 0x10000]
loc_5869c:
    inc ecx
    jmp short loc_586bd
loc_5869f:
    add ecx, 2
    jmp short loc_586bd
loc_586a4:
    add ecx, 4
    jmp short loc_586bd
loc_586a9:
    add ecx, 8
    jmp short loc_586bd
loc_586ae:
    add ecx, 0x10
    jmp short loc_586bd
loc_586b3:
    mov eax, 0x4ecc
    call PRINT_NOTICE
loc_586bd:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c42f]
    cmp eax, 4
    ja short loc_586f0
    jmp dword [cs:nosplit eax*4 + 0x48554]
loc_586de:
    inc ecx
    jmp short loc_586f0
loc_586e1:
    add ecx, 2
    jmp short loc_586f0
loc_586e6:
    mov ecx, 2
    jmp short loc_586f0
loc_586ed:
    add ecx, 3
loc_586f0:
    movsx edi, si
    lea ebx, [edi*4]
    sub ebx, edi
    shl ebx, 2
    sub ebx, edi
    shl ebx, 2
    mov ah, byte [ebx + 0x191375]
    or ah, 0x80
    mov dl, ah
    mov byte [ebx + 0x191375], ah
    and dl, 0xfe
    mov byte [ebx + 0x191375], dl
    mov edx, dword [0xcf65c]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov edx, dword [edx + 0x8c106]
    mov eax, 0x57
    sar edx, 0x10
    call 0x51c68
    mov eax, edi
    mov esi, 1
    call 0x584a4
    mov word [ebx + 0x191392], si
    cmp ecx, 0x12
    jbe short loc_58762
    mov eax, 0x200
    call 0x5a250
loc_58762:
    mov ebx, dword [0xab00]
    add ebx, ecx
    mov eax, ecx
    mov dword [0xab00], ebx
loc_58772:
    call 0x58a30
    mov eax, dword [0xab00]
    call 0x53848
loc_58781:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 5 db 0    ; Alignment

move_arrows:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x18
    mov esi, dword [0x2175dc]
    sar esi, 0x10
    test esi, esi
    jl near loc_588c5
loc_587ac:
    mov eax, dword [nosplit esi*2 + 0x18cf66]
    sar eax, 0x10
    mov dword [ebp - 0x2c], eax
    movsx eax, si
    imul edi, esi, 0x2c
    mov edx, 0x4ef4
    add edi, strict dword 0x191368
    mov dword [ebp - 0x1c], eax
    call 0x513b8
    mov dx, word [edi + 0x18]
    test dx, dx
    jl near loc_588b3
    cmp dx, word [0x217fce]
    jge near loc_588b3
    mov eax, dword [ebp - 0x1c]
    call 0x1a0b8
    push dword 0x1000040
    mov eax, dword [edi]
    mov ecx, dword [edi + 0x22]
    mov ebx, dword [edi + 0x20]
    mov edx, dword [edi + 0x1e]
    mov dword [ebp - 0x24], eax
    mov eax, dword [edi + 4]
    sar ecx, 0x10
    mov dword [ebp - 0x28], eax
    mov eax, dword [edi + 8]
    sar ebx, 0x10
    mov dword [ebp - 0x20], eax
    mov ax, word [edi + 0x18]
    sar edx, 0x10
    mov word [ebp - 0x18], ax
    mov eax, dword [ebp - 0x1c]
    call 0x24024
    mov ebx, eax
    test ax, ax
    je near loc_588ba
    mov eax, dword [ebp - 0x24]
    mov dword [edi], eax
    mov eax, dword [ebp - 0x28]
    mov edx, dword [ebp - 0x1a]
    mov dword [edi + 4], eax
    mov eax, dword [ebp - 0x20]
    sar edx, 0x10
    mov dword [edi + 8], eax
    mov eax, esi
    call CHANGE_SPRITE_SECT
    movsx eax, bx
    and eax, strict dword 0xc000
    cmp eax, strict dword 0xc000
    jne short loc_5888d
    mov eax, 0x3b
    mov edx, esi
    and bh, 0xf
    call 0x51c68
    call 0x56ad8
    movsx ebx, bx
    mov edx, eax
    mov eax, ebx
    call 0x53854
    mov eax, ebx
    call 0x58568
    jmp short loc_588b3
loc_5888d:
    cmp eax, strict dword 0x8000
    jne short loc_588a9
    cmp dword [0xbffeb], 3
    jle short loc_588a9
    mov eax, 0x3b
    mov edx, esi
    call 0x51c68
loc_588a9:
    mov eax, 4
    call 0x5a250
loc_588b3:
    mov eax, esi
    call 0x40ecd
loc_588ba:
    mov esi, dword [ebp - 0x2c]
    test esi, esi
    jge near loc_587ac
loc_588c5:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

spawn_arrow:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    movsx ebx, ax
    mov eax, ebx
    imul ebx, ebx, strict dword 0x623
    mov edx, 0x4f04
    call 0x51408
    add ebx, strict dword 0x8be10
    mov edx, 0x4f1c
    mov eax, ebx
    call 0x5144c
    mov eax, dword [ebx + 0x298]
    mov edx, 0x329
    sar eax, 0x10
    call INSERT_SPRITE
    test ax, ax
    jl short loc_5891c
    cmp ax, strict word 0x1000
    jl short loc_5892b
loc_5891c:
    mov eax, 0x4f34
    call PRINT_NOTICE
    jmp near loc_58a26
loc_5892b:
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    shl eax, 2
    add eax, strict dword 0x191368
    jne short loc_58959
    mov eax, 0x4f5c
    call PRINT_NOTICE
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_58959:
    mov edx, dword [ebx + 0x214]
    mov dword [eax], edx
    mov edx, dword [ebx + 0x218]
    mov dword [eax + 4], edx
    mov edx, dword [ebx + 0x21c]
    mov dword [eax + 8], edx
    mov dx, word [ebx + 0x294]
    add edx, 3
    and dh, 7
    mov word [eax + 0x1c], dx
    mov edx, dword [eax + 0x1a]
    sar edx, 0x10
    add edx, strict dword 0x200
    and edx, strict dword 0x7ff
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    sar edx, 2
    mov word [eax + 0x20], dx
    mov dx, word [eax + 0x1c]
    and dh, 7
    movsx edx, dx
    mov edx, dword [nosplit edx*2 + 0x1bd566]
    sar edx, 0x10
    sar edx, 2
    mov word [eax + 0x22], dx
    mov cx, word [ebx + 0x220]
    mov word [eax + 0xe], 0xd7a
    mov word [eax + 0xc], 1
    mov word [eax + 0x1e], 0
    mov byte [eax + 0x12], 4
    mov byte [eax + 0x14], 0xe
    mov byte [eax + 0x15], 0xe
    mov byte [eax + 0x10], 0
    mov byte [eax + 0x16], 0
    mov byte [eax + 0x17], 0
    mov word [eax + 0x26], 0
    mov word [eax + 0x28], 0
    mov edx, 0x64
    mov word [eax + 0x2a], 0
    sub edx, ecx
    mov byte [eax + 0x11], 0
    inc edx
    mov si, word [eax + 0xc]
    shl edx, 9
    or esi, strict dword 0x8001
    mov word [eax + 0x24], dx
    mov word [eax + 0xc], si
loc_58a26:
    lea esp, [ebp - 0x10]
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 1 db 0    ; Alignment

add_range_score:
    push ebp
    mov ebp, esp
    push edx
    mov edx, dword [0xab0c]
    add edx, eax
    cmp edx, strict dword 0x1869f
    jbe short loc_58a46
    xor edx, edx
loc_58a46:
    mov dword [0xab08], 0x80
    mov dword [0xab0c], edx
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
    sub esp, 0xc
    mov ebx, eax
    mov ecx, 0xa
    xor edx, edx
    div ecx
    mov esi, 0x64
    mov ecx, edx
    mov eax, ebx
    xor edx, edx
    div esi
    mov esi, 0xa
    mov eax, edx
    xor edx, edx
    div esi
    mov esi, 0x3e8
    mov dword [ebp - 0x20], eax
    xor edx, edx
    mov eax, ebx
    div esi
    mov esi, 0x64
    mov eax, edx
    xor edx, edx
    div esi
    mov edi, 0x2710
    mov esi, eax
    xor edx, edx
    mov eax, ebx
    div edi
    mov edi, 0x3e8
    mov eax, edx
    xor edx, edx
    div edi
    mov edx, 0x186a0
    mov edi, eax
    mov dword [ebp - 0x18], edx
    mov eax, ebx
    mov ebx, dword [ebp - 0x18]
    xor edx, edx
    div ebx
    mov ebx, 0x2710
    mov eax, edx
    xor edx, edx
    div ebx
    mov dword [ebp - 0x1c], eax
    mov eax, dword [0x216f84]
    push eax
    mov edx, dword [0x216f88]
    push edx
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    add ecx, strict dword 0x679
    push byte 0
    mov ebx, 0x5800
    mov eax, 0xf30000
    push ecx
    mov edx, 0xb90000
    xor ecx, ecx
    call ROTATE_SPRITE
    mov ebx, dword [0x216f84]
    push ebx
    mov ecx, dword [0x216f88]
    push ecx
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    mov eax, dword [ebp - 0x20]
    mov edx, 0xb90000
    push byte 0
    add eax, strict dword 0x679
    mov ebx, 0x5800
    push eax
    xor ecx, ecx
    mov eax, 0xeb0000
    call ROTATE_SPRITE
    mov eax, dword [0x216f84]
    push eax
    mov edx, dword [0x216f88]
    push edx
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    add esi, strict dword 0x679
    push byte 0
    mov ebx, 0x5800
    xor ecx, ecx
    push esi
    mov eax, 0xe30000
    mov edx, 0xb90000
    call ROTATE_SPRITE
    mov ebx, dword [0x216f84]
    push ebx
    mov ecx, dword [0x216f88]
    push ecx
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    add edi, strict dword 0x679
    push byte 0
    mov edx, 0xb90000
    mov eax, 0xdb0000
    push edi
    mov ebx, 0x5800
    xor ecx, ecx
    call ROTATE_SPRITE
    mov esi, dword [0x216f84]
    push esi
    mov edi, dword [0x216f88]
    push edi
    push byte 0
    push byte 0
    push dword 0xca
    push byte 0
    mov eax, dword [ebp - 0x1c]
    mov ebx, 0x5800
    push byte 0
    add eax, strict dword 0x679
    mov edx, 0xb90000
    push eax
    xor ecx, ecx
    mov eax, 0xd30000
    call ROTATE_SPRITE
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
