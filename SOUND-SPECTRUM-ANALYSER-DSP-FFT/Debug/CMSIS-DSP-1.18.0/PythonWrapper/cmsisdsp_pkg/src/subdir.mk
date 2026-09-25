################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_basic.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_bayes.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_complexf.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_controller.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_distance.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_fastmath.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_filtering.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_interpolation.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_matrix.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_quaternion.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_statistics.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_support.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_svm.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_transform.c \
../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_window.c 

OBJS += \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_basic.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_bayes.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_complexf.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_controller.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_distance.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_fastmath.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_filtering.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_interpolation.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_matrix.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_quaternion.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_statistics.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_support.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_svm.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_transform.o \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_window.o 

C_DEPS += \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_basic.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_bayes.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_complexf.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_controller.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_distance.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_fastmath.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_filtering.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_interpolation.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_matrix.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_quaternion.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_statistics.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_support.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_svm.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_transform.d \
./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_window.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/%.o CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/%.su CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/%.cyclo: ../CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/%.c CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/PrivateInclude" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../PDM2PCM/App -I../Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/PrivateInclude" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-PythonWrapper-2f-cmsisdsp_pkg-2f-src

clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-PythonWrapper-2f-cmsisdsp_pkg-2f-src:
	-$(RM) ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_basic.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_basic.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_basic.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_basic.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_bayes.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_bayes.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_bayes.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_bayes.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_complexf.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_complexf.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_complexf.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_complexf.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_controller.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_controller.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_controller.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_controller.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_distance.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_distance.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_distance.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_distance.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_fastmath.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_fastmath.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_fastmath.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_fastmath.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_filtering.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_filtering.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_filtering.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_filtering.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_interpolation.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_interpolation.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_interpolation.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_interpolation.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_matrix.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_matrix.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_matrix.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_matrix.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_quaternion.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_quaternion.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_quaternion.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_quaternion.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_statistics.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_statistics.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_statistics.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_statistics.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_support.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_support.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_support.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_support.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_svm.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_svm.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_svm.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_svm.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_transform.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_transform.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_transform.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_transform.su ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_window.cyclo ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_window.d ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_window.o ./CMSIS-DSP-1.18.0/PythonWrapper/cmsisdsp_pkg/src/cmsisdsp_window.su

.PHONY: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-PythonWrapper-2f-cmsisdsp_pkg-2f-src

