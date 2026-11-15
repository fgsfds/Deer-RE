typedef unsigned char uint8;
typedef unsigned int uint32;

extern void call_62682(uint32 output, uint32 source);
#pragma aux call_62682 parm [eax] [edx] modify [eax ecx edx ebx]
extern void call_63d72(uint32 output, uint32 input, uint32 **cursor);
#pragma aux call_63d72 parm [eax] [edx] [ebx] modify [eax ecx edx]
extern void __pascal call_81e05(char *text);
extern void __pascal code_7349e(char *text);
extern volatile uint8 initialization_active;

void __cdecl code_734d7(uint32 source, ...);

void __cdecl code_734d7(uint32 source, ...)
{
    char temporary[0xc8];
    char text[0xc8];
    uint32 * volatile cursor_pointer;

    cursor_pointer = (uint32 *)&source + 1;
    call_62682((uint32)temporary, source);
    call_63d72((uint32)text, (uint32)temporary, &cursor_pointer);
    cursor_pointer = 0;

    if (text[0] >= 'a' && text[0] <= 'z')
        text[0] -= 0x20;

    if (!initialization_active) {
        initialization_active = 1;
        call_81e05(text);
        initialization_active = 0;
    }
    code_7349e(text);
}
