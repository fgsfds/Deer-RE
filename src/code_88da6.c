typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;

extern volatile uint8 state_b890;
extern volatile uint8 diagnostic_active_23f1ed;
extern volatile uint8 state_b887;
extern volatile uint32 diagnostic_context_23f1e4;
extern volatile uint8 diagnostic_depth_23f1ec;
extern const char diagnostic_name_8f0a[];
extern const char diagnostic_name_8f43[];

extern void __pascal call_62160(uint32 value);
extern void __pascal call_621c6(void);
extern void __cdecl call_81d73(uint32 name);
extern void code_88d83(void);
extern short call_8c543(void);
#pragma aux call_8c543 value [ax] modify [eax ecx edx]

int __pascal code_88da6(uint32 value)
{
    int result = 0;

    call_62160(12);
    if (state_b890 != 0 && diagnostic_active_23f1ed == 0)
        goto trace;
    if (state_b887 == 0)
        goto done;

trace:
    diagnostic_active_23f1ed = 1;
    diagnostic_context_23f1e4 = value;
    ++diagnostic_depth_23f1ec;
    if (diagnostic_depth_23f1ec == 1) {
        call_81d73((uint32)diagnostic_name_8f0a);
        call_81d73((uint32)diagnostic_name_8f43);
        code_88d83();
    }
    result = call_8c543();
    diagnostic_active_23f1ed = 0;

done:
    call_621c6();
    return result;
}
