/********************************** (C) COPYRIGHT *******************************
 * File Name          : ch32v20x_rtc.c
 * Author             : WCH
 * Version            : V1.0.0
 * Date               : 2021/06/06
 * Description        : This file provides all the RTC firmware functions.
 * Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
 * SPDX-License-Identifier: Apache-2.0
 ********************************************************************************/
#include "ch32v20x_rtc.h"

/* RTC_Private_Defines */
#define RTC_LSB_MASK     ((uint32_t)0x0000FFFF) /* RTC LSB Mask */
#define PRLH_MSB_MASK    ((uint32_t)0x000F0000) /* RTC Prescaler MSB Mask */

/*********************************************************************
 * @fn      RTC_ITConfig
 *
 * @brief   Enables or disables the specified RTC interrupts.
 *
 * @param   RTC_IT - specifies the RTC interrupts sources to be enabled or disabled.
 *            RTC_IT_OW - Overflow interrupt
 *            RTC_IT_ALR - Alarm interrupt
 *            RTC_IT_SEC - Second interrupt
 *
 * @return  NewState - new state of the specified RTC interrupts(ENABLE or DISABLE).
 */
void RTC_ITConfig(uint16_t RTC_IT, FunctionalState NewState)
{
    if(NewState != DISABLE)
    {
        RTC->CTLRH |= RTC_IT;
    }
    else
    {
        RTC->CTLRH &= (uint16_t)~RTC_IT;
    }
}

/*********************************************************************
 * @fn      RTC_EnterConfigMode
 *
 * @brief   Enters the RTC configuration mode.
 *
 * @return  none
 */
void RTC_EnterConfigMode(void)
{
    RTC->CTLRL |= RTC_CTLRL_CNF;
}

/*********************************************************************
 * @fn      RTC_ExitConfigMode
 *
 * @brief   Exits from the RTC configuration mode.
 *
 * @return  none
 */
void RTC_ExitConfigMode(void)
{
    RTC->CTLRL &= (uint16_t) ~((uint16_t)RTC_CTLRL_CNF);
}

/*********************************************************************
 * @fn      RTC_GetCounter
 *
 * @brief   Gets the RTC counter value
 *
 * @return  RTC counter value
 */
uint32_t RTC_GetCounter(void)
{
    uint16_t high1 = 0, high2 = 0, low = 0;

    high1 = RTC->CNTH;
    low = RTC->CNTL;
    high2 = RTC->CNTH;

    if(high1 != high2)
    {
        return (((uint32_t)high2 << 16) | RTC->CNTL);
    }
    else
    {
        return (((uint32_t)high1 << 16) | low);
    }
}

/*********************************************************************
 * @fn      RTC_SetCounter
 *
 * @brief   Sets the RTC counter value.
 *
 * @param   CounterValue - RTC counter new value.
 *
 * @return  RTC counter value
 */
void RTC_SetCounter(uint32_t CounterValue)
{
    RTC_EnterConfigMode();
    RTC->CNTH = CounterValue >> 16;
    RTC->CNTL = (CounterValue & RTC_LSB_MASK);
    RTC_ExitConfigMode();
}

/*********************************************************************
 * @fn      RTC_SetPrescaler
 *
 * @brief   Sets the RTC prescaler value
 *
 * @param   PrescalerValue - RTC prescaler new value
 *
 * @return  none
 */
void RTC_SetPrescaler(uint32_t PrescalerValue)
{
    RTC_EnterConfigMode();
    RTC->PSCRH = (PrescalerValue & PRLH_MSB_MASK) >> 16;
    RTC->PSCRL = (PrescalerValue & RTC_LSB_MASK);
    RTC_ExitConfigMode();
}

/*********************************************************************
 * @fn      RTC_SetAlarm
 *
 * @brief   Sets the RTC alarm value
 *
 * @param   AlarmValue - RTC alarm new value
 *
 * @return  none
 */
void RTC_SetAlarm(uint32_t AlarmValue)
{
    RTC_EnterConfigMode();
    RTC->ALRMH = AlarmValue >> 16;
    RTC->ALRML = (AlarmValue & RTC_LSB_MASK);
    RTC_ExitConfigMode();
}

/*********************************************************************
 * @fn      RTC_GetDivider
 *
 * @brief   Gets the RTC divider value
 *
 * @return  RTC Divider value
 */
uint32_t RTC_GetDivider(void)
{
    uint32_t tmp = 0x00;
    tmp = ((uint32_t)RTC->DIVH & (uint32_t)0x000F) << 16;
    tmp |= RTC->DIVL;
    return tmp;
}

/*********************************************************************
 * @fn      RTC_WaitForLastTask
 *
 * @brief   Waits until last write operation on RTC registers has finished
 *
 * @return  none
 */
void RTC_WaitForLastTask(void)
{
    while((RTC->CTLRL & RTC_FLAG_RTOFF) == (uint16_t)RESET)
    {
    }
}

/*********************************************************************
 * @fn      RTC_WaitForSynchro
 *
 * @brief   Waits until the RTC registers are synchronized with RTC APB clock
 *
 * @return  none
 */
void RTC_WaitForSynchro(void)
{
    RTC->CTLRL &= (uint16_t)~RTC_FLAG_RSF;
    while((RTC->CTLRL & RTC_FLAG_RSF) == (uint16_t)RESET)
    {
    }
}

/*********************************************************************
 * @fn      RTC_GetFlagStatus
 *
 * @brief   Checks whether the specified RTC flag is set or not
 *
 * @param   RTC_FLAG- specifies the flag to check
 *            RTC_FLAG_RTOFF - RTC Operation OFF flag
 *            RTC_FLAG_RSF - Registers Synchronized flag
 *            RTC_FLAG_OW - Overflow flag
 *            RTC_FLAG_ALR - Alarm flag
 *            RTC_FLAG_SEC - Second flag
 *
 * @return  none
 */
FlagStatus RTC_GetFlagStatus(uint16_t RTC_FLAG)
{
    FlagStatus bitstatus = RESET;
    if((RTC->CTLRL & RTC_FLAG) != (uint16_t)RESET)
    {
        bitstatus = SET;
    }
    else
    {
        bitstatus = RESET;
    }
    return bitstatus;
}

/*********************************************************************
 * @fn      RTC_ClearFlag
 *
 * @brief   Clears the RTC's pending flags
 *
 * @param   RTC_FLAG - specifies the flag to clear
 *            RTC_FLAG_RSF - Registers Synchronized flag
 *            RTC_FLAG_OW - Overflow flag
 *            RTC_FLAG_ALR - Alarm flag
 *            RTC_FLAG_SEC - Second flag
 *
 * @return  none
 */
void RTC_ClearFlag(uint16_t RTC_FLAG)
{
    RTC->CTLRL &= (uint16_t)~RTC_FLAG;
}

/*********************************************************************
 * @fn      RTC_GetITStatus
 *
 * @brief   Checks whether the specified RTC interrupt has occurred or not
 *
 * @param   RTC_IT - specifies the RTC interrupts sources to check
 *            RTC_FLAG_OW - Overflow interrupt
 *            RTC_FLAG_ALR - Alarm interrupt
 *            RTC_FLAG_SEC - Second interrupt
 *
 * @return  The new state of the RTC_IT (SET or RESET)
 */
ITStatus RTC_GetITStatus(uint16_t RTC_IT)
{
    ITStatus bitstatus = RESET;

    bitstatus = (ITStatus)(RTC->CTLRL & RTC_IT);
    if(((RTC->CTLRH & RTC_IT) != (uint16_t)RESET) && (bitstatus != (uint16_t)RESET))
    {
        bitstatus = SET;
    }
    else
    {
        bitstatus = RESET;
    }
    return bitstatus;
}

/*********************************************************************
 * @fn      RTC_ClearITPendingBit
 *
 * @brief   Clears the RTC's interrupt pending bits
 *
 * @param   RTC_IT - specifies the interrupt pending bit to clear
 *            RTC_FLAG_OW - Overflow interrupt
 *            RTC_FLAG_ALR - Alarm interrupt
 *            RTC_FLAG_SEC - Second interrupt
 *
 * @return  none
 */
void RTC_ClearITPendingBit(uint16_t RTC_IT)
{
    RTC->CTLRL &= (uint16_t)~RTC_IT;
}

#if defined(CH32V20x_D8) || defined(CH32V20x_D8W)
/*******************************************************************************
 * @fn            Calibration_LSI
 *
 * @brief         校准内部32K时钟
 *
 * @param         cali_Lv : 校准等级选择
 *                Level_32  -   用时 1.2ms 1000ppm (32M 主频)  1100ppm (64M 主频)
 *                Level_64  -   用时 2.2ms 800ppm  (32M 主频)  1000ppm (64M 主频)
 *                Level_128 -   用时 4.2ms 600ppm  (32M 主频)  800ppm  (64M 主频)
 *
 * @return        None
 */
void Calibration_LSI(Cali_LevelTypeDef cali_Lv)
{
    uint32_t i;
    int32_t  cnt_offset;
    uint8_t  retry = 0;
    // 粗调
    R8_OSC_CAL_CFG &= ~RB_OSC_CNT_VLU;
    R8_OSC_CAL_CFG |= 1;
    R8_OSC_CAL_CTRL |= RB_OSC_CAL_EN;
    R16_OSC_CAL_CNT_ST |= RB_OSC_CAL_CNT_OV;
    while(1)
    {
        while(!(R8_OSC_CAL_CTRL & RB_OSC_CAL_HALT));
        i = R16_OSC_CAL_CNT_ST; // 用于丢弃
        while(R8_OSC_CAL_CTRL & RB_OSC_CAL_HALT);
        R16_OSC_CAL_CNT_ST |= RB_OSC_CAL_CNT_OV;
        while(!(R8_OSC_CAL_CTRL & RB_OSC_CAL_HALT));
        i = R16_OSC_CAL_CNT_ST; // 实时校准后采样值
        cnt_offset = (i & 0x3FFF) + R8_OSC_CAL_OV_CNT * 0x3FFF - 2000 * (SystemCoreClock / 1000) / CAB_LSIFQ;
        if(((cnt_offset > -37 * (SystemCoreClock / 1000) / CAB_LSIFQ) && (cnt_offset < 37 * (SystemCoreClock / 1000) / CAB_LSIFQ)) || retry > 2)
            break;
        retry++;
        cnt_offset = (cnt_offset > 0) ? (((cnt_offset * 2) / (37 * (SystemCoreClock / 1000) / CAB_LSIFQ)) + 1) / 2 : (((cnt_offset * 2) / (37 * (SystemCoreClock / 1000) / CAB_LSIFQ)) - 1) / 2;
        R16_OSC32K_TUNE += cnt_offset;
    }

    // 细调
    // 配置细调参数后，丢弃2次捕获值（软件行为）上判断已有一次，这里只留一次
    while(!(R8_OSC_CAL_CTRL & RB_OSC_CAL_HALT));
    i = R16_OSC_CAL_CNT_ST; // 用于丢弃
    R16_OSC_CAL_CNT_ST |= RB_OSC_CAL_CNT_OV;
    R8_OSC_CAL_CFG &= ~RB_OSC_CNT_VLU;
    R8_OSC_CAL_CFG |= cali_Lv;
    while(R8_OSC_CAL_CTRL & RB_OSC_CAL_HALT);
    while(!(R8_OSC_CAL_CTRL & RB_OSC_CAL_HALT));
    i = R16_OSC_CAL_CNT_ST; // 实时校准后采样值
    cnt_offset = (i & 0x3FFF) + R8_OSC_CAL_OV_CNT * 0x3FFF - 4000 * (1 << cali_Lv) * (SystemCoreClock / 1000000) / CAB_LSIFQ * 1000;
    cnt_offset = (cnt_offset > 0) ? ((((cnt_offset * (3200 / (1 << cali_Lv))) / (1366 * (SystemCoreClock / 1000) / CAB_LSIFQ)) + 1) / 2) << 5 : ((((cnt_offset * (3200 / (1 << cali_Lv))) / (1366 * (SystemCoreClock / 1000) / CAB_LSIFQ)) - 1) / 2) << 5;
    R16_OSC32K_TUNE += cnt_offset;
    R8_OSC_CAL_CTRL &= ~RB_OSC_CAL_EN;
}

#endif
