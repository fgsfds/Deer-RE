bits 32
org 0x23d70

%define SET_SPRITE 0x40b6d
%define CHANGE_SPRITE_SECT 0x410f9
%define CLIP_MOVE 0x430f3
%define GET_FLOOR_Z_OF_SLOPE 0x4decc
%define GET_INC_ANGLE 0x19ff0
%define MAKE_IT_FALL 0x1a340
%define PRINT_NOTICE 0x5130c
%define EXECUTE_ACTOR_SCRIPT 0x23b2c
%define EGS 0x15c74
%define SPAWN 0x15ee0
%define BADGUY 0x14814
%define KRAND 0x46fa0
%define DELETE_SPRITE 0x40ecd
%define GET_ANGLE 0x3b4fc

update_interpolations:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov edx, dword [0x93b0]
    dec edx
    test edx, edx
    jl short loc_23d9d
    lea eax, [edx*4]
loc_23d87:
    mov ebx, dword [eax + 0x19040]
    sub eax, 4
    mov ebx, dword [ebx]
    dec edx
    mov dword [eax + 0x17004], ebx
    test eax, eax
    jge short loc_23d87
loc_23d9d:
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret

set_interpolation:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov ecx, dword [0x93b0]
    mov ebx, eax
    cmp ecx, strict dword 0x800
    jge short loc_23de9
    lea edx, [ecx - 1]
    test edx, edx
    jl short loc_23dd8
    lea eax, [edx*4]
loc_23dc8:
    cmp ebx, dword [eax + 0x19040]
    je short loc_23de9
    sub eax, 4
    dec edx
    test eax, eax
    jge short loc_23dc8
loc_23dd8:
    mov dword [nosplit ecx*4 + 0x19040], ebx
    inc ecx
    mov edx, dword [ebx]
    mov dword [nosplit ecx*4 + 0x16ffc], edx
loc_23de9:
    mov dword [0x93b0], ecx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

stop_interpolation:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov ecx, dword [0x93b0]
    mov dword [ebp - 0x18], eax
    mov edx, dword [0x93b4]
    lea ebx, [ecx - 1]
    cmp ebx, edx
    jl short loc_23e6b
    mov edi, dword [0x93b4]
    lea eax, [ebx*4]
    lea edx, [ecx*4]
    shl edi, 2
loc_23e30:
    mov esi, dword [eax + 0x19040]
    cmp esi, dword [ebp - 0x18]
    jne short loc_23e63
    mov esi, dword [edx + 0x16ffc]
    mov dword [eax + 0x17000], esi
    mov esi, dword [edx + 0x14ffc]
    sub edx, 4
    mov dword [eax + 0x15000], esi
    mov esi, dword [edx + 0x19040]
    dec ecx
    mov dword [eax + 0x19040], esi
loc_23e63:
    sub eax, 4
    dec ebx
    cmp eax, edi
    jge short loc_23e30
loc_23e6b:
    mov dword [0x93b0], ecx
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

do_interpolations:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov edi, eax
    mov esi, dword [0x93b0]
    xor ecx, ecx
    dec esi
    mov dword [ebp - 0x18], ecx
    test esi, esi
    jl short loc_23ee4
    lea ebx, [esi*4]
loc_23ea0:
    mov eax, dword [ebx + 0x19040]
    mov edx, dword [eax]
    mov dword [ebx + 0x15000], edx
    mov edx, ecx
    mov ecx, dword [eax]
    sub ecx, dword [ebx + 0x17000]
    cmp edx, ecx
    je short loc_23ec9
    mov edx, edi
    mov eax, ecx
    imul edx
    shrd eax, edx, 0x10
    mov dword [ebp - 0x18], eax
loc_23ec9:
    mov eax, dword [ebp - 0x18]
    mov edx, dword [ebx + 0x17000]
    add edx, eax
    mov eax, dword [ebx + 0x19040]
    sub ebx, 4
    dec esi
    mov dword [eax], edx
    test ebx, ebx
    jge short loc_23ea0
loc_23ee4:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

restore_interpolations:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov edx, dword [0x93b0]
    dec edx
    test edx, edx
    jl short loc_23f1e
    lea eax, [edx*4]
loc_23f08:
    mov ecx, dword [eax + 0x19040]
    mov ebx, dword [eax + 0x15000]
    sub eax, 4
    dec edx
    mov dword [ecx], ebx
    test eax, eax
    jge short loc_23f08
loc_23f1e:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

ceiling_space:
    push ebp
    mov ebp, esp
    push edx
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    shl eax, 3
    test byte [eax + 0x20a074], 1
    je short loc_23f69
    cmp byte [eax + 0x20a07d], 0
    jne short loc_23f69
    mov ax, word [eax + 0x20a078]
    cmp ax, strict word 0x3fe
    jb short loc_23f69
    jbe short loc_23f62
    cmp ax, strict word 0x402
    jne short loc_23f69
loc_23f62:
    mov eax, 1
    jmp short loc_23f6b
loc_23f69:
    xor eax, eax
loc_23f6b:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    lea eax, [byte eax + 0]

floor_space:
    push ebp
    mov ebp, esp
    push edx
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    shl eax, 3
    test byte [eax + 0x20a076], 1
    je short loc_23fb5
    cmp byte [eax + 0x20a07d], 0
    jne short loc_23fb5
    mov ax, word [eax + 0x20a080]
    cmp ax, strict word 0x3fe
    jb short loc_23fb5
    jbe short loc_23fae
    cmp ax, strict word 0x402
    jne short loc_23fb5
loc_23fae:
    mov eax, 1
    jmp short loc_23fb7
loc_23fb5:
    xor eax, eax
loc_23fb7:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    lea eax, [byte eax + 0]

add_ammo:
    push ebp
    mov ebp, esp
    mov eax, 0x28e0
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

add_weapon:
    push ebp
    mov ebp, esp
    mov eax, 0x28f8
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

check_available_inventory:
    push ebp
    mov ebp, esp
    mov eax, 0x2914
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x2934
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret 8
    nop

move_sprite:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x20
    mov esi, eax
    mov edi, edx
    mov dword [ebp - 0x20], ecx
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    lea edx, [eax*4]
    mov eax, 0x191368
    add eax, edx
    call BADGUY
    mov cx, word [edx + 0x191382]
    mov byte [ebp - 0xc], al
    cmp cx, 5
    je short loc_2407c
    test al, al
    je near loc_240fe
    cmp byte [edx + 0x19137c], 4
    jae near loc_240fe
loc_2407c:
    movsx esi, si
    lea eax, [esi*4]
    sub eax, esi
    lea edx, [edi*4]
    shl eax, 2
    shl ebx, 2
    sub eax, esi
    sar edx, 2
    shl eax, 2
    sar ebx, 2
    mov ecx, dword [eax + 0x191368]
    mov edi, dword [eax + 0x19136c]
    add ecx, edx
    mov edx, dword [ebp - 0x20]
    add edi, ebx
    shl edx, 2
    mov ebx, dword [eax + 0x191370]
    sar edx, 2
    mov dword [eax + 0x191368], ecx
    add ebx, edx
    mov dword [eax + 0x191370], ebx
    mov bl, byte [ebp - 0xc]
    mov dword [eax + 0x19136c], edi
    test bl, bl
    je short loc_240f3
    mov ecx, dword [eax + 0x191370]
    mov ebx, dword [eax + 0x19136c]
    mov edx, dword [eax + 0x191368]
    mov eax, esi
    call SET_SPRITE
loc_240f3:
    xor eax, eax
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_240fe:
    movsx edx, si
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    lea edx, [eax*4]
    mov ax, word [edx + 0x191380]
    mov word [ebp - 0x10], ax
    mov eax, dword [edx + 0x191370]
    mov dword [ebp - 0x28], eax
    mov eax, dword [edx + 0x191374]
    sar eax, 0x10
    mov eax, dword [nosplit eax*2 + 0x1816e6]
    sar eax, 0x10
    mov dword [ebp - 0x24], eax
    xor eax, eax
    mov ecx, dword [ebp - 0x24]
    mov al, byte [edx + 0x19137d]
    imul eax, ecx
    shl edi, 0xd
    shl ebx, 0xd
    mov ecx, dword [ebp - 0x28]
    add eax, eax
    mov dword [ebp - 0x14], edi
    sub ecx, eax
    mov eax, 0x191368
    mov dword [ebp - 0x28], ecx
    add eax, edx
    mov cl, byte [ebp - 0xc]
    lea edi, [eax + 4]
    test cl, cl
    je near loc_242ff
    mov ecx, dword [edx + 0x191368]
    mov dword [ebp - 0x1c], ecx
    mov ecx, dword [edx + 0x19136c]
    mov dword [ebp - 0x18], ecx
    cmp byte [edx + 0x19137c], 0x3c
    jbe short loc_241a6
    mov ecx, dword [ebp + 8]
    push ecx
    push dword 0x400
    push dword 0x400
    push dword 0x400
    jmp short loc_241b9
loc_241a6:
    mov ecx, dword [ebp + 8]
    push ecx
    push dword 0x400
    push dword 0x400
    push dword 0xc0
loc_241b9:
    push ebx
    mov edx, dword [ebp - 0x14]
    lea ecx, [ebp - 0x10]
    push edx
    lea ebx, [ebp - 0x28]
    mov edx, edi
    call CLIP_MOVE
    mov ebx, eax
    mov edi, dword [ebp - 0x10]
    test di, di
    jl short loc_24205
    jl near loc_242ba
    movsx edx, si
    lea eax, [edx*8]
    add eax, edx
    shl eax, 3
    sub eax, edx
    mov dx, word [eax + 0x20445]
    test dx, dx
    jl near loc_242ba
    cmp dx, di
    je near loc_242ba
loc_24205:
    movsx ecx, si
    lea eax, [ecx*4]
    sub eax, ecx
    shl eax, 2
    sub eax, ecx
    lea edx, [eax*4]
    mov eax, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x12]
    mov dword [edx + 0x191368], eax
    mov eax, dword [ebp - 0x18]
    sar ebx, 0x10
    mov dword [edx + 0x19136c], eax
    lea eax, [ebx*4]
    add eax, ebx
    cmp word [nosplit eax*8 + 0x20a08a], 1
    je short loc_24265
    lea eax, [ecx*8]
    add eax, ecx
    shl eax, 3
    sub eax, ecx
    mov eax, dword [eax + 0x20467]
    and eax, 3
    cmp eax, 1
    jne short loc_24274
loc_24265:
    call KRAND
    and ah, 7
    mov word [edx + 0x191384], ax
loc_24274:
    movsx esi, si
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    sub eax, esi
    mov ebx, dword [ebp - 0x18]
    mov edx, dword [ebp - 0x1c]
    mov ecx, dword [nosplit eax*4 + 0x191370]
    mov eax, esi
    call SET_SPRITE
    cmp word [ebp - 0x10], 0
    jge short loc_242a6
    xor edx, edx
    mov word [ebp - 0x10], dx
loc_242a6:
    mov eax, dword [ebp - 0x12]
    sar eax, 0x10
    add eax, strict dword 0x4000
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_242ba:
    movsx eax, bx
    and eax, strict dword 0xc000
    cmp eax, strict dword 0x8000
    jl near loc_2434f
    movsx ecx, si
    lea eax, [ecx*8]
    add eax, ecx
    shl eax, 3
    sub eax, ecx
    cmp byte [eax + 0x20438], 0
    jne short loc_2434f
    lea eax, [ecx*4]
    sub eax, ecx
    shl eax, 2
    sub eax, ecx
    add byte [nosplit eax*4 + 0x191385], 3
    jmp short loc_2434f
loc_242ff:
    cmp word [edx + 0x191382], 4
    jne short loc_24328
    mov ecx, dword [ebp + 8]
    push ecx
    push dword 0x400
    push dword 0x400
    push byte 8
    push ebx
    mov edx, dword [ebp - 0x14]
    lea ecx, [ebp - 0x10]
    push edx
    lea ebx, [ebp - 0x28]
    mov edx, edi
    jmp short loc_24348
loc_24328:
    mov edx, dword [ebp + 8]
    push edx
    push dword 0x400
    push dword 0x400
    push dword 0x80
    push ebx
    mov ebx, dword [ebp - 0x14]
    lea ecx, [ebp - 0x10]
    push ebx
    mov edx, edi
    lea ebx, [ebp - 0x28]
loc_24348:
    call CLIP_MOVE
    mov ebx, eax
loc_2434f:
    cmp word [ebp - 0x10], 0
    jl short loc_24387
    movsx edi, si
    lea eax, [edi*4]
    sub eax, edi
    shl eax, 2
    sub eax, edi
    lea edx, [eax*4]
    mov eax, dword [ebp - 0x10]
    cmp ax, word [edx + 0x191380]
    je short loc_24387
    mov edx, dword [ebp - 0x12]
    mov eax, edi
    sar edx, 0x10
    call CHANGE_SPRITE_SECT
loc_24387:
    movsx esi, si
    lea ecx, [esi*4]
    sub ecx, esi
    shl ecx, 2
    mov eax, dword [ebp - 0x20]
    sub ecx, esi
    shl eax, 2
    shl ecx, 2
    sar eax, 3
    mov edx, dword [ecx + 0x191370]
    add edx, eax
    mov dword [ebp - 0x28], edx
    lea edx, [esi*8]
    add edx, esi
    shl edx, 3
    sub edx, esi
    mov eax, dword [ebp - 0x28]
    cmp eax, dword [edx + 0x2044f]
    jle short loc_243d8
    cmp eax, dword [edx + 0x2044b]
    jg short loc_243d8
    mov dword [ecx + 0x191370], eax
    jmp short loc_243f1
loc_243d8:
    test bx, bx
    jne short loc_243f1
    mov eax, dword [ebp - 0x12]
    sar eax, 0x10
    add eax, strict dword 0x4000
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
loc_243f1:
    movsx eax, bx
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    lea eax, [byte eax + 0]

ssp:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    mov ebx, edx
    movsx esi, ax
    lea eax, [esi*4]
    sub eax, esi
    shl eax, 2
    sub eax, esi
    shl eax, 2
    add eax, strict dword 0x191368
    push edx
    mov dx, word [eax + 0x1c]
    and dh, 7
    movsx edx, dx
    mov ebx, dword [nosplit edx*2 + 0x1bd566]
    mov edx, dword [eax + 0x1e]
    sar ebx, 0x10
    sar edx, 0x10
    imul ebx, edx
    mov ecx, dword [eax + 0x22]
    mov eax, dword [eax + 0x1a]
    sar eax, 0x10
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov eax, dword [nosplit eax*2 + 0x1bd566]
    sar eax, 0x10
    imul edx, eax
    sar ecx, 0x10
    sar ebx, 0xe
    sar edx, 0xe
    mov eax, esi
    call move_sprite
    test eax, eax
    sete al
    xor ah, ah
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
    push edx
    mov edx, eax
    cmp word [0x9370], 0
    jle short loc_244f1
    mov eax, dword [0xbf568]
    sar eax, 0x10
    add eax, eax
    cmp word [eax + 0x8b280], 0
    jl short loc_244c5
    mov ebx, dword [eax + 0x8b27e]
    sar ebx, 0x10
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    xor bl, bl
    mov byte [nosplit eax*4 + 0x19137c], bl
loc_244c5:
    mov eax, dword [0xbf568]
    sar eax, 0x10
    mov ebx, dword [0x936e]
    mov word [nosplit eax*2 + 0x8b280], dx
    lea edx, [eax + 1]
    sar ebx, 0x10
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov word [0xbf56a], dx
    jmp short loc_24512
loc_244f1:
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    xor dl, dl
    mov byte [nosplit eax*4 + 0x19137d], dl
    mov byte [nosplit eax*4 + 0x19137c], dl
loc_24512:
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

spawn_money:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov edi, edx
    test dx, dx
    jle short loc_24590
loc_2452c:
    push byte 5
    push byte 0
    push byte 0
    push byte 0
    call KRAND
    and ah, 7
    cwde
    push eax
    push byte 8
    push byte 8
    push byte -0x20
    push dword 0x51e
    call KRAND
    mov edx, eax
    mov ebx, 0x2f00
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov eax, dword [esi + 0x16]
    sub ecx, edx
    sar eax, 0x10
    mov edx, dword [esi]
    call EGS
    mov edx, eax
    call KRAND
    mov ebx, eax
    xor bh, ah
    movsx eax, dx
    imul eax, eax, 0x2c
    and bl, 0xc
    dec edi
    mov word [eax + 0x191374], bx
    test di, di
    jg short loc_2452c
loc_24590:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

spawn_mail:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov edi, edx
    test dx, dx
    jle short loc_24610
loc_245ac:
    push byte 5
    push byte 0
    push byte 0
    push byte 0
    call KRAND
    and ah, 7
    cwde
    push eax
    push byte 8
    push byte 8
    push byte -0x20
    push dword 0x51e
    call KRAND
    mov edx, eax
    mov ebx, 0x2f00
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov eax, dword [esi + 0x16]
    sub ecx, edx
    sar eax, 0x10
    mov edx, dword [esi]
    call EGS
    mov edx, eax
    call KRAND
    mov ebx, eax
    xor bh, ah
    movsx eax, dx
    imul eax, eax, 0x2c
    and bl, 0xc
    dec edi
    mov word [eax + 0x191374], bx
    test di, di
    jg short loc_245ac
loc_24610:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

spawn_paper:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov edi, edx
    test dx, dx
    jle short loc_24690
loc_2462c:
    push byte 5
    push byte 0
    push byte 0
    push byte 0
    call KRAND
    and ah, 7
    cwde
    push eax
    push byte 8
    push byte 8
    push byte -0x20
    push dword 0x51e
    call KRAND
    mov edx, eax
    mov ebx, 0x2f00
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov eax, dword [esi + 0x16]
    sub ecx, edx
    sar eax, 0x10
    mov edx, dword [esi]
    call EGS
    mov edx, eax
    call KRAND
    mov ebx, eax
    xor bh, ah
    movsx eax, dx
    imul eax, eax, 0x2c
    and bl, 0xc
    dec edi
    mov word [eax + 0x191374], bx
    test di, di
    jg short loc_2462c
loc_24690:
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
    push esi
    push edi
    sub esp, 0x1c
    mov esi, eax
    mov word [ebp - 0x20], dx
    mov dword [ebp - 0x1c], ebx
    mov word [ebp - 0x18], cx
    call BADGUY
    test ax, ax
    je short loc_246cb
    cmp byte [esi + 0x14], 0x10
    jae short loc_246cb
    mov bl, 8
    mov byte [ebp - 0x10], bl
    mov byte [ebp - 0x14], bl
    jmp short loc_246d3
loc_246cb:
    mov dl, 0x20
    mov byte [ebp - 0x10], dl
    mov byte [ebp - 0x14], dl
loc_246d3:
    mov eax, dword [esi + 8]
    sub eax, strict dword 0x800
    mov ebx, dword [esi + 4]
    mov dword [ebp - 0x24], eax
    mov eax, dword [esi + 0x16]
    mov edx, dword [esi]
    sar eax, 0x10
    call GET_FLOOR_Z_OF_SLOPE
    mov edx, dword [ebp - 0x24]
    sub eax, strict dword 0x800
    cmp eax, edx
    jge short loc_246fd
    mov dword [ebp - 0x24], eax
loc_246fd:
    mov eax, esi
    call BADGUY
    test ax, ax
    je short loc_24716
    mov cl, byte [esi + 0x11]
    cmp cl, 6
    jne short loc_24716
    mov byte [ebp - 0xc], cl
    jmp short loc_24744
loc_24716:
    cmp word [esi + 0xe], 0x1400
    jne short loc_2472b
    mov ch, byte [esi + 0x11]
    cmp ch, 8
    jne short loc_2472b
    mov byte [ebp - 0xc], ch
    jmp short loc_24744
loc_2472b:
    cmp word [esi + 0xe], 0x1400
    jne short loc_2473f
    mov al, byte [esi + 0x11]
    cmp al, 0x13
    jne short loc_2473f
    mov byte [ebp - 0xc], al
    jmp short loc_24744
loc_2473f:
    xor ah, ah
    mov byte [ebp - 0xc], ah
loc_24744:
    mov ecx, dword [ebp - 0x1c]
    xor edi, edi
    test cx, cx
    jle near loc_24825
loc_24752:
    call KRAND
    and ah, 7
    mov edx, eax
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c106]
    push byte 5
    sar eax, 0x10
    push eax
    mov ebx, 0xfffffe00
    call KRAND
    and eax, strict dword 0x7ff
    sub ebx, eax
    push ebx
    call KRAND
    xor ah, ah
    and al, 0x1f
    add eax, strict dword 0x30
    cwde
    push eax
    movsx eax, dx
    push eax
    xor eax, eax
    mov al, byte [ebp - 0x10]
    sar eax, 1
    movsx eax, al
    push eax
    xor eax, eax
    mov al, byte [ebp - 0x14]
    sar eax, 1
    movsx eax, al
    push eax
    mov eax, dword [ebp - 0x22]
    push byte -0x20
    sar eax, 0x10
    push eax
    mov ecx, dword [ebp - 0x24]
    call KRAND
    and eax, strict dword 0x1fff
    sub ecx, eax
    call KRAND
    and eax, strict dword 0xff
    mov ebx, dword [esi + 4]
    add ebx, eax
    call KRAND
    and eax, strict dword 0xff
    mov edx, dword [esi]
    add edx, eax
    mov eax, dword [esi + 0x16]
    sub ebx, strict dword 0x80
    sar eax, 0x10
    sub edx, strict dword 0x80
    call EGS
    mov bh, byte [ebp - 0xc]
    cmp bh, 6
    je short loc_2480e
    cmp bh, 8
    je short loc_2480e
    cmp bh, 0x13
    jne short loc_24818
loc_2480e:
    cwde
    imul eax, eax, 0x2c
    mov byte [eax + 0x191379], bh
loc_24818:
    mov eax, dword [ebp - 0x1c]
    inc edi
    cmp di, ax
    jl near loc_24752
loc_24825:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x18
    mov esi, eax
    mov word [ebp - 0x18], dx
    mov dword [ebp - 0x1c], ebx
    mov word [ebp - 0x14], cx
    call BADGUY
    test ax, ax
    je short loc_2485b
    cmp byte [esi + 0x14], 0x10
    jae short loc_2485b
    mov bl, 8
    mov byte [ebp - 0xc], bl
    mov byte [ebp - 0x10], bl
    jmp short loc_24863
loc_2485b:
    mov dl, 0x20
    mov byte [ebp - 0xc], dl
    mov byte [ebp - 0x10], dl
loc_24863:
    mov eax, dword [esi + 8]
    sub eax, strict dword 0x800
    mov ebx, dword [esi + 4]
    mov dword [ebp - 0x20], eax
    mov eax, dword [esi + 0x16]
    mov edx, dword [esi]
    sar eax, 0x10
    call GET_FLOOR_Z_OF_SLOPE
    mov edx, dword [ebp - 0x20]
    sub eax, strict dword 0x800
    cmp eax, edx
    jge short loc_2488d
    mov dword [ebp - 0x20], eax
loc_2488d:
    mov edx, dword [ebp - 0x1c]
    xor edi, edi
    test dx, dx
    jle short loc_2490d
loc_24897:
    call KRAND
    and ah, 7
    mov edx, eax
    mov eax, dword [ebp - 0x16]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c106]
    push byte 5
    sar eax, 0x10
    push eax
    mov ebx, 0xfffffe00
    call KRAND
    and eax, strict dword 0x7ff
    sub ebx, eax
    push ebx
    call KRAND
    xor ah, ah
    and al, 0x7f
    inc ah
    cwde
    push eax
    movsx eax, dx
    push eax
    mov eax, dword [ebp - 0xf]
    sar eax, 0x18
    push eax
    mov eax, dword [ebp - 0x13]
    sar eax, 0x18
    push eax
    mov ecx, dword [ebp - 0x20]
    mov eax, dword [ebp - 0x1a]
    push byte -0x20
    sar eax, 0x10
    mov ebx, dword [esi + 4]
    push eax
    mov eax, dword [esi + 0x16]
    mov edx, dword [esi]
    sar eax, 0x10
    inc edi
    call EGS
    cmp di, word [ebp - 0x1c]
    jl short loc_24897
loc_2490d:
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
    push edi
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edx, dword [nosplit eax*4 + 0x19137e]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov ebx, dword [nosplit eax*8 + 0x20a066]
    mov edi, dword [nosplit eax*8 + 0x20a068]
    sar ebx, 0x10
    sar edi, 0x10
    add edi, ebx
    mov edx, ebx
    cmp ebx, edi
    jge near loc_249d6
    shl ebx, 5
    add ebx, 4
    add ebx, strict dword 0x1be568
loc_2496c:
    mov ecx, edx
    mov eax, 0x1be568
    shl ecx, 5
    add eax, ecx
    call set_interpolation
    mov eax, ebx
    call set_interpolation
    mov eax, dword [ecx + 0x1be570]
    sar eax, 0x10
    test eax, eax
    jl short loc_249ce
    mov esi, eax
    mov ecx, 0x1be568
    shl esi, 5
    add ecx, esi
    mov eax, ecx
    call set_interpolation
    lea eax, [ecx + 4]
    call set_interpolation
    mov eax, dword [esi + 0x1be56e]
    sar eax, 0x10
    mov ecx, 0x1be568
    shl eax, 5
    add ecx, eax
    mov eax, ecx
    call set_interpolation
    lea eax, [ecx + 4]
    call set_interpolation
loc_249ce:
    inc edx
    add ebx, 0x20
    cmp edx, edi
    jl short loc_2496c
loc_249d6:
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
    push esi
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov edx, dword [nosplit eax*4 + 0x19137e]
    sar edx, 0x10
    lea eax, [edx*4]
    add edx, eax
    shl edx, 3
    mov ax, word [edx + 0x20a068]
    mov si, word [edx + 0x20a06a]
    add esi, eax
    mov ebx, eax
    cmp ax, si
    jge short loc_24a80
loc_24a25:
    movsx edx, bx
    mov ecx, 0x1be568
    shl edx, 5
    add ecx, edx
    mov eax, ecx
    call stop_interpolation
    lea eax, [ecx + 4]
    call stop_interpolation
    cmp word [edx + 0x1be572], 0
    jl short loc_24a7a
    mov eax, dword [edx + 0x1be570]
    sar eax, 0x10
    shl eax, 5
    add eax, strict dword 0x1be568
    call stop_interpolation
    mov eax, dword [edx + 0x1be570]
    sar eax, 0x10
    shl eax, 5
    add eax, strict dword 0x1be568
    add eax, 4
    call stop_interpolation
loc_24a7a:
    inc ebx
    cmp bx, si
    jl short loc_24a25
loc_24a80:
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
    push edx
    push esi
    push edi
    sub esp, 0x18
    movsx ebx, ax
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov edx, 0x191368
    shl eax, 2
    add edx, eax
    mov eax, dword [edx + 0x1a]
    sar eax, 0x10
    add eax, strict dword 0x200
    and eax, strict dword 0x7ff
    mov dword [ebp - 0x1c], edx
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    mov eax, dword [ebp - 0x1c]
    mov eax, dword [eax + 0x1e]
    sar edx, 0x10
    sar eax, 0x10
    imul eax, edx
    mov edx, dword [ebp - 0x1c]
    sar eax, 0xe
    mov ecx, dword [edx]
    add ecx, eax
    mov ax, word [edx + 0x1c]
    and ah, 7
    cwde
    mov dword [edx], ecx
    mov edx, dword [nosplit eax*2 + 0x1bd566]
    mov eax, dword [ebp - 0x1c]
    mov eax, dword [eax + 0x1e]
    sar edx, 0x10
    sar eax, 0x10
    imul eax, edx
    mov edx, dword [ebp - 0x1c]
    sar eax, 0xe
    mov esi, dword [edx + 4]
    add esi, eax
    lea eax, [ebx*8]
    add eax, ebx
    shl eax, 3
    sub eax, ebx
    mov dword [edx + 4], esi
    mov edx, dword [eax + 0x2046b]
    mov dword [ebp - 0x20], edx
    mov edx, dword [ebp - 0x1c]
    mov edx, dword [edx + 0x16]
    sar edx, 0x10
    mov ebx, dword [eax + 0x2046f]
    lea eax, [edx*4]
    add edx, eax
    shl edx, 3
    mov ax, word [edx + 0x20a068]
    mov dx, word [edx + 0x20a06a]
    add edx, eax
    mov esi, eax
    mov dword [ebp - 0x18], edx
    cmp ax, dx
    jge short loc_24bbf
    and ebx, strict dword 0x7ff
    mov edi, dword [ebp - 0x20]
    mov dword [ebp - 0x24], ebx
    shl edi, 2
loc_24b6e:
    lea eax, [ebp - 0x2c]
    push eax
    lea eax, [ebp - 0x28]
    mov ecx, dword [edi + 0xb8c90]
    push eax
    mov eax, dword [ebp - 0x24]
    mov ebx, dword [edi + 0xbac90]
    push eax
    xor edx, edx
    xor eax, eax
    call 0x450d9
    mov ebx, dword [ebp - 0x1c]
    mov edx, dword [ebp - 0x2c]
    mov ebx, dword [ebx + 4]
    add ebx, edx
    mov edx, dword [ebp - 0x1c]
    mov ecx, dword [ebp - 0x28]
    mov edx, dword [edx]
    movsx eax, si
    add edx, ecx
    add edi, 4
    call 0x42fe5
    mov eax, dword [ebp - 0x20]
    inc esi
    inc eax
    mov ebx, dword [ebp - 0x18]
    mov dword [ebp - 0x20], eax
    cmp si, bx
    jl short loc_24b6e
loc_24bbf:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

move_cyclers:
    push ebp
    mov ebp, esp
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov ebx, eax
    mov ax, word [0x216f96]
    test ax, ax
    jl short loc_24c1b
loc_24be7:
    movsx edx, ax
    imul edx, edx, 0x2c
    mov cx, word [edx + 0x191376]
    cmp cx, 0x5a1
    je short loc_24c20
    cmp cx, 0x5a2
    jne short loc_24c0b
    cmp bx, word [edx + 0x191380]
    je short loc_24c20
loc_24c0b:
    movsx edx, ax
    mov ax, word [nosplit edx*2 + 0x18cf68]
    test ax, ax
    jge short loc_24be7
loc_24c1b:
    mov eax, 0xffffffff
loc_24c20:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 8 db 0    ; Object alignment
    push ebp
    mov ebp, esp
    mov eax, 0x2950
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2970
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

move_dummy_players:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    mov ax, word [0x216fa6]
    test ax, ax
    jl near loc_24e1b
loc_24c72:
    movsx esi, ax
    imul ebx, esi, 0x2c
    mov dx, word [nosplit esi*2 + 0x18cf68]
    mov dword [ebp - 0x18], edx
    mov edx, dword [ebx + 0x191384]
    sar edx, 0x10
    imul edx, edx, 0x2c
    mov dx, word [edx + 0x19138a]
    mov word [ebp - 0x1c], dx
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov ecx, dword [edx + 0x8c0a8]
    sar ecx, 0x10
    imul ecx, ecx, 0x28
    mov di, word [ecx + 0x20a08a]
    mov dword [ebp - 0x20], ecx
    cmp di, 1
    jne short loc_24cd8
    mov ecx, dword [edx + 0x8c106]
    sar ecx, 0x10
    imul ecx, ecx, 0x2c
    cmp word [ecx + 0x191392], 0
    jg short loc_24cfb
loc_24cd8:
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov ebx, 0xffffffff
    cwde
    mov word [edx + 0x8c116], bx
    call DELETE_SPRITE
    jmp near loc_24e0f
loc_24cfb:
    cmp byte [edx + 0x8c352], 0
    je near loc_24d79
    cmp byte [edx + 0x8c34d], 1
    jne short loc_24d79
    mov ecx, dword [ebp - 0x20]
    cmp word [ecx + 0x20a08a], 1
    jne short loc_24d79
    mov ecx, dword [ebx + 0x19137e]
    sar ecx, 0x10
    imul ecx, ecx, 0x28
    mov dx, word [edx + 0x8c0a4]
    mov word [ebx + 0x191384], dx
    imul edx, esi, 0x47
    mov edi, 0x101
    mov ecx, dword [ecx + 0x20a06c]
    mov word [ebx + 0x191374], di
    add ecx, strict dword 0x1b00
    mov dword [ebx + 0x191370], ecx
    mov ebx, dword [edx + 0x20467]
    cmp ebx, 8
    jne short loc_24d6e
    xor esi, esi
    mov dword [edx + 0x20467], esi
    jmp short loc_24db0
loc_24d6e:
    lea ecx, [ebx + 1]
    mov dword [edx + 0x20467], ecx
    jmp short loc_24db0
loc_24d79:
    movsx ebx, ax
    imul ebx, ebx, 0x2c
    mov edx, dword [ebx + 0x19137e]
    sar edx, 0x10
    imul edx, edx, 0x28
    cmp word [edx + 0x20a08a], 2
    je short loc_24da1
    mov edx, dword [edx + 0x20a070]
    mov dword [ebx + 0x191370], edx
loc_24da1:
    movsx edx, ax
    imul edx, edx, 0x2c
    mov word [edx + 0x191374], 0x8000
loc_24db0:
    mov edx, dword [ebp - 0x1e]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    movsx esi, ax
    imul eax, esi, 0x2c
    mov ebx, dword [edx + 0x8c024]
    mov edi, dword [edx + 0x8c048]
    mov ecx, dword [eax + 0x191368]
    sub ebx, edi
    mov edi, dword [edx + 0x8c04c]
    add ecx, ebx
    mov ebx, dword [edx + 0x8c028]
    mov edx, dword [eax + 0x19136c]
    sub ebx, edi
    mov dword [eax + 0x191368], ecx
    add edx, ebx
    mov ecx, dword [eax + 0x191370]
    mov dword [eax + 0x19136c], edx
    mov ebx, edx
    mov edx, dword [eax + 0x191368]
    mov eax, esi
    call SET_SPRITE
loc_24e0f:
    mov eax, dword [ebp - 0x18]
    test ax, ax
    jge near loc_24c72
loc_24e1b:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

move_players:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    mov di, word [0x216fa0]
    test di, di
    jl near loc_251ba
loc_24e43:
    movsx eax, di
    imul esi, eax, 0x2c
    mov dx, word [nosplit eax*2 + 0x18cf68]
    add esi, strict dword 0x191368
    mov dword [ebp - 0x18], edx
    mov edx, dword [esi + 0x20]
    sar edx, 0x10
    mov dword [ebp - 0x20], edx
    imul ecx, edx, strict dword 0x623
    imul edx, eax, 0x47
    mov bx, word [esi + 0x1e]
    add ecx, strict dword 0x8be10
    test bx, bx
    jl near loc_25086
    cmp word [ecx + 0x2d4], 0
    jl short loc_24ec5
    mov ebx, dword [ecx + 0x238]
    mov dword [esi], ebx
    mov ebx, dword [ecx + 0x23c]
    mov dword [esi + 4], ebx
    mov ebx, dword [ecx + 0x240]
    add ebx, strict dword 0x2800
    mov dword [esi + 8], ebx
    mov dword [edx + 0x20463], ebx
    mov dx, word [ecx + 0x296]
    mov word [esi + 0x1c], dx
    mov ebx, dword [esi + 4]
    mov ecx, dword [esi + 8]
    jmp near loc_25175
loc_24ec5:
    cmp dword [0xbffe3], 1
    jle short loc_24ee1
    lea edx, [ebp - 0x1c]
    mov eax, dword [ebp - 0x20]
    call 0x28d9c
    mov word [0xc3398], ax
    jmp short loc_24ef0
loc_24ee1:
    mov ax, word [esi + 0x22]
    xor ebx, ebx
    mov word [0xc3398], ax
    mov dword [ebp - 0x1c], ebx
loc_24ef0:
    mov ebx, dword [ebp - 0x1c]
    mov edx, dword [esi + 0x20]
    movsx eax, di
    sar edx, 0x10
    call EXECUTE_ACTOR_SCRIPT
    cmp dword [0xbffe3], 1
    jle short loc_24f70
    mov eax, dword [0xc3396]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c106]
    sar edx, 0x10
    imul edx, edx, 0x2c
    cmp word [edx + 0x191392], 0
    jle short loc_24f70
    cmp byte [esi + 0x15], 0x20
    jbe short loc_24f70
    cmp byte [edx + 0x19137d], 0x20
    jae short loc_24f70
    cmp dword [ebp - 0x1c], strict dword 0x578
    jge short loc_24f70
    cmp word [ecx + 0x2e0], 0
    jne short loc_24f70
    mov word [ecx + 0x2e0], 1
    mov word [ecx + 0x52a], 0xffff
    mov ax, word [eax + 0x8c108]
    mov word [ecx + 0x30e], ax
loc_24f70:
    cmp byte [0xbf570], 0
    je short loc_24f89
    mov ax, word [0xbf378]
    mov word [esi + 0xc], 0x101
    mov word [esi + 0x2a], ax
loc_24f89:
    cmp word [esi + 0x2a], 0
    jle short loc_24fd9
    movsx eax, di
    imul eax, eax, 0x47
    mov dl, byte [0xbf570]
    mov word [eax + 0x2043f], di
    test dl, dl
    jne near loc_25076
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    call ceiling_space
    test eax, eax
    jne short loc_24fcd
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    call floor_space
    test eax, eax
    je near loc_25076
loc_24fcd:
    mov eax, ecx
    call 0x29578
    jmp near loc_25076
loc_24fd9:
    mov eax, dword [esi]
    mov dword [ecx + 0x214], eax
    mov eax, dword [esi + 4]
    mov dword [ecx + 0x218], eax
    mov eax, dword [esi + 8]
    mov word [ecx + 0x2d4], 0xffff
    sub eax, strict dword 0x1400
    mov di, word [ecx + 0x2c2]
    mov dword [ecx + 0x21c], eax
    test di, di
    jl short loc_25076
    mov edx, dword [ecx + 0x2c0]
    sar edx, 0x10
    imul edx, edx, 0x2c
    cmp word [edx + 0x191382], 0x400
    jge short loc_25076
    mov eax, dword [edx + 0x19136c]
    sub eax, dword [ecx + 0x218]
    mov edi, dword [ecx + 0x214]
    mov ebx, eax
    mov eax, dword [edx + 0x191368]
    mov edx, ebx
    sub eax, edi
    call GET_ANGLE
    movsx edx, ax
    mov eax, dword [ecx + 0x292]
    sar eax, 0x10
    call GET_INC_ANGLE
    cwde
    mov edx, eax
    mov eax, dword [ecx + 0x292]
    sar edx, 1
    sar eax, 0x10
    add eax, edx
    mov word [ecx + 0x294], ax
    and byte [ecx + 0x295], 7
loc_25076:
    mov ax, word [ecx + 0x294]
    mov word [esi + 0x1c], ax
    jmp near loc_2517c
loc_25086:
    mov ebx, dword [ecx + 0x524]
    sar ebx, 0x10
    cmp ebx, -1
    jne short loc_2509e
    call DELETE_SPRITE
    jmp near loc_251ae
loc_2509e:
    mov eax, dword [esi]
    mov dword [edx + 0x2045b], eax
    mov eax, dword [esi + 4]
    mov dword [edx + 0x2045f], eax
    mov eax, dword [esi + 8]
    mov dword [edx + 0x20463], eax
    mov ah, byte [esi + 0x14]
    mov word [esi + 0xc], 0
    cmp ah, 0x2a
    jae short loc_250d4
    mov dl, ah
    add dl, 4
    mov byte [esi + 0x14], dl
    or byte [esi + 0xc], 2
    jmp short loc_250d8
loc_250d4:
    mov byte [esi + 0x14], 0x2a
loc_250d8:
    mov bl, byte [esi + 0x15]
    cmp bl, 0x24
    jae short loc_250ea
    mov bh, bl
    add bh, 4
    mov byte [esi + 0x15], bh
    jmp short loc_2512a
loc_250ea:
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    imul eax, eax, 0x28
    mov byte [esi + 0x15], 0x24
    cmp word [eax + 0x20a08a], 2
    je short loc_25109
    movsx eax, di
    call MAKE_IT_FALL
loc_25109:
    cmp word [esi + 0x24], 0
    jne short loc_2512a
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    imul eax, eax, 0x28
    cmp word [eax + 0x20a08a], 1
    jne short loc_2512a
    add dword [esi + 8], strict dword 0x2000
loc_2512a:
    cmp word [esi + 0x2a], 8
    jge short loc_2515a
    mov word [esi + 0x20], 0x80
    mov edx, 0x10001
    mov ax, word [ecx + 0x294]
    mov cx, word [esi + 0x2a]
    mov word [esi + 0x1c], ax
    inc ecx
    movsx eax, di
    mov word [esi + 0x2a], cx
    call ssp
    jmp short loc_2517c
loc_2515a:
    mov edx, 0x7ff
    mov ax, word [ecx + 0x294]
    mov ebx, dword [esi + 4]
    sub edx, eax
    mov ecx, dword [esi + 8]
    mov word [esi + 0x1c], dx
    movsx eax, di
loc_25175:
    mov edx, dword [esi]
    call SET_SPRITE
loc_2517c:
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    imul eax, eax, 0x28
    test byte [eax + 0x20a074], 1
    je short loc_25196
    mov edx, dword [eax + 0x20a079]
    jmp short loc_2519c
loc_25196:
    mov edx, dword [eax + 0x20a081]
loc_2519c:
    mov eax, dword [esi + 0xd]
    sar edx, 0x18
    sar eax, 0x18
    sub edx, eax
    sar edx, 1
    add eax, edx
    mov byte [esi + 0x10], al
loc_251ae:
    mov edi, dword [ebp - 0x18]
    test di, di
    jge near loc_24e43
loc_251ba:
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
    mov eax, 0x298c
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

move_fallers:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xc
    mov ax, word [0x216fa4]
    mov word [ebp - 0x18], ax
    test ax, ax
    jl near loc_25502
loc_251f6:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul esi, eax, 0x2c
    mov dx, word [nosplit eax*2 + 0x18cf68]
    mov dword [ebp - 0x20], edx
    imul edx, eax, 0x47
    add esi, strict dword 0x191368
    mov ecx, dword [edx + 0x20467]
    mov bx, word [esi + 0x18]
    test ecx, ecx
    jne near loc_2533e
    sub dword [esi + 8], strict dword 0x1000
    mov ebx, dword [esi + 0x1a]
    sar ebx, 0x10
    mov dword [edx + 0x2046b], ebx
    mov edi, dword [esi + 0x28]
    call 0x24c30
    sar edi, 0x10
    test ax, ax
    jl near loc_25319
    cmp ax, strict word 0x6ee
    je short loc_2526e
    cmp ax, strict word 0x6f5
    je short loc_2526e
    cmp ax, strict word 0x592
    je short loc_2526e
    cmp ax, strict word 0x52c
    je short loc_2526e
    cmp ax, strict word 0x4f9
    jne near loc_2530c
loc_2526e:
    cmp word [esi + 0x2a], 0
    jg near loc_25319
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul eax, eax, 0x47
    mov ecx, 1
    mov dx, word [0x216fa4]
    mov dword [eax + 0x20467], ecx
    test dx, dx
    jl near loc_25319
loc_2529d:
    movsx edi, dx
    imul eax, edi, 0x2c
    mov ebx, dword [ebp - 0x1a]
    sar ebx, 0x10
    imul ebx, ebx, 0x2c
    mov cx, word [eax + 0x191390]
    cmp cx, word [ebx + 0x191390]
    jne short loc_252fa
    imul edi, edi, 0x47
    mov dword [edi + 0x20467], 1
    mov bl, byte [eax + 0x191374]
    and bl, 0xbf
    mov di, word [eax + 0x191376]
    mov byte [eax + 0x191374], bl
    cmp di, 0x534
    je short loc_252ed
    cmp di, 0x52f
    jne short loc_252fa
loc_252ed:
    movsx eax, dx
    imul eax, eax, 0x2c
    or byte [eax + 0x191375], 0x80
loc_252fa:
    movsx edx, dx
    mov dx, word [nosplit edx*2 + 0x18cf68]
    test dx, dx
    jge short loc_2529d
    jmp short loc_25319
loc_2530c:
    xor ebx, ebx
    mov word [edx + 0x2043d], bx
    mov word [esi + 0x2a], di
loc_25319:
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    imul eax, eax, 0x47
    mov ecx, dword [esi + 8]
    mov ax, word [eax + 0x2046b]
    add ecx, strict dword 0x1000
    mov word [esi + 0x1c], ax
    mov dword [esi + 8], ecx
    jmp near loc_254f2
loc_2533e:
    cmp ecx, 1
    jne near loc_254f2
    mov cx, word [esi + 0x26]
    test cx, cx
    jle short loc_25387
    mov eax, ecx
    sub eax, 3
    mov word [esi + 0x26], ax
    call KRAND
    add eax, strict dword 0x40
    xor ah, ah
    and al, 0x7f
    mov word [esi + 0x20], ax
    call KRAND
    and ah, 3
    add ah, 4
    mov edx, eax
    mov word [esi + 0x24], ax
    neg edx
    mov word [esi + 0x24], dx
    jmp near loc_254f2
loc_25387:
    mov di, word [esi + 0x20]
    test di, di
    jle short loc_253a3
    mov edx, edi
    sub edx, 2
    mov word [esi + 0x20], dx
    mov edx, 0x10001
    call ssp
loc_253a3:
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    call floor_space
    test eax, eax
    je short loc_253b6
    xor edi, edi
    jmp short loc_253e0
loc_253b6:
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    call ceiling_space
    test eax, eax
    je short loc_253da
    mov eax, dword [0xbf330]
    mov edx, eax
    mov ecx, 6
    sar edx, 0x1f
    idiv ecx
    mov edi, eax
    jmp short loc_253e0
loc_253da:
    mov edi, dword [0xbf330]
loc_253e0:
    movsx eax, bx
    imul eax, eax, 0x28
    mov eax, dword [eax + 0x20a070]
    mov edx, dword [esi + 8]
    sub eax, strict dword 0x100
    cmp eax, edx
    jle short loc_2541d
    mov cx, word [esi + 0x24]
    add ecx, edi
    mov word [esi + 0x24], cx
    cmp cx, 0x1800
    jle short loc_2540f
    mov word [esi + 0x24], 0x1800
loc_2540f:
    mov eax, dword [esi + 0x22]
    mov ecx, dword [esi + 8]
    sar eax, 0x10
    add ecx, eax
    mov dword [esi + 8], ecx
loc_2541d:
    movsx eax, bx
    imul eax, eax, 0x28
    mov edi, dword [esi + 8]
    mov eax, dword [eax + 0x20a070]
    sub eax, edi
    cmp eax, strict dword 0x1000
    jge near loc_254f2
    call KRAND
    xor ah, ah
    and al, 7
    inc eax
    xor edi, edi
    mov word [ebp - 0x1c], ax
    jmp near loc_254d9
loc_2544e:
    mov eax, dword [ebp - 0x1a]
    push byte 5
    sar eax, 0x10
    push eax
    mov edx, 0xfffffe00
    call KRAND
    and eax, strict dword 0x7ff
    sub edx, eax
    push edx
    call KRAND
    xor ah, ah
    and al, 0x3f
    add eax, strict dword 0x40
    cwde
    push eax
    call KRAND
    and ah, 7
    cwde
    push eax
    push byte 0x10
    push byte 0x10
    push byte -8
    call KRAND
    xor ah, ah
    and al, 0xf
    add eax, strict dword 0x63b
    cwde
    mov ecx, dword [esi + 8]
    push eax
    sub ecx, strict dword 0x800
    call KRAND
    and eax, strict dword 0x1fff
    sub ecx, eax
    call KRAND
    and eax, strict dword 0xff
    add eax, dword [esi + 4]
    lea ebx, [eax - 0x80]
    call KRAND
    and eax, strict dword 0xff
    add eax, dword [esi]
    lea edx, [eax - 0x80]
    mov eax, dword [esi + 0x16]
    sar eax, 0x10
    inc edi
    call EGS
loc_254d9:
    mov eax, dword [ebp - 0x1e]
    sar eax, 0x10
    cmp edi, eax
    jl near loc_2544e
    mov eax, dword [ebp - 0x1a]
    sar eax, 0x10
    call DELETE_SPRITE
loc_254f2:
    mov eax, dword [ebp - 0x20]
    mov word [ebp - 0x18], ax
    test ax, ax
    jge near loc_251f6
loc_25502:
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
    mov eax, 0x29a4
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 3 db 0    ; Object alignment

empty_entry_before_move_weapons:
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
    nop

move_transports:
    push ebp
    mov ebp, esp
    mov eax, 0x29c4
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 15 db 0    ; Object alignment

move_actors:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov dx, word [eax + 0x8c419]
    test dx, dx
    jle short loc_255b4
    mov ebx, edx
    dec bx
    mov word [eax + 0x8c419], bx
    jne short loc_255b4
    mov byte [eax + 0x8c34c], 8
    mov byte [0xbf573], 1
    mov edx, dword [0xbffeb]
    inc edx
    mov dword [0xbffeb], edx
    cmp edx, 6
    jle short loc_255aa
    xor ecx, ecx
    mov dword [0xbffeb], ecx
loc_255aa:
    mov eax, dword [0xbffeb]
    mov dword [0xbffdb], eax
loc_255b4:
    mov cx, word [0x216f8e]
    test cx, cx
    jl near loc_2566e
loc_255c4:
    movsx eax, cx
    imul ebx, eax, 0x2c
    add ebx, strict dword 0x191368
    mov di, word [nosplit eax*2 + 0x18cf68]
    mov dl, byte [ebx + 0x14]
    mov si, word [ebx + 0x18]
    test dl, dl
    je short loc_255ef
    test si, si
    jl short loc_255ef
    cmp si, 0x400
    jl short loc_255f9
loc_255ef:
    movsx eax, cx
    call DELETE_SPRITE
    jmp short loc_25663
loc_255f9:
    imul eax, eax, 0x47
    mov edx, dword [ebx]
    mov dword [eax + 0x2045b], edx
    mov edx, dword [ebx + 4]
    mov dword [eax + 0x2045f], edx
    mov edx, dword [ebx + 8]
    mov esi, dword [0xbffe3]
    mov dword [eax + 0x20463], edx
    cmp esi, 2
    jge short loc_2564b
    mov eax, ebx
    call BADGUY
    test ax, ax
    je short loc_2564b
    mov dh, byte [0x9689]
    cmp dh, 1
    jne short loc_25640
    mov word [ebx + 0xc], 0x8000
    jmp short loc_25663
loc_25640:
    cmp dh, 2
    jne short loc_2564b
    mov word [ebx + 0xc], 0x101
loc_2564b:
    lea edx, [ebp - 0x18]
    mov eax, ebx
    call 0x28c68
    mov ebx, dword [ebp - 0x18]
    movsx edx, ax
    movsx eax, cx
    call EXECUTE_ACTOR_SCRIPT
loc_25663:
    mov ecx, edi
    test di, di
    jge near loc_255c4
loc_2566e:
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
    mov eax, 0x29e4
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x2a00
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2a24
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2a44
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    mov eax, 0x2a60
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    mov eax, 0x2a7c
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 3 db 0    ; Object alignment

move_explosions:
    push ebp
    mov ebp, esp
    mov eax, 0x2a9c
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 15 db 0    ; Object alignment

move_effectors:
    push ebp
    mov ebp, esp
    mov eax, 0x2abc
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    times 15 db 0    ; Object alignment

dummy_func:
    push ebp
    mov ebp, esp
    mov eax, 0x2adc
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

ten_text:
    push ebp
    mov ebp, esp
    mov eax, 0x2af8
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov dx, word [0x9988]
    movsx ebx, ax
    mov dword [0xbd714], ebx
    cmp ax, strict word 0x3e8
    jl short loc_25779
    cmp ax, strict word 0x3f1
    jle short loc_257ba
loc_25779:
    test ax, ax
    jne short loc_25787
    mov dx, word [0xc45b8]
    jmp short loc_257b1
loc_25787:
    cmp ax, strict word 0x32
    jne short loc_25796
    mov dx, word [0xc45bc]
    jmp short loc_257b1
loc_25796:
    cmp ax, strict word 0x12c
    jl short loc_257ab
    cmp ax, strict word 0x190
    jge short loc_257ab
    mov dx, word [0x998e]
    jmp short loc_257b1
loc_257ab:
    cmp ax, strict word 0x6e
    xor edx, edx
loc_257b1:
    mov word [0x998a], 0xffff
loc_257ba:
    mov word [0x9988], dx
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret

save_temp:
    push ebp
    mov ebp, esp
    mov eax, 0x2b10
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

get_angle_players:
    push ebp
    mov ebp, esp
    mov eax, 0x2b28
    call PRINT_NOTICE
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]

load_player_header:
    push ebp
    mov ebp, esp
    mov eax, 0x2b48
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret 4
    lea eax, [byte eax + 0]

load_player:
    push ebp
    mov ebp, esp
    mov eax, 0x2b64
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop

save_player:
    push ebp
    mov ebp, esp
    mov eax, 0x2b80
    call PRINT_NOTICE
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    cmp byte [0x21ebd1], 0
    je short loc_2584d
    mov ecx, 1
    xor eax, eax
    mov dword [0x9994], ecx
    jmp short loc_2586c
loc_2584d:
    cmp dword [0x9994], 0
    je short loc_2586a
    xor ebx, ebx
    mov eax, 1
    mov dword [0x9994], ebx
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
loc_2586a:
    xor eax, eax
loc_2586c:
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
