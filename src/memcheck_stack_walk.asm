bits 32
org 0x82677

loc_82677:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0xc
    xor edi, edi
    mov dword [ebp - 0x10], edi
    mov byte [ebp - 0xc], 0
    test byte [0xb888], 0x20
    je short loc_82695
    mov al, 0x24
    jmp short loc_82697
loc_82695:
    mov al, 0x4d
loc_82697:
    movzx eax, al
    mov dword [ebp - 0x14], eax
    push eax
    call 0x62160
    call 0x62071
    test al, al
    jne short loc_826bb
    mov eax, dword [ebp + 8]
    call 0x733ad
    mov edi, eax
    jmp near loc_8273b
loc_826bb:
    movzx eax, byte [0xb810]
    add eax, eax
    inc dword [0xb850]
    mov edx, dword [ebp + 8]
    add edx, eax
    cmp edx, -0x21
    jbe short loc_826da
loc_826d4:
    mov byte [ebp - 0xc], 1
    jmp short loc_82701
loc_826da:
    mov eax, edx
    call 0x733ad
    mov esi, eax
    mov dword [ebp - 0x10], eax
    test eax, eax
    je short loc_826d4
    push dword [ebp - 0x14]
    push eax
    push edx
    call 0x636c1
    test eax, eax
    jne short loc_826d4
    movzx edi, byte [0xb810]
    add edi, esi
loc_82701:
    cmp byte [ebp - 0xc], 0
    je short loc_8273b
    push 0xd
    call 0x63a9c
    push dword [0xb850]
    push dword [ebp + 8]
    call 0x6398f
    push eax
    push dword [0xb767]
    call 0x734d7
    add esp, 0x10
    cmp dword [ebp - 0x10], 0
    je short loc_82739
    mov eax, dword [ebp - 0x10]
    call 0x7355e
loc_82739:
    xor edi, edi
loc_8273b:
    call 0x621c6
    mov eax, edi
loc_82742:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 4
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push eax
    call loc_82677
loc_82757:
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
loc_8275f:
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x18
    mov esi, 1
    test byte [0xb888], 0x40
    je short loc_82779
    mov al, 0x1c
    jmp short loc_8277b
loc_82779:
    mov al, 0x4c
loc_8277b:
    movzx edi, al
    push edi
    call 0x62160
    call 0x62071
    test al, al
    je short loc_827ca
    cmp dword [ebp + 8], 0
    jne short loc_82797
    xor esi, esi
    jmp short loc_827a6
loc_82797:
    push dword [ebp + 8]
    push edi
    lea esi, [ebp - 0x20]
    push esi
    call 0x63c20
    mov esi, eax
loc_827a6:
    cmp esi, 1
    jne short loc_827c0
    lea edi, [ebp - 0x20]
    push edi
    call 0x637ad
    movzx edi, byte [0xb810]
    sub dword [ebp + 8], edi
    jmp short loc_827ca
loc_827c0:
    cmp esi, 2
    jne short loc_827ca
    mov esi, 1
loc_827ca:
    cmp esi, 1
    jne short loc_827d7
    mov eax, dword [ebp + 8]
    call 0x7355e
loc_827d7:
    call 0x621c6
    jmp near loc_82742
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push eax
    call loc_8275f
    jmp near loc_82757
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 0x20
    push eax
    mov edi, edx
    xor esi, esi
    mov byte [ebp - 0x14], 0
    push 0x4b
    call 0x62160
    call 0x62071
    test al, al
    jne short loc_82826
    mov edx, edi
    mov eax, dword [ebp - 0x34]
    call 0x88ebf
    mov esi, eax
    jmp near loc_828cb
loc_82826:
    movzx eax, byte [0xb810]
    add eax, eax
    inc dword [0xb850]
    add eax, edi
    mov dword [ebp - 0x18], eax
    cmp eax, -0x21
    jbe short loc_82843
    mov byte [ebp - 0x14], 1
loc_82843:
    push dword [ebp - 0x34]
    push 0x4b
    lea eax, [ebp - 0x30]
    push eax
    call 0x63c20
    cmp eax, 1
    jne short loc_828a1
    movzx eax, byte [0xb810]
    mov esi, dword [ebp - 0x34]
    sub esi, eax
    mov eax, esi
    mov edx, dword [ebp - 0x18]
    call 0x88ebf
    mov esi, eax
    test eax, eax
    jne short loc_82876
    mov byte [ebp - 0x14], 1
loc_82876:
    cmp byte [ebp - 0x14], 0
    jne short loc_828a1
    lea eax, [ebp - 0x30]
    push eax
    call 0x637ad
    push 0x4b
    push esi
    push dword [ebp - 0x18]
    call 0x636c1
    test eax, eax
    setne al
    mov byte [ebp - 0x14], al
    movzx eax, byte [0xb810]
    add esi, eax
loc_828a1:
    cmp byte [ebp - 0x14], 1
    jne short loc_828cb
    xor esi, esi
    push 0xd
    call 0x63a9c
    push dword [0xb850]
    push edi
    call 0x6398f
    push eax
    push dword [0xb767]
    call 0x734d7
    add esp, 0x10
loc_828cb:
    call 0x621c6
    mov eax, esi
    lea esp, [ebp - 0x10]
    pop edi
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
