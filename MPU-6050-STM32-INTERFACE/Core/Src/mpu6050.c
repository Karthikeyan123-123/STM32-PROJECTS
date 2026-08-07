#include "main.h"
#include "mpu6050.h"


extern I2C_HandleTypeDef hi2c1;
extern UART_HandleTypeDef huart1;

extern char txBuf[200];


extern uint8_t data[14];

extern int16_t Accel_X;
extern int16_t Accel_Y;
extern int16_t Accel_Z;

extern int16_t Gyro_X;
extern int16_t Gyro_Y;
extern int16_t Gyro_Z;


void MPU6050_Init(void)
{
    uint8_t check;
    uint8_t Data;

    HAL_I2C_Mem_Read(&hi2c1,
                     MPU6050_ADDR,
                     WHO_AM_I,
                     1,
                     &check,
                     1,
                     HAL_MAX_DELAY);

    if(check == 0x68)
    {
        Data = 0;

        // Wake up MPU6050
        HAL_I2C_Mem_Write(&hi2c1,
                          MPU6050_ADDR,
                          PWR_MGMT_1,
                          1,
                          &Data,
                          1,
                          HAL_MAX_DELAY);

        // Accelerometer ±2g
        Data = 0;
        HAL_I2C_Mem_Write(&hi2c1,
                          MPU6050_ADDR,
                          ACCEL_CONFIG,
                          1,
                          &Data,
                          1,
                          HAL_MAX_DELAY);

        // Gyroscope ±250 deg/s
        Data = 0;
        HAL_I2C_Mem_Write(&hi2c1,
                          MPU6050_ADDR,
                          GYRO_CONFIG,
                          1,
                          &Data,
                          1,
                          HAL_MAX_DELAY);
    }
}

void MPU6050_Read(void)
{
    HAL_I2C_Mem_Read(&hi2c1,
                     MPU6050_ADDR,
                     ACCEL_XOUT_H,
                     1,
                     data,
                     14,
                     HAL_MAX_DELAY);

    Accel_X = (int16_t)(data[0] << 8 | data[1]);
    Accel_Y = (int16_t)(data[2] << 8 | data[3]);
    Accel_Z = (int16_t)(data[4] << 8 | data[5]);

    Gyro_X  = (int16_t)(data[8] << 8 | data[9]);
    Gyro_Y  = (int16_t)(data[10] << 8 | data[11]);
    Gyro_Z  = (int16_t)(data[12] << 8 | data[13]);
}
