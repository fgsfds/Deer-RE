typedef unsigned int uint32;

extern void __pascal CALL_62160(uint32 value);
extern void __cdecl call_734d7(uint32 message);
extern void call_621c6(void);

extern unsigned char data_b890;
extern unsigned char data_b887;

void __pascal code_75ff0(uint32 message)
{
    CALL_62160(10);
    if (data_b890 != 0 || data_b887 != 0)
        call_734d7(message);
    call_621c6();
}
