<img width="1080" height="1051" alt="Screenshot 2026-09-26 225840" src="https://github.com/user-attachments/assets/14b74966-af8b-41ba-90c8-a8d861499ef7" />

LSM6DSL Accelerometer + Gyroscope — Register-Level Learning Notes
1. Overview

The LSM6DSL is a 6-axis IMU containing:

3-axis accelerometer → measures linear acceleration / specific force
3-axis gyroscope → measures angular velocity

Communication:

# LSM6DSL 6-Axis IMU — Register-Level Learning

## 📌 Overview

The **LSM6DSL** is a 6-axis Inertial Measurement Unit (IMU) containing:

- **3-axis accelerometer** → X, Y, Z acceleration
- **3-axis gyroscope** → X, Y, Z angular velocity

The sensor is interfaced with the STM32 using **I²C**.

```text
                    STM32
                      │
                      │ I²C
                      ▼
                 ┌─────────┐
                 │ LSM6DSL │
                 └────┬────┘
                      │
              ┌───────┴───────┐
              ▼               ▼
       Accelerometer       Gyroscope
          X Y Z              X Y Z
            │                  │
            ▼                  ▼
         Raw data           Raw data
            │                  │
            ▼                  ▼
       Sensitivity         Sensitivity
            │                  │
            ▼                  ▼
        g / m/s²               dps
