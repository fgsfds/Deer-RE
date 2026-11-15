typedef unsigned int uint32;

extern volatile unsigned char state_b872;
extern volatile uint32 state_b87f;

extern void __pascal code_5d849(uint32 first, uint32 second);

void __pascal code_5d8a9(uint32 first, uint32 second, uint32 third)
{
    code_5d849(first, second);
    if (state_b872 == 1)
        state_b87f = third;
}
