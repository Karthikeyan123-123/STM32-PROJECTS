################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/startup_ARMCM33.c \
../CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/system_ARMCM33.c 

OBJS += \
./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/startup_ARMCM33.o \
./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/system_ARMCM33.o 

C_DEPS += \
./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/startup_ARMCM33.d \
./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/system_ARMCM33.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/%.o CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/%.su CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/%.cyclo: ../CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/%.c CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/PrivateInclude" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../PDM2PCM/App -I../Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/PrivateInclude" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Testing-2f-cmsis_build-2f-RTE-2f-Device-2f-ARMCM33

clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Testing-2f-cmsis_build-2f-RTE-2f-Device-2f-ARMCM33:
	-$(RM) ./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/startup_ARMCM33.cyclo ./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/startup_ARMCM33.d ./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/startup_ARMCM33.o ./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/startup_ARMCM33.su ./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/system_ARMCM33.cyclo ./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/system_ARMCM33.d ./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/system_ARMCM33.o ./CMSIS-DSP-1.18.0/Testing/cmsis_build/RTE/Device/ARMCM33/system_ARMCM33.su

.PHONY: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Testing-2f-cmsis_build-2f-RTE-2f-Device-2f-ARMCM33

