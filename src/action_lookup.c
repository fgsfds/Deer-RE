typedef unsigned int uint32;
typedef int int32;

extern const uint32 action_names[];
extern int32 call_name_compare(uint32 name, uint32 candidate);
#pragma aux call_name_compare parm [eax] [edx] value [eax] modify [eax edx]

int32 action_lookup(uint32 name);
#pragma aux action_lookup parm [eax] value [eax] modify [eax]

int32 action_lookup(uint32 name)
{
    int32 byte_offset;
    uint32 index;

    index = 0;
    byte_offset = 0;
    do {
        if (call_name_compare(name,
                *(const uint32 *)((const char *)action_names + byte_offset)) != 0)
            goto advance;
        return (int32)index;
advance:
        byte_offset += 4;
        ++index;
    } while (byte_offset < 208);
    return -1;
}
