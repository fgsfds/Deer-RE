typedef unsigned int uint32;

extern uint32 random_initialized;
extern short player_count;

extern void call_5aed8(void);
#pragma aux call_5aed8 modify [eax ebx ecx edx]
extern void call_61213(uint32 value);
#pragma aux call_61213 parm [ebx] modify [eax ecx edx]
extern uint32 call_46fa0(void);
extern uint32 call_611ef(void);

uint32 select_random(void);
#pragma aux select_random value [eax] modify [eax ecx edx]

uint32 select_random(void)
{
    uint32 result;

    if (random_initialized == 0 && player_count < 2) {
        call_5aed8();
        call_61213(1);
        random_initialized = 1;
    }

    if (player_count > 1) {
        result = call_46fa0();
        goto done;
    }
    result = call_611ef();

done:
    return result;
}
