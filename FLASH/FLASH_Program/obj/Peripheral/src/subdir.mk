################################################################################
# MRS Version: 1.9.2
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_adc.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_bkp.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_can.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_crc.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_dbgmcu.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_dma.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_exti.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_flash.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_gpio.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_i2c.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_iwdg.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_misc.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_opa.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_pwr.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_rcc.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_rtc.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_spi.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_tim.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_usart.c \
D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_wwdg.c 

OBJS += \
./Peripheral/src/ch32v20x_adc.o \
./Peripheral/src/ch32v20x_bkp.o \
./Peripheral/src/ch32v20x_can.o \
./Peripheral/src/ch32v20x_crc.o \
./Peripheral/src/ch32v20x_dbgmcu.o \
./Peripheral/src/ch32v20x_dma.o \
./Peripheral/src/ch32v20x_exti.o \
./Peripheral/src/ch32v20x_flash.o \
./Peripheral/src/ch32v20x_gpio.o \
./Peripheral/src/ch32v20x_i2c.o \
./Peripheral/src/ch32v20x_iwdg.o \
./Peripheral/src/ch32v20x_misc.o \
./Peripheral/src/ch32v20x_opa.o \
./Peripheral/src/ch32v20x_pwr.o \
./Peripheral/src/ch32v20x_rcc.o \
./Peripheral/src/ch32v20x_rtc.o \
./Peripheral/src/ch32v20x_spi.o \
./Peripheral/src/ch32v20x_tim.o \
./Peripheral/src/ch32v20x_usart.o \
./Peripheral/src/ch32v20x_wwdg.o 

C_DEPS += \
./Peripheral/src/ch32v20x_adc.d \
./Peripheral/src/ch32v20x_bkp.d \
./Peripheral/src/ch32v20x_can.d \
./Peripheral/src/ch32v20x_crc.d \
./Peripheral/src/ch32v20x_dbgmcu.d \
./Peripheral/src/ch32v20x_dma.d \
./Peripheral/src/ch32v20x_exti.d \
./Peripheral/src/ch32v20x_flash.d \
./Peripheral/src/ch32v20x_gpio.d \
./Peripheral/src/ch32v20x_i2c.d \
./Peripheral/src/ch32v20x_iwdg.d \
./Peripheral/src/ch32v20x_misc.d \
./Peripheral/src/ch32v20x_opa.d \
./Peripheral/src/ch32v20x_pwr.d \
./Peripheral/src/ch32v20x_rcc.d \
./Peripheral/src/ch32v20x_rtc.d \
./Peripheral/src/ch32v20x_spi.d \
./Peripheral/src/ch32v20x_tim.d \
./Peripheral/src/ch32v20x_usart.d \
./Peripheral/src/ch32v20x_wwdg.d 


# Each subdirectory must supply rules for building sources it contributes
Peripheral/src/ch32v20x_adc.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_adc.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_bkp.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_bkp.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_can.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_can.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_crc.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_crc.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_dbgmcu.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_dbgmcu.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_dma.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_dma.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_exti.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_exti.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_flash.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_flash.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_gpio.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_gpio.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_i2c.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_i2c.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_iwdg.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_iwdg.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_misc.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_misc.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_opa.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_opa.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_pwr.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_pwr.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_rcc.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_rcc.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_rtc.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_rtc.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_spi.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_spi.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_tim.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_tim.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_usart.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_usart.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@
Peripheral/src/ch32v20x_wwdg.o: D:/CH32V203/test/FLASH100Mhz/CH32V203_FLASH_Program/SRC/Peripheral/src/ch32v20x_wwdg.c
	@	@	riscv-none-embed-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized  -g -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Debug" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Core" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\FLASH\FLASH_Program\User" -I"D:\CH32V203\test\FLASH100Mhz\CH32V203_FLASH_Program\SRC\Peripheral\inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@	@

