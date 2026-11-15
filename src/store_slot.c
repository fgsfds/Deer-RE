typedef unsigned int uint32;

extern uint32 slot_table[];

void store_slot(uint32 index, uint32 value);
#pragma aux store_slot parm [eax] [edx] modify [eax ecx edx]

void store_slot(uint32 index, uint32 value)
{
    if (index <= 9)
        slot_table[index] = value;
}

const unsigned char store_slot_tail[1] = { 0x90 };
