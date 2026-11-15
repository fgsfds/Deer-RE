typedef unsigned int uint32;

extern uint32 call_5ac26(uint32 name, uint32 value);
#pragma aux call_5ac26 parm [eax] [edx] value [eax] modify [eax ecx edx]

extern const char analog_turning[];
extern const char analog_strafing[];
extern const char analog_moving[];
extern const char analog_looking[];

int analog_name_to_index(uint32 name);
#pragma aux analog_name_to_index parm [eax] value [eax] modify [eax ecx]

int analog_name_to_index(uint32 name)
{
    int result;

    if (call_5ac26(name, (uint32)analog_turning) == 0) {
        result = 0;
        goto done;
    }
    if (call_5ac26(name, (uint32)analog_strafing) == 0) {
        result = 1;
        goto done;
    }
    if (call_5ac26(name, (uint32)analog_moving) == 0) {
        result = 5;
        goto done;
    }
    if (call_5ac26(name, (uint32)analog_looking) == 0) {
        result = 2;
        goto done;
    }
    result = -1;

done:
    return result;
}

const unsigned char analog_lookup_padding[2] = { 0x8b, 0xc0 };
