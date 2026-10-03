# STM32L4S5 IoT Temperature & Humidity MQTT

## Overview     P9 = 0  //for not license for broker//

This project reads **temperature and humidity** from the **HTS221** sensor using an STM32L4S5 microcontroller and publishes the sensor data to an **MQTT broker** over Wi-Fi.

A remote MQTT client can subscribe to the topic and view the live sensor data.

### Final data path

```text
HTS221
   │
   │ I2C
   ▼
STM32L4S5
   │
   │ SPI3
   ▼
ISM43362 Wi-Fi Module
   │
   │ Wi-Fi
   ▼
Wi-Fi Router / Internet
   │
   │ TLS
   ▼
HiveMQ Cloud MQTT Broker
   │
   │ MQTT topic: stm32/sensor
   ▼
MQTT Client / HiveMQ WebClient
```

---

## Hardware

| Component | Purpose |
|---|---|
| B-L4S5I-IOT01A | Main development board |
| STM32L4S5VIT6 | MCU |
| HTS221 | Temperature & humidity sensor |
| ISM43362-M3G-L44 | Wi-Fi module |
| Wi-Fi access point | Internet connectivity |
| PC / phone / browser | MQTT client |

The B-L4S5I-IOT01A integrates the ISM43362 Wi-Fi module and HTS221 environmental sensor.

---

## Software / Protocol Stack

```text
Application
    │
    ├── HTS221 Temperature/Humidity
    │
    └── MQTT
          │
          └── JSON payload
                │
                ▼
          TLS over TCP
                │
                ▼
          Wi-Fi / 802.11
                │
                ▼
          ISM43362
                │
                ▼
          SPI3
                │
                ▼
          STM32L4S5
```

### Main protocols

- I2C — STM32 ↔ HTS221
- SPI — STM32 ↔ ISM43362
- Wi-Fi / IEEE 802.11 — wireless network
- TCP — transport layer
- TLS — encrypted MQTT connection
- MQTT — sensor messaging protocol
- JSON — sensor payload format

---

# 1. Wi-Fi Connection

The STM32 uses the ST **ES-WIFI** middleware to communicate with the ISM43362 module.

The Wi-Fi sequence is:

```text
Initialize ES-WIFI
       ↓
Scan access points
       ↓
Connect to Wi-Fi
       ↓
DHCP
       ↓
Obtain IP address
       ↓
DNS lookup
```

Example:

```text
Connecting to: Galaxy
Wi-Fi CONNECT command SUCCESS
Wi-Fi CONNECTED!

NETWORK SETTINGS
IP Address : 10.80.70.xxx
Subnet Mask: 255.255.255.0
Gateway    : 10.80.70.xxx
DNS1       : 10.80.70.xxx
```

---

# 2. HiveMQ Cloud

The project uses **HiveMQ Cloud** as the MQTT broker.

The STM32 connects using:

```text
Protocol : MQTT
Transport: TCP + TLS
Port     : 8883
```

The MQTT broker hostname is resolved using DNS.

```text
HiveMQ hostname
      ↓
DNS lookup
      ↓
Broker IPv4 address
      ↓
TCP connection
      ↓
TLS handshake
```

---

# 3. TLS Connection

The ISM43362 establishes the TLS connection to the HiveMQ MQTT endpoint.

During development, certificate verification was disabled using:

```c
P9=0
```

This allowed the TLS connection to be tested successfully.

> **Important:** `P9=0` should be treated as a development/diagnostic configuration. For a production deployment, configure Root CA verification (`P9=1`) and install the appropriate CA certificate.

The successful connection should look like:

```text
HiveMQ IP: xx.xx.xx.xx
Starting TLS connection to HiveMQ...
TLS connection ESTABLISHED
```

---

# 4. MQTT Authentication

HiveMQ requires valid MQTT access credentials.

Do not use the HiveMQ **cluster name** as the MQTT username unless it was explicitly created as an MQTT access credential.

Use a dedicated MQTT credential:

```c
#define MQTT_USERNAME "your_mqtt_username"
#define MQTT_PASSWORD "your_mqtt_password"
```

Never commit the real password to a public GitHub repository.

---

# 5. MQTT CONNECT

After TLS is established, the STM32 sends an MQTT 3.1.1 CONNECT packet.

The sequence is:

```text
TLS connection
      ↓
MQTT CONNECT
      ↓
MQTT CONNACK
```

A successful CONNACK is:

```text
20 02 00 00
```

Meaning:

```text
20 → CONNACK
02 → Remaining Length
00 → Session Present = 0
00 → Connection Accepted
```

For example:

```text
MQTT CONNECT sent

========== SERVER RESPONSE ==========
CONNACK RX: 20 02 00 00
```

If the last byte is:

```text
05
```

then the broker has refused the connection because the client is not authorized.

```text
20 02 00 05
         ↑
         Not authorized
```

---

# 6. Reading HTS221

The STM32 reads the raw sensor values:

```c
HTS221_ReadRaw(&raw_humidity,
               &raw_temperature);
```

The raw values are converted into physical units:

```c
humidity =
    HTS221_GetHumidity(raw_humidity);

temperature =
    HTS221_GetTemperature(raw_temperature);
```

The resulting values are approximately:

```text
Temperature → °C
Humidity    → %RH
```

---

# 7. JSON Sensor Payload

The sensor values are converted into a JSON message.

```c
char topic[] = "stm32/sensor";
char payload[100];

snprintf(payload,
         sizeof(payload),
         "{\"temperature\":%.2f,\"humidity\":%.2f}",
         temperature,
         humidity);
```

Example:

```json
{
  "temperature": 28.90,
  "humidity": 62.00
}
```

The actual one-line MQTT payload is:

```text
{"temperature":28.90,"humidity":62.00}
```

---

# 8. MQTT Topic

The project publishes to:

```text
stm32/sensor
```

The topic is hierarchical:

```text
stm32
  └── sensor
```

Any MQTT client subscribed to:

```text
stm32/sensor
```

can receive the sensor data.

---

# 9. MQTT PUBLISH

The project uses MQTT QoS 0 for the initial implementation.

```c
packet_len =
    MQTT_BuildPublishQos0(
        mqtt_packet,
        topic,
        (const uint8_t *)payload,
        strlen(payload));
```

Then the packet is sent through ES-WIFI:

```c
status =
    ES_WIFI_SendData(
        &WiFiObj,
        mqtt_conn.Number,
        mqtt_packet,
        packet_len,
        &sent_len,
        5000);
```

A successful transmission should satisfy:

```c
status == ES_WIFI_STATUS_OK
```

and:

```c
sent_len == packet_len
```

Example:

```text
PUBLISH status = 0
Packet length  = xx
Bytes sent     = xx
MQTT PUBLISH SUCCESS
```

---

# 10. Complete Sensor-to-MQTT Code

The core application logic is:

```c
/* Read HTS221 */

HTS221_ReadRaw(&raw_humidity,
               &raw_temperature);

humidity =
    HTS221_GetHumidity(raw_humidity);

temperature =
    HTS221_GetTemperature(raw_temperature);


/* Create JSON */

const char topic[] = "stm32/sensor";
char payload[100];

snprintf(payload,
         sizeof(payload),
         "{\"temperature\":%.2f,\"humidity\":%.2f}",
         temperature,
         humidity);

printf("MQTT Payload: %s\r\n", payload);


/* Build MQTT PUBLISH */

packet_len =
    MQTT_BuildPublishQos0(
        mqtt_packet,
        topic,
        (const uint8_t *)payload,
        strlen(payload));


/* Send MQTT PUBLISH */

status =
    ES_WIFI_SendData(
        &WiFiObj,
        mqtt_conn.Number,
        mqtt_packet,
        packet_len,
        &sent_len,
        5000);

if ((status == ES_WIFI_STATUS_OK) &&
    (sent_len == packet_len))
{
    printf("MQTT PUBLISH SUCCESS\r\n");
}
else
{
    printf("MQTT PUBLISH FAILED\r\n");
}
```

---

# 11. MQTT Client

A client must subscribe to:

```text
stm32/sensor
```

For example, using the HiveMQ WebClient:

```text
Connect to HiveMQ Cloud
        ↓
Subscribe
        ↓
stm32/sensor
        ↓
Wait for STM32
        ↓
Receive sensor JSON
```

Example received message:

```json
{"temperature":28.90,"humidity":62.00}
```

The same topic can be consumed by other MQTT applications, dashboards, or IoT services.

---

# 12. Complete End-to-End Flow

```text
                    ┌───────────────┐
                    │    HTS221     │
                    │ Temperature   │
                    │   Humidity    │
                    └───────┬───────┘
                            │
                           I2C
                            │
                            ▼
                    ┌───────────────┐
                    │   STM32L4S5   │
                    │               │
                    │ Read Sensor   │
                    │      ↓        │
                    │ Create JSON   │
                    │      ↓        │
                    │ MQTT PUBLISH  │
                    └───────┬───────┘
                            │
                           SPI3
                            │
                            ▼
                    ┌───────────────┐
                    │   ISM43362    │
                    │    Wi-Fi      │
                    └───────┬───────┘
                            │
                         802.11
                            │
                            ▼
                    ┌───────────────┐
                    │ Wi-Fi Router  │
                    └───────┬───────┘
                            │
                         Internet
                            │
                            ▼
                  ┌──────────────────┐
                  │   HiveMQ Cloud   │
                  │                  │
                  │ MQTT + TLS :8883 │
                  └────────┬─────────┘
                           │
                    stm32/sensor
                           │
                           ▼
                  ┌──────────────────┐
                  │   MQTT Client    │
                  │                  │
                  │ Temperature      │
                  │ Humidity         │
                  └──────────────────┘
```

---

# 13. Troubleshooting

## Wi-Fi does not connect

Check:

- SSID
- Wi-Fi password
- Security type
- ISM43362 firmware
- SPI3 communication
- Data Ready interrupt

---

## TLS connection fails

Verify:

```text
TCP port = 8883
Connection type = ES_WIFI_TCP_SSL_CONNECTION
```

During initial development:

```text
P9 = 0
```

If TLS works with `P9=0`, move to CA verification later.

---

## MQTT CONNECT returns

```text
20 02 00 05
```

This means:

```text
Not authorized
```

Check:

- MQTT username
- MQTT password
- HiveMQ access credential
- Access role/permissions

Do not confuse:

```text
HiveMQ cluster name
```

with:

```text
MQTT username
```

---

## PUBLISH succeeds but client sees nothing

Check that the client is subscribed to exactly:

```text
stm32/sensor
```

MQTT topics are case-sensitive.

For example:

```text
stm32/sensor
```

is different from:

```text
STM32/sensor
```

Also verify:

```text
PUBLISH status == ES_WIFI_STATUS_OK
sent_len == packet_len
```

---

# 14. Recommended Periodic Publishing

For a live IoT application, sensor data can be published periodically.

Example:

```c
while (1)
{
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

    ES_WIFI_SendData(
        &WiFiObj,
        mqtt_conn.Number,
        mqtt_packet,
        packet_len,
        &sent_len,
        5000);

    HAL_Delay(5000);
}
```

This publishes new sensor data every **5 seconds**.

For a FreeRTOS-based version, replace `HAL_Delay()` with a dedicated MQTT publishing task and use:

```c
vTaskDelay(pdMS_TO_TICKS(5000));
```

---

# 15. Future Improvements

Possible next steps:

- [ ] Publish every 5 seconds using FreeRTOS
- [ ] Add MQTT QoS 1
- [ ] Add MQTT reconnect handling
- [ ] Add Wi-Fi reconnect handling
- [ ] Add TLS Root CA verification
- [ ] Store credentials securely
- [ ] Add MQTT Last Will and Testament
- [ ] Add device status topic
- [ ] Create a web dashboard
- [ ] Send JSON with device ID and timestamp
- [ ] Store sensor data in a cloud database
- [ ] Add OTA firmware update
- [ ] Add FreeRTOS tasks for sensor, MQTT, and Wi-Fi management

---

# 16. Final Project Summary

This project demonstrates a complete embedded IoT communication pipeline using the STM32L4S5.

The **HTS221** provides temperature and humidity measurements. The STM32 reads the sensor over I2C, converts the raw values into physical units, formats them as JSON, and publishes them using MQTT. The **ISM43362** provides Wi-Fi connectivity through SPI3. The MQTT connection to **HiveMQ Cloud** uses TCP port 8883 with TLS encryption. A remote MQTT client subscribes to `stm32/sensor` and receives the live sensor data.

Example:

```text
HTS221
   ↓
STM32L4S5
   ↓
JSON
   ↓
MQTT PUBLISH
   ↓
TLS
   ↓
Wi-Fi
   ↓
HiveMQ Cloud
   ↓
MQTT Client
```

Example message:

```json
{"temperature":28.90,"humidity":62.00}
```

This establishes the foundation for a real-time STM32-based IoT sensing system.
