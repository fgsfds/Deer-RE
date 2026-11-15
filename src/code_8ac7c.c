typedef unsigned char uint8;
typedef unsigned int uint32;
typedef int int32;

extern void __cdecl call_8b349(uint32 value);
extern int32 call_88d12(void);
extern int32 call_88d20(void);
extern int32 call_88d28(void);
extern uint32 call_5ab50(void);
#pragma aux call_5ab50 value [eax] modify [eax ecx edx]
extern void __pascal CALL_5D849(uint32 first, uint32 second);
extern int32 __pascal CALL_88DA6(uint32 value);

extern uint8 data_b891;
extern const char debug_string_8fbc[];
extern const char debug_string_8fc6[];

int32 __cdecl code_8ac7c(uint32 value)
{
    int32 result;

    call_8b349(value);
    result = call_88d12();
    if (result == 0)
        return result;
    result = call_88d20();
    if (result != 0)
        return result;
    result = call_88d28();
    if (result != 0)
        return result;
    result = (uint8)call_5ab50() != 10;
    if (result == 0)
        return result;
    if (data_b891 >= 2)
        return result;
    result = (uint8)call_5ab50() != 1;
    if (result == 0)
        return result;

    CALL_5D849((uint32)debug_string_8fbc, 0x4d);
    return CALL_88DA6((uint32)debug_string_8fc6);
}
