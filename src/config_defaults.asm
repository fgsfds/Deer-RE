bits 32
org 0x103e8

config_defaults:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push edi
    mov edx, 1
    mov edi, 192
    mov eax, 128
    mov ebx, 8
    mov [0xc0058], edx     ; sound
    mov [0xc0054], edx     ; music
    mov ecx, edx
    mov [0xc005c], edx     ; voice
    mov [0xc0060], edx     ; ambience
    mov [0xc00a0], edi     ; effects volume
    mov [0xc00a4], eax     ; music volume
    mov [0xbfb4f], ebx     ; screen size
    mov [0xbfb2b], ecx
    mov [0xbfb2f], ecx
    mov edi, ecx
    mov [0xbfff3], ecx
    mov [0xbffcf], ecx
    xor edx, edx
    xor ah, ah
    mov [0xc007c], edx     ; reverse stereo
    mov [0x8c36a], ah      ; initial aim mode
    mov [0xbffcb], edi
    mov [0xbfb53], edx
    mov [0xbf9f4], ah
    mov [0xbfb57], edx
    lea esp, [ebp - 16]
    pop edi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    lea eax, [byte eax + 0]
