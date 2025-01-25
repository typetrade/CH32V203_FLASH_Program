/********************************** (C) COPYRIGHT *******************************
 * File Name          : main.c
 * Author             : WCH
 * Version            : V1.0.0
 * Date               : 2021/06/06
 * Description        : Main program body.
 * Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
 * SPDX-License-Identifier: Apache-2.0
 *******************************************************************************/

/*
 *@Note
 FLASH的擦/读/写例程：参考 https://bbs.21ic.com/icview-3053566-1-1.html
   包括标准擦除和编程、快速擦除和编程。

   注意：
   a-擦除成功部分读非0xFF：
            字读——0xe339e339
            半字读——0xe339
            字节读——0x39
            偶地址字节读——0x39
            奇地址字节读——0xe3
   b-在主频超过100MHz时，操作FLASH时需注意：
            在进行非零等待区域FLASH和零等待区域FLASH、用户字读写以及厂商配置字和Boot区域读时，需做以下操作，
            首先将HCLK进行2分频，FLASH操作完成后再恢复，保证FLASH操作是频率低于100Mhz。

*/

#include "debug.h"

/* Global define */
typedef enum {FAILED = 0, PASSED = !FAILED} TestStatus;
#define PAGE_WRITE_START_ADDR  ((uint32_t)0x08008000) /* Start from 32K */
#define PAGE_WRITE_END_ADDR    ((uint32_t)0x08009000) /* End at 36K */
#define FLASH_PAGE_SIZE                   4096
#define FLASH_PAGES_TO_BE_PROTECTED FLASH_WRProt_Pages60to63

/* Fast Mode define */
#define FAST_FLASH_PROGRAM_START_ADDR  ((uint32_t)0x08008000)
#define FAST_FLASH_PROGRAM_END_ADDR  ((uint32_t)0x08010000)
#define FAST_FLASH_SIZE  (64*1024)

/* Global Variable */
uint32_t EraseCounter = 0x0;  //  记录要擦除多少页
uint32_t Address = 0x0;       //  记录写入的地址
uint16_t Data = 0xAAAA;       //  记录写入的数据
uint32_t WRPR_Value = 0xFFFFFFFF, ProtectedPages = 0x0;
uint32_t NbrOfPage;           //  记录写入多少页
volatile FLASH_Status FLASHStatus = FLASH_COMPLETE; //  记录每次擦除的结果

volatile TestStatus MemoryProgramStatus = PASSED;   //  记录整个测试结果
volatile TestStatus MemoryEraseStatus = PASSED;

/*********************************************************************
 * @fn      Flash_Test
 *
 * @brief   Flash Program Test.内部FLASH标准编程
 *          1. 调用FLASH_Unlock函数进行解锁；
 *          2. 根据起始地址及结束地址计算需要擦除页数；
 *          3. 调用FLASH_ClearFlag函数清除各种标志位；
 *          4. 使用for循环以及调用FLASH_ErasePage函数擦除页数，每次擦除一页；
 *          5. 使用while循环并调用FLASH_ProgramWord函数向起始地址至结束地址的存储区域都写入变量“Data”存储的数值数值；
 *          6. 调用FLASH_Lock函数进行上锁；
 *          7. 使用指针读取写入的数据内容并校验。
 *
 * @return  none
 */
TestStatus Flash_Test(void)
{
    printf("FLASH Test\n");

    RCC->CFGR0 |= (uint32_t)RCC_HPRE_DIV2;  //  将系统时钟的主频分频为2
    Delay_Init();
    USART_Printf_Init(115200);
    __disable_irq();

    // 解除闪存锁
    FLASH_Unlock();

    NbrOfPage = (PAGE_WRITE_END_ADDR - PAGE_WRITE_START_ADDR) / FLASH_PAGE_SIZE;  //  计算要擦除多少页

    // 清除闪存的挂起标志
    //  FLASH_FLAG_BSY:指示忙状态标志；
    //  FLASH_FLAG_EOP：指示操作结束标志；
    //  FLASH_FLAG_PGERR：闪存程序错误标志；
    //  FLASH_FLAG_WRPRTERR：指示写保护错误标志
    FLASH_ClearFlag(FLASH_FLAG_BSY | FLASH_FLAG_EOP|FLASH_FLAG_PGERR |FLASH_FLAG_WRPRTERR); //  清空所有标志位

    for(EraseCounter = 0; (EraseCounter < NbrOfPage) && (FLASHStatus == FLASH_COMPLETE); EraseCounter++)
    {
      FLASHStatus = FLASH_ErasePage(PAGE_WRITE_START_ADDR + (FLASH_PAGE_SIZE * EraseCounter));  //  Erase 4KB

      if(FLASHStatus != FLASH_COMPLETE)
      {
        printf("FLASH Erase Fail\r\n");
      }
      printf("FLASH Erase Suc\r\n");
    }

    Address = PAGE_WRITE_START_ADDR;  //  向内部FLASH写入数据起始地址
    printf("Programing...\r\n");
    while((Address < PAGE_WRITE_END_ADDR) && (FLASHStatus == FLASH_COMPLETE))
    {
      FLASHStatus = FLASH_ProgramHalfWord(Address, Data); //  向指定地址写入半字
      Address = Address + 2;
    }

    Address = PAGE_WRITE_START_ADDR;

    printf("Program Cheking...\r\n");
    while((Address < PAGE_WRITE_END_ADDR) && (MemoryProgramStatus != FAILED))
    {
      if((*(__IO uint16_t*) Address) != Data)
      {
        MemoryProgramStatus = FAILED;
      }
      Address += 2;
    }

    if(MemoryProgramStatus == FAILED)
    {
       printf("Memory Program FAIL!\r\n");
    }
    else
    {
       printf("Memory Program PASS!\r\n");
    }

    // 上锁
    FLASH_Lock();

    RCC->CFGR0 &= ~(uint32_t)RCC_HPRE_DIV2;
    Delay_Init();
    USART_Printf_Init(115200);
    __enable_irq();
    return MemoryProgramStatus;
}

/*********************************************************************
 * @fn      Flash_Test_Fast
 *
 * @brief   Flash Fast Program Test.内部FLASH快速编程
 *          1. 调用FLASH_Unlock_Fast函数进行解锁；
 *          2. 调用FLASH_ErasePage_Fast函数擦除指定闪存页；
 *          3. 调用FLASH_BufReset函数复位闪存缓冲区，执行清除内部256字节缓存区操作；
 *          4. 调用FLASH_BufLoad函数向指定地址开始连续写入16字节数据（4字节/次操作，写的地址每次偏移量为4），然后执行加载到缓冲区；
 *          5. 调用FLASH_ProgramPage_Fast函数启动一次快速页编程动作，编程指定的闪存页；
 *          6. 调用FLASH_Lock_Fast函数进行上锁；
 *          7. 使用for循环读取编程地址进行数据校验并返回校验值。
 *
 * @return  none
 */
u16 Flash_Test_Fast(void)
{
	u16 i,j,flag;
  u32 buf[64];

    for(i=0; i<64; i++){
        buf[i] = i;
    }

    printf("FLASH Fast Mode Test\n");

    RCC->CFGR0 |= (uint32_t)RCC_HPRE_DIV2;
    Delay_Init();
    USART_Printf_Init(115200);
    __disable_irq();

  // 快速编程模式解锁
	FLASH_Unlock_Fast();

  // 0x08008000
	FLASH_EraseBlock_32K_Fast(FAST_FLASH_PROGRAM_START_ADDR);

  // FLASH_ErasePage_Fast(0x0800E000); //擦除指定闪存页，此处擦除0x0800E000这个地址所指定页
  // printf("128Byte Page Erase Sucess\r\n");
  // FLASH_BufReset(); //复位闪存缓冲区，即执行清除内部128字节缓存区操作
  // FLASH_BufLoad(0x0800E000, buf[0], buf[1], buf[2], buf[3]); //向指定地址开始连续写入16字节数据（4字节/次操作，写的地址每次偏移量为4），然后执行加载到缓冲区
  // FLASH_BufLoad(0x0800E000 + 0x10, buf[4], buf[5], buf[6], buf[7]);

    printf("Program 32KByte start\n");
    for(i=0; i<128; i++){
        // 擦除指定闪存页，此处擦除指定地址所指定页
        FLASH_ProgramPage_Fast(FAST_FLASH_PROGRAM_START_ADDR + 256*i, buf);
    }

	for(i=0; i<128; i++){ // 读编程地址数据校验
	    for(j=0; j<64; j++){
	        if(*(u32*)(FAST_FLASH_PROGRAM_START_ADDR+256*i+4*j) != j){
	            flag = 0;
	            break;
	        }
	        else{
	            flag = 1;
	        }
	    }

	}

	if(flag){
    printf("Program 32KByte suc\n");
	}
	else printf("Program fail\n");

	printf("Erase 256Byte...\n");
	FLASH_ErasePage_Fast(FAST_FLASH_PROGRAM_START_ADDR);

	printf("Read 4KByte...\n");
	for(i=0;i<1024; i++){
      printf("%08x ",*(u32*)(FAST_FLASH_PROGRAM_START_ADDR+4*i));

	}printf("\n");

    printf("Erase 4KByte...\n");
    // 擦除单个FLASH页面
    // @pa
    FLASH_ErasePage(FAST_FLASH_PROGRAM_START_ADDR);

    printf("Read 8KByte...\n");
    for(i=0;i<2048; i++){
      printf("%08x ",*(u32*)(FAST_FLASH_PROGRAM_START_ADDR+4*i));

    }printf("\n");

    printf("Erase 32KByte...\n");
    FLASH_EraseBlock_32K_Fast(FAST_FLASH_PROGRAM_START_ADDR);

    printf("Read 32KByte...\n");
    for(i=0;i<(1024*9); i++){
      printf("%08x ",*(u32*)(FAST_FLASH_PROGRAM_START_ADDR+4*i));

    }printf("\n");


    FLASH_Lock_Fast();

    RCC->CFGR0 &= ~(uint32_t)RCC_HPRE_DIV2;
    Delay_Init();
    USART_Printf_Init(115200);
    __enable_irq();

    return flag;
}

/*********************************************************************
 * @fn      main
 *
 * @brief   Main program.
 *
 * @return  none
 */
int main(void)
{
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	Delay_Init();
	USART_Printf_Init(115200);
	printf("SystemClk:%d\r\n",SystemCoreClock);

	printf("Flash Program Test\r\n");

    // 判断内部 FLASH 标准编程测试结果
    if(Flash_Test() == PASSED)
    {
        printf("读写内部 FLASH 标准编程测试成功\r\n");
    }
    else
    {
        printf("读写内部 FLASH 标准编程测试失败\r\n");
    }

    if(Flash_Test_Fast())
    {
        printf("读写内部 FLASH 快速编程测试成功\r\n");
    }
    else
    {
        printf("读写内部 FLASH 快速编程测试失败\r\n");
    }

	while(1);
}


