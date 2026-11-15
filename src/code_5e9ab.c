typedef unsigned int uint32;

extern void __pascal call_5d8a9(uint32 first, uint32 second, uint32 third);

extern uint32 code_61e3b(uint32 first, uint32 second, uint32 third);
#pragma aux code_61e3b parm [eax] [edx] [ebx] value [eax] modify [eax ecx edx]

void code_5e9ab(uint32 third, uint32 first, uint32 second,
                uint32 incoming_ecx, uint32 stack_first, uint32 stack_second);
#pragma aux code_5e9ab parm routine [ebx] [eax] [edx] [ecx] modify [eax edx ebx]

void code_5e9ab(uint32 third, uint32 first, uint32 second,
                uint32 incoming_ecx, uint32 stack_first, uint32 stack_second)
{
    call_5d8a9(incoming_ecx, stack_first, stack_second);
    code_61e3b(first, second, third);
}
