typedef unsigned int uint32;

extern void __pascal call_5d849(uint32 first, uint32 second);

extern void call_61ace(uint32 value);
#pragma aux call_61ace parm [eax] modify [eax ecx edx]

void code_61223(uint32 value, uint32 second, uint32 third);
#pragma aux code_61223 parm [eax] [edx] [ebx] modify [eax edx ebx]

void code_61223(uint32 value, uint32 second, uint32 third)
{
    call_5d849(second, third);
    call_61ace(value);
}
