################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/W5500/Ethernet/socket.c \
../Drivers/W5500/Ethernet/wizchip_conf.c 

OBJS += \
./Drivers/W5500/Ethernet/socket.o \
./Drivers/W5500/Ethernet/wizchip_conf.o 

C_DEPS += \
./Drivers/W5500/Ethernet/socket.d \
./Drivers/W5500/Ethernet/wizchip_conf.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/W5500/Ethernet/%.o Drivers/W5500/Ethernet/%.su Drivers/W5500/Ethernet/%.cyclo: ../Drivers/W5500/Ethernet/%.c Drivers/W5500/Ethernet/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/LAN-ETHERCOM/Drivers/W5500/Ethernet" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/LAN-ETHERCOM/Drivers/W5500/Ethernet/w55c" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/LAN-ETHERCOM/Drivers/W5500/port" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-W5500-2f-Ethernet

clean-Drivers-2f-W5500-2f-Ethernet:
	-$(RM) ./Drivers/W5500/Ethernet/socket.cyclo ./Drivers/W5500/Ethernet/socket.d ./Drivers/W5500/Ethernet/socket.o ./Drivers/W5500/Ethernet/socket.su ./Drivers/W5500/Ethernet/wizchip_conf.cyclo ./Drivers/W5500/Ethernet/wizchip_conf.d ./Drivers/W5500/Ethernet/wizchip_conf.o ./Drivers/W5500/Ethernet/wizchip_conf.su

.PHONY: clean-Drivers-2f-W5500-2f-Ethernet

