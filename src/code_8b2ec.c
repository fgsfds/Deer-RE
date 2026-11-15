typedef unsigned short uint16;
typedef unsigned int uint32;

extern void call_8bd7a(uint32 mode, uint32 value);
#pragma aux call_8bd7a parm [eax] [edx] modify [eax edx]

void code_8b2ec(uint16 value);
#pragma aux code_8b2ec parm [eax] modify [eax]

void code_8b2ec(uint16 value)
{
    call_8bd7a(1, value);
}
