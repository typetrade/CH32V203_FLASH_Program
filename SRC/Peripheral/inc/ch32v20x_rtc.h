/********************************** (C) COPYRIGHT  *******************************
 * File Name          : ch32v20x_rtc.h
 * Author             : WCH
 * Version            : V1.0.0
 * Date               : 2021/06/06
 * Description        : This file contains all the functions prototypes for the RTC
 *                      firmware library.
 * Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
 * SPDX-License-Identifier: Apache-2.0
 *******************************************************************************/
#ifndef __CH32V20x_RTC_H
#define __CH32V20x_RTC_H

#ifdef __cplusplus
extern "C" {
#endif

#include "ch32v20x.h"

typedef enum
{
    /* 校准精度越高，耗时越长 */
    Level_32 = 2, // 用时 1.2ms 1000ppm (32M 主频)  1100ppm (64M 主频)
    Level_64,     // 用时 2.2ms 800ppm  (32M 主频)  1000ppm (64M 主频)
    Level_128,    // 用时 4.2ms 600ppm  (32M 主频)  800ppm  (64M 主频)

} Cali_LevelTypeDef;

/* RTC_interrupts_define */
#define RTC_IT_OW         ((uint16_t)0x0004) /* Overflow interrupt */
#define RTC_IT_ALR        ((uint16_t)0x0002) /* Alarm interrupt */
#define RTC_IT_SEC        ((uint16_t)0x0001) /* Second interrupt */

/* RTC_interrupts_flags */
#define RTC_FLAG_RTOFF    ((uint16_t)0x0020) /* RTC Operation OFF flag */
#define RTC_FLAG_RSF      ((uint16_t)0x0008) /* Registers Synchronized flag */
#define RTC_FLAG_OW       ((uint16_t)0x0004) /* Overflow flag */
#define RTC_FLAG_ALR      ((uint16_t)0x0002) /* Alarm flag */
#define RTC_FLAG_SEC      ((uint16_t)0x0001) /* Second flag */

#if defined(CH32V20x_D8) || defined(CH32V20x_D8W)
  #define R16_OSC32K_TUNE       (*((uint16_t *)0x40022036))
  #define RB_OSC32K_HTUNE       (0x1FE0)
  #define RB_OSC32K_LTUNE       (0x1F)

  #define R8_OSC_CAL_CTRL       (*((uint8_t *)0x4002204F))
  #define RB_OSC_CAL_HALT       (0x80)
  #define RB_OSC_CAL_EN         (0x02)
  #define RB_OSC_CAL_INT_EN     (0x01)

  #define R8_OSC_CAL_OV_CNT     (*((uint8_t *)0x4002204E))
  #define RB_OSC_CAL_OV_CNT     (0xFF)

  #define R16_OSC_CAL_CNT_ST    (*((uint16_t *)0x4002204C))
  #define RB_OSC_CAL_IF_END     (1 << 15)
  #define RB_OSC_CAL_CNT_OV     (1 << 14)
  #define RB_OSC_CAL_CNT        (0x3FFF)

  #define R8_OSC_CAL_CFG        (*((uint8_t *)0x40022049))
  #define RB_CAL_LP_EN          (1 << 6)
  #define RB_CAL_WKUP_EN        (1 << 5)
  #define RB_OSC_HALT_MD        (1 << 4)
  #define RB_OSC_CNT_VLU        (0x0F)

  #if(CLK_OSC32K == 1)
    #define CAB_LSIFQ    32000
  #else
    #define CAB_LSIFQ    32768
  #endif

#endif

void       RTC_ITConfig(uint16_t RTC_IT, FunctionalState NewState);
void       RTC_EnterConfigMode(void);
void       RTC_ExitConfigMode(void);
uint32_t   RTC_GetCounter(void);
void       RTC_SetCounter(uint32_t CounterValue);
void       RTC_SetPrescaler(uint32_t PrescalerValue);
void       RTC_SetAlarm(uint32_t AlarmValue);
uint32_t   RTC_GetDivider(void);
void       RTC_WaitForLastTask(void);
void       RTC_WaitForSynchro(void);
FlagStatus RTC_GetFlagStatus(uint16_t RTC_FLAG);
void       RTC_ClearFlag(uint16_t RTC_FLAG);
ITStatus   RTC_GetITStatus(uint16_t RTC_IT);
void       RTC_ClearITPendingBit(uint16_t RTC_IT);

#if defined(CH32V20x_D8) || defined(CH32V20x_D8W)
void Calibration_LSI(Cali_LevelTypeDef cali_Lv);

#endif

#ifdef __cplusplus
}
#endif

#endif
