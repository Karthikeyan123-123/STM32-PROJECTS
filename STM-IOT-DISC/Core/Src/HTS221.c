#include "main.h"
#include "HTS221.h"

extern I2C_HandleTypeDef hi2c2;
extern float H0_RH;
extern float H1_RH;

extern float T0_degC;
extern float T1_degC;

extern int16_t H0_T0_OUT;
extern int16_t H1_T0_OUT;

extern int16_t T0_OUT;
extern int16_t T1_OUT;


HAL_StatusTypeDef HTS221_ReadReg(uint8_t reg,
                                 uint8_t *data,
                                 uint16_t size)
{
    return HAL_I2C_Mem_Read(&hi2c2,
                            HTS221_ADDR,
                            reg,
                            I2C_MEMADD_SIZE_8BIT,
                            data,
                            size,
                            HAL_MAX_DELAY);
}

void HTS221_ReadCalibration(void)
{
    uint8_t data[2];

    /*
     * -------------------------
     * Humidity calibration
     * -------------------------
     */

    HTS221_ReadReg(H0_RH_X2|0x80, data, 2);

    H0_RH = data[0] / 2.0f;
    H1_RH = data[1] / 2.0f;


    /*
     * -------------------------
     * Temperature calibration
     * -------------------------
     */

    HTS221_ReadReg(T0_DEGC_X8|0x80, data, 2);

    uint16_t T0_x8 = data[0];
    uint16_t T1_x8 = data[1];


    /*
     * Read T0/T1 upper bits
     */

    uint8_t msb;

    HTS221_ReadReg(T1_T0_MSB, &msb, 1);

    /*
     * T0 bits [9:8] are in bits [1:0]
     */

    T0_x8 |= ((msb & 0x03) << 8);

    /*
     * T1 bits [9:8] are in bits [3:2]
     */

    T1_x8 |= ((msb & 0x0C) << 6);


    /*
     * x8 -> actual °C
     */

    T0_degC = T0_x8 / 8.0f;
    T1_degC = T1_x8 / 8.0f;


    /*
     * -------------------------
     * Humidity raw calibration
     * -------------------------
     */

    HTS221_ReadReg(H0_T0_OUT_L|0x80, data, 2);

    H0_T0_OUT =
        (int16_t)(
            ((uint16_t)data[1] << 8) |
            data[0]
        );


    HTS221_ReadReg(H1_T0_OUT_L|0x80, data, 2);

    H1_T0_OUT =
        (int16_t)(
            ((uint16_t)data[1] << 8) |
            data[0]
        );


    /*
     * -------------------------
     * Temperature raw calibration
     * -------------------------
     */

    HTS221_ReadReg(T0_OUT_L|0x80, data, 2);

    T0_OUT =
        (int16_t)(
            ((uint16_t)data[1] << 8) |
            data[0]
        );


    HTS221_ReadReg(T1_OUT_L|0x80, data, 2);

    T1_OUT =
        (int16_t)(
            ((uint16_t)data[1] << 8) |
            data[0]
        );
}

void HTS221_ReadRaw(int16_t *raw_humidity,
                    int16_t *raw_temperature)
{
    uint8_t data[4];

    HAL_I2C_Mem_Read(&hi2c2,
                     HTS221_ADDR,
                     HUM_OUT_L | 0x80,
                     I2C_MEMADD_SIZE_8BIT,
                     data,
                     4,
                     HAL_MAX_DELAY);

    /*
     * 0x28 -> humidity LOW
     * 0x29 -> humidity HIGH
     * 0x2A -> temperature LOW
     * 0x2B -> temperature HIGH
     */

    *raw_humidity =
        (int16_t)(
            ((uint16_t)data[1] << 8) |
            data[0]
        );

    *raw_temperature =
        (int16_t)(
            ((uint16_t)data[3] << 8) |
            data[2]
        );
}

float HTS221_GetTemperature(int16_t raw_temperature)
{
    float temperature;

    temperature =
        T0_degC +
        ((float)(raw_temperature - T0_OUT) *
        (T1_degC - T0_degC)) /
        (float)(T1_OUT - T0_OUT);

    return temperature;
}

float HTS221_GetHumidity(int16_t raw_humidity)
{
    float humidity;

    humidity =
        H0_RH +
        ((float)(raw_humidity - H0_T0_OUT) *
        (H1_RH - H0_RH)) /
        (float)(H1_T0_OUT - H0_T0_OUT);

    return humidity;
}
