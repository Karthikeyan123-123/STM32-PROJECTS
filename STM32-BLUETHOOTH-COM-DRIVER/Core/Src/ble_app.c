#include "main.h"
#include "ble_app.h"

#include <string.h>
#include <stdio.h>

#include "bluenrg_aci_const.h"
#include "bluenrg_gap_aci.h"
#include "bluenrg_gatt_aci.h"
#include "bluenrg_hal_aci.h"
#include "hci.h"
#include "bluenrg_gap.h"

#define BLE_DEVICE_NAME "STM32_TEMP"

static const uint8_t BLE_ADV_NAME[] =
{
    AD_TYPE_COMPLETE_LOCAL_NAME,
    'S','T','M','3','2','_','T','M','P'
};
/* ============================================================
 * Custom UUIDs
 * ============================================================ */

/*
 * Temperature Service UUID
 */
static const uint8_t TEMP_SERVICE_UUID[16] =
{
    0x01, 0x02, 0x03, 0x04,
    0x05, 0x06, 0x07, 0x08,
    0x09, 0x0A, 0x0B, 0x0C,
    0x0D, 0x0E, 0x0F, 0x10
};


/*
 * Temperature Characteristic UUID
 */
static const uint8_t TEMP_CHAR_UUID[16] =
{
    0x11, 0x12, 0x13, 0x14,
    0x15, 0x16, 0x17, 0x18,
    0x19, 0x1A, 0x1B, 0x1C,
    0x1D, 0x1E, 0x1F, 0x20
};


static const uint8_t ACCEL_CHAR_UUID[16] = {
    0x21,0x22,0x23,0x24,0x25,0x26,0x27,0x28,
    0x29,0x2A,0x2B,0x2C,0x2D,0x2E,0x2F,0x30
};




/* ============================================================
 * BlueNRG handles
 * ============================================================ */

static uint16_t gap_service_handle;
static uint16_t device_name_char_handle;
static uint16_t appearance_char_handle;

static uint16_t temp_service_handle;
static uint16_t temp_char_handle;
static uint16_t accel_char_handle;


/* ============================================================
 * BLE initialization
 * ============================================================ */

uint8_t BLE_App_Init(void)
{
    tBleStatus ret;

    /*
     * Initialize GATT
     */
    ret = aci_gatt_init();

    if (ret != BLE_APP_SUCCESS)
    {
        printf("GATT init failed: 0x%02X\r\n", ret);
        return ret;
    }

    printf("GATT initialized\r\n");


    /*
     * Initialize GAP
     *
     * IMPORTANT:
     * BlueNRG-MS uses aci_gap_init_IDB05A1()
     */
    ret = aci_gap_init_IDB05A1(
            GAP_PERIPHERAL_ROLE_IDB05A1,
            0,
            15,
            &gap_service_handle,
            &device_name_char_handle,
            &appearance_char_handle
    );

    if (ret != BLE_APP_SUCCESS)
    {
        printf("GAP init failed: 0x%02X\r\n", ret);
        return ret;
    }

    printf("GAP initialized\r\n");


    /*
     * Set device name
     */
    ret = aci_gatt_update_char_value(
            gap_service_handle,
            device_name_char_handle,
            0,
            strlen(BLE_DEVICE_NAME),
            (uint8_t *)BLE_DEVICE_NAME
    );

    if (ret != BLE_STATUS_SUCCESS)
    {
        printf("Device name failed: 0x%02X\r\n", ret);
        return ret;
    }

    printf("Device name = %s\r\n", BLE_DEVICE_NAME);


    /*
     * Add Temperature Service
     *
     * IMPORTANT:
     * BlueNRG-MS API uses aci_gatt_add_serv()
     */
    ret = aci_gatt_add_serv(
            UUID_TYPE_128,
            TEMP_SERVICE_UUID,
            PRIMARY_SERVICE,
            12,
            &temp_service_handle
    );

    if (ret != BLE_STATUS_SUCCESS)
    {
        printf("Temperature service failed: 0x%02X\r\n", ret);
        return ret;
    }

    printf("Temperature service added\r\n");


    /*
     * Add Temperature Characteristic
     */
    ret = aci_gatt_add_char(
            temp_service_handle,
            UUID_TYPE_128,
            TEMP_CHAR_UUID,
            2,
            CHAR_PROP_READ | CHAR_PROP_NOTIFY,
            ATTR_PERMISSION_NONE,
            0,
            16,
            1,
            &temp_char_handle
    );

    if (ret != BLE_STATUS_SUCCESS)
    {
        printf("Temperature characteristic failed: 0x%02X\r\n",
               ret);

        return ret;
    }

    printf("Temperature characteristic added\r\n");

    printf("Service handle = 0x%04X\r\n",
           temp_service_handle);

    printf("Temperature characteristic handle = 0x%04X\r\n",
           temp_char_handle);


    return BLE_STATUS_SUCCESS;
}




uint16_t aci_IMU_char(){
    tBleStatus ret;

	ret = aci_gatt_add_char(
	    temp_service_handle,
	    UUID_TYPE_128,
	    ACCEL_CHAR_UUID,
	    6,                              // X + Y + Z = 6 bytes
	    CHAR_PROP_READ | CHAR_PROP_NOTIFY,
	    ATTR_PERMISSION_NONE,
	    0,
	    16,
	    1,
	    &accel_char_handle);

	if (ret != BLE_STATUS_SUCCESS) {
	    printf("Acceleration characteristic failed: 0x%02X\r\n", ret);
	    return ret;
	}

	printf("Acceleration characteristic added\r\n");
	printf("Acceleration handle = 0x%04X\r\n", accel_char_handle);

	return ret;
}


/* ============================================================
 * Start BLE advertising
 * ============================================================ */

uint8_t BLE_App_StartAdvertising(void)
{
    tBleStatus ret;

    ret = aci_gap_set_discoverable(
            ADV_IND,
            0x0080,
            0x0080,
            PUBLIC_ADDR,
            NO_WHITE_LIST_USE,
            sizeof(BLE_ADV_NAME),
            BLE_ADV_NAME,
            0,
            NULL,
            0,
            0
    );

    if (ret != BLE_STATUS_SUCCESS)
    {
        printf("Advertising failed: 0x%02X\r\n", ret);
        return ret;
    }

    printf("BLE advertising started\r\n");

    return BLE_STATUS_SUCCESS;
}

/* ============================================================
 * Send temperature
 * ============================================================ */

uint8_t BLE_App_SendTemperature(float temperature)
{
    tBleStatus ret;

    int16_t temperature_x10;

    uint8_t data[2];


    /*
     * Example:
     *
     * 28.4 °C
     *    ↓
     * 284
     */

    temperature_x10 =
            (int16_t)(temperature * 10.0f);


    /*
     * Little endian
     */

    data[0] =
            (uint8_t)(temperature_x10 & 0xFF);

    data[1] =
            (uint8_t)((temperature_x10 >> 8) & 0xFF);


    ret = aci_gatt_update_char_value(
            temp_service_handle,
            temp_char_handle,
            0,
            2,
            data
    );

    if (ret != BLE_STATUS_SUCCESS)
    {
        printf("Temperature update failed: 0x%02X\r\n",
               ret);

        return ret;
    }

    return BLE_STATUS_SUCCESS;
}


uint8_t BLE_App_SendAcceleration(int16_t x,
                                 int16_t y,
                                 int16_t z)
{
    tBleStatus ret;

    uint8_t data[6];

    data[0] = (uint8_t)(x & 0xFF);
    data[1] = (uint8_t)((x >> 8) & 0xFF);

    data[2] = (uint8_t)(y & 0xFF);
    data[3] = (uint8_t)((y >> 8) & 0xFF);

    data[4] = (uint8_t)(z & 0xFF);
    data[5] = (uint8_t)((z >> 8) & 0xFF);

    ret = aci_gatt_update_char_value(
        temp_service_handle,
        accel_char_handle,
        0,
        6,
        data);

    if (ret != BLE_STATUS_SUCCESS) {
        printf("Acceleration update failed: 0x%02X\r\n", ret);
        return ret;
    }

    return BLE_STATUS_SUCCESS;
}
