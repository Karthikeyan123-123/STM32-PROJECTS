################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/W5500/port/wizchip_port.c 

OBJS += \
./Drivers/W5500/port/wizchip_port.o 

C_DEPS += \
./Drivers/W5500/port/wizchip_port.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/W5500/port/%.o Drivers/W5500/port/%.su Drivers/W5500/port/%.cyclo: ../Drivers/W5500/port/%.c Drivers/W5500/port/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/LAN-ETHERCOM/Drivers/W5500/Ethernet" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/LAN-ETHERCOM/Drivers/W5500/Ethernet/w55c" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/LAN-ETHERCOM/Drivers/W5500/port" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-W5500-2f-port

clean-Drivers-2f-W5500-2f-port:
	-$(RM) ./Drivers/W5500/port/wizchip_port.cyclo ./Drivers/W5500/port/wizchip_port.d ./Drivers/W5500/port/wizchip_port.o ./Drivers/W5500/port/wizchip_port.su

.PHONY: clean-Drivers-2f-W5500-2f-port

