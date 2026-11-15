typedef unsigned int uint32;

extern void __pascal call_5d8a9(uint32 first, uint32 second, uint32 third);

extern uint32 code_61915(uint32 third, uint32 second, uint32 first);
#pragma aux code_61915 parm [ebx] [edx] [eax] value [eax] modify [eax edx ebx]

void code_5bf59(uint32 third, uint32 first, uint32 second,
                uint32 incoming_ecx, uint32 stack_first, uint32 stack_second);
#pragma aux code_5bf59 parm routine [ebx] [eax] [edx] [ecx] modify [eax edx ebx]

void code_5bf59(uint32 third, uint32 first, uint32 second,
                uint32 incoming_ecx, uint32 stack_first, uint32 stack_second)
{
    call_5d8a9(incoming_ecx, stack_first, stack_second);
    code_61915(third, second, first);
}

const unsigned char code_5bf59_padding[9] = { 0 };
