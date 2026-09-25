################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS-DSP-1.18.0/Source/CommonTables/CommonTables.c \
../CMSIS-DSP-1.18.0/Source/CommonTables/CommonTablesF16.c \
../CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables.c \
../CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables_f16.c \
../CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs.c \
../CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs_f16.c \
../CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables.c \
../CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables_f16.c \
../CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables.c \
../CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables_f16.c 

OBJS += \
./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTables.o \
./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTablesF16.o \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables.o \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables_f16.o \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs.o \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs_f16.o \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables.o \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables_f16.o \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables.o \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables_f16.o 

C_DEPS += \
./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTables.d \
./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTablesF16.d \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables.d \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables_f16.d \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs.d \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs_f16.d \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables.d \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables_f16.d \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables.d \
./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables_f16.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS-DSP-1.18.0/Source/CommonTables/%.o CMSIS-DSP-1.18.0/Source/CommonTables/%.su CMSIS-DSP-1.18.0/Source/CommonTables/%.cyclo: ../CMSIS-DSP-1.18.0/Source/CommonTables/%.c CMSIS-DSP-1.18.0/Source/CommonTables/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/Drivers/CMSIS-DSP-1.18.0/PrivateInclude" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../PDM2PCM/App -I../Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/Include" -I"C:/Users/karthikeyan m/STM32CubeIDE/workspace_1.19.0/DISC-ADC/CMSIS-DSP-1.18.0/PrivateInclude" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-CommonTables

clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-CommonTables:
	-$(RM) ./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTables.cyclo ./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTables.d ./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTables.o ./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTables.su ./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTablesF16.cyclo ./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTablesF16.d ./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTablesF16.o ./CMSIS-DSP-1.18.0/Source/CommonTables/CommonTablesF16.su ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables.cyclo ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables.d ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables.o ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables.su ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables_f16.cyclo ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables_f16.d ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables_f16.o ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_common_tables_f16.su ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs.cyclo ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs.d ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs.o ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs.su ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs_f16.cyclo ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs_f16.d ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs_f16.o ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_const_structs_f16.su ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables.cyclo ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables.d ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables.o ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables.su ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables_f16.cyclo ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables_f16.d ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables_f16.o ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_mve_tables_f16.su ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables.cyclo ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables.d ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables.o ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables.su ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables_f16.cyclo ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables_f16.d ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables_f16.o ./CMSIS-DSP-1.18.0/Source/CommonTables/arm_neon_tables_f16.su

.PHONY: clean-CMSIS-2d-DSP-2d-1-2e-18-2e-0-2f-Source-2f-CommonTables

