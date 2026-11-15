typedef unsigned int uint32;

extern volatile uint32 diagnostic_counter;
extern const char diagnostic_segment_767c[];
extern const char diagnostic_message_8eec[];

extern void __cdecl diagnostic_log(uint32 format, ...);

void code_88d83(void)
{
    ++diagnostic_counter;
    if (diagnostic_counter == 1)
        diagnostic_log((uint32)diagnostic_message_8eec,
                       (uint32)diagnostic_segment_767c, 0);
}
