typedef unsigned int uint32;

extern const uint32 action_names[];

uint32 action_name(int index);
#pragma aux action_name parm [eax] value [eax] modify [eax ecx edx]

uint32 action_name(int index)
{
    if (index >= 52)
        return 0;
    return action_names[index];
}

const unsigned char action_name_tail[3] = { 0x8d, 0x40, 0x00 };
