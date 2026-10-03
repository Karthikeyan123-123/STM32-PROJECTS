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
#include <string.h>
#include <stdint.h>
#include "HTS221.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
I2C_HandleTypeDef hi2c2;

SPI_HandleTypeDef hspi3;

/* USER CODE BEGIN PV */
#define MQTT_HOST       "stm32-cluster-fe8e3dac.a03.euc1.aws.hivemq.cloud"
#define MQTT_PORT       8883

#define MQTT_USERNAME   "Karthikeyan"
#define MQTT_PASSWORD   "Karthikarthi"

#define MQTT_CLIENT_ID  "STM32L4S5_01"

#define MQTT_TOPIC      "stm32/sensor"
#define WIFI_SSID       "Galaxy"
#define WIFI_PASSWORD   "1234567890"
ES_WIFI_Status_t status;
ES_WIFIObject_t WiFiObj;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_SPI3_Init(void);
static void MX_I2C2_Init(void);
/* USER CODE BEGIN PFP */
float H0_RH;
float H1_RH;

float T0_degC;
float T1_degC;

int16_t H0_T0_OUT;
int16_t H1_T0_OUT;

int16_t T0_OUT;
int16_t T1_OUT;
uint8_t ctrl = 0x85;
int16_t raw_humidity;
int16_t raw_temperature;
char json_payload[128];
float humidity;
float temperature;
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
static uint8_t MQTT_EncodeRemainingLength(uint32_t length,
                                           uint8_t *out)
{
    uint8_t i = 0;

    do
    {
        uint8_t digit = length % 128;

        length /= 128;

        if (length > 0)
        {
            digit |= 0x80;
        }

        out[i++] = digit;

    } while (length > 0);

    return i;
}


static uint16_t MQTT_BuildConnect(
        uint8_t *buf,
        const char *client_id,
        const char *username,
        const char *password)
{
    uint16_t i = 0;

    uint16_t client_len =
        strlen(client_id);

    uint16_t username_len =
        strlen(username);

    uint16_t password_len =
        strlen(password);

    /*
     * MQTT CONNECT variable header:
     *
     * Protocol Name       = 6 bytes
     * Protocol Level      = 1 byte
     * Connect Flags       = 1 byte
     * Keep Alive          = 2 bytes
     *
     * Total = 10 bytes
     */

    uint32_t remaining_length =
        10
        + 2 + client_len
        + 2 + username_len
        + 2 + password_len;

    uint8_t encoded_length[4];

    uint8_t encoded_len_bytes =
        MQTT_EncodeRemainingLength(
            remaining_length,
            encoded_length);


    /* Fixed header */

    buf[i++] = 0x10;


    /* Remaining Length */

    memcpy(&buf[i],
           encoded_length,
           encoded_len_bytes);

    i += encoded_len_bytes;


    /* Protocol Name = MQTT */

    buf[i++] = 0x00;
    buf[i++] = 0x04;

    buf[i++] = 'M';
    buf[i++] = 'Q';
    buf[i++] = 'T';
    buf[i++] = 'T';


    /* MQTT 3.1.1 */

    buf[i++] = 0x04;


    /*
     * Connect Flags
     *
     * Bit 7 = Username = 1
     * Bit 6 = Password = 1
     * Bit 1 = Clean Session = 1
     */

    buf[i++] = 0xC2;


    /* Keep Alive = 60 seconds */

    buf[i++] = 0x00;
    buf[i++] = 0x3C;


    /* Client ID */

    buf[i++] =
        (client_len >> 8) & 0xFF;

    buf[i++] =
        client_len & 0xFF;

    memcpy(&buf[i],
           client_id,
           client_len);

    i += client_len;


    /* Username */

    buf[i++] =
        (username_len >> 8) & 0xFF;

    buf[i++] =
        username_len & 0xFF;

    memcpy(&buf[i],
           username,
           username_len);

    i += username_len;


    /* Password */

    buf[i++] =
        (password_len >> 8) & 0xFF;

    buf[i++] =
        password_len & 0xFF;

    memcpy(&buf[i],
           password,
           password_len);

    i += password_len;


    return i;
}

int __io_putchar(int ch)
{
    ITM_SendChar(ch);
    return ch;
}

static uint16_t MQTT_BuildPublishQos0(uint8_t *buf,
                                      const char *topic,
                                      const uint8_t *payload,
                                      uint16_t payload_len)
{
    uint16_t i = 0;

    uint16_t topic_len = strlen(topic);

    uint32_t remaining_length =
            2 + topic_len + payload_len;

    uint8_t encoded_length[4];

    uint8_t encoded_len_bytes;


    /* Encode MQTT Remaining Length */

    encoded_len_bytes =
        MQTT_EncodeRemainingLength(
            remaining_length,
            encoded_length);


    /* Fixed header */

    buf[i++] = 0x30;


    /* Remaining Length */

    memcpy(&buf[i],
           encoded_length,
           encoded_len_bytes);

    i += encoded_len_bytes;


    /* Topic length */

    buf[i++] = (topic_len >> 8) & 0xFF;
    buf[i++] = topic_len & 0xFF;


    /* Topic */

    memcpy(&buf[i],
           topic,
           topic_len);

    i += topic_len;


    /* Payload */

    memcpy(&buf[i],
           payload,
           payload_len);

    i += payload_len;


    return i;
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
  MX_GPIO_Init();
  MX_SPI3_Init();
  MX_I2C2_Init();
  /* USER CODE BEGIN 2 */

  HAL_I2C_Mem_Write(&hi2c2,
                     HTS221_ADDR,
                     CTRL_REG1,
                     I2C_MEMADD_SIZE_8BIT,
                     &ctrl,
                     1,
                     HAL_MAX_DELAY);
   HTS221_ReadCalibration();
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




            uint8_t broker_ip[4];

            status = ES_WIFI_DNS_LookUp(
                &WiFiObj,
                MQTT_HOST,
                broker_ip,
				sizeof(broker_ip)
            );

            if (status != ES_WIFI_STATUS_OK)
            {
                printf("DNS lookup failed\r\n");
                while (1)
                   {

                   }
            }

            printf("HiveMQ IP: %d.%d.%d.%d\r\n",
                   broker_ip[0],
                   broker_ip[1],
                   broker_ip[2],
                   broker_ip[3]);






            ES_WIFI_Conn_t mqtt_conn;

            memset(&mqtt_conn, 0, sizeof(mqtt_conn));

            mqtt_conn.Type = ES_WIFI_TCP_SSL_CONNECTION;

            mqtt_conn.Number = 0;

            mqtt_conn.RemotePort = 8883;

            mqtt_conn.LocalPort = 0;

            mqtt_conn.TLScheckMode =
                ES_WIFI_TLS_CHECK_NOTHING;

            mqtt_conn.RemoteIP[0] = broker_ip[0];
            mqtt_conn.RemoteIP[1] = broker_ip[1];
            mqtt_conn.RemoteIP[2] = broker_ip[2];
            mqtt_conn.RemoteIP[3] = broker_ip[3];

            mqtt_conn.TLScheckMode = ES_WIFI_TLS_CHECK_NOTHING;

            printf("Starting TLS connection to HiveMQ...\r\n");

            status = ES_WIFI_StartClientConnection(
                         &WiFiObj,
                         &mqtt_conn);

            if (status == ES_WIFI_STATUS_OK)
            {
                printf("TLS connection ESTABLISHED\r\n");
            }
            else
            {
                printf("TLS connection FAILED\r\n");
                printf("Status = %d\r\n", status);

                while (1)
                {
                    HAL_Delay(1000);
                }
            }


            uint8_t mqtt_packet[512];

            uint16_t packet_len;
            uint16_t sent_len;

            packet_len =
                MQTT_BuildConnect(
                    mqtt_packet,
                    MQTT_CLIENT_ID,
                    MQTT_USERNAME,
                    MQTT_PASSWORD);


            status =
                ES_WIFI_SendData(
                    &WiFiObj,
                    mqtt_conn.Number,
                    mqtt_packet,
                    packet_len,
                    &sent_len,
                    5000);

            if (status == ES_WIFI_STATUS_OK)
            {
                printf("MQTT CONNECT sent\r\n");
            }
            else
            {
                printf("MQTT CONNECT failed\r\n");
            }


            /* ------------------------------------------------------------
             * 4. Wait for server response
             * ------------------------------------------------------------ */




            /* ------------------------------------------------------------
             * 5. Print result
             * ------------------------------------------------------------ */

            printf("\r\n========== SERVER RESPONSE ==========\r\n");

            uint8_t connack[4];

            uint16_t received_len = 0;

            status =
                ES_WIFI_ReceiveData(
                    &WiFiObj,
                    mqtt_conn.Number,
                    connack,
                    sizeof(connack),
                    &received_len,
                    5000);

            if (status == ES_WIFI_STATUS_OK)
            {
                printf("CONNACK RX: ");

                for (uint16_t i = 0;
                     i < received_len;
                     i++)
                {
                    printf("%02X ", connack[i]);
                }

                printf("\r\n");
            }




            char topic[] = "stm32/sensor";
            char payload[100];



  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
	  HTS221_ReadRaw(&raw_humidity,
		                    &raw_temperature);

		     humidity =
		         HTS221_GetHumidity(raw_humidity);

		     temperature =
		         HTS221_GetTemperature(raw_temperature);


		     snprintf(payload,
		                        sizeof(payload),
		                        "{\"temperature\":%.2f,\"humidity\":%.2f}",
		                        temperature,
		                        humidity);



		     packet_len =
		         MQTT_BuildPublishQos0(
		             mqtt_packet,
		             topic,
		             (const uint8_t *)payload,
		             strlen(payload));


		     status =
		         ES_WIFI_SendData(
		             &WiFiObj,
		             mqtt_conn.Number,
		             mqtt_packet,
		             packet_len,
		             &sent_len,
		             5000);


	    HAL_Delay(1000);
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
  * @brief I2C2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C2_Init(void)
{

  /* USER CODE BEGIN I2C2_Init 0 */

  /* USER CODE END I2C2_Init 0 */

  /* USER CODE BEGIN I2C2_Init 1 */

  /* USER CODE END I2C2_Init 1 */
  hi2c2.Instance = I2C2;
  hi2c2.Init.Timing = 0x10D19CE4;
  hi2c2.Init.OwnAddress1 = 0;
  hi2c2.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c2.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c2.Init.OwnAddress2 = 0;
  hi2c2.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
  hi2c2.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c2.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c2) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Analogue filter
  */
  if (HAL_I2CEx_ConfigAnalogFilter(&hi2c2, I2C_ANALOGFILTER_ENABLE) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Digital filter
  */
  if (HAL_I2CEx_ConfigDigitalFilter(&hi2c2, 0) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C2_Init 2 */

  /* USER CODE END I2C2_Init 2 */

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
