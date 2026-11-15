typedef unsigned char uint8;
typedef unsigned int uint32;

extern void call_62228(uint32 value);
#pragma aux call_62228 parm [eax] modify [eax ecx edx]

extern uint8 call_6211f(void);
#pragma aux call_6211f value [al] modify [eax ecx edx]

extern void __pascal call_6236d(uint32 first, uint32 second, uint32 third,
                                uint32 fourth, uint32 fifth, uint32 sixth);

extern uint32 call_73632(uint32 first, uint32 second, uint32 third);
#pragma aux call_73632 parm [eax] [edx] [ebx] value [eax] modify [eax ecx edx]

extern void call_6223c(void);

uint32 code_61e3b(uint32 first, uint32 second, uint32 third);
#pragma aux code_61e3b parm [eax] [edx] [ebx] value [eax] modify [eax edx ebx]

uint32 code_61e3b(uint32 first, uint32 second, uint32 third)
{
    uint32 result;

    call_62228(0x11);
    if (call_6211f())
        call_6236d(first, second, third, 4, 0x8011, 0);
    result = call_73632(first, second, third);
    call_6223c();
    return result;
}
