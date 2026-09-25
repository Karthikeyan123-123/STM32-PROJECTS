/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "pdm2pcm.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "arm_math.h"
#include <stdio.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
/* USER CODE BEGIN PV */

#include <math.h>
#define SAMPLE_RATE 16000.0f

#define PDM_BUFFER_SIZE    512
uint16_t pdm_buffer[PDM_BUFFER_SIZE];

volatile uint8_t pdm_half_ready = 0;
volatile uint8_t pdm_full_ready = 0;

#define PCM_BUFFER_SIZE      128
int16_t pcm_buffer[PCM_BUFFER_SIZE];

uint16_t app_pdm[PDM_BUFFER_SIZE];

#define FFT_SIZE 256
int16_t fft_buffer[FFT_SIZE];
uint16_t fft_index = 0;

float fft_input[FFT_SIZE];
float hann_window[FFT_SIZE];

arm_rfft_fast_instance_f32 fft_instance;

float fft_output[FFT_SIZE];
float magnitude[FFT_SIZE / 2];

float peak_frequency;
float peak_magnitude;
uint16_t peak_bin;



#include <stdio.h>
#include "core_cm4.h"

int _write(int file, char *ptr, int len)
{
    for (int i = 0; i < len; i++)
    {
        ITM_SendChar((uint32_t)ptr[i]);
    }

    return len;
}
void HannWindow_Init(void)
{
    for (uint16_t i = 0; i < FFT_SIZE; i++)
    {
        hann_window[i] =
            0.5f * (1.0f -
            cosf((2.0f * PI * i) / (FFT_SIZE - 1)));
    }
}
void PrepareFFTInput(const int16_t *pcm_buffer,
                     float *fft_input)
{
    int32_t sum = 0;

    /* Calculate DC component */
    for (uint16_t i = 0; i < FFT_SIZE; i++)
    {
        sum += pcm_buffer[i];
    }

    float dc = (float)sum / FFT_SIZE;

    /* Remove DC + apply precomputed Hann window */
    for (uint16_t i = 0; i < FFT_SIZE; i++)
    {
        float sample = (float)pcm_buffer[i] - dc;

        fft_input[i] = sample * hann_window[i];
    }
}
void Convert_PDM_To_PCM(void)
{
    uint32_t ret;

    /* Correct byte order */
    for (uint32_t i = 0; i < PDM_BUFFER_SIZE; i++)
    {
        app_pdm[i] = __REV16(pdm_buffer[i]);
    }

    /* Convert PDM → PCM */
    ret = PDM_Filter(
            (uint8_t *)app_pdm,
            (uint16_t *)pcm_buffer,
            &PDM1_filter_handler
          );

    if (ret != 0)
    {
        Error_Handler();
    }
}
void HAL_I2S_RxHalfCpltCallback(I2S_HandleTypeDef *hi2s)
{
    if (hi2s->Instance == SPI2)
    {
        pdm_half_ready = 1;
    }
}


void HAL_I2S_RxCpltCallback(I2S_HandleTypeDef *hi2s)
{
    if (hi2s->Instance == SPI2)
    {
        pdm_full_ready = 1;
    }
}
void HAL_I2S_ErrorCallback(I2S_HandleTypeDef *hi2s)
{
    if (hi2s->Instance == SPI2)
    {
        Error_Handler();
    }
}
void ProcessFFT(void)
{
    /* -----------------------------------------
       1. Prepare input
       DC removal + Hann window
       ----------------------------------------- */
    PrepareFFTInput(fft_buffer, fft_input);


    /* -----------------------------------------
       2. Perform 256-point real FFT
       ----------------------------------------- */
    arm_rfft_fast_f32(
        &fft_instance,
        fft_input,
        fft_output,
        0
    );


    /* -----------------------------------------
       3. Calculate magnitude
       ----------------------------------------- */

    /*
     * CMSIS-DSP real FFT output:
     *
     * fft_output[0] = real X[0]
     * fft_output[1] = real X[N/2]
     *
     * Then:
     *
     * fft_output[2*k]     = Real X[k]
     * fft_output[2*k + 1] = Imaginary X[k]
     *
     * for k = 1 ... N/2-1
     */

    magnitude[0] = fabsf(fft_output[0]);

    for (uint16_t k = 1; k < FFT_SIZE / 2; k++)
    {
        float real = fft_output[2 * k];
        float imag = fft_output[2 * k + 1];

        magnitude[k] = sqrtf(
            (real * real) +
            (imag * imag)
        );
    }


    /* -----------------------------------------
       4. Find strongest frequency bin
       ----------------------------------------- */

    peak_magnitude = 0.0f;
    peak_bin = 0;

    for (uint16_t k = 1; k < FFT_SIZE / 2; k++)
    {
        if (magnitude[k] > peak_magnitude)
        {
            peak_magnitude = magnitude[k];
            peak_bin = k;
        }
    }


    /* -----------------------------------------
       5. Convert bin → frequency
       ----------------------------------------- */

    peak_frequency =
        ((float)peak_bin * SAMPLE_RATE) / FFT_SIZE;




    printf("Peak Frequency: %.2f Hz\r\n", peak_frequency);
}









/* USER CODE END PV */
/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
CRC_HandleTypeDef hcrc;

I2S_HandleTypeDef hi2s2;
DMA_HandleTypeDef hdma_spi2_rx;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_I2S2_Init(void);
static void MX_CRC_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_I2S2_Init();
  MX_CRC_Init();
  MX_PDM2PCM_Init();

  HannWindow_Init();
  /* USER CODE BEGIN 2 */
  if (HAL_I2S_Receive_DMA(&hi2s2,
                             pdm_buffer,
                             PDM_BUFFER_SIZE) != HAL_OK)
     {
         Error_Handler();
     }


  if (arm_rfft_fast_init_f32(&fft_instance, FFT_SIZE) != ARM_MATH_SUCCESS)
  {
      Error_Handler();
  }


  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
	  if (pdm_half_ready)
	    {
	        pdm_half_ready = 0;

	        PDM_Filter(
	            (void *)&pdm_buffer[0],
	            (void *)pcm_buffer,
	            &PDM1_filter_handler
	        );

	        for(uint16_t i=0; i<PCM_BUFFER_SIZE; i++){
	        	        	        	fft_buffer[fft_index++] = pcm_buffer[i];
	        	        	        }




	    }


	  if (pdm_full_ready)
	    {
	        pdm_full_ready = 0;

	        PDM_Filter(
	            (void *)&pdm_buffer[256],
	            (void *)pcm_buffer,
	            &PDM1_filter_handler
	        );

	        for(uint16_t i=0; i<PCM_BUFFER_SIZE; i++){
	        	        	fft_buffer[fft_index++] = pcm_buffer[i];
	        	        }

	    }



	  if (fft_index >= FFT_SIZE)
	  {


		ProcessFFT();
	    fft_index = 0;
	  }
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Macro to configure the PLL multiplication factor
  */
  __HAL_RCC_PLL_PLLM_CONFIG(8);

  /** Macro to configure the PLL clock source
  */
  __HAL_RCC_PLL_PLLSOURCE_CONFIG(RCC_PLLSOURCE_HSI);

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief CRC Initialization Function
  * @param None
  * @retval None
  */
static void MX_CRC_Init(void)
{

  /* USER CODE BEGIN CRC_Init 0 */

  /* USER CODE END CRC_Init 0 */

  /* USER CODE BEGIN CRC_Init 1 */

  /* USER CODE END CRC_Init 1 */
  hcrc.Instance = CRC;
  if (HAL_CRC_Init(&hcrc) != HAL_OK)
  {
    Error_Handler();
  }
  __HAL_CRC_DR_RESET(&hcrc);
  /* USER CODE BEGIN CRC_Init 2 */

  /* USER CODE END CRC_Init 2 */

}

/**
  * @brief I2S2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2S2_Init(void)
{

  /* USER CODE BEGIN I2S2_Init 0 */

  /* USER CODE END I2S2_Init 0 */

  /* USER CODE BEGIN I2S2_Init 1 */

  /* USER CODE END I2S2_Init 1 */
  hi2s2.Instance = SPI2;
  hi2s2.Init.Mode = I2S_MODE_MASTER_RX;
  hi2s2.Init.Standard = I2S_STANDARD_LSB;
  hi2s2.Init.DataFormat = I2S_DATAFORMAT_16B;
  hi2s2.Init.MCLKOutput = I2S_MCLKOUTPUT_DISABLE;
  hi2s2.Init.AudioFreq = I2S_AUDIOFREQ_32K;
  hi2s2.Init.CPOL = I2S_CPOL_LOW;
  hi2s2.Init.ClockSource = I2S_CLOCK_PLL;
  hi2s2.Init.FullDuplexMode = I2S_FULLDUPLEXMODE_DISABLE;
  if (HAL_I2S_Init(&hi2s2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2S2_Init 2 */

  /* USER CODE END I2S2_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Stream3_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Stream3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream3_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /* USER CODE BEGIN MX_GPIO_Init_2 */

  /* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */




/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
