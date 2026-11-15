typedef void (*callback)(void);

extern void call_72c4e(void);
extern void call_72db6(void);
extern callback data_14878;
extern callback data_1487c;

void code_759c3(void)
{
    data_14878 = call_72c4e;
    data_1487c = call_72db6;
}
