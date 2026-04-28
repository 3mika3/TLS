/*
 * time_measure.c
 *
 *  Created on: Jan 21, 2026
 *      Author: mika
 */


#include "stm32n6xx_hal.h"

uint32_t TimMeasure_NowUs(void)
{
    return TIM2->CNT;   // 1 Tick = 1 us
}

void TimMeasure_Init(void)
{
    __HAL_RCC_TIM2_CLK_ENABLE();

    // Timer sicher stoppen
    TIM2->CR1 = 0;

    // TIM2 läuft bei dir offenbar ~200 MHz (Kernel Clock) – PSC macht daraus 1 MHz
    // Wenn du "Auto" willst, brauchst du die echte TIM2-Clock.
    // Quick & dirty (für N657DK oft passend): auf 200 MHz annehmen:
    uint32_t tim_clk = 200714800UL; // kannst du nach dem Test auch als Konstante setzen

    TIM2->PSC = (tim_clk / 1000000UL) - 1UL;  // -> 1 MHz
    TIM2->ARR = 0xFFFFFFFFUL;

    TIM2->EGR = TIM_EGR_UG;   // <<< WICHTIG: PSC/ARR sofort übernehmen
    TIM2->CNT = 0;

    TIM2->CR1 = TIM_CR1_CEN;  // starten
}
