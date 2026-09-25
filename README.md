<img width="884" height="1599" alt="image" src="https://github.com/user-attachments/assets/cd1514dd-3bee-4be4-ae26-ea6aaeb4cf28" />

# 🎧 Real-Time Signal Analyzer using STM32F407

A real-time embedded DSP project that captures audio from the onboard digital MEMS microphone of the **STM32F407 Discovery Board**, converts the PDM microphone data into PCM samples, performs FFT-based frequency analysis using **CMSIS-DSP**, detects the dominant frequency, and prepares the signal for real-time visualization on a PC.

---

## 📌 Project Overview

The goal of this project is to understand and implement a complete real-time digital signal-processing pipeline on an STM32 microcontroller.

Instead of simply using a ready-made audio library, the project focuses on understanding what happens at every stage:

```text
                         REAL WORLD
                             │
                             ▼
                    ┌─────────────────┐
                    │ Digital MEMS    │
                    │ Microphone      │
                    └────────┬────────┘
                             │
                            PDM
                             │
                             ▼
                    ┌─────────────────┐
                    │ I2S / SPI2      │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ DMA             │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ PDM Buffer      │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ PDM → PCM       │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ PCM Samples     │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ DC Removal      │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Hann Window     │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ CMSIS-DSP FFT   │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ FFT Complex Data│
                    │ Re + jIm        │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Magnitude        │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │ Peak Detection   │
                    └────────┬────────┘
                             │
                             ▼
                      Peak Frequency
                             │
                             ▼
                     UART / USB
                             │
                             ▼
                    ┌─────────────────┐
                    │ Python GUI       │
                    │ Waveform         │
                    │ FFT Spectrum     │
                    │ Spectrogram      │
                    └─────────────────┘
