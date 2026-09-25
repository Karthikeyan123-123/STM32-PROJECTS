################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctions.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctionsF16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f64.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q15.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q31.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q7.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f64.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q15.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q31.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q7.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u8.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q15.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q31.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q7.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f64.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q15.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q31.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q7.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f64.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q15.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q31.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q7.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f64.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q15.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q31.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q7.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u8.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f64.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q15.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q31.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q7.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u8.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f64.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q15.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q31.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q7.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q15.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q31.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q7.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f64.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q15.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q31.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q7.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u16.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u32.c \
../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u8.c 

OBJS += \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctions.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctionsF16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f64.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q15.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q31.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q7.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f64.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q15.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q31.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q7.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u8.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q15.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q31.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q7.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f64.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q15.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q31.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q7.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f64.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q15.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q31.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q7.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f64.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q15.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q31.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q7.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u8.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f64.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q15.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q31.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q7.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u8.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f64.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q15.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q31.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q7.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q15.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q31.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q7.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f64.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q15.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q31.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q7.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u16.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u32.o \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u8.o 

C_DEPS += \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctions.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctionsF16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f64.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q15.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q31.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q7.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f64.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q15.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q31.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q7.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u8.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q15.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q31.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q7.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f64.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q15.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q31.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q7.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f64.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q15.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q31.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q7.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f64.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q15.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q31.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q7.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u8.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f64.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q15.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q31.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q7.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u8.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f64.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q15.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q31.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q7.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q15.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q31.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q7.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f64.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q15.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q31.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q7.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u16.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u32.d \
./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u8.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS-DSP-1.18.0/Source/BasicMathFunctions/%.o CMSIS-DSP-1.18.0/Source/BasicMathFunctions/%.su CMSIS-DSP-1.18.0/Source/BasicMathFunctions/%.cyclo: ../CMSIS-DSP-1.18.0/Source/BasicMathFunctions/%.c CMSIS-DSP-1.18.0/Source/BasicMathFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/PrivateInclude" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../PDM2PCM/App -I../Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/PrivateInclude" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-BasicMathFunctions

clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-BasicMathFunctions:
	-$(RM) ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctions.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctions.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctions.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctions.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctionsF16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctionsF16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctionsF16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/BasicMathFunctionsF16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f64.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f64.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f64.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_f64.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q15.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q15.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q15.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q15.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q31.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q31.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q31.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q31.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q7.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q7.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q7.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_abs_q7.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f64.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f64.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f64.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_f64.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q15.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q15.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q15.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q15.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q31.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q31.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q31.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q31.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q7.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q7.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q7.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_add_q7.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u8.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u8.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u8.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_and_u8.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_f32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q15.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q15.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q15.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q15.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q31.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q31.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q31.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q31.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q7.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q7.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q7.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_clip_q7.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f64.cyclo
	-$(RM) ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f64.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f64.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_f64.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q15.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q15.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q15.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q15.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q31.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q31.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q31.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q31.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q7.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q7.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q7.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_dot_prod_q7.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f64.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f64.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f64.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_f64.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q15.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q15.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q15.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q15.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q31.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q31.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q31.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q31.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q7.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q7.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q7.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_mult_q7.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f64.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f64.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f64.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_f64.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q15.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q15.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q15.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q15.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q31.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q31.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q31.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q31.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q7.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q7.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q7.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_negate_q7.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u8.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u8.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u8.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_not_u8.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f64.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f64.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f64.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_f64.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q15.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q15.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q15.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q15.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q31.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q31.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q31.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q31.su
	-$(RM) ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q7.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q7.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q7.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_offset_q7.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u8.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u8.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u8.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_or_u8.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f64.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f64.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f64.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_f64.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q15.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q15.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q15.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q15.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q31.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q31.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q31.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q31.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q7.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q7.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q7.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_scale_q7.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q15.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q15.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q15.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q15.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q31.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q31.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q31.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q31.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q7.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q7.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q7.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_shift_q7.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f64.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f64.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f64.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_f64.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q15.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q15.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q15.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q15.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q31.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q31.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q31.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q31.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q7.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q7.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q7.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_sub_q7.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u16.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u16.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u16.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u16.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u32.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u32.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u32.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u32.su ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u8.cyclo ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u8.d ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u8.o ./CMSIS-DSP-1.18.0/Source/BasicMathFunctions/arm_xor_u8.su

.PHONY: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-BasicMathFunctions

