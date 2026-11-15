typedef unsigned char uint8;

extern volatile uint8 data_b888;
extern volatile uint8 data_b890;
extern volatile uint8 data_b806;
extern void call_73cb4(void);

void code_88e92(void);
#pragma aux code_88e92 modify [eax]

void code_88e92(void)
{
    data_b888 |= 0x80;
    if (data_b890 != 0 && (data_b806 & 0x40) != 0)
        call_73cb4();
}

const uint8 code_88e92_tail = 0xc3;
