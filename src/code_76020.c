typedef unsigned char uint8;
typedef unsigned int uint32;

extern void __pascal CALL_62160(uint32 value);
extern void call_63d72(char *buffer, uint32 **arguments, const char *format);
#pragma aux call_63d72 parm [eax] [ebx] [edx] modify [eax ecx edx ebx]
extern void __cdecl call_734d7(char *message);
extern void call_621c6(void);

extern uint8 data_b890;
extern uint8 data_b887;

void __cdecl code_76020(const char *format, ...)
{
    char buffer[200];
    uint32 *arguments;

    CALL_62160(10);
    if (data_b890 != 0 || data_b887 != 0) {
        arguments = (uint32 *)((char *)&format + 4);
        call_63d72(buffer, &arguments, format);
        arguments = 0;
        call_734d7(buffer);
    }
    call_621c6();
}
