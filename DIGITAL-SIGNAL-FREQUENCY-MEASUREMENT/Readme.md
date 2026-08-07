<img width="900" height="1600" alt="image" src="https://github.com/user-attachments/assets/f5524323-2285-4798-9892-106f152bffba" />
# STM32 Digital Frequency Meter Using Timer Input Capture

A simple STM32 HAL project that measures the **frequency of a digital signal** using the **Timer Input Capture** peripheral. The measured frequency is calculated from the time between two consecutive rising edges and displayed through **UART**.

This project demonstrates how to use STM32 timers to accurately measure frequencies ranging from a few Hertz to several Megahertz (depending on the MCU clock and timer configuration).

---

## 📌 Features

* STM32 HAL Driver
* Timer Input Capture Mode
* Rising Edge Detection
* Frequency Measurement
* Timer Overflow Handling
* UART Output
* High-Speed Signal Measurement
* Easy to understand and modify

---

## 🛠 Hardware Required

* STM32 Nucleo Development Board
* Signal Generator / Function Generator
* USB Cable
* Jumper Wires
* PC with STM32CubeIDE
* USB Serial Terminal (PuTTY, Tera Term, Hercules, etc.)

---

## ⚙️ Software Requirements

* STM32CubeIDE
* STM32 HAL Library
* Serial Terminal Software

---

## 🔌 Hardware Connections

| Signal Generator | STM32 Nucleo                                 |
| ---------------- | -------------------------------------------- |
| Signal Output    | TIM Input Capture Pin (e.g., PA8 / TIM1_CH1) |
| GND              | GND                                          |

> **Note:** The timer input pin depends on the timer channel selected in STM32CubeMX.

---

## 📁 Project Structure

```text
Core/
├── Inc/
│   └── main.h
│
├── Src/
│   ├── main.c
│   ├── stm32xxxx_it.c
│   └── stm32xxxx_hal_msp.c
│
└── Drivers/
```

---

## 🚀 Project Workflow

1. Configure the system clock.
2. Initialize GPIO.
3. Configure UART for serial communication.
4. Configure Timer in Input Capture mode.
5. Start Input Capture with interrupts.
6. Detect the first rising edge.
7. Store the timer count.
8. Detect the second rising edge.
9. Calculate the timer count difference.
10. Handle timer overflow if required.
11. Calculate the input signal frequency.
12. Send the measured frequency through UART.
13. Repeat continuously.

---

## 🧮 Frequency Calculation

The timer runs at a known clock frequency.

```
Frequency = Timer Clock / Captured Count Difference
```

### Example

Timer Clock

```
84 MHz
```

Captured Difference

```
84
```

Measured Frequency

```
84,000,000 / 84

= 1,000,000 Hz

= 1 MHz
```

---

## 📊 UART Output

```text
Frequency : 100 Hz

Frequency : 1,000 Hz

Frequency : 10,250 Hz

Frequency : 100,000 Hz

Frequency : 1,000,000 Hz

Frequency : 2,500,000 Hz
```

---

## 📚 Concepts Covered

* STM32 HAL Driver
* Timer Peripheral
* Input Capture Mode
* Interrupts
* Timer Registers
* Counter Overflow Handling
* Frequency Measurement
* UART Communication
* Embedded C Programming

---

## 🎯 Learning Outcomes

After completing this project, you will understand:

* How STM32 timers operate.
* How Input Capture detects signal edges.
* How timer counts represent signal periods.
* How to calculate frequency from timer values.
* How interrupt-based measurements improve accuracy.
* How to handle timer overflow during long periods.
* How to send debugging information over UART.

---

## 📈 Applications

* Frequency Counter
* RPM Measurement
* PWM Frequency Measurement
* Pulse Monitoring
* Motor Speed Measurement
* Sensor Pulse Counting
* Encoder Signal Analysis
* Embedded Instrumentation

---

## 🔧 Future Improvements

* Measure Duty Cycle
* Measure Pulse Width
* Auto Range Selection
* OLED/LCD Display Support
* DMA-Based Data Logging
* Input Signal Filtering
* Multi-Channel Frequency Measurement
* USB Serial Output
* Data Logging to SD Card

---

## 📄 License

This project is intended for educational purposes. You are free to modify, improve, and use it in your own embedded systems projects.
