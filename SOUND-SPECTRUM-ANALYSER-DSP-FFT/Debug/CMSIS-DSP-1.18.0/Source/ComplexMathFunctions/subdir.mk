################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctions.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctionsF16.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f16.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f32.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q15.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q31.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f16.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f16.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f32.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f64.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_fast_q15.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q15.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q31.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f16.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f64.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f16.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f64.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f16.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.c \
../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.c 

OBJS += \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctions.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctionsF16.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f16.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f32.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q15.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q31.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f16.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f16.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f32.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f64.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_fast_q15.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q15.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q31.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f16.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f64.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f16.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f64.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f16.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.o \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.o 

C_DEPS += \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctions.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctionsF16.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f16.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f32.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q15.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q31.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f16.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f16.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f32.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f64.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_fast_q15.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q15.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q31.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f16.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f64.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f16.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f64.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f16.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.d \
./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/%.o CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/%.su CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/%.cyclo: ../CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/%.c CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/PrivateInclude" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../PDM2PCM/App -I../Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/PrivateInclude" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-ComplexMathFunctions

clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-ComplexMathFunctions:
	-$(RM) ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctions.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctions.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctions.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctions.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctionsF16.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctionsF16.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctionsF16.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/ComplexMathFunctionsF16.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f16.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f16.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f16.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f16.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f32.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f32.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f32.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_f32.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q15.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q15.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q15.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q15.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q31.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q31.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q31.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_conj_q31.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f16.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f16.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f16.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f16.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f16.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f16.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f16.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f16.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f32.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f32.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f32.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f32.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f64.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f64.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f64.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_f64.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_fast_q15.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_fast_q15.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_fast_q15.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_fast_q15.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q15.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q15.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q15.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q15.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q31.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q31.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q31.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_q31.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f16.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f16.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f16.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f16.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f64.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f64.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f64.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f64.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.o
	-$(RM) ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f16.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f16.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f16.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f16.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f64.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f64.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f64.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f64.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f16.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f16.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f16.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f16.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.su ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.cyclo ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.d ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.o ./CMSIS-DSP-1.18.0/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.su

.PHONY: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-ComplexMathFunctions

