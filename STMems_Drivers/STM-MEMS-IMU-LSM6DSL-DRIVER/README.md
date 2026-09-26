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

