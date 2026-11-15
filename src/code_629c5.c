typedef unsigned short uint16;
typedef unsigned char uint8;
typedef unsigned int uint32;

extern volatile uint8 state_b890;
extern volatile uint8 state_b806;
extern volatile uint8 state_d36c;
extern volatile uint8 state_d35a;
extern volatile uint16 state_d35f;
extern volatile uint32 state_b83c;
extern volatile uint32 state_22ee6c;
extern volatile uint32 state_c8d4;
extern volatile uint32 state_c8d0;
extern volatile uint32 state_d361;
extern volatile uint32 state_22ee70;
extern volatile uint32 state_22ee78;
extern volatile uint32 state_22ee80;

extern uint32 call_73370(uint32 first, uint32 second, uint32 third);
#pragma aux call_73370 parm [eax] [edx] [ebx] value [eax] modify [eax ecx edx]
extern uint32 call_73632(uint32 first, uint32 second, uint32 third);
#pragma aux call_73632 parm [eax] [edx] [ebx] value [eax] modify [eax ecx edx]
extern void call_8c364(void);

void code_629c5(void)
{
    call_73370((uint32)&state_b83c, 0, 0x54);
    call_73370((uint32)&state_22ee6c, 0, 0x14);
    state_b890 = 0;
    call_73632((uint32)&state_b806, (uint32)&state_d36c, 0x34);
    state_d35a = 0xff;
    call_8c364();
    state_d361 = state_c8d4 - 0x18;
    state_22ee6c = state_c8d4;
    state_22ee70 = state_c8d0;
    state_22ee78 = state_22ee6c;
    state_22ee80 = 0;
    state_d35f = 0;
}
