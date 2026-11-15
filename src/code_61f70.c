typedef unsigned char uint8;
typedef unsigned short uint16;

extern volatile uint8 control_flags;

uint16 code_61f70(void)
{
    return (uint16)((control_flags & 1) != 0);
}
