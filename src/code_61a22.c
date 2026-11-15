typedef unsigned char uint8;
typedef unsigned int uint32;

extern void __pascal call_62160(uint32 value);

extern uint8 call_6211f(void);
#pragma aux call_6211f value [al] modify [eax ecx edx]

extern void __pascal call_6236d(uint32 first, uint32 second, uint32 third,
                                uint32 fourth, uint32 fifth, uint32 sixth);

extern uint32 call_73388(uint32 first, uint32 second, uint32 third);
#pragma aux call_73388 parm [eax] [edx] [ebx] value [eax] modify [eax ecx edx]

extern void call_621c6(void);

uint32 code_61a22(uint32 first, uint32 second, uint32 third);
#pragma aux code_61a22 parm [eax] [edx] [ebx] value [eax] modify [eax edx ebx]

uint32 code_61a22(uint32 first, uint32 second, uint32 third)
{
    uint32 result;

    call_62160(0x19);
    if (call_6211f())
        call_6236d(first, second, third, 4, 0x19, 0);
    result = call_73388(first, second, third);
    call_621c6();
    return result;
}
