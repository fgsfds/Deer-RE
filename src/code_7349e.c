typedef unsigned char uint8;
typedef unsigned int uint32;

extern volatile uint8 callback_active;
extern volatile uint8 pending_count;
extern void __cdecl (*callback_handler)(uint32);

void __pascal code_7349e(uint32 argument);

void __pascal code_7349e(uint32 argument)
{
    if (!callback_active) {
        callback_active = 1;
        if (pending_count)
            --pending_count;
        callback_handler(argument);
        callback_active = 0;
    }
}
