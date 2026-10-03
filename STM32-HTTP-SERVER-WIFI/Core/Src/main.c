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

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "es_wifi.h"
#include "es_wifi_io.h"


/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
ES_WIFI_Status_t status;
ES_WIFIObject_t WiFiObj;

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define WIFI_SSID       "Galaxy"
#define WIFI_PASSWORD   "1234567890"
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
static void PrintNetworkSettings(void)
{
    printf("\r\n");
    printf("========================================\r\n");
    printf("        NETWORK SETTINGS\r\n");
    printf("========================================\r\n");

    printf("IP Address : %d.%d.%d.%d\r\n",
           WiFiObj.NetSettings.IP_Addr[0],
           WiFiObj.NetSettings.IP_Addr[1],
           WiFiObj.NetSettings.IP_Addr[2],
           WiFiObj.NetSettings.IP_Addr[3]);

    printf("Subnet Mask: %d.%d.%d.%d\r\n",
           WiFiObj.NetSettings.IP_Mask[0],
           WiFiObj.NetSettings.IP_Mask[1],
           WiFiObj.NetSettings.IP_Mask[2],
           WiFiObj.NetSettings.IP_Mask[3]);

    printf("Gateway    : %d.%d.%d.%d\r\n",
           WiFiObj.NetSettings.Gateway_Addr[0],
           WiFiObj.NetSettings.Gateway_Addr[1],
           WiFiObj.NetSettings.Gateway_Addr[2],
           WiFiObj.NetSettings.Gateway_Addr[3]);

    printf("DNS1       : %d.%d.%d.%d\r\n",
           WiFiObj.NetSettings.DNS1[0],
           WiFiObj.NetSettings.DNS1[1],
           WiFiObj.NetSettings.DNS1[2],
           WiFiObj.NetSettings.DNS1[3]);

    printf("========================================\r\n");
}
/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
SPI_HandleTypeDef hspi3;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_SPI3_Init(void);
/* USER CODE BEGIN PFP */
int __io_putchar(int ch)
{
    ITM_SendChar(ch);
    return ch;
}
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

  MX_SPI3_Init();
  /* USER CODE BEGIN 2 */
  MX_GPIO_Init();





  printf("\r\n");



      /* =========================================================
         STEP 1
         Register low-level SPI/GPIO interface
         ========================================================= */

      ES_WIFI_Status_t status;

      status = ES_WIFI_RegisterBusIO(
                  &WiFiObj,
                  SPI_WIFI_Init,
                  SPI_WIFI_DeInit,
                  SPI_WIFI_Delay,
                  SPI_WIFI_SendData,
                  SPI_WIFI_ReceiveData
               );


      if (status != ES_WIFI_STATUS_OK)
      {
          printf("ERROR: ES_WIFI_RegisterBusIO failed\r\n");

          while (1)
          {
          }
      }

      printf("Bus interface registered\r\n");


      /* =========================================================
         STEP 2
         Initialize ISM43362
         ========================================================= */

      status = ES_WIFI_Init(&WiFiObj);


      if (status != ES_WIFI_STATUS_OK)
      {
          printf("ERROR: ES_WIFI_Init failed\r\n");

          while (1)
          {
          }
      }

      printf("ES_WIFI_Init SUCCESS\r\n");


      /* =========================================================
         STEP 3
         Scan Wi-Fi networks
         ========================================================= */

      ES_WIFI_APs_t APs;

      memset(&APs, 0, sizeof(APs));


      printf("\r\nScanning Wi-Fi networks...\r\n");


      status = ES_WIFI_ListAccessPoints(
                  &WiFiObj,
                  &APs
               );


      if (status != ES_WIFI_STATUS_OK)
      {
          printf("ERROR: Wi-Fi scan failed\r\n");

          while (1)
          {
          }
      }


      /* =========================================================
         STEP 4
         Print discovered APs
         ========================================================= */

      printf("\r\nWi-Fi scan SUCCESS\r\n");

      printf("APs found: %d\r\n\r\n", APs.nbr);


      for (uint8_t i = 0; i < APs.nbr; i++)
      {
          printf(
              "[%d] SSID: %s\r\n",
              i + 1,
              APs.AP[i].SSID
          );

          printf(
              "    RSSI: %d dBm\r\n",
              APs.AP[i].RSSI
          );

          printf(
              "    Channel: %d\r\n",
              APs.AP[i].Channel
          );

          printf(
              "    Security: %d\r\n",
              APs.AP[i].Security
          );

          printf("\r\n");
      }





      printf("\r\nConnecting to: %s\r\n", WIFI_SSID);

          status = ES_WIFI_Connect(
                      &WiFiObj,
                      WIFI_SSID,
                      WIFI_PASSWORD,
                      ES_WIFI_SEC_WPA2
                   );

          if (status != ES_WIFI_STATUS_OK)
          {
              printf("Wi-Fi CONNECTION FAILED\r\n");

              while (1);
          }

          printf("Wi-Fi CONNECT command SUCCESS\r\n");


          /* =====================================================
             5. Verify connection
             ===================================================== */

          if (ES_WIFI_IsConnected(&WiFiObj))
          {
              printf("Wi-Fi CONNECTED!\r\n");
          }
          else
          {
              printf("Wi-Fi NOT CONNECTED\r\n");

              while (1);
          }


          printf("\r\nGetting DHCP/network information...\r\n");

          status = ES_WIFI_GetNetworkSettings(&WiFiObj);

          if (status != ES_WIFI_STATUS_OK)
          {
              printf("ERROR: GetNetworkSettings failed\r\n");

              while (1);
          }

          printf("Network settings obtained\r\n");

          PrintNetworkSettings();


          /* ============================================
             VERIFY IP ADDRESS
             ============================================ */

          uint8_t ipaddr[4];

          status = ES_WIFI_GetIPAddress(
                      &WiFiObj,
                      ipaddr,
                      sizeof(ipaddr)
                   );

          if (status != ES_WIFI_STATUS_OK)
          {
              printf("ERROR: GetIPAddress failed\r\n");

              while (1);
          }

          printf("\r\nIP Address verification:\r\n");

          printf("%d.%d.%d.%d\r\n",
                 ipaddr[0],
                 ipaddr[1],
                 ipaddr[2],
                 ipaddr[3]);







          /* ============================================================
             MILESTONE 4 - TCP CLIENT
             ============================================================ */

          printf("\r\n");
          printf("========================================\r\n");
          printf("          MILESTONE 4 - TCP\r\n");
          printf("========================================\r\n");


          /* Laptop IP address */
          uint8_t server_ip[4] =
          {
              10,
              80,
              70,
              214
          };


          /* ------------------------------------------------------------
             Create TCP connection
             ------------------------------------------------------------ */

          ES_WIFI_Conn_t http_conn;

          memset(&http_conn, 0, sizeof(http_conn));

          http_conn.Type = ES_WIFI_TCP_CONNECTION;

          http_conn.TLScheckMode = ES_WIFI_TLS_CHECK_NOTHING;

          http_conn.Number = 0;

          http_conn.RemoteIP[0] = server_ip[0];
          http_conn.RemoteIP[1] = server_ip[1];
          http_conn.RemoteIP[2] = server_ip[2];
          http_conn.RemoteIP[3] = server_ip[3];

          http_conn.RemotePort = 8080;

          http_conn.LocalPort = 0;

          http_conn.Name = NULL;

          http_conn.Backlog = 0;


          printf(
              "Connecting to HTTP server %d.%d.%d.%d:%d\r\n",
              http_conn.RemoteIP[0],
              http_conn.RemoteIP[1],
              http_conn.RemoteIP[2],
              http_conn.RemoteIP[3],
              http_conn.RemotePort
          );


          /* ============================================================
             Start TCP connection
             ============================================================ */



          status = ES_WIFI_StartClientConnection(
                      &WiFiObj,
                      &http_conn
                   );


          if (status != ES_WIFI_STATUS_OK)
          {
              printf("TCP CONNECTION FAILED\r\n");

              while (1);
          }


          printf("TCP CONNECTION SUCCESS\r\n");


          /* ============================================================
             SEND DATA
             ============================================================ */




          char http_request[] =
              "GET / HTTP/1.1\r\n"
              "Host: 10.80.70.214\r\n"
              "Connection: close\r\n"
              "\r\n";


          uint16_t sent_len = 0;


          printf("\r\nSending HTTP GET...\r\n");

          printf("----------------------------------------\r\n");
          printf("%s", http_request);
          printf("----------------------------------------\r\n");


          status = ES_WIFI_SendData(
                      &WiFiObj,
                      http_conn.Number,
                      (uint8_t *)http_request,
                      strlen(http_request),
                      &sent_len,
                      5000
                   );


          if (status != ES_WIFI_STATUS_OK)
          {
              printf("HTTP REQUEST FAILED\r\n");

              while (1);
          }


          printf("HTTP REQUEST SENT\r\n");
          printf("Bytes sent: %d\r\n", sent_len);


          /* ------------------------------------------------------------
             RECEIVE HTTP RESPONSE
             ------------------------------------------------------------ */

          uint8_t rx_buffer[512];
          uint16_t received_len = 0;

          memset(rx_buffer, 0, sizeof(rx_buffer));

          printf("\r\nWaiting for HTTP response...\r\n");

          status = ES_WIFI_ReceiveData(
                      &WiFiObj,
                      http_conn.Number,
                      rx_buffer,
                      sizeof(rx_buffer) - 1,
                      &received_len,
                      10000
                   );

          printf("Receive status = %d\r\n", status);
          printf("Received length = %d\r\n", received_len);

          if (status == ES_WIFI_STATUS_OK)
          {
              rx_buffer[received_len] = '\0';

              printf("\r\n========== HTTP RESPONSE ==========\r\n");
              printf("%s\r\n", rx_buffer);
              printf("===================================\r\n");
          }
          else
          {
              printf("HTTP RESPONSE FAILED\r\n");
          }

          /* ------------------------------------------------------------
             CLOSE TCP CONNECTION
             ------------------------------------------------------------ */

          status = ES_WIFI_StopClientConnection(
                      &WiFiObj,
                      &http_conn
                   );


          if (status == ES_WIFI_STATUS_OK)
          {
              printf("HTTP TCP connection closed\r\n");
          }


          printf("\r\n");
          printf("========================================\r\n");
          printf("       MILESTONE 5 COMPLETE\r\n");
          printf("========================================\r\n");
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */






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

  /** Configure the main internal regulator output voltage
  */
  if (HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_MSI;
  RCC_OscInitStruct.MSIState = RCC_MSI_ON;
  RCC_OscInitStruct.MSICalibrationValue = 0;
  RCC_OscInitStruct.MSIClockRange = RCC_MSIRANGE_6;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_MSI;
  RCC_OscInitStruct.PLL.PLLM = 1;
  RCC_OscInitStruct.PLL.PLLN = 40;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief SPI3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI3_Init(void)
{

  /* USER CODE BEGIN SPI3_Init 0 */

  /* USER CODE END SPI3_Init 0 */

  /* USER CODE BEGIN SPI3_Init 1 */

  /* USER CODE END SPI3_Init 1 */
  /* SPI3 parameter configuration*/
  hspi3.Instance = SPI3;
  hspi3.Init.Mode = SPI_MODE_MASTER;
  hspi3.Init.Direction = SPI_DIRECTION_2LINES;
  hspi3.Init.DataSize = SPI_DATASIZE_16BIT;
  hspi3.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi3.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi3.Init.NSS = SPI_NSS_SOFT;
  hspi3.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_8;
  hspi3.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi3.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi3.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi3.Init.CRCPolynomial = 7;
  hspi3.Init.CRCLength = SPI_CRC_LENGTH_DATASIZE;
  hspi3.Init.NSSPMode = SPI_NSS_PULSE_ENABLE;
  if (HAL_SPI_Init(&hspi3) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI3_Init 2 */

  /* USER CODE END SPI3_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* USER CODE BEGIN MX_GPIO_Init_1 */

  /* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOE, GPIO_PIN_8|GPIO_PIN_0, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_RESET);

  /*Configure GPIO pins : PE8 PE0 */
  GPIO_InitStruct.Pin = GPIO_PIN_8|GPIO_PIN_0;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

  /*Configure GPIO pin : PB13 */
  GPIO_InitStruct.Pin = GPIO_PIN_13;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pin : PE1 */
  GPIO_InitStruct.Pin = GPIO_PIN_1;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI1_IRQn);

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
