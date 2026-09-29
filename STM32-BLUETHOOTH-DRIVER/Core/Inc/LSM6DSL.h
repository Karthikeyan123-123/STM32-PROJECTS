/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __LSM6DSL_H
#define __LSM6DSL_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

extern I2C_HandleTypeDef hi2c2;

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */
#ifndef LSM6DSL_H
#define LSM6DSL_H

#include "main.h"

/* LSM6DSL I2C address */
#define LSM6DSL_ADDR            (0x6A << 1)

/* Registers */
#define LSM6DSL_WHO_AM_I       0x0F
#define LSM6DSL_CTRL1_XL       0x10

#define LSM6DSL_OUTX_L_XL      0x28
#define LSM6DSL_OUTX_H_XL      0x29
#define LSM6DSL_OUTY_L_XL      0x2A
#define LSM6DSL_OUTY_H_XL      0x2B
#define LSM6DSL_OUTZ_L_XL      0x2C
#define LSM6DSL_OUTZ_H_XL      0x2D


/* gyroscope */


#define LSM6DSL_CTRL2_G      0x11    // Gyroscope
#define LSM6DSL_CTRL3_C      0x12    // Common control
#define LSM6DSL_OUTX_L_G     0x22
#define LSM6DSL_OUTX_H_G     0x23
#define LSM6DSL_OUTY_L_G     0x24
#define LSM6DSL_OUTY_H_G     0x25
#define LSM6DSL_OUTZ_L_G     0x26
#define LSM6DSL_OUTZ_H_G     0x27

/* Expected WHO_AM_I */
#define LSM6DSL_ID             0x6A

HAL_StatusTypeDef LSM6DSL_ReadReg(uint8_t reg,
                                  uint8_t *data,
                                  uint16_t size);

HAL_StatusTypeDef LSM6DSL_WriteReg(uint8_t reg,
                                   uint8_t *data,
                                   uint16_t size);

HAL_StatusTypeDef LSM6DSL_Init(void);

HAL_StatusTypeDef LSM6DSL_ReadAccel(int16_t *ax,
                                    int16_t *ay,
                                    int16_t *az);

HAL_StatusTypeDef LSM6DSL_ReadGyro(int16_t *x,
                                   int16_t *y,
                                   int16_t *z);

HAL_StatusTypeDef LSM6DSL_ReadAccel(int16_t *ax,
                                    int16_t *ay,
                                    int16_t *az);

#endif
/* USER CODE END ET */
/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
