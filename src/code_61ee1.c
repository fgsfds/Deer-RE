typedef unsigned char uint8;
typedef unsigned int uint32;

extern volatile uint32 cached_value;
extern volatile uint8 initialization_flags;
extern volatile uint8 control_flags;
extern void call_8c311(void);
#pragma aux call_8c311 modify [eax ebx ecx edx]
extern void call_8c1c6(void);
#pragma aux call_8c1c6 modify [eax ebx ecx edx]

uint32 __pascal code_61ee1(uint32 enabled);

uint32 __pascal code_61ee1(uint32 enabled)
{
    uint32 previous;

    previous = cached_value;
    cached_value = enabled;
    if (enabled != 0) {
        if ((initialization_flags & 1) != 0 &&
            (control_flags & 4) == 0) {
            control_flags |= 4;
            call_8c311();
        }
    } else if ((control_flags & 4) != 0) {
        call_8c1c6();
        control_flags &= 0xfb;
    }
    return previous;
}
