typedef unsigned int uint32;
typedef int int32;

int32 code_8b313(const uint32 *left, const uint32 *right);
#pragma aux code_8b313 parm [eax] [edx] value [eax] modify [eax ecx]

int32 code_8b313(const uint32 *left, const uint32 *right)
{
    int32 result;

    if (*left > *right)
        result = 1;
    else if (*left < *right)
        result = -1;
    else
        result = 0;
    return result;
}

const unsigned char code_8b313_tail = 0xc3;
