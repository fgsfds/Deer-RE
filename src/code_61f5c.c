typedef unsigned char uint8;

extern volatile uint8 control_flags;
extern volatile uint8 state_count;

void code_61f5c(void)
{
    control_flags &= 0xfe;
    --state_count;
}
