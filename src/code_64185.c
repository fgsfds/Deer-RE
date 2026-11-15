typedef unsigned char uint8;
typedef unsigned int uint32;

extern void __pascal CALL_62160(uint32 value);
extern uint8 call_6211f(void);
#pragma aux call_6211f value [al] modify [eax ecx edx]

extern uint32 __pascal CALL_6224C(uint32 first, uint32 second, uint32 third);
extern uint32 call_61c2a(uint32 value);
#pragma aux call_61c2a parm [eax] value [eax] modify [eax ecx edx]

extern void __pascal CALL_6236D(uint32 first, uint32 second, uint32 third,
                                uint32 fourth, uint32 fifth, uint32 sixth);

extern uint32 call_760df(uint32 first, uint32 second);
#pragma aux call_760df parm [eax] [edx] value [eax] modify [eax ecx edx]
extern void call_621c6(void);

extern uint32 data_b71f;
extern uint32 data_b71b;

uint32 code_64185(uint32 first, uint32 second);
#pragma aux code_64185 parm [eax] [edx] value [eax] modify [eax edx ebx ecx]

uint32 code_64185(uint32 first, uint32 second)
{
    uint32 result;

    CALL_62160(0x16);
    if (call_6211f() &&
        CALL_6224C(first, data_b71f, 1) == 0 &&
        CALL_6224C(second, data_b71b, 0) == 0) {
        uint32 first_value = call_61c2a(first);
        uint32 second_value = call_61c2a(second);
        uint32 combined_value = first_value + second_value + 1;
        CALL_6236D(first, second, combined_value, 4, 0x16, 0);
    }

    result = call_760df(first, second);
    call_621c6();
    return result;
}
