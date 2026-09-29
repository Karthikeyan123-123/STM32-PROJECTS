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
#ifndef __HTS221_H
#define __HTS221_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "main.h"

#define HTS221_ADDR        (0x5F << 1)

#define WHO_AM_I           0x0F

#define CTRL_REG1          0x20
#define STATUS_REG         0x27

#define HUM_OUT_L          0x28
#define HUM_OUT_H          0x29

#define TEMP_OUT_L         0x2A
#define TEMP_OUT_H         0x2B

/* Calibration registers */

#define H0_RH_X2           0x30
#define H1_RH_X2           0x31

#define T0_DEGC_X8         0x32
#define T1_DEGC_X8         0x33

#define T1_T0_MSB          0x35

#define H0_T0_OUT_L        0x36
#define H0_T0_OUT_H        0x37

#define H1_T0_OUT_L        0x3A
#define H1_T0_OUT_H        0x3B

#define T0_OUT_L           0x3C
#define T0_OUT_H           0x3D

#define T1_OUT_L           0x3E
#define T1_OUT_H           0x3F



/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */
HAL_StatusTypeDef HTS221_ReadReg(uint8_t reg,
                                 uint8_t *data,
                                 uint16_t size);
void HTS221_ReadCalibration(void);
void HTS221_ReadRaw(int16_t *raw_humidity,
                    int16_t *raw_temperature);
float HTS221_GetTemperature(int16_t raw_temperature);
float HTS221_GetHumidity(int16_t raw_humidity);

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

#endif /* __HTS221_H */
