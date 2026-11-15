typedef unsigned int uint32;

extern const char log_message_68c4[];
extern void __cdecl code_734d7(uint32 format, ...);

void code_61f7f(void);
#pragma aux code_61f7f modify [eax ecx edx]

void code_61f7f(void)
{
    code_734d7((uint32)log_message_68c4);
}
