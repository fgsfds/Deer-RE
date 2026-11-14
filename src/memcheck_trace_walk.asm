bits 32
org 0x61ff8

loc_61ff8:
    cmp byte [0xb871], 8
    je short loc_62006
    call 0x736a9
loc_62006:
    test byte [0x22ee80], 1
    je short loc_62014
    call 0x737de
loc_62014:
    cmp dword [0xd34c], 0
    je short loc_6202f
    inc byte [0xb887]
    call dword [0xd34c]
    dec byte [0xb887]
loc_6202f:
    inc dword [0xb84c]
    ret
loc_62036:
    cmp dword [0xd350], 0
    je short loc_62051
    inc byte [0xb887]
    call dword [0xd350]
    dec byte [0xb887]
loc_62051:
    and byte [0xb888], 0x9f
    ret
    cmp byte [0xb890], 0
    je short loc_6206e
    cmp byte [0xb891], 1
    jbe short loc_6206e
    mov al, 1
    ret
loc_6206e:
    xor al, al
    ret
    cmp byte [0xb890], 0
    je short loc_620a5
    cmp byte [0xb891], 1
    jne short loc_620a5
    test byte [0xb807], 4
    je short loc_62095
    cmp byte [0xb872], 0
    je short loc_6209c
loc_62095:
    mov eax, 1
    jmp short loc_6209e
loc_6209c:
    xor eax, eax
loc_6209e:
    test eax, eax
    je short loc_620a5
    mov al, 1
    ret
loc_620a5:
    xor al, al
    ret
    cmp byte [0xb890], 0
    je short loc_620e5
    cmp byte [0xb891], 1
    jne short loc_620e5
    test byte [0xb807], 4
    je short loc_620cc
    cmp byte [0xb872], 0
    je short loc_620d3
loc_620cc:
    mov eax, 1
    jmp short loc_620d5
loc_620d3:
    xor eax, eax
loc_620d5:
    test eax, eax
    je short loc_620e5
    test byte [0xb807], 0x40
    je short loc_620e5
    mov al, 1
    ret
loc_620e5:
    xor al, al
    ret
    cmp byte [0xb890], 0
    je short loc_6211c
    cmp byte [0xb891], 1
    jne short loc_6211c
loc_620fa:
    test byte [0xb807], 4
    je short loc_6210c
    cmp byte [0xb872], 0
    je short loc_62118
loc_6210c:
    mov eax, 1
loc_62111:
    test eax, eax
    je short loc_6211c
    mov al, 1
    ret
loc_62118:
    xor eax, eax
    jmp short loc_62111
loc_6211c:
    xor al, al
    ret
    cmp byte [0xb890], 0
    je short loc_6211c
    cmp byte [0xb891], 1
    jne short loc_6211c
    test byte [0xb806], 2
    sete al
    movzx eax, al
    test eax, eax
    je short loc_6211c
    jmp short loc_620fa
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    cmp byte [0xb892], 0
    jne short loc_62158
    call 0x738c5
loc_62158:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_62160:
    push ebp
    mov ebp, esp
    cmp dword [0xbe64], 0
    je short loc_62184
    cmp dword [0xbe68], 0
    sete al
    movzx eax, al
    test eax, eax
    je short loc_62184
    push 0
    call 0x635ca
loc_62184:
    mov al, byte [ebp + 8]
    mov byte [0xb868], al
    inc byte [0xb891]
    cmp byte [0xb890], 0
    je short loc_621c2
    cmp byte [0xb891], 1
    jne short loc_621c2
    mov byte [0xb871], al
    mov dword [0xb883], 0
    mov dword [0xb88c], 0
    call loc_61ff8
loc_621c2:
    pop ebp
    ret 4
loc_621c6:
    cmp byte [0xb890], 0
    je short loc_621ff
    cmp byte [0xb891], 1
    jne short loc_621ff
    cmp byte [0xb872], 0
    je short loc_621e7
    dec byte [0xb872]
loc_621e7:
    cmp byte [0xb872], 0
    jne short loc_621fa
    mov dword [0xb87f], 0
loc_621fa:
    call loc_62036
loc_621ff:
    cmp byte [0xb891], 0
    je short loc_6220e
    dec byte [0xb891]
loc_6220e:
    cmp byte [0xb891], 0
    jne short loc_62227
    cmp dword [0xbe64], 0
    je short loc_62227
    push 1
    call 0x635ca
loc_62227:
    ret
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    movzx eax, al
    push eax
    call loc_62160
    jmp near loc_62158
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    call loc_621c6
    jmp near loc_62158
loc_6224c:
    push ebp
    mov ebp, esp
    push esi
    cmp dword [ebp + 0x10], 0x10
    setb al
    movzx eax, al
    mov esi, eax
    test eax, eax
    je short loc_62281
    push 0xe
    call 0x63a9c
    push dword [ebp + 0x10]
    push dword [ebp + 0xc]
    call 0x6398f
    push eax
    push dword [0xb7a3]
    call 0x734d7
    add esp, 0x10
loc_62281:
    mov eax, esi
    pop esi
    pop ebp
    ret 0xc
loc_62288:
    push ebp
    mov ebp, esp
    cmp eax, dword [0xc8d0]
    jbe short loc_622a1
    cmp eax, dword [0xc8d4]
    jae short loc_622a1
    mov al, 1
    mov esp, ebp
    pop ebp
    ret
loc_622a1:
    xor al, al
    mov esp, ebp
    pop ebp
    ret
loc_622a7:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x10
    mov esi, dword [ebp + 0x10]
    mov dword [ebp - 0x14], 0
    mov eax, dword [ebp + 8]
    sub eax, dword [esi]
    mov dword [ebp - 0xc], eax
    add eax, dword [ebp + 0xc]
    mov dword [ebp - 0x18], eax
    mov eax, dword [esi + 0xa]
    mov dword [ebp - 0x10], eax
    test byte [esi + 5], 4
    je short loc_622d7
    xor edi, edi
    jmp short loc_622de
loc_622d7:
    movzx edi, byte [0xb810]
loc_622de:
    cmp byte [ebp + 0x14], 0x15
    je short loc_62301
    cmp byte [ebp + 0x14], 0x1a
    je short loc_62301
    test byte [esi + 5], 8
    jne short loc_62301
    push esi
    push dword [0xb71f]
    movzx eax, byte [ebp + 0x14]
    push eax
    call 0x63b59
loc_62301:
    cmp edi, dword [ebp - 0xc]
    ja short loc_62320
    mov eax, dword [ebp - 0x10]
    sub eax, edi
    cmp eax, dword [ebp - 0xc]
    ja short loc_62316
    cmp dword [ebp + 0xc], 0
    jne short loc_62320
loc_62316:
    mov eax, dword [ebp - 0x10]
    sub eax, edi
    cmp eax, dword [ebp - 0x18]
    jae short loc_62361
loc_62320:
    push 0xc
    call 0x63a9c
    mov byte [0xb893], 2
    push dword [ebp + 0xc]
    call 0x6398f
    push eax
    push dword [0xb753]
    call 0x734d7
    add esp, 0xc
    push esi
    call 0x639e4
    push eax
    push dword [0xb757]
    call 0x734d7
    add esp, 8
    mov dword [ebp - 0x14], 4
loc_62361:
    mov eax, dword [ebp - 0x14]
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 0x10
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x30
    mov edi, dword [ebp + 0x14]
    mov esi, dword [ebp + 0x1c]
    xor ebx, ebx
    mov al, byte [ebp + 0xc]
    mov byte [ebp - 0xc], al
    cmp dword [0xb7d0], 0
    jne near loc_62677
    mov dword [0xb7d0], 1
    mov dword [0xb873], ebx
    cmp dword [ebp + 8], 0
    jne short loc_623ac
    lea eax, [ebp - 0x38]
    mov dword [ebp + 8], eax
loc_623ac:
    mov eax, dword [ebp + 8]
    mov dword [eax], 0
    test edi, edi
    je short loc_623f4
    push esi
    push dword [0xb71f]
    push 1
    call loc_6224c
    test eax, eax
    jne short loc_623de
    lea eax, [edi - 1]
    add eax, esi
    push eax
    push dword [0xb71f]
    push 1
    call loc_6224c
loc_623de:
    cmp dword [ebp + 0x18], -6
    je short loc_623f4
    push dword [ebp + 0x18]
    push dword [0xb71b]
    push 0
    call loc_6224c
loc_623f4:
    test byte [ebp + 0xd], 0x80
    je short loc_62447
    mov eax, esi
    sub eax, dword [ebp + 0x18]
    test eax, eax
    jle short loc_62447
    cmp eax, edi
    jge short loc_62447
    push 0xa
    call 0x63a9c
    mov byte [0xb893], 2
    push edi
    call 0x6398f
    push eax
    push dword [0xb787]
    call 0x734d7
    add esp, 0xc
    push dword [ebp + 0x18]
    push esi
    movzx eax, byte [ebp - 0xc]
    push dword [eax*4 + 0xbcc5]
    push dword [0xb78b]
    call 0x734d7
    add esp, 0x10
loc_62447:
    cmp byte [0xb872], 1
    jne short loc_62472
    cmp dword [0xb87f], 0
    je short loc_62472
    cmp dword [0xb87f], 2
    je short loc_62472
    cmp dword [0xb87f], 4
    je short loc_62472
    mov eax, 1
    jmp short loc_62474
loc_62472:
    xor eax, eax
loc_62474:
    mov dword [ebp - 0x1c], eax
    test eax, eax
    je short loc_624a5
    cmp edi, dword [0xb87f]
    jbe short loc_624a5
    push 0xc
    call 0x63a9c
    push dword [0xb87f]
    push edi
    call 0x6398f
    push eax
    push dword [0xb793]
    call 0x734d7
    add esp, 0x10
loc_624a5:
    test byte [0xb806], 0x20
    je near loc_625be
    mov eax, esi
    call loc_62288
    movzx eax, al
    mov dword [ebp - 0x20], eax
    test eax, eax
    jne short loc_624d3
    mov eax, dword [ebp + 0x18]
    call loc_62288
    test al, al
    je near loc_625be
loc_624d3:
    push dword [ebp + 0x10]
    call 0x8c386
    mov dword [ebp - 0x18], eax
    mov dword [ebp - 0x10], 0
    cmp dword [ebp - 0x20], 0
    je short loc_624fa
    cmp esi, eax
    setb al
    movzx eax, al
    mov dword [ebp - 0x10], eax
    test eax, eax
    jne short loc_62510
loc_624fa:
    cmp dword [ebp - 0x20], 0
    jne near loc_62586
    mov eax, dword [ebp + 0x18]
    cmp eax, dword [ebp - 0x18]
    jae near loc_62586
loc_62510:
    push 7
    call 0x63a9c
    mov byte [0xb893], 2
    cmp dword [ebp - 0x10], 0
    je short loc_6252b
    mov eax, dword [0xb71f]
    jmp short loc_62530
loc_6252b:
    mov eax, dword [0xb71b]
loc_62530:
    push eax
    push edi
    call 0x6398f
    push eax
    push dword [0xb77b]
    call 0x734d7
    add esp, 0x10
    cmp dword [ebp - 0x10], 0
    je short loc_62550
    mov eax, esi
    jmp short loc_62553
loc_62550:
    mov eax, dword [ebp + 0x18]
loc_62553:
    mov ebx, dword [ebp - 0x18]
    sub ebx, eax
    push ebx
    cmp dword [ebp - 0x10], 0
    je short loc_62563
    mov eax, esi
    jmp short loc_62566
loc_62563:
    mov eax, dword [ebp + 0x18]
loc_62566:
    push eax
    je short loc_62570
    mov eax, dword [0xb71f]
    jmp short loc_62575
loc_62570:
    mov eax, dword [0xb71b]
loc_62575:
    push eax
    push dword [0xb77f]
    call 0x734d7
    add esp, 0x10
    jmp short loc_625be
loc_62586:
    cmp dword [ebp - 0x20], 0
    je short loc_625be
    cmp edi, 0xffff
    ja short loc_625a2
    push esi
    push edi
    push -1
    call 0x8c3ae
    test ax, ax
    je short loc_625be
loc_625a2:
    push 8
    call 0x63a9c
    push edi
    call 0x6398f
    push eax
    push dword [0xb783]
    call 0x734d7
    add esp, 0xc
loc_625be:
    cmp dword [ebp - 0x1c], 0
    jne short loc_625f1
    test byte [0xb806], 2
    sete al
    movzx eax, al
    test eax, eax
    je short loc_625f1
    push esi
    push dword [ebp + 8]
    call 0x63886
    test eax, eax
    je short loc_625f1
    movzx eax, byte [ebp - 0xc]
    push eax
    push dword [ebp + 8]
    push edi
    push esi
    call loc_622a7
loc_625f1:
    test edi, edi
    je short loc_6262d
    cmp dword [0xb873], 0
    jne short loc_6262d
    movzx eax, byte [ebp - 0xc]
    mov dword [ebp - 0x14], eax
    push eax
    push esi
    push dword [0xb71f]
    call 0x73d9f
    test eax, eax
    jne short loc_6262d
    cmp dword [ebp + 0x18], -6
    je short loc_6262d
    push dword [ebp - 0x14]
    push dword [ebp + 0x18]
    push dword [0xb71b]
    call 0x73d9f
loc_6262d:
    mov ebx, dword [0xb873]
    mov eax, dword [ebp + 0x18]
    mov dword [0xb88c], eax
    cmp dword [0xd368], 0
    je short loc_6266d
    test byte [0xb806], 2
    sete al
    movzx eax, al
    test eax, eax
    je short loc_6266d
    push edi
    push esi
    push ebx
    inc byte [0xb887]
    call dword [0xd368]
    add esp, 0xc
    dec byte [0xb887]
loc_6266d:
    mov dword [0xb7d0], 0
loc_62677:
    mov eax, ebx
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 0x18
