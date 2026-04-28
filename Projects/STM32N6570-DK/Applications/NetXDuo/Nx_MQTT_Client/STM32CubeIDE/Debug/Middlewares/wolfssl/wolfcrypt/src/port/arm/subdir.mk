################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCell.c \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCellHash.c \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm_c.c \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm_c.c \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519_c.c \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm_c.c \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm_c.c \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm_c.c \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm_c.c \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm_c.c 

S_UPPER_SRCS += \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm.S \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm.S \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519.S \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm.S \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm.S \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm.S \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm.S \
../Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm.S 

OBJS += \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCell.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCellHash.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm_c.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm_c.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519_c.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm_c.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm_c.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm_c.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm_c.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm.o \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm_c.o 

S_UPPER_DEPS += \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm.d 

C_DEPS += \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCell.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCellHash.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm_c.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm_c.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519_c.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm_c.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm_c.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm_c.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm_c.d \
./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm_c.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/wolfssl/wolfcrypt/src/port/arm/%.o Middlewares/wolfssl/wolfcrypt/src/port/arm/%.su Middlewares/wolfssl/wolfcrypt/src/port/arm/%.cyclo: ../Middlewares/wolfssl/wolfcrypt/src/port/arm/%.c Middlewares/wolfssl/wolfcrypt/src/port/arm/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DWOLFSSL_USER_SETTINGS -DNX_INCLUDE_USER_DEFINE_FILE -DUSE_HAL_DRIVER -DSTM32N657xx -DETH_PHY_1000MBITS_SUPPORTED -DNX_SECURE_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_SECURE=1 -DRTL8211_INIT_TO=10000 -DTX_INCLUDE_USER_DEFINE_FILE -c -I../../NetXDuo/App -I/home/mika/Schreibtisch/STM32CubeN6/Projects/STM32N6570-DK/Applications/NetXDuo/Nx_MQTT_Client/STM32CubeIDE/Middlewares/wolfssl -I../../NetXDuo/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../../../../../../Middlewares/ST/netxduo/common/drivers/ethernet -I../../../../../../../Middlewares/ST/netxduo/nx_secure/inc -I../../../../../../../Middlewares/ST/netxduo/nx_secure/ports -I../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../../Middlewares/ST/netxduo/crypto_libraries/inc -I../../../../../../../Middlewares/ST/netxduo/tsn/inc -I../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../../Middlewares/ST/netxduo/addons/mqtt -I../../../../../../../Middlewares/ST/netxduo/addons/dhcp -I../../../../../../../Middlewares/ST/netxduo/addons/sntp -I../../../../../../../Middlewares/ST/netxduo/addons/dns -I../../../../../../../Middlewares/ST/threadx/common/inc -I../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../../Middlewares/ST/netxduo/common/inc -I../../../../../../../Middlewares/ST/netxduo/ports/cortex_m55/gnu/inc -I../../../../../../../Middlewares/ST/threadx/ports/cortex_m55/gnu/inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include/Templates -I../../../../../../../Drivers/BSP/Components/rtl8211 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/wolfssl/wolfcrypt/src/port/arm/%.o: ../Middlewares/wolfssl/wolfcrypt/src/port/arm/%.S Middlewares/wolfssl/wolfcrypt/src/port/arm/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE=1 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Middlewares-2f-wolfssl-2f-wolfcrypt-2f-src-2f-port-2f-arm

clean-Middlewares-2f-wolfssl-2f-wolfcrypt-2f-src-2f-port-2f-arm:
	-$(RM) ./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCell.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCell.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCell.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCell.su ./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCellHash.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCellHash.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCellHash.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/cryptoCellHash.su ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm_c.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm_c.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm_c.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-aes-asm_c.su ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm_c.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm_c.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm_c.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-chacha-asm_c.su ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519_c.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519_c.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519_c.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-curve25519_c.su ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm_c.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm_c.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm_c.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-mlkem-asm_c.su ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm_c.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm_c.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm_c.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-poly1305-asm_c.su ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm_c.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm_c.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm_c.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha256-asm_c.su ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm_c.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm_c.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm_c.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha3-asm_c.su ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm_c.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm_c.d ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm_c.o ./Middlewares/wolfssl/wolfcrypt/src/port/arm/thumb2-sha512-asm_c.su

.PHONY: clean-Middlewares-2f-wolfssl-2f-wolfcrypt-2f-src-2f-port-2f-arm

