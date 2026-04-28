################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/home/mika/Schreibtisch/STM32CubeN6/Middlewares/ST/netxduo/common/drivers/ethernet/nx_stm32_eth_driver.c 

OBJS += \
./Middlewares/NetXDuo/Ethernet\ Interface/nx_stm32_eth_driver.o 

C_DEPS += \
./Middlewares/NetXDuo/Ethernet\ Interface/nx_stm32_eth_driver.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/NetXDuo/Ethernet\ Interface/nx_stm32_eth_driver.o: /home/mika/Schreibtisch/STM32CubeN6/Middlewares/ST/netxduo/common/drivers/ethernet/nx_stm32_eth_driver.c Middlewares/NetXDuo/Ethernet\ Interface/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DWOLFSSL_USER_SETTINGS -DNX_INCLUDE_USER_DEFINE_FILE -DUSE_HAL_DRIVER -DSTM32N657xx -DETH_PHY_1000MBITS_SUPPORTED -DNX_SECURE_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_SECURE=1 -DRTL8211_INIT_TO=10000 -DTX_INCLUDE_USER_DEFINE_FILE -c -I../../NetXDuo/App -I/home/mika/Schreibtisch/STM32CubeN6/Projects/STM32N6570-DK/Applications/NetXDuo/Nx_MQTT_Client/STM32CubeIDE/Middlewares/wolfssl -I../../NetXDuo/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../../../../../../Middlewares/ST/netxduo/common/drivers/ethernet -I../../../../../../../Middlewares/ST/netxduo/nx_secure/inc -I../../../../../../../Middlewares/ST/netxduo/nx_secure/ports -I../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../../Middlewares/ST/netxduo/crypto_libraries/inc -I../../../../../../../Middlewares/ST/netxduo/tsn/inc -I../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../../Middlewares/ST/netxduo/addons/mqtt -I../../../../../../../Middlewares/ST/netxduo/addons/dhcp -I../../../../../../../Middlewares/ST/netxduo/addons/sntp -I../../../../../../../Middlewares/ST/netxduo/addons/dns -I../../../../../../../Middlewares/ST/threadx/common/inc -I../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../../Middlewares/ST/netxduo/common/inc -I../../../../../../../Middlewares/ST/netxduo/ports/cortex_m55/gnu/inc -I../../../../../../../Middlewares/ST/threadx/ports/cortex_m55/gnu/inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include/Templates -I../../../../../../../Drivers/BSP/Components/rtl8211 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"Middlewares/NetXDuo/Ethernet Interface/nx_stm32_eth_driver.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-NetXDuo-2f-Ethernet-20-Interface

clean-Middlewares-2f-NetXDuo-2f-Ethernet-20-Interface:
	-$(RM) ./Middlewares/NetXDuo/Ethernet\ Interface/nx_stm32_eth_driver.cyclo ./Middlewares/NetXDuo/Ethernet\ Interface/nx_stm32_eth_driver.d ./Middlewares/NetXDuo/Ethernet\ Interface/nx_stm32_eth_driver.o ./Middlewares/NetXDuo/Ethernet\ Interface/nx_stm32_eth_driver.su

.PHONY: clean-Middlewares-2f-NetXDuo-2f-Ethernet-20-Interface

