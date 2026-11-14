bits 32
org 0x50fe0

%define RANDOM_INITIALIZED 0xa258
%define PLAYER_COUNT 0xcf65c
%define READ_CLOCK 0x5aed8
%define SEED_C_RANDOM 0x61213
%define BUILD_RANDOM 0x46fa0
%define C_RANDOM 0x611ef
%define SLOT_TABLE 0x218060

select_random:
    push ebp
    mov ebp, esp
    push ebx
    cmp dword [RANDOM_INITIALIZED], 0
    jne .select
    cmp word [PLAYER_COUNT], 2
    jge .select
    call READ_CLOCK
    mov ebx, 1
    call SEED_C_RANDOM
    mov [RANDOM_INITIALIZED], ebx
.select:
    cmp word [PLAYER_COUNT], 1
    jle .single_player
    call BUILD_RANDOM
    jmp short .done
.single_player:
    call C_RANDOM
.done:
    lea esp, [ebp - 4]
    pop ebx
    pop ebp
    ret

store_slot:
    push ebp
    mov ebp, esp
    cmp eax, 9
    ja .done
    mov [eax * 4 + SLOT_TABLE], edx
.done:
    mov esp, ebp
    pop ebp
    ret
    nop
