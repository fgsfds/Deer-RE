typedef int int32;

extern void call_8bd8c(void);

void code_8b303(int32 call_if_nonzero);
#pragma aux code_8b303 parm [eax] modify [eax]

void code_8b303(int32 call_if_nonzero)
{
    if (call_if_nonzero)
        call_8bd8c();
}
