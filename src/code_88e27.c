typedef unsigned int uint32;

extern const char diagnostic_name_8f88[];

extern void call_81e58(void);
#pragma aux call_81e58 modify [eax ecx edx ebx]
extern uint32 __pascal call_88be3(uint32 value);
extern uint32 __cdecl call_6398f(uint32 value);
extern void __cdecl code_734d7(uint32 format, ...);

void code_88e27(void);
#pragma aux code_88e27 modify [eax ecx edx]

void code_88e27(void)
{
    uint32 value;

    call_81e58();
    value = call_88be3(5);
    value = call_6398f(value);
    code_734d7((uint32)diagnostic_name_8f88, value);
    call_81e58();
}
