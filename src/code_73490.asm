bits 32
org 0x73490

    cmp byte [0xd2a4], 0
    setne al
    movzx eax, al
    ret
loc_7349e:
    push ebp
    mov ebp, esp
    cmp byte [0xd2a4], 0
    jne short loc_734d3
    mov byte [0xd2a4], 1
    cmp byte [0xb893], 0
    je short loc_734c0
    dec byte [0xb893]
loc_734c0:
    push dword [ebp + 8]
    call dword [0x14848]
    add esp, 4
    mov byte [0xd2a4], 0
loc_734d3:
    pop ebp
    ret 4
    push ebp
    mov ebp, esp
    push ebx
    sub esp, 0x194
    lea eax, [ebp + 0xc]
    mov dword [ebp - 8], eax
    mov edx, dword [ebp + 8]
    lea eax, [ebp - 0x198]
    call 0x62682
    lea ebx, [ebp - 8]
    lea edx, [ebp - 0x198]
    lea eax, [ebp - 0xd0]
    call 0x63d72
    mov dword [ebp - 8], 0
    cmp byte [ebp - 0xd0], 0x61
    jb short loc_73529
    cmp byte [ebp - 0xd0], 0x7a
    ja short loc_73529
    sub byte [ebp - 0xd0], 0x20
loc_73529:
    cmp byte [0xd2a5], 0
    jne short loc_7354c
    mov byte [0xd2a5], 1
    lea eax, [ebp - 0xd0]
    push eax
    call 0x81e05
    mov byte [0xd2a5], 0
loc_7354c:
    lea eax, [ebp - 0xd0]
    push eax
    call loc_7349e
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret
