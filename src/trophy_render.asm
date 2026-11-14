bits 32
org 0x53600

%define PRINT_NOTICE 0x5130c
%define LOG_NUMBER 0x51350
%define ROTATE_SPRITE 0x47f83
%define MENU_TEXT 0x25e2c
%define DRAW_TEXT 0x118f0

save_best_scores:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push dword 0x180
    push dword 0x222
    push dword 0x4388
    call 0x61340
    add esp, 0xc
    mov ecx, eax
    cmp eax, -1
    jne short loc_53633
    mov eax, 0x4390
    call PRINT_NOTICE
    jmp near loc_536cc
loc_53633:
    xor ebx, ebx
    xor edx, edx
    call 0x616b2
    mov eax, dword [0xa36c]
    cmp eax, dword [0xa310]
    jbe short loc_5364e
    mov dword [0xa310], eax
loc_5364e:
    mov eax, dword [0xa370]
    cmp eax, dword [0xa314]
    jbe short loc_53660
    mov dword [0xa314], eax
loc_53660:
    mov eax, dword [0xa374]
    cmp eax, dword [0xa318]
    jbe short loc_53672
    mov dword [0xa318], eax
loc_53672:
    mov eax, dword [0xa378]
    cmp eax, dword [0xa31c]
    jbe short loc_53684
    mov dword [0xa31c], eax
loc_53684:
    mov eax, ecx
    xor ebx, ebx
    xor edx, edx
    call 0x616b2
    mov ebx, 0x5b
    mov edx, 0xa310
    mov eax, ecx
    call 0x61c43
    cmp eax, 0x5b
    je short loc_536be
    mov eax, 0x43bc
    call PRINT_NOTICE
    mov eax, ecx
    call 0x616ad
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_536be:
    mov eax, ecx
    call 0x616ad
    xor eax, eax
    mov dword [0xa380], eax
loc_536cc:
    lea esp, [ebp - 0xc]
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
    push dword 0x202
    push dword 0x4388
    call 0x61340
    mov ecx, eax
    add esp, 8
    cmp eax, -1
    jne short loc_536ff
    mov eax, 0x43e8
    call PRINT_NOTICE
    jmp short loc_5372f
loc_536ff:
    xor ebx, ebx
    xor edx, edx
    call 0x616b2
    mov ebx, 0x5b
    mov edx, 0xa310
    mov eax, ecx
    call 0x615b2
    cmp eax, -1
    jne short loc_53728
    mov eax, 0x4414
    call PRINT_NOTICE
loc_53728:
    mov eax, ecx
    call 0x616ad
loc_5372f:
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
    push edx
    mov ebx, eax
    movsx ecx, ax
    mov edx, 0x443c
    mov eax, ecx
    call 0x513b8
    lea eax, [ecx*4]
    sub eax, ecx
    shl eax, 2
    sub eax, ecx
    shl eax, 2
    mov edx, 0x4450
    add eax, strict dword 0x191368
    call 0x513e4
    mov edx, dword [0xa300]
    test edx, edx
    jbe short loc_5379c
    mov ecx, edx
    shl edx, 2
    add edx, ecx
    xor eax, eax
    shl edx, 2
loc_53785:
    cmp bx, word [eax + 0x2180e0]
    jne short loc_53795
    mov edx, 1
    jmp short loc_5379e
loc_53795:
    add eax, 0x14
    cmp eax, edx
    jl short loc_53785
loc_5379c:
    xor edx, edx
loc_5379e:
    mov eax, edx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, eax
    call 0x50fe0
    and eax, strict dword 0xff
    cmp ebx, strict dword 0x1351
    jb short loc_537d6
    jbe short loc_537e0
    cmp ebx, strict dword 0x1603
    jb short loc_53812
    jbe short loc_53806
    cmp ebx, strict dword 0x1a02
    je short loc_537ff
    jmp short loc_53812
loc_537d6:
    cmp ebx, strict dword 0x10a4
    je short loc_537ff
    jmp short loc_53812
loc_537e0:
    test edx, edx
    jne short loc_537e9
    cmp eax, 0x40
    jg short loc_53812
loc_537e9:
    cmp edx, 6
    jne short loc_537f3
    cmp eax, 0x50
    jg short loc_53812
loc_537f3:
    cmp edx, 2
    jne short loc_537ff
    cmp eax, strict dword 0x80
    jg short loc_53812
loc_537ff:
    mov eax, 1
    jmp short loc_53814
loc_53806:
    cmp edx, 6
    jne short loc_537ff
    cmp eax, strict dword 0x80
    jle short loc_537ff
loc_53812:
    xor eax, eax
loc_53814:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push ebx
    imul edx, eax
    mov ebx, 0x64
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov ebx, eax
    call 0x50fe0
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov eax, edx
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov dword [0xa37c], eax
    mov esp, ebp
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
    mov dword [ebp - 0x18], edx
    movsx ebx, ax
    mov edx, 0x4464
    mov eax, ebx
    call 0x513b8
    mov eax, ebx
    shl ebx, 2
    sub ebx, eax
    shl ebx, 2
    sub ebx, eax
    mov eax, 0x191368
    shl ebx, 2
    mov edx, 0x4478
    add eax, ebx
    call 0x513e4
    mov edx, dword [0xbffeb]
    xor edi, edi
    cmp edx, 3
    jg near loc_53bc6
    mov eax, dword [ebx + 0x191372]
    sar eax, 0x10
    test ah, 0x80
    jne near loc_53bc6
    mov bx, word [ebx + 0x191376]
    cmp bx, 0x1351
    jb short loc_538d5
    jbe short loc_538e6
    cmp bx, 0x1603
    jb short loc_538dc
    jbe short loc_538e6
    cmp bx, 0x1a02
    jmp short loc_538da
loc_538d5:
    cmp bx, 0x10a4
loc_538da:
    je short loc_538e6
loc_538dc:
    mov eax, 4
    jmp near loc_53bc1
loc_538e6:
    movsx ebx, cx
    mov eax, ebx
    call 0x53738
    test eax, eax
    jne near loc_53bc6
    lea esi, [ebx*4]
    sub esi, ebx
    shl esi, 2
    sub esi, ebx
    shl esi, 2
    mov eax, dword [esi + 0x191374]
    mov edx, dword [ebp - 0x18]
    sar eax, 0x10
    call 0x537a8
    test eax, eax
    je near loc_53bc6
    mov ebx, dword [0xa300]
    cmp ebx, 0x14
    jae near loc_53bbc
    mov eax, ebx
    shl ebx, 2
    add ebx, eax
    shl ebx, 2
    mov ax, word [esi + 0x191376]
    mov word [ebx + 0x2180e0], cx
    mov word [ebx + 0x2180e2], ax
    xor ecx, ecx
    xor eax, eax
    mov cl, byte [esi + 0x19137c]
    mov al, byte [esi + 0x19137d]
    imul ecx, eax
    mov eax, 0x28
    mov edx, ecx
    mov dword [ebp - 0x14], eax
    sar edx, 0x1f
    mov eax, ecx
    idiv dword [ebp - 0x14]
    mov si, word [esi + 0x191376]
    cmp si, 0x1351
    jb short loc_539a6
    jbe near loc_53a10
    cmp si, 0x1603
    jb near loc_53b90
    jbe short loc_539b6
    cmp si, 0x1a02
    je near loc_53b2d
    jmp near loc_53b90
loc_539a6:
    cmp si, 0x10a4
    je near loc_53aca
    jmp near loc_53b90
loc_539b6:
    sub eax, 2
    mov dword [ebx + 0x2180e4], eax
    cmp eax, 2
    jge short loc_539ce
    mov dword [ebx + 0x2180e4], 2
loc_539ce:
    mov eax, dword [0xa300]
    lea ebx, [eax*4]
    add ebx, eax
    shl ebx, 2
    mov ecx, dword [ebx + 0x2180e4]
    add ecx, 2
    mov esi, dword [0xa36c]
    mov dword [ebx + 0x2180e4], ecx
    cmp ecx, esi
    jbe short loc_539fe
    mov dword [0xa36c], ecx
loc_539fe:
    mov edi, dword [0xa308]
    inc edi
    mov dword [0xa308], edi
    jmp near loc_53b90
loc_53a10:
    mov dword [ebx + 0x2180e4], ecx
    lea eax, [ecx + 0x7d]
    mov edx, 0x7d
    mov dword [ebx + 0x2180e4], eax
    mov eax, 0x1e
    call 0x5381c
    mov edx, dword [ebx + 0x2180e4]
    add edx, eax
    mov eax, dword [0xa300]
    mov dword [ebx + 0x2180e4], edx
    lea ebx, [eax*4]
    mov edx, 0x64
    add ebx, eax
    mov eax, 0xa
    call 0x5381c
    mov ecx, dword [nosplit ebx*4 + 0x2180e4]
    add ecx, eax
    mov eax, dword [0xa300]
    mov dword [nosplit ebx*4 + 0x2180e4], ecx
    lea ebx, [eax*4]
    add ebx, eax
    shl ebx, 2
    cmp dword [ebx + 0x2180e4], strict dword 0x15e
    jle short loc_53a90
    mov dword [ebx + 0x2180e4], 0x15c
loc_53a90:
    mov eax, dword [0xa300]
    lea ebx, [eax*4]
    add ebx, eax
    shl ebx, 2
    mov edx, dword [0xa370]
    mov eax, dword [ebx + 0x2180e4]
    cmp eax, edx
    jbe short loc_53ab6
    mov dword [0xa370], eax
loc_53ab6:
    mov ebx, dword [0xa30c]
    inc ebx
    mov dword [0xa30c], ebx
    mov edi, ebx
    jmp near loc_53b90
loc_53aca:
    mov edx, 0x7d
    mov dword [ebx + 0x2180e4], eax
    mov eax, 4
    call 0x5381c
    mov ecx, dword [ebx + 0x2180e4]
    add ecx, eax
    mov eax, dword [0xa300]
    mov dword [ebx + 0x2180e4], ecx
    lea ebx, [eax*4]
    add ebx, eax
    shl ebx, 2
    mov esi, dword [ebx + 0x2180e4]
    sub esi, 3
    mov dword [ebx + 0x2180e4], esi
    cmp esi, 2
    jge short loc_53b1c
    mov dword [ebx + 0x2180e4], 2
loc_53b1c:
    mov edx, dword [0xa378]
    inc edx
    mov dword [0xa378], edx
    mov edi, edx
    jmp short loc_53b90
loc_53b2d:
    mov edx, ecx
    mov eax, ecx
    sar edx, 0x1f
    shl edx, 4
    db 0x1b, 0xc2    ; Watcom encoding of sbb eax, edx
    sar eax, 4
    mov edx, 0x7d
    mov dword [ebx + 0x2180e4], eax
    mov eax, 0xa
    call 0x5381c
    mov edx, dword [ebx + 0x2180e4]
    add edx, eax
    mov eax, dword [0xa300]
    mov dword [ebx + 0x2180e4], edx
    lea ebx, [eax*4]
    add ebx, eax
    shl ebx, 2
    cmp dword [ebx + 0x2180e4], 8
    jge short loc_53b83
    mov dword [ebx + 0x2180e4], 8
loc_53b83:
    mov edi, dword [0xa374]
    inc edi
    mov dword [0xa374], edi
loc_53b90:
    mov eax, dword [0xa300]
    lea ebx, [eax*4]
    add ebx, eax
    mov eax, dword [nosplit ebx*4 + 0x2180e0]
    mov edx, dword [nosplit ebx*4 + 0x2180e4]
    sar eax, 0x10
    mov ebx, edi
    call 0x58c00
    inc dword [0xa300]
loc_53bbc:
    mov eax, 8
loc_53bc1:
    call 0x5a250
loc_53bc6:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    test eax, eax
    je short loc_53bdc
    test edx, edx
    jne short loc_53be8
loc_53bdc:
    mov eax, 0x448c
    call PRINT_NOTICE
    jmp short loc_53bfe
loc_53be8:
    mov ebx, dword [eax]
    mov dword [edx], ebx
    mov bl, byte [eax + 4]
    mov byte [edx + 4], bl
    mov bl, byte [eax + 5]
    mov byte [edx + 5], bl
    mov al, byte [eax + 6]
    mov byte [edx + 6], al
loc_53bfe:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x50
    xor edx, edx
    mov dword [0xa380], edx
    mov dword [0xa384], edx
    mov eax, dword [0x216f7c]
    mov ecx, dword [0xa320]
    mov dword [0xa38c], eax
    mov eax, dword [0xa37c]
    cmp eax, ecx
    jbe short loc_53c7b
    lea edx, [ebp - 0x50]
    mov dword [ebp - 0x20], eax
    mov eax, 0xa320
    call 0x53bd0
    lea edx, [ebp - 0x30]
    mov eax, 0xa32f
    call 0x53bd0
    lea edx, [ebp - 0x40]
    mov eax, 0xa33e
    call 0x53bd0
    lea edx, [ebp - 0x60]
    mov eax, 0xa34d
    call 0x53bd0
    mov dword [0xa380], 1
    jmp near loc_53dc2
loc_53c7b:
    cmp eax, dword [0xa32f]
    jbe short loc_53cce
    lea edx, [ebp - 0x20]
    mov eax, 0xa320
    call 0x53bd0
    mov eax, dword [0xa37c]
    lea edx, [ebp - 0x30]
    mov dword [ebp - 0x50], eax
    mov eax, 0xa32f
    call 0x53bd0
    lea edx, [ebp - 0x40]
    mov eax, 0xa33e
    call 0x53bd0
    lea edx, [ebp - 0x60]
    mov eax, 0xa34d
    call 0x53bd0
    mov dword [0xa380], 2
    jmp near loc_53dc2
loc_53cce:
    cmp eax, dword [0xa33e]
    jbe short loc_53d22
    lea edx, [ebp - 0x20]
    mov eax, 0xa320
    call 0x53bd0
    lea edx, [ebp - 0x50]
    mov eax, 0xa32f
    call 0x53bd0
    mov eax, dword [0xa37c]
    lea edx, [ebp - 0x40]
    mov dword [ebp - 0x30], eax
    mov eax, 0xa33e
    call 0x53bd0
    lea edx, [ebp - 0x60]
    mov eax, 0xa34d
    mov edi, 3
    call 0x53bd0
    mov dword [0xa380], edi
    jmp near loc_53dc2
loc_53d22:
    cmp eax, dword [0xa34d]
    jbe short loc_53d73
    lea edx, [ebp - 0x20]
    mov eax, 0xa320
    call 0x53bd0
    lea edx, [ebp - 0x50]
    mov eax, 0xa32f
    call 0x53bd0
    lea edx, [ebp - 0x30]
    mov eax, 0xa33e
    call 0x53bd0
    mov eax, dword [0xa37c]
    lea edx, [ebp - 0x60]
    mov dword [ebp - 0x40], eax
    mov eax, 0xa34d
    mov esi, 4
    call 0x53bd0
    mov dword [0xa380], esi
    jmp short loc_53dc2
loc_53d73:
    cmp eax, dword [0xa35c]
    jbe short loc_53dc2
    lea edx, [ebp - 0x20]
    mov eax, 0xa320
    call 0x53bd0
    lea edx, [ebp - 0x50]
    mov eax, 0xa32f
    call 0x53bd0
    lea edx, [ebp - 0x30]
    mov eax, 0xa33e
    call 0x53bd0
    lea edx, [ebp - 0x40]
    mov eax, 0xa34d
    mov ecx, 5
    call 0x53bd0
    mov eax, dword [0xa37c]
    mov dword [0xa380], ecx
    mov dword [ebp - 0x60], eax
loc_53dc2:
    cmp dword [0xa380], 0
    je short loc_53e0c
    mov edx, 0xa320
    lea eax, [ebp - 0x20]
    call 0x53bd0
    mov edx, 0xa32f
    lea eax, [ebp - 0x50]
    call 0x53bd0
    mov edx, 0xa33e
    lea eax, [ebp - 0x30]
    call 0x53bd0
    mov edx, 0xa34d
    lea eax, [ebp - 0x40]
    call 0x53bd0
    mov edx, 0xa35c
    lea eax, [ebp - 0x60]
    call 0x53bd0
loc_53e0c:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    call 0x53c04
    cmp dword [0xa380], 0
    je short loc_53e33
    mov eax, 0x12c
    call 0x53160
loc_53e33:
    mov esp, ebp
    pop ebp
    ret
    nop

kill_dispatch:
    dd loc_54013 - 0x10000
    dd loc_54036 - 0x10000
    dd loc_54056 - 0x10000
    dd loc_54076 - 0x10000
    dd loc_54096 - 0x10000

is_a_kill:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x10
    xor edx, edx
    call 0x54b80
    mov dword [ebp - 0x20], edx
    cmp al, 0x20
    je short loc_53e97
    mov ebx, 1
    mov esi, dword [0xa384]
    mov dword [ebp - 0x20], ebx
    cmp esi, ebx
    jb short loc_53e80
    jbe short loc_53e8b
    cmp esi, 2
    je short loc_53e92
    jmp short loc_53e97
loc_53e80:
    test esi, esi
    jne short loc_53e97
    mov byte [0xa388], al
    jmp short loc_53e97
loc_53e8b:
    mov byte [0xa389], al
    jmp short loc_53e97
loc_53e92:
    mov byte [0xa38a], al
loc_53e97:
    xor ecx, ecx
    mov dword [ebp - 0x1c], ecx
    mov eax, dword [0x216f7c]
    sub eax, dword [0xa38c]
    cmp eax, 0x1e
    jle short loc_53ebd
    mov dword [ebp - 0x1c], 1
    mov eax, dword [0x216f7c]
    mov dword [0xa38c], eax
loc_53ebd:
    mov eax, 0x12
    push dword 0x44ac
    mov edx, 0x16
    xor ecx, ecx
    xor ebx, ebx
    mov dword [ebp - 0x18], eax
    mov eax, 0xa0
    mov esi, 0x64
    call MENU_TEXT
    mov edx, dword [0xa380]
    mov edi, 0x2c
    test edx, edx
    je near loc_540b4
    cmp dword [ebp - 0x1c], 0
    je short loc_53f04
    cmp dword [0xa384], 0
    je short loc_53f4c
loc_53f04:
    push dword 0x44b8
    push dword 0x1e2
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa388]
    push eax
    push dword 0x44c4
    mov eax, dword [0xa390]
    push eax
    call 0x5d8cc
    mov eax, dword [0xa380]
    mov edx, dword [ebp - 0x18]
    dec eax
    imul eax, edx
    xor ecx, ecx
    mov ebx, dword [0xa390]
    add esp, 0xc
    lea edx, [edi + eax]
    mov eax, esi
    call DRAW_TEXT
loc_53f4c:
    cmp dword [ebp - 0x1c], 0
    je short loc_53f5b
    cmp dword [0xa384], 1
    je short loc_53fa4
loc_53f5b:
    push dword 0x44b8
    push dword 0x1e6
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa389]
    push eax
    push dword 0x44c4
    mov eax, dword [0xa390]
    push eax
    call 0x5d8cc
    mov eax, dword [0xa380]
    mov edx, dword [ebp - 0x18]
    dec eax
    imul eax, edx
    xor ecx, ecx
    mov ebx, dword [0xa390]
    add esp, 0xc
    lea edx, [edi + eax]
    lea eax, [esi + 0xe]
    call DRAW_TEXT
loc_53fa4:
    cmp dword [ebp - 0x1c], 0
    je short loc_53fb3
    cmp dword [0xa384], 2
    je short loc_53ffc
loc_53fb3:
    push dword 0x44b8
    push dword 0x1ea
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa38a]
    push eax
    push dword 0x44c4
    mov eax, dword [0xa390]
    push eax
    call 0x5d8cc
    mov eax, dword [0xa380]
    mov edx, dword [ebp - 0x18]
    dec eax
    imul eax, edx
    xor ecx, ecx
    mov ebx, dword [0xa390]
    add esp, 0xc
    lea edx, [edi + eax]
    lea eax, [esi + 0x1c]
    call DRAW_TEXT
loc_53ffc:
    mov eax, dword [0xa380]
    dec eax
    cmp eax, 4
    ja near loc_540b4
    jmp dword [cs:nosplit eax*4 + kill_dispatch - 0x10000]
loc_54013:
    mov al, byte [0xa388]
    mov byte [0xa324], al
    mov al, byte [0xa389]
    mov byte [0xa325], al
    mov al, byte [0xa38a]
    mov byte [0xa326], al
    jmp near loc_540b4
loc_54036:
    mov al, byte [0xa388]
    mov byte [0xa333], al
    mov al, byte [0xa389]
    mov byte [0xa334], al
    mov al, byte [0xa38a]
    mov byte [0xa335], al
    jmp short loc_540b4
loc_54056:
    mov al, byte [0xa388]
    mov byte [0xa342], al
    mov al, byte [0xa389]
    mov byte [0xa343], al
    mov al, byte [0xa38a]
    mov byte [0xa344], al
    jmp short loc_540b4
loc_54076:
    mov al, byte [0xa388]
    mov byte [0xa351], al
    mov al, byte [0xa389]
    mov byte [0xa352], al
    mov al, byte [0xa38a]
    mov byte [0xa353], al
    jmp short loc_540b4
loc_54096:
    mov al, byte [0xa388]
    mov byte [0xa360], al
    mov al, byte [0xa389]
    mov byte [0xa361], al
    mov al, byte [0xa38a]
    mov byte [0xa362], al
loc_540b4:
    cmp dword [0xa380], 1
    je near loc_54176
    push dword 0x44b8
    push dword 0x20e
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa324]
    push eax
    push dword 0x44c4
    mov ecx, dword [0xa390]
    push ecx
    mov edx, edi
    call 0x5d8cc
    mov ebx, dword [0xa390]
    add esp, 0xc
    mov eax, esi
    xor ecx, ecx
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x210
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa325]
    push eax
    push dword 0x44c4
    mov eax, dword [0xa390]
    push eax
    mov edx, edi
    xor ecx, ecx
    call 0x5d8cc
    add esp, 0xc
    mov ebx, dword [0xa390]
    lea eax, [esi + 0xe]
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x212
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa326]
    push eax
    push dword 0x44c4
    mov edx, dword [0xa390]
    push edx
    xor ecx, ecx
    call 0x5d8cc
    mov ebx, dword [0xa390]
    add esp, 0xc
    lea eax, [esi + 0x1c]
    mov edx, edi
    call DRAW_TEXT
loc_54176:
    push dword 0x44b8
    push dword 0x215
    call 0x5d849
    mov ebx, dword [0xa320]
    push ebx
    push dword 0x44c8
    mov ecx, dword [0xa390]
    push ecx
    mov edx, edi
    call 0x5d8cc
    mov ebx, dword [0xa390]
    add esp, 0xc
    lea eax, [esi + 0x4a]
    xor ecx, ecx
    call DRAW_TEXT
    cmp dword [0xa380], 2
    je near loc_5427f
    push dword 0x44b8
    push dword 0x21c
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa333]
    push eax
    push dword 0x44c4
    mov edx, dword [0xa390]
    push edx
    xor ecx, ecx
    call 0x5d8cc
    mov eax, dword [ebp - 0x18]
    mov ebx, dword [0xa390]
    add eax, edi
    add esp, 0xc
    mov dword [ebp - 0x24], eax
    mov edx, eax
    mov eax, esi
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x21e
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa334]
    push eax
    push dword 0x44c4
    mov ebx, dword [0xa390]
    push ebx
    mov edx, dword [ebp - 0x24]
    xor ecx, ecx
    call 0x5d8cc
    add esp, 0xc
    mov ebx, dword [0xa390]
    lea eax, [esi + 0xe]
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x220
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa335]
    push eax
    push dword 0x44c4
    mov ecx, dword [0xa390]
    push ecx
    mov edx, dword [ebp - 0x24]
    call 0x5d8cc
    mov ebx, dword [0xa390]
    add esp, 0xc
    lea eax, [esi + 0x1c]
    xor ecx, ecx
    call DRAW_TEXT
loc_5427f:
    push dword 0x44b8
    push dword 0x223
    call 0x5d849
    mov eax, dword [0xa32f]
    push eax
    push dword 0x44c8
    mov edx, dword [0xa390]
    push edx
    xor ecx, ecx
    call 0x5d8cc
    mov edx, dword [ebp - 0x18]
    mov ebx, dword [0xa390]
    add esp, 0xc
    lea eax, [esi + 0x4a]
    add edx, edi
    call DRAW_TEXT
    cmp dword [0xa380], 3
    je near loc_5438a
    push dword 0x44b8
    push dword 0x22a
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa342]
    push eax
    push dword 0x44c4
    mov ecx, dword [0xa390]
    push ecx
    call 0x5d8cc
    mov eax, dword [ebp - 0x18]
    mov ebx, dword [0xa390]
    add esp, 0xc
    add eax, eax
    xor ecx, ecx
    lea edx, [edi + eax]
    mov eax, esi
    mov dword [ebp - 0x24], edx
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x22c
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa343]
    push eax
    push dword 0x44c4
    mov eax, dword [0xa390]
    push eax
    mov edx, dword [ebp - 0x24]
    xor ecx, ecx
    call 0x5d8cc
    add esp, 0xc
    mov ebx, dword [0xa390]
    lea eax, [esi + 0xe]
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x22e
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa344]
    push eax
    push dword 0x44c4
    mov edx, dword [0xa390]
    push edx
    xor ecx, ecx
    call 0x5d8cc
    mov edx, dword [ebp - 0x24]
    add esp, 0xc
    mov ebx, dword [0xa390]
    lea eax, [esi + 0x1c]
    call DRAW_TEXT
loc_5438a:
    push dword 0x44b8
    push dword 0x231
    call 0x5d849
    mov ebx, dword [0xa33e]
    push ebx
    mov edx, dword [ebp - 0x18]
    push dword 0x44c8
    mov ecx, dword [0xa390]
    add edx, edx
    push ecx
    add edx, edi
    call 0x5d8cc
    mov ebx, dword [0xa390]
    add esp, 0xc
    lea eax, [esi + 0x4a]
    xor ecx, ecx
    call DRAW_TEXT
    cmp dword [0xa380], 4
    je near loc_544a0
    push dword 0x44b8
    push dword 0x238
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa351]
    push eax
    push dword 0x44c4
    mov edx, dword [0xa390]
    push edx
    xor ecx, ecx
    mov edx, dword [ebp - 0x18]
    call 0x5d8cc
    lea eax, [edx*4]
    mov ebx, dword [0xa390]
    sub eax, edx
    add esp, 0xc
    lea edx, [edi + eax]
    mov eax, esi
    mov dword [ebp - 0x24], edx
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x23a
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa352]
    push eax
    push dword 0x44c4
    mov ebx, dword [0xa390]
    push ebx
    mov edx, dword [ebp - 0x24]
    xor ecx, ecx
    call 0x5d8cc
    add esp, 0xc
    mov ebx, dword [0xa390]
    lea eax, [esi + 0xe]
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x23c
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa353]
    push eax
    push dword 0x44c4
    mov ecx, dword [0xa390]
    push ecx
    mov edx, dword [ebp - 0x24]
    call 0x5d8cc
    mov ebx, dword [0xa390]
    add esp, 0xc
    lea eax, [esi + 0x1c]
    xor ecx, ecx
    call DRAW_TEXT
loc_544a0:
    push dword 0x44b8
    push dword 0x23f
    call 0x5d849
    mov eax, dword [0xa34d]
    push eax
    push dword 0x44c8
    mov edx, dword [0xa390]
    push edx
    xor ecx, ecx
    mov edx, dword [ebp - 0x18]
    call 0x5d8cc
    lea eax, [edx*4]
    mov ebx, dword [0xa390]
    sub eax, edx
    add esp, 0xc
    lea edx, [edi + eax]
    lea eax, [esi + 0x4a]
    call DRAW_TEXT
    cmp dword [0xa380], 5
    je near loc_545b6
    push dword 0x44b8
    push dword 0x246
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa360]
    push eax
    push dword 0x44c4
    mov ecx, dword [0xa390]
    push ecx
    call 0x5d8cc
    mov eax, dword [ebp - 0x18]
    mov ebx, dword [0xa390]
    add esp, 0xc
    shl eax, 2
    xor ecx, ecx
    lea edx, [edi + eax]
    mov eax, esi
    mov dword [ebp - 0x24], edx
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x248
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa361]
    push eax
    push dword 0x44c4
    mov eax, dword [0xa390]
    push eax
    mov edx, dword [ebp - 0x24]
    xor ecx, ecx
    call 0x5d8cc
    add esp, 0xc
    mov ebx, dword [0xa390]
    lea eax, [esi + 0xe]
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x24a
    call 0x5d849
    xor eax, eax
    mov al, byte [0xa362]
    push eax
    push dword 0x44c4
    mov edx, dword [0xa390]
    push edx
    xor ecx, ecx
    call 0x5d8cc
    mov edx, dword [ebp - 0x24]
    add esp, 0xc
    mov ebx, dword [0xa390]
    lea eax, [esi + 0x1c]
    call DRAW_TEXT
loc_545b6:
    push dword 0x44b8
    push dword 0x24d
    call 0x5d849
    mov ebx, dword [0xa35c]
    push ebx
    mov edx, dword [ebp - 0x18]
    mov ecx, dword [0xa390]
    push dword 0x44c8
    shl edx, 2
    push ecx
    add edx, edi
    call 0x5d8cc
    mov ebx, dword [0xa390]
    add esp, 0xc
    lea eax, [esi + 0x4a]
    xor ecx, ecx
    call DRAW_TEXT
    cmp byte [0x21ec3b], 0
    jne short loc_5460a
    cmp byte [0x21ec1b], 0
    je short loc_54620
loc_5460a:
    xor ch, ch
    mov byte [0x21ec3b], ch
    mov byte [0x21ec1b], ch
    dec dword [0xa384]
    jmp short loc_5464c
loc_54620:
    cmp dword [ebp - 0x20], 0
    jne short loc_54638
    cmp byte [0x21ec3c], 0
    jne short loc_54638
    cmp byte [0x21ec1d], 0
    je short loc_5464c
loc_54638:
    xor bh, bh
    mov byte [0x21ec3c], bh
    mov byte [0x21ec1d], bh
    inc dword [0xa384]
loc_5464c:
    cmp dword [0xa384], 0
    jge short loc_5465f
    mov dword [0xa384], 2
loc_5465f:
    cmp dword [0xa384], 2
    jle short loc_54670
    xor esi, esi
    mov dword [0xa384], esi
loc_54670:
    cmp dword [0xa380], 0
    je short loc_5468f
    mov ebx, 0x44d0
    mov edx, 0x92
    mov eax, 0x56
    xor ecx, ecx
    call DRAW_TEXT
loc_5468f:
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
    sub esp, 0x10
    mov esi, eax
    cmp eax, 2
    jne short loc_546b8
    call 0x53e4c
    jmp near loc_54a1f
loc_546b8:
    mov ebx, dword [0x216f84]
    dec ebx
    push ebx
    mov ebx, dword [0x216f88]
    dec ebx
    push ebx
    push byte 0
    push byte 0
    push byte 0x5a
    push byte 0
    mov eax, 0xa00000
    push byte 0
    mov edx, dword [0xa304]
    xor ecx, ecx
    push edx
    mov ebx, 0x10000
    xor edx, edx
    call ROTATE_SPRITE
    cmp esi, 1
    jne short loc_5471a
    mov ebx, dword [0xa310]
    mov dword [ebp - 0x20], ebx
    mov ebx, dword [0xa314]
    mov dword [ebp - 0x1c], ebx
    mov ebx, dword [0xa31c]
    mov dword [ebp - 0x18], ebx
    mov ebx, dword [0xa320]
    mov edi, dword [0xa318]
    jmp short loc_54741
loc_5471a:
    mov ebx, dword [0xa36c]
    mov dword [ebp - 0x20], ebx
    mov ebx, dword [0xa370]
    mov dword [ebp - 0x1c], ebx
    mov ebx, dword [0xa378]
    mov dword [ebp - 0x18], ebx
    mov ebx, dword [0xa37c]
    mov edi, dword [0xa374]
loc_54741:
    mov dword [ebp - 0x24], ebx
    cmp dword [ebp - 0x20], 0
    jbe short loc_5477c
    mov ebx, dword [0x216f84]
    dec ebx
    push ebx
    mov ebx, dword [0x216f88]
    dec ebx
    push ebx
    push byte 0
    push byte 0
    push byte 0x1a
    push byte 0
    push byte 0
    mov eax, 0x40000
    xor ecx, ecx
    push dword 0x6cd
    xor edx, edx
    mov ebx, 0x9000
    call ROTATE_SPRITE
loc_5477c:
    cmp dword [ebp - 0x1c], 0
    jbe short loc_547b7
    mov ebx, dword [0x216f84]
    dec ebx
    push ebx
    mov ebx, dword [0x216f88]
    dec ebx
    push ebx
    push byte 0
    push byte 0
    push byte 0x1a
    push byte 0
    push byte 0
    mov edx, 0x60000
    mov eax, 0x620000
    push dword 0x6cc
    xor ecx, ecx
    mov ebx, 0x9000
    call ROTATE_SPRITE
loc_547b7:
    test edi, edi
    jbe short loc_547f0
    mov ebx, dword [0x216f84]
    dec ebx
    push ebx
    mov ebx, dword [0x216f88]
    dec ebx
    push ebx
    push byte 0
    push byte 0
    push byte 0x1a
    push byte 0
    push byte 0
    mov edx, 0x800000
    mov eax, 0xac0000
    push dword 0x6cf
    xor ecx, ecx
    mov ebx, 0x6fa0
    call ROTATE_SPRITE
loc_547f0:
    cmp dword [ebp - 0x18], 0
    jbe short loc_5482b
    mov ebx, dword [0x216f84]
    dec ebx
    push ebx
    mov ebx, dword [0x216f88]
    dec ebx
    push ebx
    push byte 0
    push byte 0
    push byte 0x1a
    push byte 0
    push byte 0
    mov edx, 0x800000
    mov eax, 0xe80000
    push dword 0x6ce
    xor ecx, ecx
    mov ebx, 0x6fa0
    call ROTATE_SPRITE
loc_5482b:
    test esi, esi
    jne short loc_54836
    mov ebx, 0x44e4
    jmp short loc_5483b
loc_54836:
    mov ebx, 0x4504
loc_5483b:
    mov edx, 0x68
    mov eax, 4
    xor ecx, ecx
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x29f
    call 0x5d849
    mov edx, dword [ebp - 0x20]
    push edx
    push dword 0x4524
    mov ebx, dword [0xa390]
    push ebx
    xor ecx, ecx
    mov edx, 0x7a
    call 0x5d8cc
    add esp, 0xc
    mov eax, 8
    mov ebx, dword [0xa390]
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x2a1
    call 0x5d849
    mov ecx, dword [ebp - 0x1c]
    push ecx
    push dword 0x453c
    mov eax, dword [0xa390]
    push eax
    mov edx, 0x88
    xor ecx, ecx
    call 0x5d8cc
    add esp, 0xc
    mov eax, 8
    mov ebx, dword [0xa390]
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x2a3
    call 0x5d849
    push edi
    push dword 0x4554
    mov edx, dword [0xa390]
    push edx
    xor ecx, ecx
    call 0x5d8cc
    mov edx, 0x96
    add esp, 0xc
    mov eax, 8
    mov ebx, dword [0xa390]
    call DRAW_TEXT
    push dword 0x44b8
    push dword 0x2a5
    call 0x5d849
    mov ebx, dword [ebp - 0x18]
    push ebx
    push dword 0x456c
    mov ecx, dword [0xa390]
    push ecx
    mov edx, 0xa4
    call 0x5d8cc
    mov eax, 8
    add esp, 0xc
    mov ebx, dword [0xa390]
    xor ecx, ecx
    call DRAW_TEXT
    test esi, esi
    jne near loc_549e1
    mov esi, dword [0xa308]
    mov eax, dword [0xa30c]
    mov edx, dword [ebp - 0x18]
    add esi, eax
    add esi, edx
    add edi, esi
    cmp edi, 6
    jle short loc_54977
    mov ebx, 0x4584
    mov edx, 0xb6
    mov eax, 8
    xor ecx, ecx
    jmp near loc_54a1a
loc_54977:
    cmp edi, 4
    jle short loc_5499c
    mov ebx, 0x4594
    mov edx, 0xb6
    mov eax, 8
    xor ecx, ecx
    call DRAW_TEXT
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_5499c:
    cmp edi, 1
    jl short loc_549c1
    mov ebx, 0x45a4
    mov edx, 0xb6
    mov eax, 8
    xor ecx, ecx
    call DRAW_TEXT
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_549c1:
    mov ebx, 0x45b0
    mov edx, 0xb6
    mov eax, 8
    xor ecx, ecx
    call DRAW_TEXT
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_549e1:
    push dword 0x44b8
    push dword 0x2b8
    mov esi, dword [ebp - 0x24]
    call 0x5d849
    push esi
    push dword 0x45c0
    mov edi, dword [0xa390]
    push edi
    mov edx, 0xb6
    xor ecx, ecx
    call 0x5d8cc
    add esp, 0xc
    mov eax, 8
    mov ebx, dword [0xa390]
loc_54a1a:
    call DRAW_TEXT
loc_54a1f:
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
    push edx
    push esi
    xor edx, edx
    mov dword [0xa300], edx
    call 0x50fe0
    mov edx, eax
    mov ebx, 6
    sar edx, 0x1f
    idiv ebx
    add edx, strict dword 0x6c3
    xor ebx, ebx
    xor eax, eax
    mov dword [0xa304], edx
    mov dword [0xa308], ebx
    mov dword [0xa30c], ebx
    mov ebx, 0xffffffff
    xor edx, edx
loc_54a6e:
    add eax, 0x14
    mov word [eax + 0x2180cc], bx
    mov word [eax + 0x2180ce], dx
    mov dword [eax + 0x2180d0], edx
    mov dword [eax + 0x2180d4], edx
    mov dword [eax + 0x2180d8], edx
    mov dword [eax + 0x2180dc], edx
    cmp eax, strict dword 0x190
    jne short loc_54a6e
    xor esi, esi
    mov ah, 0x41
    mov dword [0xa36c], esi
    mov dword [0xa370], esi
    mov dword [0xa374], esi
    mov dword [0xa378], esi
    mov dword [0xa37c], esi
    mov dword [0xa380], esi
    mov dword [0xa384], esi
    mov byte [0xa388], ah
    mov byte [0xa389], ah
    mov byte [0xa38a], ah
    mov dword [0xa38c], esi
    call 0x536d4
    lea esp, [ebp - 0xc]
    pop esi
    pop edx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

score_dispatch:
    dd loc_54cc2 - 0x10000
    dd loc_54d2c - 0x10000
    dd loc_54bea - 0x10000
    dd loc_54cd4 - 0x10000
    dd loc_54cf6 - 0x10000
    dd loc_54d50 - 0x10000
    dd loc_54d08 - 0x10000
    dd loc_54c32 - 0x10000
    dd loc_54c9e - 0x10000
    dd loc_54cb0 - 0x10000
    dd loc_54d73 - 0x10000
    dd loc_54d73 - 0x10000
    dd loc_54d73 - 0x10000
    dd loc_54d73 - 0x10000
    dd loc_54ba2 - 0x10000
    dd loc_54ce5 - 0x10000
    dd loc_54bd8 - 0x10000
    dd loc_54bfc - 0x10000
    dd loc_54c0e - 0x10000
    dd loc_54c20 - 0x10000
    dd loc_54c44 - 0x10000
    dd loc_54c56 - 0x10000
    dd loc_54c68 - 0x10000
    dd loc_54d73 - 0x10000
    dd loc_54d73 - 0x10000
    dd loc_54d73 - 0x10000
    dd loc_54d73 - 0x10000
    dd loc_54d73 - 0x10000
    dd loc_54d62 - 0x10000
    dd loc_54d3e - 0x10000
    dd loc_54bc6 - 0x10000
    dd loc_54d1a - 0x10000
    dd loc_54bb4 - 0x10000
    dd loc_54c8c - 0x10000
    dd loc_54c7a - 0x10000
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov al, byte [0x21ec5c]
    sub al, 0x10
    cmp al, 0x22
    ja near loc_54d73
    and eax, strict dword 0xff
    jmp dword [cs:nosplit eax*4 + score_dispatch - 0x10000]
loc_54ba2:
    xor ah, ah
    mov byte [0x21ec5c], ah
    mov al, 0x41
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54bb4:
    xor bl, bl
    mov byte [0x21ec5c], bl
    mov al, 0x42
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54bc6:
    xor cl, cl
    mov byte [0x21ec5c], cl
    mov al, 0x43
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54bd8:
    xor ch, ch
    mov byte [0x21ec5c], ch
    mov al, 0x44
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54bea:
    xor ah, ah
    mov byte [0x21ec5c], ah
    mov al, 0x45
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54bfc:
    xor cl, cl
    mov byte [0x21ec5c], cl
    mov al, 0x46
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54c0e:
    xor bh, bh
    mov byte [0x21ec5c], bh
    mov al, 0x47
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54c20:
    xor bl, bl
    mov byte [0x21ec5c], bl
    mov al, 0x48
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54c32:
    xor bl, bl
    mov byte [0x21ec5c], bl
    mov al, 0x49
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54c44:
    xor dh, dh
    mov byte [0x21ec5c], dh
    mov al, 0x4a
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54c56:
    xor dl, dl
    mov byte [0x21ec5c], dl
    mov al, 0x4b
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54c68:
    xor ah, ah
    mov byte [0x21ec5c], ah
    mov al, 0x4c
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54c7a:
    xor dl, dl
    mov byte [0x21ec5c], dl
    mov al, 0x4d
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54c8c:
    xor dh, dh
    mov byte [0x21ec5c], dh
    mov al, 0x4e
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54c9e:
    xor dh, dh
    mov byte [0x21ec5c], dh
    mov al, 0x4f
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54cb0:
    xor dl, dl
    mov byte [0x21ec5c], dl
    mov al, 0x50
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54cc2:
    xor dh, dh
    mov byte [0x21ec5c], dh
    mov al, 0x51
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54cd4:
    xor al, al
    mov byte [0x21ec5c], al
    mov al, 0x52
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54ce5:
    xor al, al
    mov byte [0x21ec5c], al
    mov al, 0x53
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54cf6:
    xor ch, ch
    mov byte [0x21ec5c], ch
    mov al, 0x54
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54d08:
    xor bh, bh
    mov byte [0x21ec5c], bh
    mov al, 0x55
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54d1a:
    xor bh, bh
    mov byte [0x21ec5c], bh
    mov al, 0x56
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54d2c:
    xor dl, dl
    mov byte [0x21ec5c], dl
    mov al, 0x57
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54d3e:
    xor ch, ch
    mov byte [0x21ec5c], ch
    mov al, 0x58
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54d50:
    xor cl, cl
    mov byte [0x21ec5c], cl
    mov al, 0x59
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54d62:
    xor al, al
    mov byte [0x21ec5c], al
    mov al, 0x5a
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_54d73:
    xor ah, ah
    mov byte [0x21ec5c], ah
    mov al, 0x20
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 11 db 0    ; Object alignment

prepare_scope:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov edx, dword [0x215c84]
    push edx
    mov ebx, dword [0x215c8c]
    push ebx
    mov ecx, dword [0x215c88]
    push ecx
    mov esi, dword [0x215c90]
    push esi
    push byte 0x23
    push byte 0
    push byte -0x18
    mov eax, 0xa00000
    mov edx, 0x640000
    push dword 0x1b97
    mov ebx, 0x8000
    xor ecx, ecx
    call ROTATE_SPRITE
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
    push edx
    mov edx, dword [0x1805fa]
    sar edx, 0x10
    mov dword [0xa3a8], edx
    mov edx, dword [0x184dfa]
    sar edx, 0x10
    mov dword [0xa3ac], edx
    cmp dword [0x170c90], 0
    jne short loc_54e22
    mov eax, 0x1b8a
    mov ebx, dword [0xa3ac]
    mov edx, dword [0xa3a8]
    call 0x3a76f
loc_54e22:
    lea esp, [ebp - 8]
    pop edx
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
    mov esi, dword [0xa3ac]
    mov edi, dword [0xa3a8]
    xor edx, edx
    mov ebx, dword [0x170c90]
    mov dword [0xa3a4], edx
    test ebx, ebx
    je near loc_54f8c
    mov eax, dword [0x215c8c]
    sub eax, dword [0x215c90]
    inc eax
    mov edx, dword [0x215c88]
    mov dword [0xa3b4], eax
    mov eax, dword [0x215c84]
    sub eax, edx
    inc eax
    mov dword [0xa3b8], eax
    mov eax, dword [0xa3b4]
    cmp eax, edi
    jle near loc_54f8c
    mov eax, dword [0xa3b8]
    cmp eax, esi
    jle near loc_54f8c
    mov ebx, dword [0x215c3c]
    sub ebx, dword [0xa3b4]
    test ebx, ebx
    jge short loc_54eae
    mov eax, 0x45d8
    call 0x51510
loc_54eae:
    mov edx, ebx
    mov eax, ebx
    sar edx, 0x1f
    db 0x2b, 0xc2    ; Watcom encoding of sub eax, edx
    sar eax, 1
    mov esi, dword [0xa3b8]
    mov edx, dword [0x215c3c]
    imul edx, esi
    mov ebx, eax
    mov eax, edx
    sar edx, 0x1f
    db 0x2b, 0xc2    ; Watcom encoding of sub eax, edx
    sar eax, 1
    mov dword [0xa3b0], eax
    mov eax, dword [0x215c3c]
    mov edi, dword [0xa3b0]
    sar eax, 1
    sub edi, eax
    mov eax, edi
    mov dword [0xa3b0], edi
    sub eax, ebx
    mov dword [0xa3b0], eax
    mov eax, dword [0xa3ac]
    mov edx, dword [0x215c3c]
    sar eax, 1
    imul eax, edx
    push byte 0
    push byte 0
    mov ebx, dword [0xa3b0]
    push dword 0x1b8a
    sub ebx, eax
    xor edx, edx
    mov eax, dword [0xa3a8]
    mov dword [0xa3b0], ebx
    mov ecx, ebx
    sar eax, 1
    xor ebx, ebx
    sub ecx, eax
    mov eax, dword [0x184dfc]
    mov dword [0xa3b0], ecx
    sar eax, 0x10
    mov ecx, dword [0x1805fc]
    push eax
    sar ecx, 0x10
    mov eax, 0x1b8b
    call 0x3b729
    mov edi, dword [0xa3a8]
    mov eax, dword [0x170c90]
    mov esi, dword [0xa3ac]
    test eax, eax
    je short loc_54f8c
    xor ebx, ebx
    test edi, edi
    jle short loc_54f82
loc_54f69:
    xor edx, edx
    test esi, esi
    jle short loc_54f7d
loc_54f6f:
    cmp byte [eax], 0
    jne short loc_54f77
    mov byte [eax], 0xff
loc_54f77:
    inc edx
    inc eax
    cmp edx, esi
    jl short loc_54f6f
loc_54f7d:
    inc ebx
    cmp ebx, edi
    jl short loc_54f69
loc_54f82:
    mov dword [0xa3a4], 1
loc_54f8c:
    mov dword [0xa3a8], edi
    mov dword [0xa3ac], esi
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
    push esi
    push edi
    sub esp, 0xc
    mov dword [ebp - 0x1c], eax
    mov dword [ebp - 0x18], edx
    cmp dword [0xa3a4], 0
    jne short loc_54fc2
    call 0x54e2c
loc_54fc2:
    mov ebx, dword [0x170c90]
    test ebx, ebx
    je near loc_550e4
    mov ecx, dword [0x215c4c]
    test ecx, ecx
    je near loc_550e4
    mov edi, dword [0xa3a8]
    mov dword [ebp - 0x14], ecx
    mov edx, ebx
    xor esi, esi
    test edi, edi
    jle short loc_5502f
loc_54fef:
    mov edi, dword [0xa3ac]
    xor eax, eax
    test edi, edi
    jle short loc_55025
loc_54ffb:
    cmp byte [edx], 0xff
    je short loc_55019
    mov ebx, dword [0x215c3c]
    imul ebx, esi
    mov ecx, dword [ebp - 0x14]
    add ecx, dword [0xa3b0]
    add ebx, ecx
    mov bl, byte [ebx + eax]
    mov byte [edx], bl
loc_55019:
    mov ebx, dword [0xa3ac]
    inc eax
    inc edx
    cmp eax, ebx
    jl short loc_54ffb
loc_55025:
    mov eax, dword [0xa3a8]
    inc esi
    cmp esi, eax
    jl short loc_54fef
loc_5502f:
    mov edx, dword [0x215c84]
    push edx
    mov ebx, dword [0x215c8c]
    push ebx
    mov ecx, dword [0x215c88]
    push ecx
    mov esi, dword [0x215c90]
    mov edi, dword [ebp - 0x18]
    push esi
    shl edi, 0x10
    push byte 6
    mov edx, edi
    push byte 0
    mov ebx, 0xe000
    mov esi, dword [ebp - 0x1c]
    push byte 0
    shl esi, 0x10
    push dword 0x1b8a
    mov ecx, 0x200
    mov eax, esi
    call ROTATE_SPRITE
    mov eax, dword [0x215c84]
    push eax
    mov edx, dword [0x215c8c]
    push edx
    mov ebx, dword [0x215c88]
    push ebx
    mov ecx, dword [0x215c90]
    push ecx
    push byte 7
    push byte 0
    push byte -8
    mov eax, esi
    mov edx, edi
    push dword 0x1b8a
    mov ebx, 0xe000
    mov ecx, 0x200
    call ROTATE_SPRITE
    mov eax, dword [0x215c84]
    push eax
    mov edx, dword [0x215c8c]
    push edx
    mov ebx, dword [0x215c88]
    push ebx
    mov ecx, dword [0x215c90]
    push ecx
    push byte 0x23
    push byte 0
    push byte -0x18
    mov eax, esi
    mov edx, edi
    push dword 0x1b97
    mov ebx, 0x8000
    xor ecx, ecx
    call ROTATE_SPRITE
loc_550e4:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
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
    xor edx, edx
    xor eax, eax
    xor esi, esi
    xor ebx, ebx
    mov dword [0xa3a0], edx
loc_55106:
    mov word [esi + 0x218280], 0xffff
    mov ecx, dword [eax + 0x19137e]
    sar ecx, 0x10
    test ecx, ecx
    jl short loc_55161
    mov edi, dword [0x217fcc]
    sar edi, 0x10
    cmp ecx, edi
    jge short loc_55161
    test byte [eax + 0x191374], 2
    je short loc_55161
    imul ecx, ecx, 0x28
    test byte [ecx + 0x20a076], 1
    je short loc_55161
    mov cl, byte [eax + 0x19137c]
    mov byte [ebx + 0x218282], cl
    mov ecx, dword [0xa3a0]
    add ebx, 3
    inc ecx
    mov word [ebx + 0x21827d], dx
    mov dword [0xa3a0], ecx
loc_55161:
    add eax, 0x2c
    inc edx
    add esi, 3
    cmp edx, strict dword 0x1000
    jl short loc_55106
    xor esi, esi
    mov dword [0xa39c], esi
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
