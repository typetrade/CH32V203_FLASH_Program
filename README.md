![image](https://github.com/user-attachments/assets/f953d379-af58-4ee2-8c3b-4642115bb841)
# 开发工具 MounRiver Studio
http://mounriver.com/
![25270356dbce0fb3b893899be7de60e](https://github.com/user-attachments/assets/481b9178-24c6-4da1-92e8-819d1e42e343)
编译成功。
![049576b4d26eabfc8702b3400c131f9](https://github.com/user-attachments/assets/91c30cb5-60ce-474b-a903-06af28069c45)
烧录成功。

# 参考资料 CH32FV2x_V3xRM.PDF
下载地址：https://www.wch.cn/downloads/CH32FV2x_V3xRM_PDF.html
CH32FV2x_V3xRM应用手册，32位RISC-V架构通用微控制器，具有高效中断响应、标准内存保护、硬件除法、浮点运算等特点。 包含USB2.0主机/设备控制器、蓝牙5.3、以太网、多CAN、12位DAC/ADC、8组串口、电机定时器、运放、双DMA控制器等丰富的外设资源。
覆盖：CH32V203F6P6,CH32V203F8P6,CH32V203G6U6,CH32V203G8R6,CH32V203C6T6,CH32V203K8T6,CH32V203C8T6,CH32V203C8U6,CH32V203RBT6
我这边主要是用CH32V203G6u6、CH32V203C8T6

## PCB
![image](https://github.com/user-attachments/assets/dc6ceb0c-454b-47fd-bdae-6cdd5f75412b)

## 原理图
![image](https://github.com/user-attachments/assets/2ac697e5-49dc-428d-bcdd-b7d91ae81295)
直接用官方的评估板也可以测试这个代码，主要配置好MCU即可，例如CH32V203G6U6，需要配置Link.ld：
MEMORY
{  
/* CH32V20x_D6 - CH32V203F6-CH32V203G6-CH32V203K6-CH32V203C6 */
/**/
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 32K
	RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 10K
 

/* CH32V20x_D6 - CH32V203K8-CH32V203C8-CH32V203G8-CH32V203F8 */
/* 
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 64K
	RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 20K
*/

使用startup_ch32v20x_D6.S。

# CH32V203_FLASH_Program
CH32V203内部FLASH官方示例详细注释版本，包含2种编程/擦除方式，具体如下： 

## 标准编程 Flash_Test
此方式是默认编程方式（兼容方式）。这种模式下CPU以单次2字节方式执行编程，单次4K字节执行擦除及整片擦除操作。
Flash Program Test.内部FLASH标准编程
 *          1. 调用FLASH_Unlock函数进行解锁；
 *          2. 根据起始地址及结束地址计算需要擦除页数；
 *          3. 调用FLASH_ClearFlag函数清除各种标志位；
 *          4. 使用for循环以及调用FLASH_ErasePage函数擦除页数，每次擦除一页；
 *          5. 使用while循环并调用FLASH_ProgramWord函数向起始地址至结束地址的存储区域都写入变量“Data”存储的数值数值；
 *          6. 调用FLASH_Lock函数进行上锁；
 *          7. 使用指针读取写入的数据内容并校验。
 
## 快速编程 Flash_Test_Fast
此方式采用页操作方式（推荐）。经过特定序列解锁后，执行单次256字节的编程及256字节擦除。
Flash Fast Program Test.内部FLASH快速编程
 *          1. 调用FLASH_Unlock_Fast函数进行解锁；
 *          2. 调用FLASH_ErasePage_Fast函数擦除指定闪存页；
 *          3. 调用FLASH_BufReset函数复位闪存缓冲区，执行清除内部256字节缓存区操作；
 *          4. 调用FLASH_BufLoad函数向指定地址开始连续写入16字节数据（4字节/次操作，写的地址每次偏移量为4），然后执行加载到缓冲区；
 *          5. 调用FLASH_ProgramPage_Fast函数启动一次快速页编程动作，编程指定的闪存页；
 *          6. 调用FLASH_Lock_Fast函数进行上锁；
 *          7. 使用for循环读取编程地址进行数据校验并返回校验值。
# 如何串口查看日志
![image](https://github.com/user-attachments/assets/3d7c42fc-0f70-4e2d-a9a4-6951da015611)
WCH-LinkE 主要接3V3、GND、SWCLK和SWDIO。
USB转TTL串口主要接TX和GND（RX没用到，VCC不要接）
![f9e2f12c03c28530fa515cb91cd5802](https://github.com/user-attachments/assets/71160a3c-0b47-4738-950d-397d16e04a34)
USB转TTL串口需要找对COM号，我的电脑是COM10。COM4是WCH-LinkE使用。
![f979457bca9621bff47c5171bbbb415](https://github.com/user-attachments/assets/e29edb75-dedc-458e-a720-eeb2c9c315f9)
波特率选115200.数据位选8。
串口建立连接以后，去烧录固件程序，等复位以后，就能看到串口日志出来。
![f14b4d395b5cd7538cfde3950f29322](https://github.com/user-attachments/assets/01384fe0-ac55-4364-9b96-59d34423bce2)

![9fe68a2517f87081bd3cc7e9dcd8892](https://github.com/user-attachments/assets/e6abee2d-a741-4e6b-af53-281ea32f85d8)
如果中文显示乱码的话，串口调试软件改一下字符集编码为UTF8.
![bc8b0dec3912f6b7fa4c188a06cef60](https://github.com/user-attachments/assets/b57d37ab-2e57-42dc-bb1a-037b5afac3df)

# 填坑细节
![image](https://github.com/user-attachments/assets/da2a8767-754c-4d42-a171-6d5e9950ea5b)
CH32V103和CH32V203的Flash有区别的，一定要阅读CH32FV2x_V3xRM应用手册（CH32FV2x_V3xRM.PDF），如上图，CH32V20x每页是256字节。CSDN上有些文章说每页1K字节不要轻易认为是对的，一定要看MCU的应用手册！！！

## CH32V103
内部FLASH具有2种编程/擦除方式，具体如下：
标准编程：此方式是默认编程方式（兼容方式）。这种模式下CPU以单次2字节方式执行编程，**单次1K字节执行擦除**及整片擦除操作。
快速编程：此方式采用页操作方式（推荐）。经过特定序列解锁后，**执行单次128字节的编程及128字节擦除**。
关于CH32V103内部FLASH具体信息，可参考CH32V103应用手册。

## CH32V203
注意下面加粗的文字，跟CH32V103的区别。
标准编程：此方式是默认编程方式（兼容方式）。这种模式下CPU 以单次2 字节方式执行编程，**单次4K 字节执行擦除**及整片擦除操作。
 快速编程：此方式采用页操作方式（推荐）。经过特定序列解锁后，**执行单次256 字节的编程及256 字节擦除**、32K 字节擦除、整片擦除。
注：快速编程相关函数，仅可放在零等待区FLASH 中。

考虑兼容的话，个人认为用标准编程比较方便些。
