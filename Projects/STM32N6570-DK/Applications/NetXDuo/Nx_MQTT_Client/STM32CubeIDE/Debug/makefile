################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/xilinx/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/tropicsquare/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/ti/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/st/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/silabs/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/rpi_pico/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/riscv/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/psa/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/ppc32/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/pic32/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/nxp/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/mynewt/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/maxim/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/liboqs/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/kcapi/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/iotsafe/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/intel/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/devcrypto/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/cypress/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/cavium/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/caam/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/autosar/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/atmel/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/aria/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/af_alg/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/Renesas/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/Espressif/esp_crt_bundle/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/Espressif/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/port/subdir.mk
-include Middlewares/wolfssl/wolfcrypt/src/subdir.mk
-include Middlewares/wolfssl/src/subdir.mk
-include Middlewares/ThreadX/Core/subdir.mk
-include Middlewares/NetXDuo/TLS/subdir.mk
-include Middlewares/NetXDuo/Network/Ethernet\ Phy\ Interface/RTL8211_Phy_Interface/subdir.mk
-include Middlewares/NetXDuo/NX\ Core/subdir.mk
-include Middlewares/NetXDuo/Ethernet\ Interface/subdir.mk
-include Middlewares/NetXDuo/Crypto/subdir.mk
-include Middlewares/NetXDuo/Addons\ SNTP/subdir.mk
-include Middlewares/NetXDuo/Addons\ MQTT/subdir.mk
-include Middlewares/NetXDuo/Addons\ DNS/subdir.mk
-include Middlewares/NetXDuo/Addons\ DHCP\ Client/subdir.mk
-include Drivers/STM32N6xx_HAL_Driver/subdir.mk
-include Drivers/CMSIS/subdir.mk
-include Drivers/BSP/Components/subdir.mk
-include Application/User/Startup/subdir.mk
-include Application/User/NetXDuo/App/subdir.mk
-include Application/User/Core/subdir.mk
-include Application/User/AZURE_RTOS/App/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := TLS_Handshake
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
TLS_Handshake.elf \

MAP_FILES += \
TLS_Handshake.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
TLS_Handshake.list \

OBJCOPY_BIN += \
TLS_Handshake.bin \


# All Target
all: main-build

# Main-build Target
main-build: TLS_Handshake.elf secondary-outputs

# Tool invocations
TLS_Handshake.elf TLS_Handshake.map: $(OBJS) $(USER_OBJS) /home/mika/Schreibtisch/STM32CubeN6/Projects/STM32N6570-DK/Applications/NetXDuo/Nx_MQTT_Client/STM32CubeIDE/STM32N657X0HXQ_AXISRAM2_fsbl.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "TLS_Handshake.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m55 -T"/home/mika/Schreibtisch/STM32CubeN6/Projects/STM32N6570-DK/Applications/NetXDuo/Nx_MQTT_Client/STM32CubeIDE/STM32N657X0HXQ_AXISRAM2_fsbl.ld" --specs=nosys.specs -Wl,-Map="TLS_Handshake.map" -Wl,--gc-sections -static -Wl,--cmse-implib -Wl,--out-implib=./Nx_MQTT_Client_import_lib.o -u _printf_float --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

TLS_Handshake.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "TLS_Handshake.list"
	@echo 'Finished building: $@'
	@echo ' '

TLS_Handshake.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "TLS_Handshake.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) TLS_Handshake.bin TLS_Handshake.elf TLS_Handshake.list TLS_Handshake.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
