int get_inc_angle(short a, short na);
#pragma aux get_inc_angle parm nomemory [eax] [edx] value [eax] modify exact [eax edx]

int get_inc_angle(short a, short na)
{
    int difference;

    a &= 2047;
    na &= 2047;
    difference = a - na;
    if (difference < 0)
        difference = -difference;
    if (difference < 1024)
        return na - a;
    if (na > 1024)
        na -= 2048;
    if (a > 1024)
        a -= 2048;
    na -= 2048;
    a -= 2048;
    return na - a;
}

const unsigned char get_inc_angle_padding = 0x90;
