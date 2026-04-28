/*
 * seed_rng.c
 *
 *  Created on: Dec 16, 2025
 *      Author: mika
 */


#include "wolfssl/wolfcrypt/random.h"   // für OS_Seed, wc_GenerateSeed
#include "main.h"                       // oder wo dein hrng deklariert ist
#include <string.h>

extern RNG_HandleTypeDef hrng;

/* OS-spezifischer Seed für wolfSSL */
int wc_GenerateSeed(OS_Seed* os, byte* output, word32 sz)
{
    (void)os;  /* wir brauchen os auf STM32 nicht, daher unbenutzt */

    HAL_StatusTypeDef status;
    uint32_t rnd;

    for (word32 i = 0; i < sz; i += sizeof(rnd)) {
        status = HAL_RNG_GenerateRandomNumber(&hrng, &rnd);
        if (status != HAL_OK) {
            return -1;      /* Fehler beim RNG */
        }

        /* so viele Bytes kopieren wie noch fehlen */
        word32 left = sz - i;
        word32 copy = (left < sizeof(rnd)) ? left : sizeof(rnd);
        memcpy(&output[i], &rnd, copy);
    }

    return 0;   /* Erfolg */
}

