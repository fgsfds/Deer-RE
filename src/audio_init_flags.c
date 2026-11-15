typedef unsigned int uint32;

extern volatile uint32 sound_driver_flags;

void audio_init_flags(void)
{
    sound_driver_flags = 0x8000;
}

const unsigned char audio_init_flags_tail[2] = { 0, 0 };
