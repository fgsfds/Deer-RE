typedef unsigned int uint32;

extern volatile uint32 __STACKLOW;
uint32 get_stack_pointer(void);
#pragma aux get_stack_pointer = value [esp] modify exact [];

uint32 code_735e0(void)
{
    return get_stack_pointer() - __STACKLOW;
}

const unsigned char code_735e0_padding = 0;
