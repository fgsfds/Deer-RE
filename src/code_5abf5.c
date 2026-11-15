typedef unsigned char uint8;
typedef unsigned int uint32;

extern uint8 data_b807;

uint32 code_5abf5(void)
{
    return (data_b807 & 1) + 1;
}
