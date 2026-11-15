typedef unsigned char uint8;
extern volatile uint8 callback_active;

int code_73490(void);
#pragma aux code_73490 modify [ecx edx]

int code_73490(void)
{
    return callback_active != 0;
}
