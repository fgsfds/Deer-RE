typedef unsigned int uint32;

extern uint32 data_be48;
extern char code_52a8e;

uint32 __pascal code_5abc7(uint32 value)
{
    uint32 previous = data_be48;

    if (value == 0)
        value = (uint32)&code_52a8e;
    data_be48 = value;
    return previous;
}
