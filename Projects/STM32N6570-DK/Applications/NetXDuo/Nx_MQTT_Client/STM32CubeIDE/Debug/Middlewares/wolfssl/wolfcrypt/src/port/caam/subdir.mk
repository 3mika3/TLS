################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_aes.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_driver.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_error.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_integrity.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_qnx.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_sha.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_aes.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_cmac.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_ecdsa.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_fsl_nxp.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hash.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hmac.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_init.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_qnx.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_rsa.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_seco.c \
../Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_x25519.c 

OBJS += \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_aes.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_driver.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_error.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_integrity.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_qnx.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_sha.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_aes.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_cmac.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_ecdsa.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_fsl_nxp.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hash.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hmac.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_init.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_qnx.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_rsa.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_seco.o \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_x25519.o 

C_DEPS += \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_aes.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_driver.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_error.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_integrity.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_qnx.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_sha.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_aes.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_cmac.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_ecdsa.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_fsl_nxp.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hash.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hmac.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_init.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_qnx.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_rsa.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_seco.d \
./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_x25519.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/wolfssl/wolfcrypt/src/port/caam/%.o Middlewares/wolfssl/wolfcrypt/src/port/caam/%.su Middlewares/wolfssl/wolfcrypt/src/port/caam/%.cyclo: ../Middlewares/wolfssl/wolfcrypt/src/port/caam/%.c Middlewares/wolfssl/wolfcrypt/src/port/caam/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DWOLFSSL_USER_SETTINGS -DNX_INCLUDE_USER_DEFINE_FILE -DUSE_HAL_DRIVER -DSTM32N657xx -DETH_PHY_1000MBITS_SUPPORTED -DNX_SECURE_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_SECURE=1 -DRTL8211_INIT_TO=10000 -DTX_INCLUDE_USER_DEFINE_FILE -c -I../../NetXDuo/App -I/home/mika/Schreibtisch/STM32CubeN6/Projects/STM32N6570-DK/Applications/NetXDuo/Nx_MQTT_Client/STM32CubeIDE/Middlewares/wolfssl -I../../NetXDuo/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../../../../../../Middlewares/ST/netxduo/common/drivers/ethernet -I../../../../../../../Middlewares/ST/netxduo/nx_secure/inc -I../../../../../../../Middlewares/ST/netxduo/nx_secure/ports -I../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../../Middlewares/ST/netxduo/crypto_libraries/inc -I../../../../../../../Middlewares/ST/netxduo/tsn/inc -I../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../../Middlewares/ST/netxduo/addons/mqtt -I../../../../../../../Middlewares/ST/netxduo/addons/dhcp -I../../../../../../../Middlewares/ST/netxduo/addons/sntp -I../../../../../../../Middlewares/ST/netxduo/addons/dns -I../../../../../../../Middlewares/ST/threadx/common/inc -I../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../../Middlewares/ST/netxduo/common/inc -I../../../../../../../Middlewares/ST/netxduo/ports/cortex_m55/gnu/inc -I../../../../../../../Middlewares/ST/threadx/ports/cortex_m55/gnu/inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include/Templates -I../../../../../../../Drivers/BSP/Components/rtl8211 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-wolfssl-2f-wolfcrypt-2f-src-2f-port-2f-caam

clean-Middlewares-2f-wolfssl-2f-wolfcrypt-2f-src-2f-port-2f-caam:
	-$(RM) ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_aes.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_aes.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_aes.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_aes.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_driver.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_driver.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_driver.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_driver.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_error.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_error.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_error.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_error.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_integrity.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_integrity.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_integrity.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_integrity.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_qnx.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_qnx.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_qnx.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_qnx.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_sha.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_sha.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_sha.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/caam_sha.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_aes.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_aes.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_aes.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_aes.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_cmac.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_cmac.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_cmac.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_cmac.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_ecdsa.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_ecdsa.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_ecdsa.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_ecdsa.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_fsl_nxp.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_fsl_nxp.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_fsl_nxp.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_fsl_nxp.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hash.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hash.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hash.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hash.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hmac.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hmac.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hmac.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_hmac.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_init.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_init.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_init.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_init.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_qnx.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_qnx.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_qnx.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_qnx.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_rsa.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_rsa.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_rsa.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_rsa.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_seco.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_seco.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_seco.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_seco.su ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_x25519.cyclo ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_x25519.d ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_x25519.o ./Middlewares/wolfssl/wolfcrypt/src/port/caam/wolfcaam_x25519.su

.PHONY: clean-Middlewares-2f-wolfssl-2f-wolfcrypt-2f-src-2f-port-2f-caam

