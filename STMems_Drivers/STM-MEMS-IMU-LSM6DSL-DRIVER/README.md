<img width="1080" height="1051" alt="Screenshot 2026-09-26 225840" src="https://github.com/user-attachments/assets/14b74966-af8b-41ba-90c8-a8d861499ef7" />

LSM6DSL Accelerometer + Gyroscope — Register-Level Learning Notes
1. Overview

The LSM6DSL is a 6-axis IMU containing:

3-axis accelerometer → measures linear acceleration / specific force
3-axis gyroscope → measures angular velocity

Communication:

STM32
  │
  │ I²C
  ▼
LSM6DSL
  ├── Accelerometer → X, Y, Z
  └── Gyroscope     → X, Y, Z

LSM6DSL
│
├── WHO_AM_I
│     └── 0x0F → expected 0x6A
│
├── Accelerometer
│     ├── CTRL1_XL = 0x10
│     ├── 104 Hz
│     ├── ±2 g
│     ├── 0x28–0x2D
│     └── 0.061 mg/LSB
│
├── Gyroscope
│     ├── CTRL2_G = 0x11
│     ├── 104 Hz
│     ├── ±245 dps
│     ├── 0x22–0x27
│     └── 8.75 mdps/LSB
│
└── Common control
      ├── CTRL3_C = 0x12
      ├── BDU = 1
      └── IF_INC = 1
