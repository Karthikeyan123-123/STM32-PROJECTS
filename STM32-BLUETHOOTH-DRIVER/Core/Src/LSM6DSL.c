#include "main.h"
#include "LSM6DSL.h"


/* ----------------------------------------------------------
 * Read register(s)
 * ---------------------------------------------------------- */
HAL_StatusTypeDef LSM6DSL_ReadReg(uint8_t reg,
                                  uint8_t *data,
                                  uint16_t size)
{
    return HAL_I2C_Mem_Read(&hi2c2,
                            LSM6DSL_ADDR,
                            reg,
                            I2C_MEMADD_SIZE_8BIT,
                            data,
                            size,
                            HAL_MAX_DELAY);
}


/* ----------------------------------------------------------
 * Write register(s)
 * ---------------------------------------------------------- */
HAL_StatusTypeDef LSM6DSL_WriteReg(uint8_t reg,
                                   uint8_t *data,
                                   uint16_t size)
{
    return HAL_I2C_Mem_Write(&hi2c2,
                             LSM6DSL_ADDR,
                             reg,
                             I2C_MEMADD_SIZE_8BIT,
                             data,
                             size,
                             HAL_MAX_DELAY);
}





/* ----------------------------------------------------------
 * Initialize LSM6DSL accelerometer
 *
 * ODR = 104 Hz
 * Full Scale = ±2 g
 *
 * CTRL1_XL = 0100 0000 = 0x40
 * ---------------------------------------------------------- */
HAL_StatusTypeDef LSM6DSL_Init(void)
{
    uint8_t who_am_i;
    uint8_t ctrl1_xl;

    /* Read WHO_AM_I */
    if (LSM6DSL_ReadReg(LSM6DSL_WHO_AM_I,
                         &who_am_i,
                         1) != HAL_OK)
    {
        return HAL_ERROR;
    }

    /* Check device ID */
    if (who_am_i != LSM6DSL_ID)
    {
        return HAL_ERROR;
    }

    /*
     * CTRL1_XL = 0x40
     *
     * 0100 0000
     * ||||
     * ||||---- ODR_XL = 0100 → 104 Hz
     *
     * FS_XL = 00 → ±2 g
     */
    ctrl1_xl = 0x40;

    if (LSM6DSL_WriteReg(LSM6DSL_CTRL1_XL,
                          &ctrl1_xl,
                          1) != HAL_OK)
    {
        return HAL_ERROR;
    }



    /* -----------------------------------------
         * 2. CTRL3_C
         *
         * BDU = 1
         * IF_INC = 1
         *
         * CTRL3_C = 0x44
         *
         * 0x40 → BDU
         * 0x04 → IF_INC
         * ----------------------------------------- */
    volatile HAL_StatusTypeDef status;

    uint8_t ctrl3data = 0x44;
    uint8_t ctrl2_g = 0x40;

        if (LSM6DSL_WriteReg(LSM6DSL_CTRL3_C,
                             &ctrl3data,1) != HAL_OK)
        {
            return HAL_ERROR;
        }

        if (LSM6DSL_WriteReg(LSM6DSL_CTRL2_G,
                                 &ctrl2_g,1) != HAL_OK)
            {
                return HAL_ERROR;
            }






            status = LSM6DSL_ReadReg(LSM6DSL_CTRL2_G, &ctrl2_g, 1);




            return HAL_OK;

}


/* ----------------------------------------------------------
 * Read accelerometer X/Y/Z
 *
 * Registers:
 *
 * 0x28 → X low
 * 0x29 → X high
 * 0x2A → Y low
 * 0x2B → Y high
 * 0x2C → Z low
 * 0x2D → Z high
 * ---------------------------------------------------------- */
HAL_StatusTypeDef LSM6DSL_ReadAccel(int16_t *ax,
                                    int16_t *ay,
                                    int16_t *az)
{
    uint8_t data[6];

    /*
     * IF_INC = 1
     *
     * Start at 0x28
     *
     * 0x28 → X_L
     * 0x29 → X_H
     * 0x2A → Y_L
     * 0x2B → Y_H
     * 0x2C → Z_L
     * 0x2D → Z_H
     */
    if (LSM6DSL_ReadReg(LSM6DSL_OUTX_L_XL,
                         data,
                         6) != HAL_OK)
    {
        return HAL_ERROR;
    }

    /* Combine low byte + high byte */

    *ax = (int16_t)(((uint16_t)data[1] << 8) |
                    data[0]);

    *ay = (int16_t)(((uint16_t)data[3] << 8) |
                    data[2]);

    *az = (int16_t)(((uint16_t)data[5] << 8) |
                    data[4]);

    return HAL_OK;
}

HAL_StatusTypeDef LSM6DSL_ReadGyro(int16_t *gx,
                                   int16_t *gy,
                                   int16_t *gz)
{
    uint8_t data[6];

    volatile HAL_StatusTypeDef status;

    status = LSM6DSL_ReadReg(LSM6DSL_OUTX_L_G,
                              data,
                              6);

    if (status != HAL_OK)
    {
        return status;
    }

    /* Combine low byte + high byte */

    *gx = (int16_t)(((uint16_t)data[1] << 8) | data[0]);

    *gy = (int16_t)(((uint16_t)data[3] << 8) | data[2]);

    *gz = (int16_t)(((uint16_t)data[5] << 8) | data[4]);

    return HAL_OK;
}
