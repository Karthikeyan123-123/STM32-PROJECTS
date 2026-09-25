################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/arm_sin_cos_example_f32.c 

OBJS += \
./CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/arm_sin_cos_example_f32.o 

C_DEPS += \
./CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/arm_sin_cos_example_f32.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/%.o CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/%.su CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/%.cyclo: ../CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/%.c CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/PrivateInclude" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../PDM2PCM/App -I../Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/PrivateInclude" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Examples-2f-ARM-2f-arm_sin_cos_example

clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Examples-2f-ARM-2f-arm_sin_cos_example:
	-$(RM) ./CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/arm_sin_cos_example_f32.cyclo ./CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/arm_sin_cos_example_f32.d ./CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/arm_sin_cos_example_f32.o ./CMSIS-DSP-1.18.0/Examples/ARM/arm_sin_cos_example/arm_sin_cos_example_f32.su

.PHONY: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Examples-2f-ARM-2f-arm_sin_cos_example

