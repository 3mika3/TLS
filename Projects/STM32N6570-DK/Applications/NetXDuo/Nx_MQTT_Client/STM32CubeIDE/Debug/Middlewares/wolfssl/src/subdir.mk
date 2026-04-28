################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/wolfssl/src/bio.c \
../Middlewares/wolfssl/src/conf.c \
../Middlewares/wolfssl/src/crl.c \
../Middlewares/wolfssl/src/dtls.c \
../Middlewares/wolfssl/src/dtls13.c \
../Middlewares/wolfssl/src/internal.c \
../Middlewares/wolfssl/src/keys.c \
../Middlewares/wolfssl/src/ocsp.c \
../Middlewares/wolfssl/src/pk.c \
../Middlewares/wolfssl/src/quic.c \
../Middlewares/wolfssl/src/sniffer.c \
../Middlewares/wolfssl/src/ssl.c \
../Middlewares/wolfssl/src/ssl_asn1.c \
../Middlewares/wolfssl/src/ssl_bn.c \
../Middlewares/wolfssl/src/ssl_certman.c \
../Middlewares/wolfssl/src/ssl_crypto.c \
../Middlewares/wolfssl/src/ssl_load.c \
../Middlewares/wolfssl/src/ssl_misc.c \
../Middlewares/wolfssl/src/ssl_p7p12.c \
../Middlewares/wolfssl/src/ssl_sess.c \
../Middlewares/wolfssl/src/ssl_sk.c \
../Middlewares/wolfssl/src/tls.c \
../Middlewares/wolfssl/src/tls13.c \
../Middlewares/wolfssl/src/wolfio.c \
../Middlewares/wolfssl/src/x509.c \
../Middlewares/wolfssl/src/x509_str.c 

OBJS += \
./Middlewares/wolfssl/src/bio.o \
./Middlewares/wolfssl/src/conf.o \
./Middlewares/wolfssl/src/crl.o \
./Middlewares/wolfssl/src/dtls.o \
./Middlewares/wolfssl/src/dtls13.o \
./Middlewares/wolfssl/src/internal.o \
./Middlewares/wolfssl/src/keys.o \
./Middlewares/wolfssl/src/ocsp.o \
./Middlewares/wolfssl/src/pk.o \
./Middlewares/wolfssl/src/quic.o \
./Middlewares/wolfssl/src/sniffer.o \
./Middlewares/wolfssl/src/ssl.o \
./Middlewares/wolfssl/src/ssl_asn1.o \
./Middlewares/wolfssl/src/ssl_bn.o \
./Middlewares/wolfssl/src/ssl_certman.o \
./Middlewares/wolfssl/src/ssl_crypto.o \
./Middlewares/wolfssl/src/ssl_load.o \
./Middlewares/wolfssl/src/ssl_misc.o \
./Middlewares/wolfssl/src/ssl_p7p12.o \
./Middlewares/wolfssl/src/ssl_sess.o \
./Middlewares/wolfssl/src/ssl_sk.o \
./Middlewares/wolfssl/src/tls.o \
./Middlewares/wolfssl/src/tls13.o \
./Middlewares/wolfssl/src/wolfio.o \
./Middlewares/wolfssl/src/x509.o \
./Middlewares/wolfssl/src/x509_str.o 

C_DEPS += \
./Middlewares/wolfssl/src/bio.d \
./Middlewares/wolfssl/src/conf.d \
./Middlewares/wolfssl/src/crl.d \
./Middlewares/wolfssl/src/dtls.d \
./Middlewares/wolfssl/src/dtls13.d \
./Middlewares/wolfssl/src/internal.d \
./Middlewares/wolfssl/src/keys.d \
./Middlewares/wolfssl/src/ocsp.d \
./Middlewares/wolfssl/src/pk.d \
./Middlewares/wolfssl/src/quic.d \
./Middlewares/wolfssl/src/sniffer.d \
./Middlewares/wolfssl/src/ssl.d \
./Middlewares/wolfssl/src/ssl_asn1.d \
./Middlewares/wolfssl/src/ssl_bn.d \
./Middlewares/wolfssl/src/ssl_certman.d \
./Middlewares/wolfssl/src/ssl_crypto.d \
./Middlewares/wolfssl/src/ssl_load.d \
./Middlewares/wolfssl/src/ssl_misc.d \
./Middlewares/wolfssl/src/ssl_p7p12.d \
./Middlewares/wolfssl/src/ssl_sess.d \
./Middlewares/wolfssl/src/ssl_sk.d \
./Middlewares/wolfssl/src/tls.d \
./Middlewares/wolfssl/src/tls13.d \
./Middlewares/wolfssl/src/wolfio.d \
./Middlewares/wolfssl/src/x509.d \
./Middlewares/wolfssl/src/x509_str.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/wolfssl/src/%.o Middlewares/wolfssl/src/%.su Middlewares/wolfssl/src/%.cyclo: ../Middlewares/wolfssl/src/%.c Middlewares/wolfssl/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DWOLFSSL_USER_SETTINGS -DNX_INCLUDE_USER_DEFINE_FILE -DUSE_HAL_DRIVER -DSTM32N657xx -DETH_PHY_1000MBITS_SUPPORTED -DNX_SECURE_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_SECURE=1 -DRTL8211_INIT_TO=10000 -DTX_INCLUDE_USER_DEFINE_FILE -c -I../../NetXDuo/App -I/home/mika/Schreibtisch/STM32CubeN6/Projects/STM32N6570-DK/Applications/NetXDuo/Nx_MQTT_Client/STM32CubeIDE/Middlewares/wolfssl -I../../NetXDuo/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../../../../../../Middlewares/ST/netxduo/common/drivers/ethernet -I../../../../../../../Middlewares/ST/netxduo/nx_secure/inc -I../../../../../../../Middlewares/ST/netxduo/nx_secure/ports -I../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../../Middlewares/ST/netxduo/crypto_libraries/inc -I../../../../../../../Middlewares/ST/netxduo/tsn/inc -I../../../../../../../Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../../Middlewares/ST/netxduo/addons/mqtt -I../../../../../../../Middlewares/ST/netxduo/addons/dhcp -I../../../../../../../Middlewares/ST/netxduo/addons/sntp -I../../../../../../../Middlewares/ST/netxduo/addons/dns -I../../../../../../../Middlewares/ST/threadx/common/inc -I../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../../Middlewares/ST/netxduo/common/inc -I../../../../../../../Middlewares/ST/netxduo/ports/cortex_m55/gnu/inc -I../../../../../../../Middlewares/ST/threadx/ports/cortex_m55/gnu/inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/CMSIS/Device/ST/STM32N6xx/Include/Templates -I../../../../../../../Drivers/BSP/Components/rtl8211 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-wolfssl-2f-src

clean-Middlewares-2f-wolfssl-2f-src:
	-$(RM) ./Middlewares/wolfssl/src/bio.cyclo ./Middlewares/wolfssl/src/bio.d ./Middlewares/wolfssl/src/bio.o ./Middlewares/wolfssl/src/bio.su ./Middlewares/wolfssl/src/conf.cyclo ./Middlewares/wolfssl/src/conf.d ./Middlewares/wolfssl/src/conf.o ./Middlewares/wolfssl/src/conf.su ./Middlewares/wolfssl/src/crl.cyclo ./Middlewares/wolfssl/src/crl.d ./Middlewares/wolfssl/src/crl.o ./Middlewares/wolfssl/src/crl.su ./Middlewares/wolfssl/src/dtls.cyclo ./Middlewares/wolfssl/src/dtls.d ./Middlewares/wolfssl/src/dtls.o ./Middlewares/wolfssl/src/dtls.su ./Middlewares/wolfssl/src/dtls13.cyclo ./Middlewares/wolfssl/src/dtls13.d ./Middlewares/wolfssl/src/dtls13.o ./Middlewares/wolfssl/src/dtls13.su ./Middlewares/wolfssl/src/internal.cyclo ./Middlewares/wolfssl/src/internal.d ./Middlewares/wolfssl/src/internal.o ./Middlewares/wolfssl/src/internal.su ./Middlewares/wolfssl/src/keys.cyclo ./Middlewares/wolfssl/src/keys.d ./Middlewares/wolfssl/src/keys.o ./Middlewares/wolfssl/src/keys.su ./Middlewares/wolfssl/src/ocsp.cyclo ./Middlewares/wolfssl/src/ocsp.d ./Middlewares/wolfssl/src/ocsp.o ./Middlewares/wolfssl/src/ocsp.su ./Middlewares/wolfssl/src/pk.cyclo ./Middlewares/wolfssl/src/pk.d ./Middlewares/wolfssl/src/pk.o ./Middlewares/wolfssl/src/pk.su ./Middlewares/wolfssl/src/quic.cyclo ./Middlewares/wolfssl/src/quic.d ./Middlewares/wolfssl/src/quic.o ./Middlewares/wolfssl/src/quic.su ./Middlewares/wolfssl/src/sniffer.cyclo ./Middlewares/wolfssl/src/sniffer.d ./Middlewares/wolfssl/src/sniffer.o ./Middlewares/wolfssl/src/sniffer.su ./Middlewares/wolfssl/src/ssl.cyclo ./Middlewares/wolfssl/src/ssl.d ./Middlewares/wolfssl/src/ssl.o ./Middlewares/wolfssl/src/ssl.su ./Middlewares/wolfssl/src/ssl_asn1.cyclo ./Middlewares/wolfssl/src/ssl_asn1.d ./Middlewares/wolfssl/src/ssl_asn1.o ./Middlewares/wolfssl/src/ssl_asn1.su ./Middlewares/wolfssl/src/ssl_bn.cyclo ./Middlewares/wolfssl/src/ssl_bn.d ./Middlewares/wolfssl/src/ssl_bn.o ./Middlewares/wolfssl/src/ssl_bn.su ./Middlewares/wolfssl/src/ssl_certman.cyclo ./Middlewares/wolfssl/src/ssl_certman.d ./Middlewares/wolfssl/src/ssl_certman.o ./Middlewares/wolfssl/src/ssl_certman.su ./Middlewares/wolfssl/src/ssl_crypto.cyclo ./Middlewares/wolfssl/src/ssl_crypto.d ./Middlewares/wolfssl/src/ssl_crypto.o ./Middlewares/wolfssl/src/ssl_crypto.su ./Middlewares/wolfssl/src/ssl_load.cyclo ./Middlewares/wolfssl/src/ssl_load.d ./Middlewares/wolfssl/src/ssl_load.o ./Middlewares/wolfssl/src/ssl_load.su ./Middlewares/wolfssl/src/ssl_misc.cyclo ./Middlewares/wolfssl/src/ssl_misc.d ./Middlewares/wolfssl/src/ssl_misc.o ./Middlewares/wolfssl/src/ssl_misc.su ./Middlewares/wolfssl/src/ssl_p7p12.cyclo ./Middlewares/wolfssl/src/ssl_p7p12.d ./Middlewares/wolfssl/src/ssl_p7p12.o ./Middlewares/wolfssl/src/ssl_p7p12.su ./Middlewares/wolfssl/src/ssl_sess.cyclo ./Middlewares/wolfssl/src/ssl_sess.d ./Middlewares/wolfssl/src/ssl_sess.o ./Middlewares/wolfssl/src/ssl_sess.su ./Middlewares/wolfssl/src/ssl_sk.cyclo ./Middlewares/wolfssl/src/ssl_sk.d ./Middlewares/wolfssl/src/ssl_sk.o ./Middlewares/wolfssl/src/ssl_sk.su ./Middlewares/wolfssl/src/tls.cyclo ./Middlewares/wolfssl/src/tls.d ./Middlewares/wolfssl/src/tls.o ./Middlewares/wolfssl/src/tls.su ./Middlewares/wolfssl/src/tls13.cyclo ./Middlewares/wolfssl/src/tls13.d ./Middlewares/wolfssl/src/tls13.o ./Middlewares/wolfssl/src/tls13.su ./Middlewares/wolfssl/src/wolfio.cyclo ./Middlewares/wolfssl/src/wolfio.d ./Middlewares/wolfssl/src/wolfio.o ./Middlewares/wolfssl/src/wolfio.su ./Middlewares/wolfssl/src/x509.cyclo ./Middlewares/wolfssl/src/x509.d ./Middlewares/wolfssl/src/x509.o ./Middlewares/wolfssl/src/x509.su ./Middlewares/wolfssl/src/x509_str.cyclo ./Middlewares/wolfssl/src/x509_str.d ./Middlewares/wolfssl/src/x509_str.o ./Middlewares/wolfssl/src/x509_str.su

.PHONY: clean-Middlewares-2f-wolfssl-2f-src

