<img width="960" height="1600" alt="image" src="https://github.com/user-attachments/assets/2bd4a40a-d3c8-4082-b9a9-c12dfa8e7086" />
# STM32 Nucleo MPU6050 Interface (I2C)

A simple STM32 HAL project demonstrating how to interface the **MPU6050 6-axis Motion Tracking Sensor** with an **STM32 Nucleo** development board using the **I2C protocol**. The project reads real-time **accelerometer** and **gyroscope** data and transmits it to a PC through **UART**.

---

## 📌 Features

* STM32 HAL Driver
* I2C communication with MPU6050
* Reads 3-axis Accelerometer data
* Reads 3-axis Gyroscope data
* UART serial output
* Easy to understand and modify
* Suitable for beginners learning STM32 peripherals

---

## 🛠 Hardware Required

* STM32 Nucleo Development Board
* MPU6050 Sensor Module
* USB Cable
* Jumper Wires
* PC with STM32CubeIDE

---

## 🔌 Hardware Connections

| MPU6050 | STM32 Nucleo |
| ------- | ------------ |
| VCC     | 3.3V         |
| GND     | GND          |
| SDA     | I2C SDA      |
| SCL     | I2C SCL      |

> **Note:** The exact SDA and SCL pins depend on the I2C peripheral configured in STM32CubeMX.

---

## ⚙️ Software Requirements

* STM32CubeIDE
* STM32 HAL Library
* USB Serial Terminal (PuTTY, Tera Term, Hercules, etc.)

---

## 📁 Project Structure

```text
Core/
├── Inc/
│   └── main.h
│
├── Src/
│   ├── main.c
│   └── stm32xxxx_hal_msp.c
│
└── Drivers/
```

---

## 🚀 Project Workflow

1. Initialize STM32 peripherals.
2. Configure I2C.
3. Configure UART.
4. Wake up the MPU6050.
5. Verify sensor using the **WHO_AM_I** register.
6. Read 14 bytes of sensor data.
7. Extract:

   * Accelerometer X, Y, Z
   * Temperature
   * Gyroscope X, Y, Z
8. Send the values through UART.
9. Repeat continuously.

---

## 📊 UART Output

```text
ACC X:    125   Y:    -30   Z: 16384
GYRO X:    12   Y:      4   Z:     1

ACC X:    130   Y:    -28   Z: 16380
GYRO X:    11   Y:      3   Z:     0
```

---

## 📖 MPU6050 Registers Used

| Register     | Address | Description                 |
| ------------ | ------- | --------------------------- |
| WHO_AM_I     | 0x75    | Device Identification       |
| PWR_MGMT_1   | 0x6B    | Wake-up Register            |
| ACCEL_CONFIG | 0x1C    | Accelerometer Configuration |
| GYRO_CONFIG  | 0x1B    | Gyroscope Configuration     |
| ACCEL_XOUT_H | 0x3B    | Beginning of Sensor Data    |

---

## 📚 Concepts Covered

* STM32 HAL Driver
* I2C Communication
* UART Communication
* Register Read/Write
* Sensor Initialization
* Multi-byte Data Reading
* Bitwise Operations
* Two's Complement Data
* Embedded C Programming

---

## 🎯 Learning Outcomes

After completing this project, you will understand:

* How I2C communication works in STM32.
* How to communicate with digital sensors.
* Reading multi-byte sensor registers.
* Converting raw bytes into signed 16-bit values.
* Sending debugging information over UART.
* Building the foundation for IMU-based embedded projects.

---

## 📌 Future Improvements

* Convert raw accelerometer data to **g**.
* Convert raw gyroscope data to **degrees/second**.
* Read temperature from the MPU6050.
* Add Kalman or Complementary Filter.
* Calculate Roll and Pitch angles.
* Display data on an LCD or OLED.
* Stream sensor data to a PC for visualization.

---

## 📄 License

This project is provided for educational purposes. Feel free to modify, use, and share it for learning and personal projects.
