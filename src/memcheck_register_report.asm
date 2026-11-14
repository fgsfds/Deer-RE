bits 32
org 0x81fb9

loc_81fb9:
    push ebp
    mov ebp, esp
    push ecx
    push edx
    push eax
    call 0x8c1b2
    add esp, 4
    cmp eax, -2
    jne short loc_81fdd
    mov edx, 0x89a0
    mov eax, 0x23ef04
    call 0x62682
    jmp short loc_81ff0
loc_81fdd:
    push eax
    push 0x89b1
    push 0x23ef04
    call 0x75f3e
    add esp, 0xc
loc_81ff0:
    mov eax, 0x23ef04
    lea esp, [ebp - 8]
    pop edx
    pop ecx
    pop ebp
    ret
loc_81ffc:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push 0x89b6
    push 0x5c
    call 0x5d849
    push dword [0xd2e8]
    push dword [0xd2e4]
    push dword [0xd2e0]
    push 0x89be
    call 0x76020
    add esp, 0x10
    push 0x89b6
    push 0x5f
    call 0x5d849
    push dword [0xd2f4]
    push dword [0xd2f0]
    push dword [0xd2ec]
    push 0x89e7
    call 0x76020
    add esp, 0x10
    push 0x89b6
    push 0x62
    call 0x5d849
    push dword [0xd2f8]
    push dword [0xd2fc]
    push dword [0xd2cc]
    push 0x8a10
    call 0x76020
    add esp, 0x10
    push 0x89b6
    push 0x65
    call 0x5d849
    movzx eax, word [0xd300]
    call loc_81fb9
    push eax
    movzx eax, word [0xd300]
    push eax
    push 0x8a39
    call 0x76020
    add esp, 0xc
    push 0x89b6
    push 0x68
    call 0x5d849
    movzx eax, word [0xd302]
    call loc_81fb9
    push eax
    movzx eax, word [0xd302]
    push eax
    push 0x8a55
    call 0x76020
    add esp, 0xc
    push 0x89b6
    push 0x6b
    call 0x5d849
    movzx eax, word [0xd304]
    call loc_81fb9
    push eax
    movzx eax, word [0xd304]
    push eax
    push 0x8a71
    call 0x76020
    add esp, 0xc
    push 0x89b6
    push 0x6e
    call 0x5d849
    movzx eax, word [0xd306]
    call loc_81fb9
    push eax
    movzx eax, word [0xd306]
    push eax
    push 0x8a8d
    call 0x76020
    add esp, 0xc
    push 0x89b6
    push 0x71
    call 0x5d849
    movzx eax, word [0xd308]
    call loc_81fb9
    push eax
    movzx eax, word [0xd308]
    push eax
    push 0x8aa9
    call 0x76020
    add esp, 0xc
    push 0x89b6
    push 0x74
    call 0x5d849
    movzx eax, word [0xd30a]
    call loc_81fb9
    push eax
    movzx eax, word [0xd30a]
    push eax
    push 0x8ac5
    call 0x76020
    add esp, 0xc
    push 0x89b6
    push 0x77
    call 0x5d849
    test byte [0xd30c], 1
    setne al
    movzx eax, al
    push eax
    test byte [0xd30c], 4
    setne al
    movzx eax, al
    push eax
    test byte [0xd30c], 0x10
    setne al
    movzx eax, al
    push eax
    test byte [0xd30c], 0x40
    setne al
    movzx eax, al
    push eax
    test byte [0xd30c], 0x80
    setne al
    movzx eax, al
    push eax
    test byte [0xd30d], 1
    setne al
    movzx eax, al
    push eax
    test byte [0xd30d], 2
    setne al
    movzx eax, al
    push eax
    test byte [0xd30d], 4
    setne al
    movzx eax, al
    push eax
    test byte [0xd30d], 8
    setne al
    movzx eax, al
    push eax
    push 0x8ae1
    call 0x76020
    add esp, 0x28
    lea esp, [ebp - 0xc]
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    push ebx
    call 0x81e58
    push 0x89b6
    push 0x8b
    call 0x5d849
    push 0x8b21
    call 0x76020
    add esp, 4
    push 0x89b6
    push 0x95
    call 0x5d849
    push dword [0xd2c8]
    push dword [0xd2cc]
    movzx eax, word [0xd2d0]
    push eax
    push 0x8b6e
    call 0x76020
    add esp, 0x10
    call 0x88d83
    push dword [0xd2cc]
    movzx eax, word [0xd2d0]
    push eax
    push 0x8bae
    call 0x81d73
    add esp, 0xc
    call 0x88d12
    test eax, eax
    je short loc_822ef
    push 0x89b6
    push 0x9d
    call 0x5d849
    call 0x5ab5c
    push eax
    call 0x5ab56
    push eax
    call 0x88d20
    test eax, eax
    je short loc_822dc
    mov eax, 0x8bc4
    jmp short loc_822e1
loc_822dc:
    mov eax, 0x8bc7
loc_822e1:
    push eax
    push 0x8bcd
    call 0x76020
    add esp, 0x10
loc_822ef:
    call loc_81ffc
    push 0x89b6
    push 0xa1
    call 0x5d849
    push 0x8bef
    call 0x88da6
    call 0x81e58
    push 0x89b6
    push 0xa4
    call 0x5d849
    push 0x8c14
    call 0x76020
    add esp, 4
    call 0x81ea5
    push 0x8c61
    push 0x8c8d
    call 0x5ac04
    add esp, 8
    pop ebx
    ret
    ret
    push ebp
    mov ebp, esp
    push ebx
    sub esp, 0x64
    mov ebx, dword [ebp + 8]
    mov eax, dword [0x14850]
    call 0x64103
    mov ecx, eax
    test eax, eax
    je short loc_823c8
    or byte [ebx], 1
    mov edx, 0x8ca0
    call 0x5ac26
    test eax, eax
    jne short loc_82378
    or byte [ebx], 2
    jmp short loc_823c8
loc_82378:
    mov edx, ebx
    mov eax, ecx
    call loc_82411
    test eax, eax
    je short loc_823c8
    mov edx, 0x2e
    mov eax, ecx
    call 0x88e4f
    test eax, eax
    jne short loc_823a5
    mov edx, 0x5c
    mov eax, ecx
    call 0x88e4f
    test eax, eax
    je short loc_823c8
loc_823a5:
    mov ecx, ds
    mov ebx, dword [0xb7ab]
    mov edx, ds
    lea eax, [ebp - 0x68]
    call 0x88e63
    lea eax, [ebp - 0x68]
    push eax
    push 0x8ca5
    call 0x5ac04
    add esp, 8
loc_823c8:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
loc_823ce:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov ecx, 0xffffffff
    push 0x200
    push dword [ebp + 8]
    call 0x61340
    add esp, 8
    mov esi, eax
    test eax, eax
    jl short loc_8240b
    movzx ebx, word [ebp + 0x10]
    mov edx, dword [ebp + 0xc]
    call 0x615b2
    movzx ebx, word [ebp + 0x10]
    cmp eax, ebx
    jne short loc_82404
    xor ecx, ecx
loc_82404:
    mov eax, esi
    call 0x616ad
loc_8240b:
    mov eax, ecx
    pop esi
    pop ebx
    pop ebp
    ret
loc_82411:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push esi
    sub esp, 0x38
    mov esi, edx
    push 0x38
    lea edx, [ebp - 0x44]
    push edx
    push eax
    call loc_823ce
    add esp, 0xc
    movsx ecx, ax
    test ecx, ecx
    jne short loc_82463
    cmp dword [ebp - 0x44], 0x10f23bc4
    je short loc_82454
    push 0x8ca9
    push 0x8ca5
    call 0x5ac04
    add esp, 8
    call loc_8246d
    jmp short loc_82463
loc_82454:
    mov ebx, 0x34
    lea edx, [ebp - 0x40]
    mov eax, esi
    call 0x73632
loc_82463:
    mov eax, ecx
    lea esp, [ebp - 0xc]
    pop esi
    pop ecx
    pop ebx
    pop ebp
    ret
loc_8246d:
    push ebp
    mov ebp, esp
    push edx
    xor eax, eax
    call 0x88a13
    mov edx, eax
loc_8247a:
    xor eax, eax
    call 0x88a13
    cmp edx, eax
    je short loc_8247a
    lea esp, [ebp - 4]
    pop edx
    pop ebp
    ret
    ret
    push ebp
    mov ebp, esp
    mov eax, dword [0x14848]
    cmp dword [ebp + 8], 0
    je short loc_824a3
    mov edx, dword [ebp + 8]
    mov dword [0x14848], edx
loc_824a3:
    pop ebp
    ret 4
    mov eax, dword [0x14848]
    ret
loc_824ad:
    push ebp
    mov ebp, esp
    mov al, byte [ebp + 8]
    cmp al, 0xf
    je short loc_824c3
    cmp al, 0x1c
    je short loc_824c3
    cmp al, 0x5c
    je short loc_824c3
    cmp al, 0x5e
    jne short loc_824cc
loc_824c3:
    mov eax, 1
    pop ebp
    ret 4
loc_824cc:
    xor eax, eax
    pop ebp
    ret 4
loc_824d2:
    push ebp
    mov ebp, esp
    mov edx, dword [ebp + 8]
    mov eax, 1
    cmp dword [edx + 6], 6
    jae short loc_824f8
    movzx ebx, byte [0xb810]
    add ebx, ebx
    mov edx, dword [edx + 0xa]
    sub edx, ebx
    cmp edx, 8
    jne short loc_824f8
    xor eax, eax
loc_824f8:
    pop ebp
    ret 4
loc_824fc:
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push eax
    push dword [0xb883]
    push dword [0xb73f]
    movzx eax, byte [0x23ef2e]
    push eax
    call 0x63b59
    mov esi, eax
    cmp byte [0x23ef2e], 1
    jne near loc_82620
    movzx edi, byte [0xb810]
    add edi, edi
    mov eax, dword [0xb883]
    mov edx, dword [eax + 0xa]
    sub edx, edi
    mov edi, edx
    cmp byte [eax + 4], 4
    jne short loc_8254c
    mov byte [ebp - 0xc], 5
    jmp short loc_8256e
loc_8254c:
    cmp byte [eax + 4], 0x56
    jne short loc_82558
loc_82552:
    mov byte [ebp - 0xc], 0x58
    jmp short loc_8256e
loc_82558:
    cmp byte [eax + 4], 0x57
    je short loc_82552
    cmp byte [eax + 4], 0x24
    jne short loc_8256a
    mov byte [ebp - 0xc], 0x1c
    jmp short loc_8256e
loc_8256a:
    mov byte [ebp - 0xc], 0xf
loc_8256e:
    push dword [0xb883]
    call loc_824d2
    mov dword [ebp - 0x10], eax
    test eax, eax
    je near loc_82611
    push 5
    call 0x63a9c
    push dword [0xb883]
    call 0x639e4
    push eax
    movzx eax, byte [ebp - 0xc]
    push dword [eax*4 + 0xbcc5]
    push dword [0xb75b]
    call 0x734d7
    add esp, 0xc
    inc dword [0x23ef2f]
    cmp dword [0x23ef2f], 1
    jne short loc_825fb
    mov eax, dword [0xb883]
    test byte [eax + 5], 1
    jne short loc_825fb
    mov byte [0xb893], 3
    push dword [0xb7bf]
    call 0x734d7
    add esp, 4
    push dword [0xb7c3]
    call 0x734d7
    add esp, 4
    push dword [0xb7c7]
    call 0x734d7
    add esp, 4
loc_825fb:
    movzx eax, byte [ebp - 0xc]
    push eax
    call loc_824ad
    test eax, eax
    je short loc_8261d
    add dword [0xb85c], edi
    jmp short loc_8261d
loc_82611:
    cmp byte [ebp - 0xc], 0xf
    jne short loc_8261d
    add dword [0xb840], edi
loc_8261d:
    or esi, dword [ebp - 0x10]
loc_82620:
    mov eax, esi
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push esi
    xor esi, esi
    mov al, byte [ebp + 8]
    mov byte [0x23ef2e], al
    mov dword [0xb883], 0x23ef18
    call 0x75ec2
    test eax, eax
    jne short loc_82666
loc_8264a:
    push 0x23ef18
    call 0x75ed0
    test eax, eax
    jne short loc_82661
    call loc_824fc
    or esi, eax
    jmp short loc_8264a
loc_82661:
    call 0x75ec1
loc_82666:
    mov eax, esi
    pop esi
    pop ebp
    ret 4
    ret
