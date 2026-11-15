typedef unsigned int uint32;

const unsigned char code_88852_prefix[14] = { 0 };
extern volatile uint32 game_state_14cdc;

uint32 code_88860(uint32 value)
{
    uint32 previous = game_state_14cdc;
    game_state_14cdc = value;
    return previous;
}
