typedef unsigned char uint8;
typedef unsigned int uint32;

extern volatile uint32 state_be64;
extern volatile uint32 state_be68;
extern volatile uint32 state_b860;
extern volatile uint32 state_b864;
extern volatile uint8 state_b890;
extern volatile uint8 state_b891;
extern volatile uint32 state_b869;
extern volatile uint32 state_b86d;
extern volatile uint8 state_b872;

extern void __pascal call_635ca(uint32 value);
#pragma aux call_635ca modify [eax ebx ecx edx]

void __pascal code_5d849(uint32 first, uint32 second)
{
    if (state_be64 != 0) {
        if (state_be68 == 0)
            call_635ca(0);
    }

    state_b860 = first;
    state_b864 = second;

    if (state_b890 != 0) {
        if (state_b891 == 0) {
            state_b869 = first;
            state_b86d = second;
            ++state_b872;
        }
    }
}
