################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/pico.c 

OBJS += \
./Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/pico.o 

C_DEPS += \
./Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/pico.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/%.o Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/%.su Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/%.cyclo: ../Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/%.c Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DWOLFSSL_USER_SETTINGS -DNX_INCLUDE_USER_DEFINE_FILE -DUSE_HAL_DRIVER -DSTM32N657xx -DETH_PHY_1000MBITS_SUPPORTED -DNX_SECURE_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_SECURE=1 -DRTL8211_INIT_TO=10000 -DTX_INCLUDE_USER_DEFINE_FILE -c -I../../NetXDuo/App -I/home/mika/Schreibtisch/STM32CubeN6/Projects/STM32N6570-DK/Applications/NetXDuo/Nx_MQTT_Client/STM32CubeIDE/Middlewares/wolfssl -I../../NetXDuo/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../../../../../../Middlewares/ST/netxduo/common/drivers/ethernet -I../../../../../../../Middlewares/ST/netxduo/nx_secure/inc -I../../../../../../../Middlewares/ST/netxduo/nx_secure/ports -I../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../../Middlewares/ST/netxduo/crypto_libraries/inc -I../../../../../../../Middlewares/ST/netxduo/tsn/inc -I../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../../Middlewares/ST/netxduo/addons/mqtt -I../../../../../../../Middlewares/ST/netxduo/addons/dhcp -I../../../../../../../Middlewares/ST/netxduo/addons/sntp -I../../../../../../../Middlewares/ST/netxduo/addons/dns -I../../../../../../../Middlewares/ST/threadx/common/inc -I../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../../Middlewares/ST/netxduo/common/inc -I../../../../../../../Middlewares/ST/netxduo/ports/cortex_m55/gnu/inc -I../../../../../../../Middlewares/ST/threadx/ports/cortex_m55/gnu/inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include/Templates -I../../../../../../../Drivers/BSP/Components/rtl8211 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-wolfssl-2f-wolfcrypt-2f-src-2f-port-2f-rpi_pico

clean-Middlewares-2f-wolfssl-2f-wolfcrypt-2f-src-2f-port-2f-rpi_pico:
	-$(RM) ./Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/pico.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/pico.d ./Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/pico.o ./Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/pico.su

.PHONY: clean-Middlewares-2f-wolfssl-2f-wolfcrypt-2f-src-2f-port-2f-rpi_pico

