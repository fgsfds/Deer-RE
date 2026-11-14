bits 32
org 0x519d0

%define PRINT_NOTICE 0x5130c
%define LOG_NUMBER 0x51350
%define KRAND 0x46fa0
%define SOUND 0x2be24
%define XYZ_SOUND 0x2b7a4

ambient_dispatch:
    dd loc_51a2d - 0x10000
    dd loc_51a32 - 0x10000
    dd loc_51a37 - 0x10000
    dd loc_51a3c - 0x10000
    dd loc_51a2d - 0x10000
    dd loc_51a32 - 0x10000

ambient_loop_poll:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov ecx, eax
    call 0x50fe0
    mov ebx, eax
    and ebx, 0x3f
    cmp ebx, 0x20
    jne short loc_51a47
    mov eax, 0x14
    call 0x57a60
    test eax, eax
    je short loc_51a47
    call 0x50fe0
    mov edx, eax
    mov ebx, 5
    sar edx, 0x1f
    idiv ebx
    mov ebx, edx
    cmp ecx, 5
    ja short loc_51a47
    jmp dword [cs:nosplit ecx*4 + ambient_dispatch - 0x10000]
loc_51a2d:
    add ebx, 0x3c
    jmp short loc_51a3f
loc_51a32:
    add ebx, 0x41
    jmp short loc_51a3f
loc_51a37:
    add ebx, 0x46
    jmp short loc_51a3f
loc_51a3c:
    add ebx, 0x4b
loc_51a3f:
    movsx eax, bx
    call 0x2be3c
loc_51a47:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

ambient_loop:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov eax, dword [0xbf560]
    mov edx, 0x4054
    sar eax, 0x10
    call 0x51408
    mov edx, dword [0xa25c]
    test edx, edx
    je short loc_51ac3
    jl short loc_51a7b
    cmp edx, strict dword 0x1f4
    jle short loc_51a87
loc_51a7b:
    mov eax, 0x4070
    call PRINT_NOTICE
    jmp short loc_51ac3
loc_51a87:
    lea eax, [edx*4]
    sub eax, edx
    cmp dword [edx + eax*4 + 0xbd9d1], 0
    jne short loc_51ac3
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ax, word [eax + 0x8c108]
    mov bx, word [0xa25c]
    movsx edx, ax
    xor eax, eax
    mov ax, bx
    call 0x2c0ac
loc_51ac3:
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

player_made_sound:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov ebx, eax
    mov eax, dword [0xbf560]
    mov edx, 0x4094
    sar eax, 0x10
    call 0x51408
    cmp ebx, 1
    jb short loc_51af5
    jbe short loc_51b28
    cmp ebx, 2
    je short loc_51b3f
    jmp short loc_51b56
loc_51af5:
    test ebx, ebx
    jne short loc_51b56
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov ax, word [eax + 0x8c108]
    movsx edx, ax
    mov eax, 0x53
    mov esi, 0x53
    call 0x2c0ac
    mov dword [0xa25c], esi
    jmp short loc_51b5e
loc_51b28:
    mov eax, 0x54
    mov ebx, 0x54
    call 0x2be3c
    mov dword [0xa25c], ebx
    jmp short loc_51b5e
loc_51b3f:
    mov eax, 0x55
    mov edx, 0x55
    call 0x2be3c
    mov dword [0xa25c], edx
    jmp short loc_51b5e
loc_51b56:
    xor ecx, ecx
    mov dword [0xa25c], ecx
loc_51b5e:
    lea esp, [ebp - 0x10]
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
    push edx
    mov eax, dword [0x216f7c]
    sub eax, dword [0xa260]
    cmp eax, strict dword 0xc8
    jge short loc_51b83
    xor eax, eax
    jmp short loc_51bc4
loc_51b83:
    call 0x50fe0
    and eax, 0x7f
    cmp eax, 0x40
    je short loc_51b99
    xor eax, eax
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
loc_51b99:
    mov eax, dword [0x216f7c]
    mov dword [0xa260], eax
    call 0x50fe0
    mov edx, eax
    mov ebx, 0xf
    sar edx, 0x1f
    idiv ebx
    mov eax, edx
    add eax, strict dword 0x3c
    cwde
    call 0x2be3c
    lea eax, [edx + 0x3c]
loc_51bc4:
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    nop

player_fired_gun_near:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    mov ebx, eax
    mov ecx, edx
    mov edx, 0x40ac
    call 0x513e4
    mov edx, 0x40c4
    movsx eax, cx
    call 0x51408
    mov ax, word [ebx + 0xe]
    cmp ax, strict word 0x1351
    jb short loc_51c08
    jbe short loc_51c2e
    cmp ax, strict word 0x1603
    jb short loc_51c4e
    jbe short loc_51c1e
    cmp ax, strict word 0x1a02
    je short loc_51c3e
    jmp short loc_51c4e
loc_51c08:
    cmp ax, strict word 0x10a4
    jne short loc_51c4e
    cmp dword [0xbdbe6], 0
    je short loc_51c1e
    mov eax, 1
    jmp short loc_51c50
loc_51c1e:
    cmp dword [0xbdbd9], 0
    je short loc_51c2e
    mov eax, 1
    jmp short loc_51c50
loc_51c2e:
    cmp dword [0xbdbf3], 0
    je short loc_51c3e
    mov eax, 1
    jmp short loc_51c50
loc_51c3e:
    cmp dword [0xbdc00], 0
    je short loc_51c4e
    mov eax, 1
    jmp short loc_51c50
loc_51c4e:
    xor eax, eax
loc_51c50:
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    cwde
    call 0x2be3c
    mov esp, ebp
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    movsx edx, dx
    and eax, strict dword 0xffff
    call 0x2c0ac
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push edx
    mov edx, dword [0xbf560]
    sar edx, 0x10
    imul edx, edx, strict dword 0x623
    mov dx, word [edx + 0x8c108]
    movsx edx, dx
    and eax, strict dword 0xffff
    call 0x2c0ac
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    lea eax, [byte eax + 0]

footstep_sound:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    mov ebx, eax
    mov ecx, edx
    mov edx, 0x40dc
    call 0x513e4
    movsx ecx, cx
    mov edx, 0x40f4
    mov eax, ecx
    call 0x51408
    imul edx, ecx, strict dword 0x623
    mov eax, dword [edx + 0x8c024]
    sub eax, dword [ebx]
    test eax, eax
    jns short loc_51ce4
    neg eax
loc_51ce4:
    mov ecx, eax
    mov esi, dword [ebx + 4]
    mov eax, dword [edx + 0x8c028]
    sub eax, esi
    test eax, eax
    jns short loc_51cf7
    neg eax
loc_51cf7:
    mov edi, dword [0xbd9de]
    add eax, ecx
    test edi, edi
    je short loc_51d14
    cmp eax, strict dword 0x5a00
    jge short loc_51d14
    mov eax, 1
    jmp near loc_521cf
loc_51d14:
    cmp dword [0xbd9eb], 0
    je short loc_51d2b
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51d2b:
    cmp dword [0xbd9f8], 0
    je short loc_51d49
    cmp eax, strict dword 0x5a00
    jge short loc_51d49
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51d49:
    cmp dword [0xbda05], 0
    je short loc_51d60
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51d60:
    cmp dword [0xbda12], 0
    je short loc_51d7e
    cmp eax, strict dword 0x5a00
    jge short loc_51d7e
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51d7e:
    cmp dword [0xbda1f], 0
    je short loc_51d95
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51d95:
    cmp dword [0xbda2c], 0
    je short loc_51db3
    cmp eax, strict dword 0x5a00
    jge short loc_51db3
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51db3:
    cmp dword [0xbda39], 0
    je short loc_51dd1
    cmp eax, strict dword 0x5a00
    jge short loc_51dd1
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51dd1:
    cmp dword [0xbdca9], 0
    je short loc_51def
    cmp eax, strict dword 0x5a00
    jge short loc_51def
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51def:
    cmp dword [0xbdcb6], 0
    je short loc_51e0d
    cmp eax, strict dword 0x5a00
    jge short loc_51e0d
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51e0d:
    cmp dword [0xbdcc3], 0
    je short loc_51e2b
    cmp eax, strict dword 0x5a00
    jge short loc_51e2b
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51e2b:
    cmp dword [0xbdcd0], 0
    je short loc_51e49
    cmp eax, strict dword 0x5a00
    jge short loc_51e49
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51e49:
    cmp dword [0xbdb16], 0
    je short loc_51e67
    cmp eax, strict dword 0x5400
    jge short loc_51e67
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51e67:
    cmp dword [0xbda60], 0
    je short loc_51e85
    cmp eax, strict dword 0x2a00
    jge short loc_51e85
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51e85:
    cmp dword [0xbda46], 0
    je short loc_51ea3
    cmp eax, strict dword 0x3c00
    jge short loc_51ea3
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51ea3:
    cmp dword [0xbda53], 0
    je short loc_51ec1
    cmp eax, strict dword 0x7800
    jge short loc_51ec1
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51ec1:
    cmp dword [0xbda6d], 0
    je short loc_51edf
    cmp eax, strict dword 0x4e00
    jge short loc_51edf
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51edf:
    cmp dword [0xbda94], 0
    je short loc_51efd
    cmp eax, strict dword 0x2a00
    jge short loc_51efd
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51efd:
    cmp dword [0xbda7a], 0
    je short loc_51f1b
    cmp eax, strict dword 0x3c00
    jge short loc_51f1b
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51f1b:
    cmp dword [0xbda87], 0
    je short loc_51f39
    cmp eax, strict dword 0x7800
    jge short loc_51f39
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51f39:
    cmp dword [0xbdaa1], 0
    je short loc_51f57
    cmp eax, strict dword 0x4e00
    jge short loc_51f57
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51f57:
    cmp dword [0xbdac8], 0
    je short loc_51f75
    cmp eax, strict dword 0x2a00
    jge short loc_51f75
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51f75:
    cmp dword [0xbdaae], 0
    je short loc_51f93
    cmp eax, strict dword 0x3c00
    jge short loc_51f93
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51f93:
    cmp dword [0xbdabb], 0
    je short loc_51fb1
    cmp eax, strict dword 0x7800
    jge short loc_51fb1
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51fb1:
    cmp dword [0xbdad5], 0
    je short loc_51fcf
    cmp eax, strict dword 0x4e00
    jge short loc_51fcf
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51fcf:
    cmp dword [0xbdafc], 0
    je short loc_51fed
    cmp eax, strict dword 0x2a00
    jge short loc_51fed
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51fed:
    cmp dword [0xbdae2], 0
    je short loc_5200b
    cmp eax, strict dword 0x3c00
    jge short loc_5200b
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_5200b:
    cmp dword [0xbdaef], 0
    je short loc_52029
    cmp eax, strict dword 0x7800
    jge short loc_52029
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52029:
    cmp dword [0xbdb09], 0
    je short loc_52047
    cmp eax, strict dword 0x4e00
    jge short loc_52047
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52047:
    cmp dword [0xbddee], 0
    je short loc_52065
    cmp eax, strict dword 0x3c00
    jge short loc_52065
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52065:
    cmp dword [0xbdde1], 0
    je short loc_52083
    cmp eax, strict dword 0x7800
    jge short loc_52083
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52083:
    cmp dword [0xbdbe6], 0
    je short loc_520a1
    cmp eax, strict dword 0x5a00
    jge short loc_520a1
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_520a1:
    cmp dword [0xbdbd9], 0
    je short loc_520bf
    cmp eax, strict dword 0x5a00
    jge short loc_520bf
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_520bf:
    cmp dword [0xbdbf3], 0
    je short loc_520dd
    cmp eax, strict dword 0x5a00
    jge short loc_520dd
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_520dd:
    cmp dword [0xbdc00], 0
    je short loc_520fb
    cmp eax, strict dword 0x5a00
    jge short loc_520fb
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_520fb:
    cmp dword [0xbde49], 0
    je short loc_52119
    cmp eax, strict dword 0x2a00
    jge short loc_52119
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52119:
    cmp dword [0xbde56], 0
    je short loc_52137
    cmp eax, strict dword 0x3c00
    jge short loc_52137
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52137:
    cmp dword [0xbde63], 0
    je short loc_52155
    cmp eax, strict dword 0x5a00
    jge short loc_52155
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52155:
    cmp dword [0xbdb30], 0
    je short loc_52173
    cmp eax, strict dword 0x7800
    jge short loc_52173
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52173:
    cmp dword [0xbdba5], 0
    je short loc_52191
    cmp eax, strict dword 0x7800
    jge short loc_52191
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52191:
    cmp dword [0xbdb57], 0
    je short loc_521af
    cmp eax, strict dword 0x7800
    jge short loc_521af
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_521af:
    cmp dword [0xbdb7e], 0
    je short loc_521cd
    cmp eax, strict dword 0x7800
    jge short loc_521cd
    mov eax, 1
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_521cd:
    xor eax, eax
loc_521cf:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret

player_touched_sprite:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    mov ebx, eax
    mov ecx, edx
    mov edx, 0x410c
    call 0x513e4
    movsx ecx, cx
    mov edx, 0x4128
    mov eax, ecx
    call 0x51408
    cmp dword [0xbd9eb], 0
    je short loc_5220e
    mov eax, 1
    jmp near loc_52282
loc_5220e:
    cmp dword [0xbda05], 0
    je short loc_52224
    mov eax, 1
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52224:
    cmp dword [0xbda1f], 0
    je short loc_5223a
    mov eax, 1
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_5223a:
    cmp dword [0xbda39], 0
    je short loc_52280
    imul edx, ecx, strict dword 0x623
    mov eax, dword [edx + 0x8c024]
    sub eax, dword [ebx]
    test eax, eax
    jns short loc_52257
    neg eax
loc_52257:
    mov ecx, eax
    mov esi, dword [ebx + 4]
    mov eax, dword [edx + 0x8c028]
    sub eax, esi
    test eax, eax
    jns short loc_5226a
    neg eax
loc_5226a:
    add eax, ecx
    cmp eax, strict dword 0x5a00
    jge short loc_52280
    mov eax, 1
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_52280:
    xor eax, eax
loc_52282:
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    cmp ax, strict word 0x3e6
    jb short loc_522b0
    cmp ax, strict word 0x3e7
    jbe short loc_522a7
    cmp ax, strict word 0x3ef
    jb short loc_522b0
    cmp ax, strict word 0x3f0
    ja short loc_522b0
loc_522a7:
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
loc_522b0:
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    cmp ax, strict word 0x3d5
    jb short loc_522d0
    cmp ax, strict word 0x3d6
    ja short loc_522d0
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
loc_522d0:
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

sound_dispatch:
    dd loc_5242e - 0x10000
    dd loc_52442 - 0x10000
    dd loc_52456 - 0x10000
    dd loc_5246a - 0x10000
    dd loc_524b0 - 0x10000
    dd loc_524c4 - 0x10000
    dd loc_524d8 - 0x10000
    dd loc_524ec - 0x10000
    dd loc_52523 - 0x10000
    dd loc_52534 - 0x10000
    dd loc_52545 - 0x10000
    dd loc_52556 - 0x10000
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 4
    mov ebx, eax
    mov esi, edx
    call 0x535ec
    test eax, eax
    jne near loc_52688
    movsx ebx, bx
    mov eax, ebx
    imul ebx, ebx, strict dword 0x623
    mov edx, 0x4144
    call 0x51408
    add ebx, strict dword 0x8be10
    mov edx, 0x4160
    mov eax, ebx
    call 0x5144c
    mov edx, dword [ebx + 0x298]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov dx, word [nosplit eax*8 + 0x20a08c]
    mov ecx, ebx
    cmp dx, 0x7d3
    jne near loc_523fd
    test esi, esi
    jne short loc_523a1
    mov eax, 5
    call 0x57a40
    cmp eax, 1
    jne near loc_5256a
    mov ax, word [ecx + 0x2f8]
    mov ebx, 0x51
    movsx edx, ax
    xor eax, eax
    mov ax, bx
    jmp near loc_52565
loc_523a1:
    cmp esi, 1
    jne short loc_523d1
    mov eax, 5
    call 0x57a40
    cmp eax, esi
    jne near loc_5256a
    mov ax, word [ecx + 0x2f8]
    mov ebx, 0x50
    movsx edx, ax
    xor eax, eax
    mov ax, bx
    jmp near loc_52565
loc_523d1:
    mov eax, 5
    call 0x57a40
    cmp eax, 1
    jne near loc_5256a
    mov ax, word [ecx + 0x2f8]
    mov ebx, 0x52
    movsx edx, ax
    xor eax, eax
    mov ax, bx
    jmp near loc_52565
loc_523fd:
    test esi, esi
    jne near loc_52483
    mov eax, 5
    call 0x57a40
    cmp eax, 1
    jne near loc_5256a
    mov eax, dword [0xbffeb]
    cmp eax, 3
    ja near loc_5256a
    jmp dword [cs:nosplit eax*4 + sound_dispatch - 0x10000]
loc_5242e:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 9
    jmp near loc_52565
loc_52442:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0xd
    jmp near loc_52565
loc_52456:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0x11
    jmp near loc_52565
loc_5246a:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0x15
    call 0x2c0ac
    jmp near loc_5256a
loc_52483:
    cmp esi, 1
    jne short loc_52502
    mov eax, 5
    call 0x57a40
    cmp eax, esi
    jne near loc_5256a
    mov eax, dword [0xbffeb]
    cmp eax, 3
    ja near loc_5256a
    jmp dword [cs:nosplit eax*4 + 0x422e8]
loc_524b0:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0xa
    jmp near loc_52565
loc_524c4:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0xe
    jmp near loc_52565
loc_524d8:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0x12
    jmp near loc_52565
loc_524ec:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0x16
    call 0x2c0ac
    jmp short loc_5256a
loc_52502:
    mov eax, 5
    call 0x57a40
    cmp eax, 1
    jne short loc_5256a
    mov eax, dword [0xbffeb]
    cmp eax, 3
    ja short loc_5256a
    jmp dword [cs:nosplit eax*4 + 0x422f8]
loc_52523:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0xb
    jmp short loc_52565
loc_52534:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0xf
    jmp short loc_52565
loc_52545:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0x13
    jmp short loc_52565
loc_52556:
    mov ax, word [ebx + 0x2f8]
    movsx edx, ax
    mov eax, 0x17
loc_52565:
    call 0x2c0ac
loc_5256a:
    mov esi, dword [ecx + 0x298]
    sar esi, 0x10
    mov esi, dword [nosplit esi*2 + 0x21778c]
    sar esi, 0x10
    test esi, esi
    jl near loc_52688
loc_52585:
    imul ebx, esi, 0x2c
    mov eax, dword [nosplit esi*2 + 0x18af66]
    mov edx, 0x417c
    sar eax, 0x10
    add ebx, strict dword 0x191368
    mov dword [ebp - 0x14], eax
    mov eax, ebx
    call 0x513e4
    mov ax, word [ebx + 0xe]
    cmp ax, strict word 0x3e6
    jb short loc_525ca
    cmp ax, strict word 0x3e7
    jbe short loc_525c3
    cmp ax, strict word 0x3ef
    jb short loc_525ca
    cmp ax, strict word 0x3f0
    ja short loc_525ca
loc_525c3:
    mov eax, 1
    jmp short loc_525cc
loc_525ca:
    xor eax, eax
loc_525cc:
    test eax, eax
    je short loc_5262e
    mov eax, dword [ecx + 0x214]
    sub eax, dword [ebx]
    test eax, eax
    jns short loc_525de
    neg eax
loc_525de:
    mov edx, eax
    mov edi, dword [ebx + 4]
    mov eax, dword [ecx + 0x218]
    sub eax, edi
    test eax, eax
    jns short loc_525f1
    neg eax
loc_525f1:
    add edx, eax
    xor eax, eax
    mov al, byte [ebx + 0x12]
    cmp edx, eax
    jge short loc_5262e
    cmp esi, dword [0xa264]
    je near loc_52688
    mov ax, word [ecx + 0x2f8]
    movsx edx, ax
    mov eax, 0x19
    call 0x2c0ac
    mov eax, 0x1000
    call 0x5a250
    mov dword [0xa264], esi
    jmp short loc_52688
loc_5262e:
    mov ax, word [ebx + 0xe]
    cmp ax, strict word 0x3d5
    jb short loc_52645
    cmp ax, strict word 0x3d6
    ja short loc_52645
    mov eax, 1
    jmp short loc_52647
loc_52645:
    xor eax, eax
loc_52647:
    test eax, eax
    je short loc_5267d
    mov eax, dword [ecx + 0x214]
    sub eax, dword [ebx]
    test eax, eax
    jns short loc_52659
    neg eax
loc_52659:
    mov edx, eax
    mov esi, dword [ebx + 4]
    mov eax, dword [ecx + 0x218]
    sub eax, esi
    test eax, eax
    jns short loc_5266c
    neg eax
loc_5266c:
    add eax, edx
    cmp eax, 0x7c
    jge short loc_5267d
    mov eax, 0x800
    call 0x5a250
loc_5267d:
    mov esi, dword [ebp - 0x14]
    test esi, esi
    jge near loc_52585
loc_52688:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

sound_variant_dispatch:
    dd loc_52725 - 0x10000
    dd loc_5273f - 0x10000
    dd loc_52759 - 0x10000
    dd loc_52773 - 0x10000
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    mov ebx, eax
    movsx ecx, dx
    mov eax, ecx
    imul ecx, ecx, strict dword 0x623
    mov edx, 0x4198
    call 0x51408
    mov eax, 0x8be10
    mov edx, 0x41b4
    add eax, ecx
    movsx ebx, bx
    call 0x5144c
    mov edx, 0x41d0
    mov eax, ebx
    call 0x513b8
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    shl eax, 2
    mov edx, 0x41ec
    add eax, strict dword 0x191368
    call 0x513e4
    mov eax, ebx
    call 0x51588
    test eax, eax
    je near loc_52790
    mov eax, dword [0xbffeb]
    cmp eax, 3
    ja near loc_52790
    jmp dword [cs:nosplit eax*4 + sound_variant_dispatch - 0x10000]
loc_52725:
    cmp dword [0xbda6d], 0
    jne short loc_52790
    mov ax, word [ecx + 0x8c108]
    movsx edx, ax
    mov eax, 0xc
    jmp short loc_5278b
loc_5273f:
    cmp dword [0xbdaa1], 0
    jne short loc_52790
    mov ax, word [ecx + 0x8c108]
    movsx edx, ax
    mov eax, 0x10
    jmp short loc_5278b
loc_52759:
    cmp dword [0xbdad5], 0
    jne short loc_52790
    mov ax, word [ecx + 0x8c108]
    movsx edx, ax
    mov eax, 0x14
    jmp short loc_5278b
loc_52773:
    cmp dword [0xbdb09], 0
    jne short loc_52790
    mov ax, word [ecx + 0x8c108]
    movsx edx, ax
    mov eax, 0x18
loc_5278b:
    call 0x2c0ac
loc_52790:
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

level_dispatch:
    dd loc_527d8 - 0x10000
    dd loc_527e7 - 0x10000
    dd loc_527f5 - 0x10000
    dd loc_52804 - 0x10000
    dd loc_52899 - 0x10000
    dd loc_528d4 - 0x10000
    dd loc_528d4 - 0x10000
    dd loc_5290c - 0x10000
    dd loc_52940 - 0x10000
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    xor esi, esi
    xor ebx, ebx
    cmp eax, 3
    ja short loc_52811
    jmp dword [cs:nosplit eax*4 + level_dispatch - 0x10000]
loc_527d8:
    mov edi, 0x11
    mov esi, 0xa268
    mov dword [ebp - 0x18], edi
    jmp short loc_52811
loc_527e7:
    mov dword [ebp - 0x18], 0x12
    mov esi, 0xa28a
    jmp short loc_52811
loc_527f5:
    mov ecx, 0x12
    mov esi, 0xa2ae
    mov dword [ebp - 0x18], ecx
    jmp short loc_52811
loc_52804:
    mov edx, 0xe
    mov esi, 0xa2d2
    mov dword [ebp - 0x18], edx
loc_52811:
    test esi, esi
    je short loc_52862
    mov eax, dword [ebp - 0x18]
    xor ecx, ecx
    test eax, eax
    jle short loc_52862
loc_5281e:
    mov ax, word [esi]
    cmp ax, strict word 0x1f4
    jbe short loc_52833
    mov eax, 0x4208
    call PRINT_NOTICE
    jmp short loc_52857
loc_52833:
    test ax, ax
    jbe short loc_52857
    xor edx, edx
    mov dx, ax
    imul eax, edx, 0xd
    cmp dword [eax + 0xbd9c8], 0
    jne short loc_52857
    mov eax, edx
    call 0x2b6c0
    add ebx, dword [nosplit edx*4 + 0x1f350]
loc_52857:
    mov edx, dword [ebp - 0x18]
    inc ecx
    add esi, 2
    cmp ecx, edx
    jl short loc_5281e
loc_52862:
    mov eax, dword [0xcf65c]
    mov edx, 0x4234
    sar eax, 0x10
    call 0x51408
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c42f]
    cmp eax, 4
    ja near loc_52972
    jmp dword [cs:nosplit eax*4 + 0x427a8]
loc_52899:
    cmp dword [0xbd9d5], 0
    jne short loc_528b2
    mov eax, 1
    call 0x2b6c0
    add ebx, dword [0x1f354]
loc_528b2:
    cmp dword [0xbd9e2], 0
    jne near loc_52972
    mov eax, 2
    call 0x2b6c0
    add ebx, dword [0x1f358]
    jmp near loc_52972
loc_528d4:
    cmp dword [0xbda09], 0
    jne short loc_528ed
    mov eax, 5
    call 0x2b6c0
    add ebx, dword [0x1f364]
loc_528ed:
    cmp dword [0xbda16], 0
    jne near loc_52972
    mov eax, 6
    call 0x2b6c0
    add ebx, dword [0x1f368]
    jmp short loc_52972
loc_5290c:
    cmp dword [0xbd9ef], 0
    jne short loc_52925
    mov eax, 3
    call 0x2b6c0
    add ebx, dword [0x1f35c]
loc_52925:
    cmp dword [0xbd9fc], 0
    jne short loc_52972
    mov eax, 4
    call 0x2b6c0
    add ebx, dword [0x1f360]
    jmp short loc_52972
loc_52940:
    cmp dword [0xbda23], 0
    jne short loc_52959
    mov eax, 7
    call 0x2b6c0
    add ebx, dword [0x1f36c]
loc_52959:
    cmp dword [0xbda30], 0
    jne short loc_52972
    mov eax, 8
    call 0x2b6c0
    add ebx, dword [0x1f370]
loc_52972:
    cmp dword [0xbdec2], 0
    jne short loc_5298b
    mov eax, 0x62
    call 0x2b6c0
    add ebx, dword [0x1f4d8]
loc_5298b:
    cmp dword [0xbdecf], 0
    jne short loc_529a4
    mov eax, 0x63
    call 0x2b6c0
    add ebx, dword [0x1f4d8]
loc_529a4:
    cmp dword [0xbdedc], 0
    jne short loc_529bd
    mov eax, 0x64
    call 0x2b6c0
    add ebx, dword [0x1f4e0]
loc_529bd:
    cmp dword [0xbdee9], 0
    jne short loc_529d6
    mov eax, 0x65
    call 0x2b6c0
    add ebx, dword [0x1f4e4]
loc_529d6:
    mov eax, 0x4248
    mov edx, ebx
    call LOG_NUMBER
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 4 db 0    ; Alignment
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 0x10
    mov dword [ebp - 0x14], eax
    mov dword [ebp - 0x1c], edx
    xor edx, edx
    mov dword [ebp - 0x18], edx
loc_52a05:
    mov ebx, dword [ebp - 0x14]
    xor ecx, ecx
    xor edx, edx
loc_52a0c:
    cmp bx, word [edx + 0x191376]
    jne short loc_52a16
    inc ecx
loc_52a16:
    add edx, 0x2c
    cmp edx, strict dword 0x2c000
    jne short loc_52a0c
    cmp ecx, dword [ebp - 0x1c]
    jbe near loc_52aad
    xor esi, esi
loc_52a2c:
    cmp dword [ebp - 0x18], 0
    jne short loc_52a3b
    mov ebx, 0xfff
    sub ebx, esi
    jmp short loc_52a3d
loc_52a3b:
    mov ebx, esi
loc_52a3d:
    movsx eax, bx
    imul edi, ebx, 0x2c
    mov edx, 0x4258
    call 0x513b8
    mov edx, dword [ebp - 0x14]
    cmp dx, word [edi + 0x191376]
    jne short loc_52a88
    call 0x50fe0
    mov edx, eax
    mov dword [ebp - 0x20], 0x100
    sar edx, 0x1f
    idiv dword [ebp - 0x20]
    cmp edx, 0x20
    jge short loc_52a88
    xor eax, eax
    mov word [edi + 0x191376], ax
    mov eax, ebx
    dec ecx
    call 0x40ecd
    cmp ecx, dword [ebp - 0x1c]
    jbe short loc_52aad
loc_52a88:
    inc esi
    cmp esi, strict dword 0x1000
    jb short loc_52a2c
    cmp dword [ebp - 0x18], 0
    jne short loc_52aa3
    mov dword [ebp - 0x18], 1
    jmp near loc_52a05
loc_52aa3:
    xor ebx, ebx
    mov dword [ebp - 0x18], ebx
    jmp near loc_52a05
loc_52aad:
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
    mov ebx, 0x100
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov al, dl
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push edx
    test ax, ax
    jl short loc_52aff
    cmp ax, strict word 0x1000
    jl short loc_52b03
loc_52aff:
    xor eax, eax
    jmp short loc_52b4f
loc_52b03:
    movsx edx, ax
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov ax, word [nosplit eax*4 + 0x191376]
    cmp ax, strict word 0x1351
    jb short loc_52b34
    jbe short loc_52b42
    cmp ax, strict word 0x1603
    jb short loc_52b4a
    jbe short loc_52b42
    cmp ax, strict word 0x1a02
    je short loc_52b42
    jmp short loc_52b4a
loc_52b34:
    cmp ax, strict word 0x434
    jb short loc_52b4a
    jbe short loc_52b42
    cmp ax, strict word 0x10a4
    jne short loc_52b4a
loc_52b42:
    xor eax, eax
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
loc_52b4a:
    mov eax, 1
loc_52b4f:
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push edx
    test eax, eax
    jl short loc_52b9e
    cmp eax, strict dword 0x1000
    jge short loc_52b9e
    mov edx, eax
    shl eax, 2
    sub eax, edx
    shl eax, 2
    sub eax, edx
    mov ax, word [nosplit eax*4 + 0x191376]
    cmp ax, strict word 0xa2b
    jb short loc_52b8b
    jbe short loc_52b97
    cmp ax, strict word 0xbae
    je short loc_52b97
    jmp short loc_52b9e
loc_52b8b:
    cmp ax, strict word 0x3d0
    jb short loc_52b9e
    cmp ax, strict word 0x3d1
    ja short loc_52b9e
loc_52b97:
    mov eax, 1
    jmp short loc_52ba0
loc_52b9e:
    xor eax, eax
loc_52ba0:
    lea esp, [ebp - 4]
    pop edx
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
    sub esp, 0xc
    mov eax, 0x4270
    call PRINT_NOTICE
    xor edx, edx
    xor ecx, ecx
    mov eax, 0x4274
    mov dword [ebp - 0x1c], edx
    mov edx, dword [0xbffeb]
    xor ebx, ebx
    call LOG_NUMBER
    call 0x59c20
    call 0x54a2c
    mov edi, 1
loc_52be5:
    xor edx, edx
    xor ah, ah
    mov word [ebx + 0x191374], dx
    mov byte [ebx + 0x191379], ah
    mov si, word [ebx + 0x191380]
    mov word [ebx + 0x191382], dx
    test cx, cx
    jl short loc_52c10
    cmp cx, 0x1000
    jl short loc_52c14
loc_52c10:
    xor edx, edx
    jmp short loc_52c4d
loc_52c14:
    movsx eax, cx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x191376]
    cmp ax, strict word 0x1351
    jb short loc_52c39
    jbe short loc_52c47
    cmp ax, strict word 0x1603
    jb short loc_52c4b
    jbe short loc_52c47
    cmp ax, strict word 0x1a02
    je short loc_52c47
    jmp short loc_52c4b
loc_52c39:
    cmp ax, strict word 0x434
    jb short loc_52c4b
    jbe short loc_52c47
    cmp ax, strict word 0x10a4
    jne short loc_52c4b
loc_52c47:
    xor edx, edx
    jmp short loc_52c4d
loc_52c4b:
    mov edx, edi
loc_52c4d:
    test edx, edx
    je near loc_52d13
    test si, si
    jl near loc_52d13
    cmp si, word [0x217fce]
    jge near loc_52d13
    movsx esi, si
    imul edx, esi, 0x28
    cmp word [edx + 0x20a07a], 0
    jne near loc_52d13
    cmp word [edx + 0x20a082], 0
    jne near loc_52d13
    mov eax, dword [ebx + 0x191370]
    sub eax, dword [edx + 0x20a070]
    test eax, eax
    jns short loc_52c9f
    neg eax
loc_52c9f:
    cmp eax, strict dword 0x400
    jle short loc_52d13
    mov eax, dword [ebx + 0x191370]
    cmp eax, dword [edx + 0x20a070]
    jge short loc_52d13
    mov eax, 0x427c
    mov edx, ecx
    call LOG_NUMBER
    mov eax, 0x42a0
    mov edx, dword [ebx + 0x191368]
    call LOG_NUMBER
    mov eax, 0x42bc
    mov edx, dword [ebx + 0x19136c]
    call LOG_NUMBER
    mov eax, 0x42d8
    mov edx, dword [ebx + 0x191370]
    call LOG_NUMBER
    mov eax, 0x42f4
    mov edx, esi
    call LOG_NUMBER
    mov eax, ecx
    xor edx, edx
    call 0x40ecd
    mov word [ebx + 0x191376], dx
    mov word [ebx + 0x191374], dx
loc_52d13:
    test ecx, ecx
    jl short loc_52d46
    cmp ecx, strict dword 0x1000
    jge short loc_52d46
    mov ax, word [ebx + 0x191376]
    cmp ax, strict word 0xa2b
    jb short loc_52d36
    jbe short loc_52d42
    cmp ax, strict word 0xbae
    je short loc_52d42
    jmp short loc_52d46
loc_52d36:
    cmp ax, strict word 0x3d0
    jb short loc_52d46
    cmp ax, strict word 0x3d1
    ja short loc_52d46
loc_52d42:
    mov eax, edi
    jmp short loc_52d48
loc_52d46:
    xor eax, eax
loc_52d48:
    test eax, eax
    je short loc_52d5b
    mov dl, 8
    mov word [ebx + 0x191374], di
    mov byte [ebx + 0x19137a], dl
loc_52d5b:
    movsx eax, cx
    call 0x51588
    test eax, eax
    je short loc_52d84
    xor dh, dh
    mov word [ebx + 0x191374], di
    mov byte [ebx + 0x19137e], dh
    mov ah, 8
    mov byte [ebx + 0x19137f], dh
    mov byte [ebx + 0x19137a], ah
loc_52d84:
    mov ax, word [ebx + 0x191376]
    cmp ax, strict word 0x3e6
    je short loc_52da3
    cmp ax, strict word 0x3e7
    je short loc_52da3
    cmp ax, strict word 0x3ef
    je short loc_52da3
    cmp ax, strict word 0x3f0
    jne short loc_52db3
loc_52da3:
    mov word [ebx + 0x191374], 0x20
    mov byte [ebx + 0x19137a], 0x7f
loc_52db3:
    cmp word [ebx + 0x191376], 0
    je short loc_52dc0
    inc dword [ebp - 0x1c]
loc_52dc0:
    inc ecx
    add ebx, 0x2c
    cmp ecx, strict dword 0x1000
    jl near loc_52be5
    mov edx, 4
    mov eax, 0x1351
    call 0x529f0
    mov edx, 4
    mov eax, 0x1603
    call 0x529f0
    mov edx, 8
    mov eax, 0x10a4
    call 0x529f0
    mov edx, 4
    mov eax, 0x1a02
    xor ecx, ecx
    call 0x529f0
    mov edx, 0x40
    mov eax, 0x1b99
    xor ebx, ebx
    call 0x529f0
    mov esi, 0x64
    mov edi, 1
loc_52e29:
    cmp word [ebx + 0x191376], 0x1351
    jne short loc_52ea3
    mov edx, 0x101
    movsx eax, cx
    mov word [ebx + 0x191374], dx
    mov edx, edi
    call 0x51390
    mov edx, 0x7d
    mov eax, 5
    call 0x52ab8
    add al, 0xa
    mov edx, 0x7d
    mov byte [ebx + 0x19137c], al
    mov eax, 5
    call 0x52ab8
    add al, 0xa
    mov byte [ebx + 0x19137d], al
    mov eax, dword [ebx + 0x191374]
    sar eax, 0x10
    mov dx, word [nosplit eax*2 + 0x17cee8]
    movsx edx, dx
    mov al, byte [ebx + 0x19137c]
    and eax, strict dword 0xff
    imul edx
    shrd eax, edx, 7
    mov byte [ebx + 0x19137a], al
loc_52ea3:
    cmp word [ebx + 0x191376], 0x1603
    jne short loc_52f1a
    mov edx, 0x101
    movsx eax, cx
    mov word [ebx + 0x191374], dx
    mov edx, edi
    call 0x51390
    mov eax, 7
    mov edx, esi
    call 0x52ab8
    add al, 0xe
    mov edx, esi
    mov byte [ebx + 0x19137c], al
    mov eax, 7
    call 0x52ab8
    add al, 0xe
    mov byte [ebx + 0x19137d], al
    mov eax, dword [ebx + 0x191374]
    sar eax, 0x10
    mov dl, byte [ebx + 0x19137c]
    mov ax, word [nosplit eax*2 + 0x17cee8]
    mov byte [ebp - 0x18], dl
    movsx edx, ax
    xor eax, eax
    mov al, byte [ebp - 0x18]
    imul edx
    shrd eax, edx, 7
    mov byte [ebx + 0x19137a], al
loc_52f1a:
    cmp word [ebx + 0x191376], 0x10a4
    jne short loc_52f8e
    mov edx, 0x101
    movsx eax, cx
    mov word [ebx + 0x191374], dx
    mov edx, edi
    call 0x51390
    mov eax, 4
    mov edx, esi
    call 0x52ab8
    add al, 8
    mov edx, esi
    mov byte [ebx + 0x19137c], al
    mov eax, 4
    call 0x52ab8
    add al, 8
    mov byte [ebx + 0x19137d], al
    mov eax, dword [ebx + 0x191374]
    sar eax, 0x10
    mov dx, word [nosplit eax*2 + 0x17cee8]
    movsx edx, dx
    mov al, byte [ebx + 0x19137c]
    and eax, strict dword 0xff
    imul edx
    shrd eax, edx, 7
    mov byte [ebx + 0x19137a], al
loc_52f8e:
    cmp word [ebx + 0x191376], 0x1a02
    jne short loc_53005
    mov edx, 0x101
    movsx eax, cx
    mov word [ebx + 0x191374], dx
    mov edx, edi
    call 0x51390
    mov eax, 4
    mov edx, esi
    call 0x52ab8
    add al, 8
    mov edx, esi
    mov byte [ebx + 0x19137c], al
    mov eax, 4
    call 0x52ab8
    add al, 8
    mov byte [ebx + 0x19137d], al
    mov eax, dword [ebx + 0x191374]
    sar eax, 0x10
    mov dl, byte [ebx + 0x19137c]
    mov ax, word [nosplit eax*2 + 0x17cee8]
    mov byte [ebp - 0x18], dl
    movsx edx, ax
    xor eax, eax
    mov al, byte [ebp - 0x18]
    imul edx
    shrd eax, edx, 7
    mov byte [ebx + 0x19137a], al
loc_53005:
    cmp word [ebx + 0x191376], 0x1b99
    jne short loc_5303c
    xor edx, edx
    mov word [ebx + 0x191374], dx
    call 0x50fe0
    shl eax, 3
    mov edx, dword [ebx + 0x191370]
    sub edx, eax
    movsx eax, cx
    mov dword [ebx + 0x191370], edx
    mov edx, 0x321
    call 0x51390
loc_5303c:
    inc ecx
    add ebx, 0x2c
    cmp ecx, strict dword 0x1000
    jl near loc_52e29
    mov edx, dword [0x217fcc]
    mov eax, 0x4310
    sar edx, 0x10
    call LOG_NUMBER
    mov edx, dword [0x217fca]
    mov eax, 0x4320
    sar edx, 0x10
    xor ecx, ecx
    call LOG_NUMBER
    mov edx, dword [ebp - 0x1c]
    mov eax, 0x432c
    xor ebx, ebx
    call LOG_NUMBER
    jmp short loc_5309e
loc_53085:
    mov eax, dword [ebx + 0x1be572]
    sar eax, 0x10
    cmp eax, -1
    je short loc_5309a
    and byte [ebx + 0x1be576], 0xbf
loc_5309a:
    add ebx, 0x20
    inc ecx
loc_5309e:
    mov eax, dword [0x217fca]
    sar eax, 0x10
    cmp ecx, eax
    jl short loc_53085
    xor edx, edx
    xor ecx, ecx
    xor eax, eax
    xor ebx, ebx
loc_530b2:
    cmp dword [eax + 0x169e68], 0
    je short loc_530d9
    mov esi, dword [ebx + 0x17cee6]
    sar esi, 0x10
    mov dword [ebp - 0x20], esi
    mov esi, dword [ebx + 0x1816e6]
    mov edi, dword [ebp - 0x20]
    sar esi, 0x10
    imul esi, edi
    inc ecx
    add edx, esi
loc_530d9:
    add ebx, 2
    add eax, 4
    cmp ebx, strict dword 0x4800
    jne short loc_530b2
    mov eax, 0x433c
    call LOG_NUMBER
    mov eax, 0x4348
    mov edx, ecx
    call LOG_NUMBER
    call 0x55f8c
    call 0x566f0
    call 0x558f4
    call 0x56ab8
    call 0x573c0
    call 0x59314
    mov eax, dword [0xbffeb]
    call 0x527bc
    call 0x55184
    call 0x57b24
    call 0x58388
    call 0x59b50
    mov eax, dword [0xbffeb]
    call 0x59f80
    call 0x299c0
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
    call player_made_sound
    mov esp, ebp
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push edx
    mov edx, 1
    mov dword [0xa2fc], eax
    mov dword [0xa2f8], edx
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

random_keep_dispatch:
    dd loc_531b3 - 0x10000
    dd loc_531d7 - 0x10000
    dd loc_531fb - 0x10000
    dd loc_5321f - 0x10000
    dd loc_53243 - 0x10000
    dd loc_53263 - 0x10000
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov edx, dword [0xa2f0]
    mov eax, edx
    cmp edx, 5
    ja near loc_532b9
    jmp dword [cs:nosplit eax*4 + random_keep_dispatch - 0x10000]
loc_531b3:
    cmp byte [0x21ebef], 0
    je near loc_532b9
    xor bh, bh
    mov byte [0x21ebef], bh
    inc edx
    mov dword [0xa2f0], edx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_531d7:
    cmp byte [0x21ebe9], 0
    je near loc_532b9
    xor ch, ch
    mov byte [0x21ebe9], ch
    inc edx
    mov dword [0xa2f0], edx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_531fb:
    cmp byte [0x21ebe8], 0
    je near loc_532b9
    xor bh, bh
    mov byte [0x21ebe8], bh
    inc edx
    mov dword [0xa2f0], edx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_5321f:
    cmp byte [0x21ebe3], 0
    je near loc_532b9
    xor ch, ch
    mov byte [0x21ebe3], ch
    inc edx
    mov dword [0xa2f0], edx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_53243:
    cmp byte [0x21ebf5], 0
    je short loc_532b9
    xor bh, bh
    mov byte [0x21ebf5], bh
    inc edx
    mov dword [0xa2f0], edx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_53263:
    cmp byte [0x21ebd2], 0
    je short loc_5327d
    xor dl, dl
    mov byte [0x21ebd2], dl
    xor byte [0xa2f4], 1
    xor edx, edx
loc_5327d:
    cmp byte [0x21ebd3], 0
    je short loc_5329b
    xor bh, bh
    mov byte [0x21ebd3], bh
    mov dword [0xa2f0], edx
    call 0x57ac0
    xor edx, edx
loc_5329b:
    cmp byte [0x21ebd4], 0
    je short loc_532b9
    xor ch, ch
    mov byte [0x21ebd4], ch
    mov dword [0xa2f0], edx
    call 0x15224
    xor edx, edx
loc_532b9:
    mov dword [0xa2f0], edx
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

prelevel_dispatch:
    dd loc_53480 - 0x10000
    dd loc_53487 - 0x10000
    dd loc_53487 - 0x10000
    dd loc_5348e - 0x10000
    dd loc_53495 - 0x10000
    dd loc_534cc - 0x10000
    dd loc_534d3 - 0x10000
    dd loc_534d3 - 0x10000
    dd loc_534da - 0x10000
    dd loc_534e1 - 0x10000
    dd loc_53518 - 0x10000
    dd loc_5351f - 0x10000
    dd loc_5351f - 0x10000
    dd loc_53526 - 0x10000
    dd loc_5352d - 0x10000
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push edi
    sub esp, 0x18
    lea eax, [ebp - 0x28]
    call 0x5d3f4
    cmp byte [0x21ec35], 0
    jne near loc_535d1
    cmp byte [0x21ec08], 0
    jne near loc_535d1
    cmp byte [0x21ec06], 0
    jne near loc_535d1
    cmp byte [0x21ebfa], 0
    jne near loc_535d1
    call 0x53194
    cmp byte [0x21ebd1], 0
    jne short loc_53365
    cmp dword [0xa2f8], 0
    je near loc_5344f
loc_53365:
    cmp byte [0xbfaf4], 0
    jne near loc_5344f
    cmp byte [0xbf575], 0
    jne near loc_5344f
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, dword [eax + 0x8c0e2]
    sar edx, 0x10
    cmp edx, -1
    jne near loc_5344f
    mov dl, byte [eax + 0x8c34c]
    and dl, 1
    cmp dl, 1
    je near loc_5344f
    test byte [eax + 0x8c34c], 0x10
    jne near loc_5344f
    call 0x5f464
    call 0x2c650
    cmp dword [0xbffe3], 2
    jge short loc_533e2
    cmp dword [0xbffab], 2
    je short loc_533e2
    xor dh, dh
    mov byte [0xc0049], dh
loc_533e2:
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    test byte [eax + 0x8c34c], 4
    je short loc_5341e
    cmp dword [0xa2f8], 0
    je short loc_53414
    mov eax, dword [0xa2fa]
    xor edi, edi
    sar eax, 0x10
    mov dword [0xa2f8], edi
    jmp short loc_53419
loc_53414:
    mov eax, 0x32
loc_53419:
    call 0x25758
loc_5341e:
    mov ax, word [0xcf65e]
    mov word [0xbf562], ax
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov bh, byte [eax + 0x8c34c]
    or bh, 1
    xor cl, cl
    mov byte [eax + 0x8c34c], bh
    mov byte [0x21ebd1], cl
loc_5344f:
    cmp byte [0x21ec0b], 0
    je short loc_5349a
    xor al, al
    mov byte [0x21ec0b], al
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c42f]
    cmp eax, 4
    ja short loc_5349a
    jmp dword [cs:nosplit eax*4 + prelevel_dispatch - 0x10000]
loc_53480:
    call 0x566e8
    jmp short loc_5349a
loc_53487:
    call 0x55f68
    jmp short loc_5349a
loc_5348e:
    call 0x558d0
    jmp short loc_5349a
loc_53495:
    call 0x56ab0
loc_5349a:
    cmp byte [0x21ec0c], 0
    je short loc_534e6
    xor dl, dl
    mov byte [0x21ec0c], dl
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c42f]
    cmp eax, 4
    ja short loc_534e6
    jmp dword [cs:nosplit eax*4 + 0x432dc]
loc_534cc:
    call 0x56780
    jmp short loc_534e6
loc_534d3:
    call 0x56020
    jmp short loc_534e6
loc_534da:
    call 0x55988
    jmp short loc_534e6
loc_534e1:
    call 0x56b3c
loc_534e6:
    cmp byte [0x21ec0d], 0
    je short loc_53532
    xor bl, bl
    mov byte [0x21ec0d], bl
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c42f]
    cmp eax, 4
    ja short loc_53532
    jmp dword [cs:nosplit eax*4 + 0x432f0]
loc_53518:
    call 0x56724
    jmp short loc_53532
loc_5351f:
    call 0x55fcc
    jmp short loc_53532
loc_53526:
    call 0x55934
    jmp short loc_53532
loc_5352d:
    call 0x56ae4
loc_53532:
    cmp byte [0x21ec0e], 0
    je short loc_53556
    xor cl, cl
    mov byte [0x21ec0e], cl
    mov eax, dword [0xcf65c]
    mov edx, dword [0xbffeb]
    sar eax, 0x10
    call 0x598c0
loc_53556:
    cmp byte [0x21ec0f], 0
    je short loc_53570
    xor al, al
    mov byte [0x21ec0f], al
    mov eax, 0x28
    call 0x51c7c
loc_53570:
    cmp byte [0x21ec10], 0
    je short loc_5358b
    xor dl, dl
    mov byte [0x21ec10], dl
    mov eax, 0x2a
    call 0x51c7c
loc_5358b:
    cmp byte [0x21ec11], 0
    je short loc_535a6
    xor bl, bl
    mov byte [0x21ec11], bl
    mov eax, 0x29
    call 0x51c7c
loc_535a6:
    cmp byte [0x21ec12], 0
    je short loc_535c1
    xor cl, cl
    mov byte [0x21ec12], cl
    mov eax, 0x2b
    call 0x51c7c
loc_535c1:
    cmp byte [0x21ebef], 0
    je short loc_535d1
    xor al, al
    mov byte [0x21ebef], al
loc_535d1:
    lea esp, [ebp - 0x10]
    pop edi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    xor byte [0xa2f4], 1
    mov esp, ebp
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    mov eax, dword [0xa2f4]
    mov esp, ebp
    pop ebp
    ret
    times 8 db 0    ; Padding before the next menu routine
