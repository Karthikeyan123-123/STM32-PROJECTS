<img width="1600" height="1369" alt="image" src="https://github.com/user-attachments/assets/12ead4da-6ced-41e2-8ce9-fed539026986" />


# 📟 STM32 4-Bit LCD Driver (JHD162A / HD44780)

A lightweight LCD driver developed from scratch to interface a **JHD162A 16x2 Character LCD** (HD44780 compatible) with an **STM32** microcontroller using **4-bit communication mode**.

This project does **not** use any external LCD libraries. All commands, initialization, and data transfers are implemented manually using STM32 HAL GPIO functions.

---

## ✨ Features

- ✅ 4-bit LCD communication
- ✅ Complete LCD initialization sequence
- ✅ Command and data transmission
- ✅ Cursor positioning
- ✅ Print strings
- ✅ Clear display
- ✅ Return home
- ✅ Compatible with all HD44780-based LCDs
- ✅ Written using STM32 HAL

---

## 📷 Hardware

- STM32 (Tested on STM32F401CCU6 Blackpill)
- JHD162A 16×2 LCD
- 10k Potentiometer (Contrast)
- Breadboard
- Jumper Wires

---

## 🔌 LCD Connections

| LCD Pin | Function | STM32 Pin |
|----------|----------|------------|
| RS | Register Select | PB0 |
| RW | Read/Write | GND |
| EN | Enable | PB1 |
| D4 | Data Bit 4 | PB12 |
| D5 | Data Bit 5 | PB13 |
| D6 | Data Bit 6 | PB14 |
| D7 | Data Bit 7 | PB15 |
| VSS | GND | GND |
| VDD | +5V | +5V |
| VO | Contrast | 10k Potentiometer |

---

## 📂 Driver Functions

### LCD Initialization

```c
Lcd_Init();
```

Initializes the LCD in 4-bit mode.

---

### Send Command

```c
Lcd_Command(cmd);
```

Sends an instruction to the LCD.

Example:

```c
Lcd_Command(0x01);    // Clear Display
Lcd_Command(0x02);    // Return Home
```

---

### Send Data

```c
Lcd_Data(data);
```

Displays a single character.

Example:

```c
Lcd_Data('A');
```

---

### Set Cursor

```c
Lcd_Setcursor(row, column);
```

Example:

```c
Lcd_Setcursor(0,0);
Lcd_Setcursor(1,5);
```

---

### Print String

```c
Lcd_Print("Hello");
```

Displays a null-terminated string.

---

### Clear LCD

```c
Lcd_Clear();
```

---

### Return Home

```c
Lcd_Home();
```

---

## 🚀 Example

```c
Lcd_Init();

Lcd_Setcursor(0,0);
Lcd_Print("STM32 LCD");

Lcd_Setcursor(1,0);
Lcd_Print("4-bit Driver");
```

Output

```
STM32 LCD
4-bit Driver
```

---

## ⚙️ LCD Initialization Sequence

The driver follows the HD44780 initialization procedure.

```
Power ON
     │
     ▼
0x03
     │
0x03
     │
0x03
     │
0x02
     │
4-bit Mode Enabled
     │
0x28
     │
0x08
     │
0x01
     │
0x06
     │
0x0C
```

---

## 📖 Supported Commands

| Command | Description |
|----------|-------------|
| 0x01 | Clear Display |
| 0x02 | Return Home |
| 0x04–0x07 | Entry Mode Set |
| 0x08–0x0F | Display Control |
| 0x10–0x1F | Cursor / Display Shift |
| 0x20–0x3F | Function Set |
| 0x40–0x7F | Set CGRAM Address |
| 0x80–0xFF | Set DDRAM Address |

---

## 📚 Concepts Covered

This project helped understand:

- HD44780 LCD architecture
- 4-bit communication protocol
- Enable pulse timing
- Command vs Data transfer
- DDRAM
- CGRAM
- LCD Initialization sequence
- Cursor addressing
- LCD Commands
- Character display
- STM32 HAL GPIO programming

---

## 🛠️ Future Improvements

- [ ] Custom character support (CGRAM)
- [ ] Display shift functions
- [ ] Auto scrolling
- [ ] UART to LCD terminal
- [ ] Menu system
- [ ] LCD animations
- [ ] Non-blocking driver
- [ ] FreeRTOS compatible version

---

## 📄 License

This project is open-source and intended for learning and educational purposes.

---

## 👨‍💻 Author

**Karthikeyan M**

Embedded Systems Enthusiast

STM32 • Embedded C • FreeRTOS • Linux
