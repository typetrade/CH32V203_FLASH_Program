################################################################################
# MRS Version: 1.9.2
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Debug/debug.c 

OBJS += \
./Debug/debug.o 

C_DEPS += \
./Debug/debug.d 


# Each subdirectory must supply rules for building sources it contributes
Debug/debug.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Debug/debug.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

