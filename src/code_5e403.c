typedef unsigned int uint32;

extern void __pascal call_5d8a9(uint32 first, uint32 second, uint32 third);

extern void call_64185(uint32 first, uint32 second);
#pragma aux call_64185 parm [eax] [edx] modify [eax ecx edx]

void code_5e403(uint32 second, uint32 first, uint32 saved_ebx,
                uint32 saved_ecx, uint32 stack_argument);
#pragma aux code_5e403 parm routine [edx] [eax] [ebx] [ecx] modify [eax edx]

void code_5e403(uint32 second, uint32 first, uint32 saved_ebx,
                uint32 saved_ecx, uint32 stack_argument)
{
    call_5d8a9(saved_ebx, saved_ecx, stack_argument);
    call_64185(first, second);
}

const unsigned char code_5e403_padding[8] = { 0 };
