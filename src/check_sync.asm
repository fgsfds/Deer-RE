bits 32
org 0x13ec0

%define SET_DEBUG_LOCATION 0x5d849
%define SPRINTF 0x5d8cc
%define PRINT_TEXT_256 0x46e99
%define SOURCE_NAME 0x860
%define SYNC_TOTAL_TAIL 0xbccbc
%define CONNECT_HEAD 0xcf658
%define CONNECT_NEXT_BEFORE 0xcf53e
%define CONNECT_NEXT 0xcf540
%define SYNC_HEAD 0x1c040
%define SYNC_VALUES 0x1b040
%define SYNC_STATUS 0xc0038
%define OUT_OF_SYNC_TEXT 0x8f0
%define SYNC_HELP_TEXT 0x918
%define MISSED_PACKET_TEXT 0x938
%define MISSED_PACKET_HELP_TEXT 0x954
%define DRINK_AMOUNT_FORMAT 0x974
%define TILT_STATUS_FORMAT 0x984
%define MOTORCYCLE_SPEED_FORMAT 0x994
%define BUMP_TARGET_FORMAT 0x9a4
%define BUMP_CURRENT_FORMAT 0x9b8
%define HORIZON_FORMAT 0x9c8
%define TURBULENCE_COUNT_FORMAT 0x9d4
%define MOTORCYCLE_ON_GROUND_FORMAT 0x9e4
%define PLAYER_SKILL_FORMAT 0x9f8
%define DRUG_MODE_FORMAT 0xa10
%define WIND_DIRECTION_FORMAT 0xa20
%define WIND_TIME_FORMAT 0xa30
%define ON_MOTORCYCLE_FORMAT 0xa40
%define BIKE_TURN_FORMAT 0xa54
%define LOCAL_PLAYER_FORMAT 0xa64
%define ON_BOAT_FORMAT 0xa78
%define NOT_ON_WATER_FORMAT 0xa84
%define SEASICK_FORMAT 0xa94
%define SCREEN_ROTATION_FORMAT 0xaa4
%define LEVEL_NUMBER_FORMAT 0xab4
%define VOLUME_NUMBER_FORMAT 0xacc
%define ON_GROUND_FORMAT 0xae4
%define FOG_TYPE_FORMAT 0xaf4
%define SLOT_WIN_FORMAT 0xb04
%define SPRITE_BRIDGE_FORMAT 0xb14
%define BELL_TIME_FORMAT 0xb28

check_sync:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x2c
    mov esi, dword [SYNC_TOTAL_TAIL]
    mov di, word [CONNECT_HEAD]
    movsx eax, di
    test eax, eax
    jl short start_comparison_if_ready
check_first_sample_available:
    mov edx, dword [nosplit eax*4 + SYNC_HEAD]
    cmp edx, esi
    je short start_comparison_if_ready
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jge short check_first_sample_available
start_comparison_if_ready:
    test eax, eax
    jge near update_status
    xor ah, ah
    mov byte [SYNC_STATUS], ah
compare_next_sample:
    movsx eax, di
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jl short advance_sample
    mov edx, esi
    and edx, strict dword 0xff
compare_peer_sample:
    movsx ebx, di
    shl ebx, 8
    lea ecx, [ebx + edx]
    mov ebx, eax
    shl ebx, 8
    mov bl, byte [edx + ebx + SYNC_VALUES]
    cmp bl, byte [ecx + SYNC_VALUES]
    je short loc_13f45
    mov byte [SYNC_STATUS], 1
loc_13f45:
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jge short compare_peer_sample
advance_sample:
    movsx eax, di
    inc esi
    test eax, eax
    jl short loc_13f74
check_next_sample_available:
    mov edx, dword [nosplit eax*4 + SYNC_HEAD]
    cmp edx, esi
    je short loc_13f74
    mov eax, dword [nosplit eax*2 + CONNECT_NEXT_BEFORE]
    sar eax, 0x10
    test eax, eax
    jge short check_next_sample_available
loc_13f74:
    test eax, eax
    jl short compare_next_sample
update_status:
    movsx eax, di
    cmp word [nosplit eax*2 + CONNECT_NEXT], 0
    jge short loc_13f8e
    xor ch, ch
    mov byte [SYNC_STATUS], ch
loc_13f8e:
    mov al, byte [SYNC_STATUS]
    mov dword [SYNC_TOTAL_TAIL], esi
    mov word [CONNECT_HEAD], di
    test al, al
    je short check_missed_packets
    push byte 0
    mov ebx, 0x1f
    mov edx, 0x82
    push dword OUT_OF_SYNC_TEXT
    mov eax, 4
    xor ecx, ecx
    call PRINT_TEXT_256
    push byte 0
    mov ebx, 0x1f
    mov edx, 0x8a
    push dword SYNC_HELP_TEXT
    mov eax, 4
    xor ecx, ecx
    call PRINT_TEXT_256
check_missed_packets:
    cmp byte [0x9e40], 0
    je short draw_player_diagnostics
    push byte 0
    mov ebx, 0x1f
    mov edx, 0xa0
    push dword MISSED_PACKET_TEXT
    mov eax, 4
    xor ecx, ecx
    call PRINT_TEXT_256
    push byte 0
    mov ebx, 0x1f
    mov edx, 0x8a
    push dword MISSED_PACKET_HELP_TEXT
    mov eax, 4
    xor ecx, ecx
    call PRINT_TEXT_256
draw_player_diagnostics:
    mov eax, dword [0xbf560]
    sar eax, 0x10
    imul eax, eax, strict dword 0x623
    mov edx, 0x8be10
    add edx, eax
    mov dword [ebp - 0x18], edx
    cmp dword [edx + 0x5d9], 0
    je near save_sync_tail
    push dword SOURCE_NAME
    push dword 0x3c4
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x596]
    sar eax, 0x10
    push eax
    push dword DRINK_AMOUNT_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x10
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3c6
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x5bd]
    sar eax, 0x10
    push eax
    push dword TILT_STATUS_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x20
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3c8
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x5bb]
    sar eax, 0x10
    push eax
    push dword MOTORCYCLE_SPEED_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x30
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3ca
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x5c1]
    sar eax, 0x10
    push eax
    push dword BUMP_TARGET_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    push byte 0
    lea eax, [ebp - 0x40]
    mov ebx, 0x1f
    mov edx, 0x40
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3cc
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x5c3]
    sar eax, 0x10
    push eax
    push dword BUMP_CURRENT_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x50
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3ce
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov ebx, dword [eax + 0x220]
    push ebx
    push dword HORIZON_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov edx, 0x60
    push byte 0
    lea eax, [ebp - 0x40]
    xor ecx, ecx
    push eax
    mov ebx, 0x1f
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3d0
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x5c9]
    sar eax, 0x10
    push eax
    push dword TURBULENCE_COUNT_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x70
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3d2
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov ecx, dword [eax + 0x5b1]
    push ecx
    push dword MOTORCYCLE_ON_GROUND_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x80
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3d4
    call SET_DEBUG_LOCATION
    mov eax, dword [0xbffe7]
    push eax
    push dword PLAYER_SKILL_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x90
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3d6
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov edx, dword [eax + 0x5ed]
    push edx
    push dword DRUG_MODE_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    xor ecx, ecx
    push eax
    mov edx, 0xa0
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3d8
    call SET_DEBUG_LOCATION
    mov ebx, dword [0x93bc]
    push ebx
    push dword WIND_DIRECTION_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    push byte 0
    lea eax, [ebp - 0x40]
    mov ebx, 0x1f
    mov edx, 0xb0
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3da
    call SET_DEBUG_LOCATION
    mov ecx, dword [0x93b8]
    push ecx
    push dword WIND_TIME_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0xc0
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3dc
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov edx, dword [eax + 0x5ad]
    push edx
    push dword ON_MOTORCYCLE_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    xor ecx, ecx
    push eax
    mov edx, 0xd0
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3de
    call SET_DEBUG_LOCATION
    mov eax, dword [0x99ce]
    sar eax, 0x10
    push eax
    push dword BIKE_TURN_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0xe0
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3e0
    call SET_DEBUG_LOCATION
    mov eax, dword [0xcf65c]
    sar eax, 0x10
    push eax
    push dword LOCAL_PLAYER_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0xf0
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3e2
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov ebx, dword [eax + 0x5d1]
    push ebx
    push dword ON_BOAT_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov edx, 0x100
    push byte 0
    lea eax, [ebp - 0x40]
    xor ecx, ecx
    push eax
    mov ebx, 0x1f
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3e4
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov ecx, dword [eax + 0x5d5]
    push ecx
    push dword NOT_ON_WATER_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x110
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3e6
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov edx, dword [eax + 0x5e5]
    push edx
    push dword SEASICK_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    push byte 0
    lea eax, [ebp - 0x40]
    mov ebx, 0x1f
    mov edx, 0x120
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3e8
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x516]
    sar eax, 0x10
    push eax
    push dword SCREEN_ROTATION_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x130
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3ea
    call SET_DEBUG_LOCATION
    mov ebx, dword [0xbffeb]
    push ebx
    push dword LEVEL_NUMBER_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov edx, 0x140
    push byte 0
    lea eax, [ebp - 0x40]
    xor ecx, ecx
    push eax
    mov ebx, 0x1f
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3ec
    call SET_DEBUG_LOCATION
    mov ecx, dword [0xbffef]
    push ecx
    push dword VOLUME_NUMBER_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x150
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3ee
    call SET_DEBUG_LOCATION
    mov edx, dword [ebp - 0x18]
    xor eax, eax
    mov al, byte [edx + 0x542]
    push eax
    push dword ON_GROUND_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    xor ecx, ecx
    push eax
    mov edx, 0x160
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3f0
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x282]
    sar eax, 0x10
    push eax
    push dword FOG_TYPE_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x170
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3f2
    call SET_DEBUG_LOCATION
    mov eax, dword [ebp - 0x18]
    mov eax, dword [eax + 0x5f9]
    sar eax, 0x10
    push eax
    push dword SLOT_WIN_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x180
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3f4
    call SET_DEBUG_LOCATION
    mov edx, dword [ebp - 0x18]
    xor eax, eax
    mov al, byte [edx + 0x553]
    push eax
    push dword SPRITE_BRIDGE_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    push byte 0
    lea eax, [ebp - 0x40]
    mov ebx, 0x1f
    mov edx, 0x190
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
    push dword SOURCE_NAME
    push dword 0x3f6
    call SET_DEBUG_LOCATION
    mov eax, dword [0x93c4]
    sar eax, 0x10
    push eax
    push dword BELL_TIME_FORMAT
    lea eax, [ebp - 0x40]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ebx, 0x1f
    push byte 0
    lea eax, [ebp - 0x40]
    mov edx, 0x1a0
    push eax
    xor ecx, ecx
    mov eax, 4
    call PRINT_TEXT_256
save_sync_tail:
    mov esi, dword [SYNC_TOTAL_TAIL]
    lea esp, [ebp - 0x14]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret
    db 0x8b, 0xc0            ; mov eax, eax alignment
