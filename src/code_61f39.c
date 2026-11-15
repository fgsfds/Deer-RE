typedef unsigned char uint8;
typedef unsigned short uint16;

extern volatile uint8 control_flags;
extern volatile uint8 display_flags;
extern volatile uint8 state_count;

uint16 code_61f39(void)
{
    uint16 previous;

    previous = (uint16)((control_flags & 1) != 0);
    control_flags |= 1;
    display_flags &= 0xf7;
    ++state_count;
    return previous;
}
