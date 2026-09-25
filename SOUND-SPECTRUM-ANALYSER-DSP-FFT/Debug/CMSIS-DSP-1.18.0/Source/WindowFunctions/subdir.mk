################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/WindowFunctions.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f64.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f32.c \
../CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f64.c 

OBJS += \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/WindowFunctions.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f64.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f32.o \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f64.o 

C_DEPS += \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/WindowFunctions.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f64.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f32.d \
./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f64.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS-DSP-1.18.0/Source/WindowFunctions/%.o CMSIS-DSP-1.18.0/Source/WindowFunctions/%.su CMSIS-DSP-1.18.0/Source/WindowFunctions/%.cyclo: ../CMSIS-DSP-1.18.0/Source/WindowFunctions/%.c CMSIS-DSP-1.18.0/Source/WindowFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/PrivateInclude" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../PDM2PCM/App -I../Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/PrivateInclude" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-WindowFunctions

clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-WindowFunctions:
	-$(RM) ./CMSIS-DSP-1.18.0/Source/WindowFunctions/WindowFunctions.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/WindowFunctions.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/WindowFunctions.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/WindowFunctions.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_bartlett_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_blackman_harris_92db_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hamming_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hanning_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft116d_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft144d_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft169d_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft196d_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft223d_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft248d_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft90d_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f32.su
	-$(RM) ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_hft95_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3a_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall3b_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4a_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4b_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_nuttall4c_f64.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f32.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f32.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f32.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f32.su ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f64.cyclo ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f64.d ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f64.o ./CMSIS-DSP-1.18.0/Source/WindowFunctions/arm_welch_f64.su

.PHONY: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-WindowFunctions

