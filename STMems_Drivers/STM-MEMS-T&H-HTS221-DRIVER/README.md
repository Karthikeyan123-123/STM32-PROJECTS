<img width="1907" height="1037" alt="Screenshot 2026-09-26 231444" src="https://github.com/user-attachments/assets/120e3a12-36ea-4375-b33a-3f18c16780eb" />


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
