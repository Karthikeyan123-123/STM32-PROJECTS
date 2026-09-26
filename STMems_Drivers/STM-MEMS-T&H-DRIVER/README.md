<img width="642" height="720" alt="Screenshot 2026-09-26 230204" src="https://github.com/user-attachments/assets/05e9c900-535a-4660-a2d4-a2cfc74c3020" />

# HTS221 Temperature & Humidity Sensor — Register-Level Learning

## 📌 Overview

The **HTS221** is a digital temperature and relative-humidity sensor interfaced with the STM32 through **I²C**.

In this implementation, the sensor was studied from the datasheet at register level before using the ST driver.

```text
                    STM32
                      │
                      │ I²C
                      ▼
                 ┌─────────┐
                 │ HTS221  │
                 └────┬────┘
                      │
              ┌───────┴───────┐
              ▼               ▼
         Temperature       Humidity
              │               │
              ▼               ▼
          Raw Output       Raw Output
              │               │
              ▼               ▼
       Factory Calibration
              │               │
              ▼               ▼
             °C              %RH
