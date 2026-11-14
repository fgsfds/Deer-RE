bits 32
org 0x5103c

%define SET_DEBUG_LOCATION 0x5ab32
%define PRINTF 0x5ac04
%define DELETE_SPRITE 0x40ecd
%define GET_ANGLE 0x3b4fc

draw_player_debug:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    push dword 0x3db4
    mov eax, dword [eax + 0x8c024]
    push byte 0x35
    mov dword [0x218060], eax
    call 0x5d849
    mov edx, dword [0x218060]
    push edx
    push dword 0x3dbc
    push dword 0x218074
    call 0x5d8cc
    add esp, 0xc
    mov ecx, 0xffffffeb
    push byte 1
    mov ebx, 0x1f
    mov edx, dword [0x215c88]
    push dword 0x218074
    mov eax, dword [0x215c90]
    add edx, 8
    call 0x46e99
    push byte 0x20
    mov ecx, 0x3db4
    mov ebx, 0x20
    push byte 0x37
    mov eax, 0x218074
    xor edx, edx
    call 0x5bf59
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    push dword 0x3db4
    mov eax, dword [eax + 0x8c028]
    push byte 0x3a
    mov dword [0x218064], eax
    call 0x5d849
    mov ebx, dword [0x218064]
    push ebx
    push dword 0x3dd4
    push dword 0x218074
    call 0x5d8cc
    add esp, 0xc
    mov ecx, 0xffffffeb
    push byte 1
    mov ebx, 0x1f
    mov edx, dword [0x215c88]
    push dword 0x218074
    mov eax, dword [0x215c90]
    add edx, 0x10
    call 0x46e99
    push byte 0x20
    mov ecx, 0x3db4
    mov ebx, 0x20
    push byte 0x3c
    mov eax, 0x218074
    xor edx, edx
    call 0x5bf59
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c0a2]
    push dword 0x3db4
    sar eax, 0x10
    push byte 0x3f
    mov dword [0x218068], eax
    call 0x5d849
    mov ecx, dword [0x218068]
    push ecx
    push dword 0x3dec
    push dword 0x218074
    call 0x5d8cc
    add esp, 0xc
    mov ebx, 0x1f
    push byte 1
    mov ecx, 0xffffffeb
    mov edx, dword [0x215c88]
    push dword 0x218074
    mov eax, dword [0x215c90]
    add edx, 0x18
    call 0x46e99
    push byte 0x20
    mov ecx, 0x3db4
    mov ebx, 0x20
    push byte 0x41
    mov eax, 0x218074
    xor edx, edx
    call 0x5bf59
    push dword 0x3db4
    push byte 0x43
    call 0x5d849
    mov esi, dword [0x21806c]
    push esi
    push dword 0x3e04
    push dword 0x218074
    call 0x5d8cc
    add esp, 0xc
    mov ecx, 0xffffffeb
    push byte 1
    mov ebx, 0x1f
    mov edx, dword [0x215c88]
    push dword 0x218074
    mov eax, dword [0x215c90]
    add edx, 0x20
    call 0x46e99
    push byte 0x20
    mov ecx, 0x3db4
    mov ebx, 0x20
    push byte 0x45
    mov eax, 0x218074
    xor edx, edx
    call 0x5bf59
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov eax, dword [eax + 0x8c030]
    mov dword [0x218070], eax
    push dword 0x3db4
    push byte 0x48
    call 0x5d849
    mov edi, dword [0x218070]
    push edi
    push dword 0x3e1c
    push dword 0x218074
    call 0x5d8cc
    add esp, 0xc
    mov ecx, 0xffffffeb
    push byte 1
    mov ebx, 0x1f
    mov edx, dword [0x215c88]
    push dword 0x218074
    mov eax, dword [0x215c90]
    add edx, 0x28
    call 0x46e99
    push byte 0x20
    mov ecx, 0x3db4
    mov ebx, 0x20
    push byte 0x4a
    mov eax, 0x218074
    xor edx, edx
    call 0x5bf59
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret

open_log:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push dword 0x3db4
    push byte 0x50
    call SET_DEBUG_LOCATION
    mov edx, 0x3e34
    mov eax, 0x3e38
    call 0x5db41
    mov dword [0x218094], eax
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

close_log:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    cmp dword [0x218094], 0
    je short loc_51301
    push dword 0x3db4
    push byte 0x57
    call SET_DEBUG_LOCATION
    mov eax, dword [0x218094]
    xor ebx, ebx
    call 0x5dbf5
    mov dword [0x218094], ebx
loc_51301:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]

print_notice:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    mov esi, eax
    cmp dword [0x218094], 0
    je short loc_51344
    push dword 0x3db4
    push byte 0x61
    call SET_DEBUG_LOCATION
    push esi
    push dword 0x3e44
    mov ebx, dword [0x218094]
    push ebx
    call 0x61e8c
    add esp, 0xc
    call 0x61ead
loc_51344:
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
    mov esi, eax
    mov edi, edx
    cmp dword [0x218094], 0
    je short loc_51386
    push dword 0x3db4
    push byte 0x6a
    call SET_DEBUG_LOCATION
    push edi
    push esi
    push dword 0x3e4c
    mov ebx, dword [0x218094]
    push ebx
    call 0x61e8c
    add esp, 0x10
loc_51386:
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
    nop

change_sprite_stat:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    mov ecx, edx
    movsx ebx, ax
    mov edx, 0x3e54
    mov eax, ebx
    call 0x513b8
    movsx edx, cx
    mov eax, ebx
    call 0x41158
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, eax
    mov eax, edx
    test bx, bx
    jl short loc_513cc
    cmp bx, 0x1000
    jl short loc_513db
loc_513cc:
    call print_notice
    mov eax, 0x3e70
    call 0x14f28
loc_513db:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, eax
    mov eax, edx
    test ebx, ebx
    jne short loc_513ff
    call print_notice
    mov eax, 0x3e8c
    call 0x14f28
loc_513ff:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    mov ebx, eax
    mov ecx, edx
    mov eax, dword [0xcf656]
    sar eax, 0x10
    test eax, eax
    jl short loc_51432
    movsx edx, bx
loc_51420:
    cmp eax, edx
    je short loc_51443
    mov eax, dword [nosplit eax*2 + 0xcf53e]
    sar eax, 0x10
    test eax, eax
    jge short loc_51420
loc_51432:
    mov eax, ecx
    call print_notice
    mov eax, 0x3ea8
    call 0x14f28
loc_51443:
    lea esp, [ebp - 8]
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, eax
    mov eax, edx
    test ebx, ebx
    jne short loc_51467
    call print_notice
    mov eax, 0x3ec4
    call 0x14f28
loc_51467:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, eax
    mov eax, edx
    test bx, bx
    jl short loc_51486
    cmp bx, word [0x217fcc]
    jl short loc_51495
loc_51486:
    call print_notice
    mov eax, 0x3ee0
    call 0x14f28
loc_51495:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, eax
    mov eax, edx
    test ebx, ebx
    jne short loc_514b7
    call print_notice
    mov eax, 0x3efc
    call 0x14f28
loc_514b7:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, eax
    mov eax, edx
    test bx, bx
    jl short loc_514d6
    cmp bx, word [0x217fce]
    jl short loc_514e5
loc_514d6:
    call print_notice
    mov eax, 0x3f18
    call 0x14f28
loc_514e5:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    nop
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, eax
    mov eax, edx
    test ebx, ebx
    jne short loc_51507
    call print_notice
    mov eax, 0x3f34
    call 0x14f28
loc_51507:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    call 0x14f28
    mov esp, ebp
    pop ebp
    ret

is_tree:
    push ebp
    mov ebp, esp
    cmp ax, strict word 0x5c
    jb short loc_51553
    cmp ax, strict word 0x5d
    jbe near loc_51579
    cmp ax, strict word 0x67
    jb short loc_51545
    jbe short loc_51579
    cmp ax, strict word 0x8d
    jb short loc_51582
    cmp ax, strict word 0xa5
    jbe short loc_51579
    jmp short loc_51582
loc_51545:
    cmp ax, strict word 0x60
    jb short loc_51582
    cmp ax, strict word 0x62
    jbe short loc_51579
    jmp short loc_51582
loc_51553:
    cmp ax, strict word 0x1d
    jb short loc_5156d
    cmp ax, strict word 0x23
    jbe short loc_51579
    cmp ax, strict word 0x49
    jb short loc_51582
    cmp ax, strict word 0x4a
    jbe short loc_51579
    jmp short loc_51582
loc_5156d:
    cmp ax, strict word 0x1a
    jb short loc_51582
    cmp ax, strict word 0x1b
    ja short loc_51582
loc_51579:
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
loc_51582:
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret

wall_normal:
    push ebp
    mov ebp, esp
    push ebx
    push edx
    movsx ebx, ax
    mov edx, 0x3f50
    mov eax, ebx
    call 0x513b8
    lea eax, [ebx*4]
    sub eax, ebx
    shl eax, 2
    sub eax, ebx
    mov ax, word [nosplit eax*4 + 0x191376]
    cmp ax, strict word 0x410
    jb short loc_515ea
    cmp ax, strict word 0x411
    jbe near loc_51610
    cmp ax, strict word 0x445
    jb short loc_515dc
    cmp ax, strict word 0x44c
    jbe short loc_51610
    cmp ax, strict word 0x459
    jb short loc_51617
    cmp ax, strict word 0x45d
    jbe short loc_51610
    jmp short loc_51617
loc_515dc:
    cmp ax, strict word 0x41a
    jb short loc_51617
    cmp ax, strict word 0x423
    jbe short loc_51610
    jmp short loc_51617
loc_515ea:
    cmp ax, strict word 0x3dc
    jb short loc_51604
    cmp ax, strict word 0x3df
    jbe short loc_51610
    cmp ax, strict word 0x404
    jb short loc_51617
    cmp ax, strict word 0x406
    jbe short loc_51610
    jmp short loc_51617
loc_51604:
    cmp ax, strict word 0x3d8
    jb short loc_51617
    cmp ax, strict word 0x3da
    ja short loc_51617
loc_51610:
    mov eax, 1
    jmp short loc_51619
loc_51617:
    xor eax, eax
loc_51619:
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
    mov ebx, eax
    mov edx, 0x3f60
    cwde
    shl ebx, 5
    call 0x51470
    mov ecx, dword [ebx + 0x1be568]
    mov eax, dword [ebx + 0x1be56c]
    mov ebx, dword [ebx + 0x1be56e]
    sar ebx, 0x10
    shl ebx, 5
    mov edx, dword [ebx + 0x1be56c]
    mov esi, dword [ebx + 0x1be568]
    sub edx, eax
    mov eax, esi
    sub eax, ecx
    call GET_ANGLE
    add ah, 2
    and ah, 7
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
    mov esp, ebp
    pop ebp
    ret 8
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push edx
    mov eax, 0x191368
    lea edx, [eax + 0x2c000]
    xor ebx, ebx
loc_51696:
    add eax, 0x2c
    mov dword [eax - 0x2c], ebx
    mov dword [eax - 0x28], ebx
    mov dword [eax - 0x24], ebx
    mov word [eax - 0x20], bx
    mov word [eax - 0x1e], bx
    mov byte [eax - 0x1c], bl
    mov byte [eax - 0x1b], bl
    mov byte [eax - 0x1a], bl
    mov byte [eax - 0x19], bl
    mov byte [eax - 0x18], bl
    mov byte [eax - 0x17], bl
    mov byte [eax - 0x16], bl
    mov byte [eax - 0x15], bl
    mov word [eax - 0x10], bx
    mov word [eax - 0xe], bx
    mov word [eax - 0xc], bx
    mov word [eax - 0xa], bx
    mov word [eax - 8], bx
    mov word [eax - 6], bx
    mov word [eax - 4], bx
    mov word [eax - 2], bx
    cmp eax, edx
    jne short loc_51696
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    times 3 db 0    ; Object alignment
    push ebp
    mov ebp, esp
    push ebx
    push edx
    movsx ebx, ax
    mov edx, 0x3f74
    mov eax, ebx
    call 0x51470
    mov eax, 0x1be568
    shl ebx, 5
    mov edx, 0x3f94
    add eax, ebx
    call 0x5149c
    mov ax, word [ebx + 0x1be578]
    cmp ax, strict word 0x92b
    jb short loc_51741
    jbe short loc_5174d
    cmp ax, strict word 0xeda
    jb short loc_51754
    cmp ax, strict word 0xedb
    jbe short loc_5174d
    cmp ax, strict word 0x1ebe
    jb short loc_51754
    cmp ax, strict word 0x1ec0
    jbe short loc_5174d
    jmp short loc_51754
loc_51741:
    cmp ax, strict word 0x49e
    jb short loc_51754
    cmp ax, strict word 0x4a1
    ja short loc_51754
loc_5174d:
    mov eax, 1
    jmp short loc_51756
loc_51754:
    xor eax, eax
loc_51756:
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ebx
    push edx
    movsx ebx, ax
    mov edx, 0x3fb4
    mov eax, ebx
    call 0x514c0
    lea eax, [ebx*4]
    add ebx, eax
    mov eax, 0x20a068
    shl ebx, 3
    mov edx, 0x3fd4
    add eax, ebx
    call 0x514ec
    cmp word [ebx + 0x20a08c], 0x7d1
    sete al
    and eax, strict dword 0xff
    lea esp, [ebp - 8]
    pop edx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    sub esp, 0x10
    mov dword [ebp - 0x14], eax
    mov dword [ebp - 0x18], edx
    mov dword [ebp - 0x1c], ebx
    mov dx, word [0x217fce]
    test dx, dx
    jl near loc_51858
    cmp dx, 0x400
    jge near loc_51858
    xor ecx, ecx
    mov dword [ebp - 0x10], ecx
loc_517de:
    call 0x50fe0
    and eax, strict dword 0x7ff
    lea esi, [eax + 1]
    imul esi, esi, 0x64
    call 0x50fe0
    and eax, strict dword 0x7ff
    lea edi, [eax + 1]
    imul edi, edi, 0x64
    xor ecx, ecx
    mov ax, word [0x217fce]
    sub esi, strict dword 0x19000
    sub edi, strict dword 0x19000
    test ax, ax
    jle short loc_5184b
loc_51817:
    movsx ebx, cx
    mov edx, edi
    mov eax, esi
    call 0x3b442
    test eax, eax
    je short loc_5183e
    mov eax, dword [ebp - 0x14]
    mov dword [eax], esi
    mov eax, dword [ebp - 0x18]
    mov dword [eax], edi
    mov eax, dword [ebp - 0x1c]
    mov word [eax], cx
    mov eax, 1
    jmp short loc_5185a
loc_5183e:
    mov dx, word [0x217fce]
    inc ecx
    cmp cx, dx
    jl short loc_51817
loc_5184b:
    mov ebx, dword [ebp - 0x10]
    inc ebx
    mov dword [ebp - 0x10], ebx
    cmp bx, 0x20
    jl short loc_517de
loc_51858:
    xor eax, eax
loc_5185a:
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment

find_new_spot:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x10
    mov edi, eax
    xor edx, edx
    movsx ecx, ax
    mov dword [ebp - 0x20], edx
    mov dword [ebp - 0x24], edx
    xor edx, edx
    mov eax, ecx
    mov word [ebp - 0x18], dx
    mov edx, 0x3ff4
    call 0x513b8
    lea eax, [ecx*4]
    sub eax, ecx
    shl eax, 2
    sub eax, ecx
    mov ecx, 0x191368
    shl eax, 2
    add ecx, eax
    mov edx, 0x400c
    mov eax, ecx
    lea ebx, [ebp - 0x18]
    call 0x513e4
    lea edx, [ebp - 0x24]
    lea eax, [ebp - 0x20]
    mov dword [ebp - 0x1c], ecx
    call 0x517ac
    test eax, eax
    je near loc_519bb
    mov eax, dword [ebp - 0x1a]
    mov edx, 0x4024
    sar eax, 0x10
    call 0x514c0
    mov edx, dword [ebp - 0x1a]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    shl eax, 3
    mov edx, 0x403c
    add eax, strict dword 0x20a068
    call 0x514ec
    mov edx, dword [ebp - 0x1a]
    sar edx, 0x10
    lea eax, [edx*4]
    add eax, edx
    mov esi, 0x20a068
    shl eax, 3
    add esi, eax
    cmp esi, strict dword 0x7d0
    je short loc_51925
    cmp esi, strict dword 0x7d1
    jne short loc_5192c
loc_51925:
    xor eax, eax
    jmp near loc_519bb
loc_5192c:
    mov ax, word [ecx + 0xe]
    cmp ax, strict word 0x1351
    jb short loc_51948
    jbe short loc_51950
    cmp ax, strict word 0x1603
    jb short loc_51976
    jbe short loc_51950
    cmp ax, strict word 0x1a02
    je short loc_51950
    jmp short loc_51976
loc_51948:
    cmp ax, strict word 0x10a4
    je short loc_51963
    jmp short loc_51976
loc_51950:
    cmp word [esi + 0x24], 0
    je short loc_51976
    xor eax, eax
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51963:
    cmp word [esi + 0x24], 0
    je short loc_51976
    xor eax, eax
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_51976:
    mov ecx, dword [ebp - 0x1a]
    mov ebx, dword [ebp - 0x24]
    mov edx, dword [ebp - 0x20]
    movsx edi, di
    sar ecx, 0x10
    mov eax, edi
    call 0x40b6d
    mov edx, dword [ebp - 0x1a]
    mov eax, edi
    sar edx, 0x10
    call 0x410f9
    mov eax, dword [ebp - 0x1c]
    cmp word [eax + 0xe], 0x10a4
    jne short loc_519ad
    mov dword [eax + 8], 0xfffb5000
    jmp short loc_519b6
loc_519ad:
    mov edx, dword [ebp - 0x1c]
    mov eax, dword [esi + 8]
    mov dword [edx + 8], eax
loc_519b6:
    mov eax, 1
loc_519bb:
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    times 11 db 0    ; Alignment before the next dispatch table
