typedef unsigned char uint8;
typedef unsigned int uint32;
typedef signed short int16;

extern volatile uint32 state_b71f;
extern volatile uint32 state_b71b;
extern volatile uint32 state_b73f;

extern void __pascal call_62160(uint32 value);
extern void __pascal call_6224c(uint32 first, uint32 second, uint32 third);
extern uint8 call_6211f(void);
#pragma aux call_6211f value [al] modify [eax ecx edx]
extern uint32 __pascal call_63886(uint32 first, uint32 second);
extern void __pascal call_63b59(uint32 first, uint32 second, uint32 third);
extern uint32 call_63d72(uint32 first, uint32 second, uint32 **cursor);
#pragma aux call_63d72 parm [eax] [edx] [ebx] value [eax] modify [eax ecx edx]
extern uint32 __pascal call_6236d(uint32 first, uint32 second, uint32 third,
                                  uint32 fourth, uint32 fifth, uint32 sixth);
extern void call_621c6(void);
extern int16 call_8c543(void);
#pragma aux call_8c543 value [ax] modify [eax ecx edx]

uint32 __cdecl code_5d8cc(uint32 format, uint32 argument, ...)
{
    uint8 temporary[0x15];
    uint32 * volatile cursor;
    uint32 result;

    call_62160(0x15);
    call_6224c(format, state_b71f, 1);
    call_6224c(argument, state_b71b, 0);

    if (call_6211f() && call_63886(format, (uint32)temporary))
        call_63b59((uint32)temporary, state_b73f, 0x15);

    cursor = (uint32 *)&argument + 1;
    result = call_63d72(format, argument, &cursor);
    cursor = 0;

    if (call_6211f())
        call_6236d(format, (uint32)-6, result + 1, 4, 0x15, 0);

    call_621c6();
    return result;
}
