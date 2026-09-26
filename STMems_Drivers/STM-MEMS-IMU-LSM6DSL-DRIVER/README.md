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

I²C address used in this project:

#define LSM6DSL_ADDR    (0x6A << 1)

WHO_AM_I:

Register = 0x0F
Expected = 0x6A
2. Important LSM6DSL Registers
Register	Address	Purpose
WHO_AM_I	0x0F	Device identification
CTRL1_XL	0x10	Accelerometer configuration
CTRL2_G	0x11	Gyroscope configuration
CTRL3_C	0x12	Common control
OUTX_L_G	0x22	Gyro X low byte
OUTX_H_G	0x23	Gyro X high byte
OUTY_L_G	0x24	Gyro Y low byte
OUTY_H_G	0x25	Gyro Y high byte
OUTZ_L_G	0x26	Gyro Z low byte
OUTZ_H_G	0x27	Gyro Z high byte
OUTX_L_XL	0x28	Accel X low byte
OUTX_H_XL	0x29	Accel X high byte
OUTY_L_XL	0x2A	Accel Y low byte
OUTY_H_XL	0x2B	Accel Y high byte
OUTZ_L_XL	0x2C	Accel Z low byte
OUTZ_H_XL	0x2D	Accel Z high byte
3. Accelerometer Configuration

We used:

ODR = 104 Hz
FS  = ±2 g

Therefore:

CTRL1_XL = 0x40

Binary:

0100 0000
││││
└┴┴┴── ODR_XL = 0100 → 104 Hz

FS_XL = 00 → ±2 g

Sensitivity:

0.061 mg/LSB

Conversion:

ax_mg = raw_x * 0.061f;
ay_mg = raw_y * 0.061f;
az_mg = raw_z * 0.061f;

Then:

ax_g = ax_mg / 1000.0f;
4. Gyroscope Configuration

Gyroscope control register:

CTRL2_G = 0x11

We selected:

ODR = 104 Hz
FS  = ±245 dps

Therefore:

CTRL2_G = 0x40

Binary:

0100 0000
││││
└┴┴┴── ODR_G = 0100 → 104 Hz

FS_G = 00 → ±245 dps

Sensitivity:

8.75 mdps/LSB

Since:

1000 mdps = 1 dps

we get:

8.75 mdps/LSB
       ↓
0.00875 dps/LSB

Therefore:

gx_dps = raw_gx * 0.00875f;
gy_dps = raw_gy * 0.00875f;
gz_dps = raw_gz * 0.00875f;
5. CTRL3_C — Very Important

Register:

CTRL3_C = 0x12

We configured:

BDU    = 1
IF_INC = 1

Therefore:

CTRL3_C = 0x44
0x40 → BDU = 1
0x04 → IF_INC = 1
BDU — Block Data Update

BDU prevents an output register pair from being updated halfway through our read.

For example:

X_L
X_H

should belong to the same measurement.

Without proper data-update handling, there is a possibility of reading:

old X_L + new X_H

which creates an incorrect value.

IF_INC — Register Address Increment

With IF_INC enabled:

0x22 → 0x23 → 0x24 → 0x25 → 0x26 → 0x27

Therefore we can read all six gyro bytes in one transaction.

6. Gyroscope Data Flow

The complete process is:

MEMS Gyroscope
      ↓
Internal ADC / digital processing
      ↓
Gyro output registers
      ↓
0x22–0x27
      ↓
I²C
      ↓
STM32 uint8_t data[6]
      ↓
Combine bytes
      ↓
int16_t raw_gx/raw_gy/raw_gz
      ↓
Sensitivity conversion
      ↓
GX/GY/GZ in dps
7. Combining Gyroscope Bytes

The LSM6DSL gives each axis as a signed 16-bit value.

For example:

X:

0x22 → X_L
0x23 → X_H

Combine:

raw_gx = (int16_t)(((uint16_t)data[1] << 8) | data[0]);

Similarly:

raw_gy = (int16_t)(((uint16_t)data[3] << 8) | data[2]);

raw_gz = (int16_t)(((uint16_t)data[5] << 8) | data[4]);
Why int16_t?

Because the gyro can measure rotation in both directions:

+ → clockwise
- → opposite direction

So the raw value must be signed.

8. Gyroscope Read Function
HAL_StatusTypeDef LSM6DSL_ReadGyro(int16_t *gx,
                                   int16_t *gy,
                                   int16_t *gz)
{
    uint8_t data[6];

    HAL_StatusTypeDef status;

    status = LSM6DSL_ReadReg(LSM6DSL_OUTX_L_G,
                             data,
                             6);

    if (status != HAL_OK)
    {
        return status;
    }

    *gx = (int16_t)(((uint16_t)data[1] << 8) | data[0]);

    *gy = (int16_t)(((uint16_t)data[3] << 8) | data[2]);

    *gz = (int16_t)(((uint16_t)data[5] << 8) | data[4]);

    return HAL_OK;
}
9. HAL I²C Read

Our generic register-read function:

HAL_StatusTypeDef LSM6DSL_ReadReg(uint8_t reg,
                                  uint8_t *data,
                                  uint16_t size)
{
    return HAL_I2C_Mem_Read(&hi2c2,
                            LSM6DSL_ADDR,
                            reg,
                            I2C_MEMADD_SIZE_8BIT,
                            data,
                            size,
                            HAL_MAX_DELAY);
}

Conceptually:

START
  ↓
LSM6DSL address + WRITE
  ↓
Register address
  ↓
Repeated START
  ↓
LSM6DSL address + READ
  ↓
Receive data
  ↓
STOP
10. Raw Integer × Float

This:

gx_dps = raw_gx * 0.00875f;

performs:

int16_t
   ↓
automatically converted to float
   ↓
multiply by float
   ↓
float result

Equivalent conceptually to:

gx_dps = (float)raw_gx * 0.00875f;

The f means the constant is a float rather than a double.

11. Stationary vs Rotating

When the board is stationary:

GX ≈ 0 dps
GY ≈ 0 dps
GZ ≈ 0 dps

Small non-zero values are normal because of gyro bias/noise.

When rotating around Z:

             ↻
          Z axis
             │
             │
          LSM6DSL

we should see:

GX ≈ 0
GY ≈ 0
GZ → large positive/negative value

depending on the direction of rotation.

12. Important Debugging Lesson

We encountered an important C programming mistake inside LSM6DSL_Init().

Wrong:

/* Configure accelerometer */

return HAL_OK;

/* Configure gyro */
ctrl2_g = 0x40;

Everything after:

return HAL_OK;

is unreachable.

Correct structure:

Configure accelerometer
        ↓
Configure CTRL3_C
        ↓
Configure gyroscope
        ↓
return HAL_OK

So return immediately exits the function.

13. Final 6-Axis Picture

At this stage:

                    LSM6DSL
                       │
             ┌─────────┴─────────┐
             │                   │
       Accelerometer          Gyroscope
             │                   │
         X   Y   Z             X   Y   Z
             │                   │
          raw int16            raw int16
             │                   │
       0.061 mg/LSB         0.00875 dps/LSB
             │                   │
          mg / g              degrees/sec
Remember this core idea

Accelerometer:

Raw → sensitivity → acceleration

Gyroscope:

Raw → sensitivity → angular velocity

And:

Accelerometer ≠ angle
Gyroscope ≠ angle

Accelerometer → acceleration
Gyroscope → angular velocity

To obtain orientation/angle later, we will combine the accelerometer and gyroscope using sensor fusion.
