#include "main.h"

#include "lcd.h"


void Enable_Pulse(void)
{
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_SET);
    HAL_Delay(1);
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_RESET);
    HAL_Delay(1);
}
void LCD_SendInitNibble(uint8_t nibble)
{
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, (nibble & 0x01) ? GPIO_PIN_SET : GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_11, (nibble & 0x02) ? GPIO_PIN_SET : GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_10, (nibble & 0x04) ? GPIO_PIN_SET : GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_9, (nibble & 0x08) ? GPIO_PIN_SET : GPIO_PIN_RESET);

    Enable_Pulse();
}
void Send_Nibble(uint8_t nibble)
{
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, (nibble & 0x01) ? GPIO_PIN_SET : GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_11, (nibble & 0x02) ? GPIO_PIN_SET : GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, (nibble & 0x04) ? GPIO_PIN_SET : GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_9, (nibble & 0x08) ? GPIO_PIN_SET : GPIO_PIN_RESET);

    Enable_Pulse();
}
void Lcd_Sendbyte(uint8_t data)
{
    Send_Nibble(data >> 4);
    Send_Nibble(data & 0x0F);
}
void Lcd_Command(uint8_t cmd)
{
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_RESET);

    Lcd_Sendbyte(cmd);

    HAL_Delay(2);
}
void Lcd_Data(uint8_t data)
{
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_SET);

    Lcd_Sendbyte(data);

    HAL_Delay(1);
}
void Lcd_Init(void)
{
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_RESET);

    HAL_Delay(20);

    LCD_SendInitNibble(0x03);
    HAL_Delay(5);

    LCD_SendInitNibble(0x03);
    HAL_Delay(1);

    LCD_SendInitNibble(0x03);
    HAL_Delay(1);

    LCD_SendInitNibble(0x02);
    HAL_Delay(1);

    Lcd_Command(0x28);      // 4-bit, 2-line, 5x8
    Lcd_Command(0x08);      // Display OFF
    Lcd_Command(0x01);      // Clear Display
    HAL_Delay(2);
    Lcd_Command(0x06);      // Entry mode
    Lcd_Command(0x0C);      // Display ON, Cursor OFF
}
void Lcd_Clear(void)
{
    Lcd_Command(0x01);
}
void Lcd_Home(void)
{
    Lcd_Command(0x02);
}
void Lcd_Setcursor(uint8_t row, uint8_t col)
{
    uint8_t addr;

    if(row == 0)
        addr = 0x80 + col;
    else
        addr = 0xC0 + col;

    Lcd_Command(addr);
}
void Lcd_Print(char *str)
{
    while(*str)
    {
        Lcd_Data(*str++);
    }
}
