################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/ControllerFunctions.c \
../Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_f32.c \
../Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q15.c \
../Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q31.c \
../Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_f32.c \
../Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q15.c \
../Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q31.c \
../Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_f32.c \
../Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_q31.c 

OBJS += \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/ControllerFunctions.o \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_f32.o \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q15.o \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q31.o \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_f32.o \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q15.o \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q31.o \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_f32.o \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_q31.o 

C_DEPS += \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/ControllerFunctions.d \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_f32.d \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q15.d \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q31.d \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_f32.d \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q15.d \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q31.d \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_f32.d \
./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_q31.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/%.o Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/%.su Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/%.cyclo: ../Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/%.c Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/Include/dsp" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/Include" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../PDM2PCM/App -I../Middlewares/ST/STM32_Audio/Addons/PDM/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-ControllerFunctions

clean-Drivers-2f-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-ControllerFunctions:
	-$(RM) ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/ControllerFunctions.cyclo ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/ControllerFunctions.d ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/ControllerFunctions.o ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/ControllerFunctions.su ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_f32.cyclo ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_f32.d ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_f32.o ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_f32.su ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q15.cyclo ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q15.d ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q15.o ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q15.su ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q31.cyclo ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q31.d ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q31.o ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_init_q31.su ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_f32.cyclo ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_f32.d ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_f32.o ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_f32.su ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q15.cyclo ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q15.d ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q15.o ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q15.su ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q31.cyclo ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q31.d ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q31.o ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_pid_reset_q31.su ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_f32.cyclo ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_f32.d ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_f32.o ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_f32.su ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_q31.cyclo ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_q31.d ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_q31.o ./Drivers/CMSIS-DSP-1.18.0/Source/ControllerFunctions/arm_sin_cos_q31.su

.PHONY: clean-Drivers-2f-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-ControllerFunctions

