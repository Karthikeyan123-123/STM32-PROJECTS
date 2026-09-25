################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctions.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctionsF16.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f16.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f32.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q15.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q31.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q7.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f16.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f32.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q15.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q31.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q7.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_f32.c \
../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_init_f32.c 

OBJS += \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctions.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctionsF16.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f16.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f32.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q15.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q31.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q7.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f16.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f32.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q15.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q31.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q7.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_f32.o \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_init_f32.o 

C_DEPS += \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctions.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctionsF16.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f16.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f32.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q15.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q31.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q7.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f16.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f32.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q15.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q31.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q7.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_f32.d \
./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_init_f32.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS-DSP-1.18.0/Source/InterpolationFunctions/%.o CMSIS-DSP-1.18.0/Source/InterpolationFunctions/%.su CMSIS-DSP-1.18.0/Source/InterpolationFunctions/%.cyclo: ../CMSIS-DSP-1.18.0/Source/InterpolationFunctions/%.c CMSIS-DSP-1.18.0/Source/InterpolationFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/PrivateInclude" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../PDM2PCM/App -I../Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/PrivateInclude" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-InterpolationFunctions

clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-InterpolationFunctions:
	-$(RM) ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctions.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctions.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctions.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctions.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctionsF16.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctionsF16.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctionsF16.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/InterpolationFunctionsF16.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f16.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f16.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f16.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f16.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f32.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f32.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f32.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_f32.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q15.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q15.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q15.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q15.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q31.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q31.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q31.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q31.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q7.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q7.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q7.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_bilinear_interp_q7.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f16.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f16.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f16.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f16.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f32.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f32.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f32.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_f32.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q15.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q15.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q15.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q15.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q31.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q31.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q31.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q31.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q7.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q7.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q7.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_linear_interp_q7.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_f32.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_f32.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_f32.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_f32.su ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_init_f32.cyclo ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_init_f32.d ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_init_f32.o ./CMSIS-DSP-1.18.0/Source/InterpolationFunctions/arm_spline_interp_init_f32.su

.PHONY: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-InterpolationFunctions

