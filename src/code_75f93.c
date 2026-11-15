typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;

extern volatile uint8 state_b889;
extern int call_86b0a(uint32 entry);
#pragma aux call_86b0a parm [eax] value [eax] modify [eax ecx edx]

extern uint16 get_data_segment(void);
#pragma aux get_data_segment = "mov ax,ds" value [ax] modify exact [];

int code_75f93(uint32 address, uint32 mode);
#pragma aux code_75f93 parm [eax] [edx] value [eax] modify [eax ecx edx esi]

int code_75f93(uint32 address, uint32 mode)
{
    uint8 entry[16];
    uint32 heap_address;

    if ((state_b889 & 2) != 0)
        return -1;

    *(uint32 *)(entry + 0) = 0;
    *(uint16 *)(entry + 4) = 0;
    heap_address = address - 4;
    if (mode != 0)
        goto scan;

found:
    return 1;

scan:
    for (;;) {
        if (call_86b0a((uint32)entry) != 0)
            goto failed;
        heap_address = address - 4;
        {
            uint16 segment = get_data_segment();
            if (*(uint32 *)(entry + 0) != heap_address)
                continue;
            if (*(uint16 *)(entry + 4) != segment)
                continue;
        }
        if (*(uint32 *)(entry + 10) == 1)
            continue;
        goto found;
    }

failed:
    return 0;
}
