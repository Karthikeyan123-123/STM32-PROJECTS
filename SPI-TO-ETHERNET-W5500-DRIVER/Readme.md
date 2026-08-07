<img width="1600" height="942" alt="WhatsApp Image 2026-08-07 at 12 54 36 PM" src="https://github.com/user-attachments/assets/800680bc-39cc-43d3-815e-cc75fefd15b9" />
# STM32 W5500 TCP Server (SPI Ethernet)

A simple TCP Server implementation using the **STM32F407 Discovery Board** and the **WIZnet W5500 Ethernet Module**. The W5500 is connected to the STM32 through the SPI interface. A PC connects to the STM32 using an Ethernet cable and exchanges TCP data.

## Features

- W5500 SPI communication
- Static IP configuration
- TCP Server
- Accepts connection from PC
- Receives data from PC
- Sends received data back (Echo Server)
- UART debugging

---

## Hardware Used

- STM32F407VG Discovery Board
- WIZnet W5500 Ethernet Module
- Ethernet Cable
- PC (Hercules TCP Client)

---

## Pin Connections

| W5500 | STM32F407 |
|--------|-----------|
| VCC | 3.3V |
| GND | GND |
| SCK | PA5 |
| MISO | PA6 |
| MOSI | PA7 |
| CS | PA4 |
| RESET | PA0 |

---

## Network Configuration

| Parameter | Value |
|----------|----------|
| IP Address | 192.168.1.100 |
| Subnet Mask | 255.255.255.0 |
| Gateway | 192.168.1.1 |
| TCP Port | 5000 |

---

## Software

- STM32CubeIDE
- STM32 HAL Driver
- WIZnet ioLibrary
- Hercules TCP Client

---

## Project Flow

```
STM32 Boot
      │
      ▼
Initialize SPI
      │
      ▼
Initialize W5500
      │
      ▼
Configure Static IP
      │
      ▼
Create TCP Socket
      │
      ▼
Listen on Port 5000
      │
      ▼
PC Connects
      │
      ▼
Receive Data
      │
      ▼
Send Data Back
```

---

## Testing

1. Configure the PC Ethernet adapter with:

```
IP Address : 192.168.1.10
Subnet Mask: 255.255.255.0
Gateway    : 192.168.1.1
```

2. Connect the PC to the W5500 using an Ethernet cable.

3. Open Hercules TCP Client.

4. Connect to:

```
IP   : 192.168.1.100
Port : 5000
```

5. Send any text.

Example:

```
Hello STM32
```

STM32 receives the message and sends it back to the PC.

---

## Project Structure

```
Core/
Drivers/
W5500/
    ├── Ethernet/
    ├── Port/
    └── Application/
```

---

## Learning Objectives

This project demonstrates:

- SPI communication
- W5500 initialization
- Static IP configuration
- TCP socket creation
- TCP server implementation
- Data transmission and reception over Ethernet
- UART debugging
- Wireshark packet analysis
