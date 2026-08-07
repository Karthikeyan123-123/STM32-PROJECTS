<img width="1600" height="1133" alt="image" src="https://github.com/user-attachments/assets/ad9f9bbc-c17b-4b34-b52d-e189600254ba" />



# STM32 SD Card SPI Driver with FatFs

This project demonstrates how to interface an SD Card with an STM32 microcontroller using the SPI peripheral and the FatFs filesystem.

The project implements a complete SD card driver from the SPI protocol level up to file creation, reading, and writing using FatFs.

---

## Features

- SD Card communication using SPI
- SD Card initialization
- CMD0, CMD8, CMD55, ACMD41, CMD58 implementation
- Single block read (CMD17)
- Single block write (CMD24)
- FatFs integration
- Create new files
- Write text files
- Read existing text files
- UART debug messages

---

## Hardware Used

- STM32 Nucleo-F411RE
- MH-SD Card Module (SPI)
- MicroSD Card
- ST-LINK Programmer
- STM32CubeIDE

---

## Software Used

- STM32CubeIDE
- STM32 HAL Library
- FatFs
- Git

---

## Pin Connections

| STM32 | SD Module |
|--------|-----------|
| PA5 | SCK |
| PA6 | MISO |
| PA7 | MOSI |
| PA4 | CS |
| 5V | VCC |
| GND | GND |

*(Update the pins if your project uses different ones.)*

---

## Project Structure

```
Core/
 ├── Inc/
 │    ├── fatfs_sd.h
 │    └── main.h
 │
 ├── Src/
 │    ├── fatfs_sd.c
 │    └── main.c
 │
FATFS/
 ├── App/
 └── Target/
      └── user_diskio.c
```

---

## Working Flow

```
Application
      │
      ▼
FatFs API
      │
      ▼
user_diskio.c
      │
      ▼
SD SPI Driver
      │
      ▼
SPI Peripheral
      │
      ▼
MicroSD Card
```

---

## Implemented APIs

- f_mount()
- f_open()
- f_write()
- f_read()
- f_close()

---

## Example

Writing a file:

```c
f_mount(&fs, "", 1);

f_open(&file,
       "hello.txt",
       FA_CREATE_ALWAYS | FA_WRITE);

f_write(&file,
        text,
        strlen(text),
        &bw);

f_close(&file);
```

Reading the same file:

```c
f_open(&file,
       "hello.txt",
       FA_READ);

f_read(&file,
       buffer,
       sizeof(buffer),
       &br);

f_close(&file);
```

---

## Current Status

- ✅ SD Card Initialization
- ✅ FatFs Integration
- ✅ Create Files
- ✅ Read Files
- ✅ Write Files
- ✅ UART Debug Output

---

## Future Improvements

- Multi-block Read/Write
- DMA-based SPI transfers
- SD Card Hot-Plug Detection
- FreeRTOS Integration
- File Logging Application
- Performance Optimization

---

## Author

**Karthikeyan**

Embedded Systems Enthusiast

STM32 • Embedded C • SPI • FatFs • FreeRTOS
