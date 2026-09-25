<img width="1068" height="1047" alt="image" src="https://github.com/user-attachments/assets/d53c4b92-3a4e-4e8b-babc-6092b2257504" />

# 🌊 Low-Power Adaptive Software-Defined Sonar Transmitter for AUVs

> **A real-time embedded sonar transmitter that senses underwater environmental conditions and dynamically generates an optimized acoustic waveform using STM32, Timer, DMA, DAC, digital windowing, and analog signal conditioning.**

---

## 📌 Project Overview

Autonomous Underwater Vehicles (AUVs) are widely used for underwater exploration, marine mapping, inspection, and surveying.

A sonar system transmits an acoustic signal into the water and analyzes the returning echo to detect and map underwater objects.

Traditional sonar systems may operate with a predefined waveform and fixed operating parameters. However, underwater conditions can change significantly during an AUV mission.

For example:

* Clear and shallow water may allow higher-frequency operation for detailed mapping.
* Deep or highly turbid water may require an operating strategy that prioritizes propagation and transmitted energy.
* Temperature and salinity affect the acoustic properties of water and therefore influence sonar propagation and system modeling.

Therefore, a single fixed waveform is not necessarily suitable for every operating condition.

### 💡 Our idea

This project develops a **Software-Defined Sonar Transmitter Payload** that can dynamically change its transmitted waveform according to environmental inputs.

The system follows four major stages:

```text
SENSE
  ↓
DECIDE
  ↓
SYNTHESIZE
  ↓
TRANSMIT
```

The final output is a **real physical analog waveform**, not just a software simulation.

---

# 🎯 Project Objectives

The main objectives are:

* Develop a physical adaptive sonar transmitter prototype.
* Measure or simulate underwater environmental parameters.
* Dynamically select sonar waveform parameters.
* Generate multiple software-defined sonar waveforms.
* Implement LFM chirp generation.
* Implement geometric frequency sweeps.
* Implement phase-coded pulses.
* Apply digital windowing to transmitted pulses.
* Use hardware timers for precise waveform timing.
* Use DMA for low-CPU-load DAC streaming.
* Convert digital waveform samples into an analog signal using a DAC.
* Implement analog filtering and amplification.
* Validate the generated waveform using an oscilloscope and FFT/spectrogram.
* Build the system around low-power embedded implementation principles.

---

# 🧩 Proposed Solution

The system is divided into four major stages.

## 1. Sense

Environmental conditions are acquired using sensors or potentiometers representing:

* Turbidity
* Depth
* Temperature
* Salinity

The analog sensor signals are converted into digital values using the STM32 ADC.

```text
Environmental Condition
        ↓
Physical Sensor / Potentiometer
        ↓
Analog Voltage
        ↓
STM32 ADC
        ↓
Digital Environmental Data
```

---

## 2. Decide

The firmware acts as the **adaptive decision engine**.

It analyzes the environmental information and determines suitable waveform parameters such as:

* Center frequency
* Start frequency
* End frequency
* Bandwidth
* Pulse duration
* Amplitude
* Modulation type

Conceptually:

```text
Turbidity
Depth
Temperature
Salinity
     │
     ▼
Adaptive Decision Algorithm
     │
     ├── Frequency
     ├── Bandwidth
     ├── Pulse Duration
     ├── Amplitude
     └── Waveform Type
```

For example:

### Clear + Shallow

The system can prioritize fine-detail mapping:

```text
Higher-frequency operating region
+
Wider bandwidth
+
Shorter pulse
+
Appropriate amplitude
```

### Deep + Highly Turbid

The system can prioritize propagation:

```text
Lower-frequency operating region
+
Appropriately selected bandwidth
+
Longer pulse
+
Higher transmitted energy when required
```

> **Important:** The system does not assume that one frequency is always best for a particular environment. The final waveform is selected according to environmental conditions, required range, required resolution, transducer characteristics, power limits, and mission requirements.

---

# 3. Synthesize

Once the waveform parameters are selected, the STM32 generates the required digital waveform.

The system supports:

```text
LFM Chirp
Geometric Frequency Sweep
Phase-Coded Pulse
```

Digital windowing can then be applied to control the amplitude envelope of the transmitted pulse.

```text
Selected Parameters
        ↓
Waveform Generator
        ↓
Digital Windowing
        ↓
Final Waveform Samples
        ↓
Waveform Buffer
```

---

# 4. Transmit

The final waveform is transmitted using a hardware-efficient architecture:

```text
Waveform Buffer
      ↓
Hardware Timer
      ↓
DMA
      ↓
DAC
      ↓
Analog Filter
      ↓
Amplifier
      ↓
Analog Sonar Output
```

The physical output can then be connected to measurement equipment or, in a complete sonar system, to an appropriate transducer driver and acoustic transducer.

---

# 🏗️ System Architecture

```text
                    UNDERWATER ENVIRONMENT
                              │
                              ▼
                  ┌──────────────────────┐
                  │ Physical Sensors /   │
                  │ Potentiometers       │
                  │                      │
                  │ • Turbidity         │
                  │ • Depth             │
                  │ • Temperature       │
                  │ • Salinity          │
                  └──────────┬───────────┘
                             │
                       Analog Signals
                             │
                             ▼
                  ┌──────────────────────┐
                  │      STM32 ADC       │
                  │                      │
                  │ Analog → Digital     │
                  └──────────┬───────────┘
                             │
                    Environmental Data
                             │
                             ▼
              ┌─────────────────────────────┐
              │   ADAPTIVE WAVEFORM ENGINE  │
              │                             │
              │ • Frequency                 │
              │ • Bandwidth                 │
              │ • Pulse Duration            │
              │ • Amplitude                │
              │ • Modulation Type           │
              └─────────────┬───────────────┘
                            │
                            ▼
                 ┌────────────────────┐
                 │ Waveform Generator │
                 │                    │
                 │ • LFM Chirp        │
                 │ • Geometric Sweep  │
                 │ • Phase Coding     │
                 └──────────┬─────────┘
                            │
                            ▼
                 ┌────────────────────┐
                 │ Digital Windowing  │
                 │                    │
                 │ Hann / Hamming /   │
                 │ Blackman           │
                 └──────────┬─────────┘
                            │
                            ▼
                 ┌────────────────────┐
                 │ Waveform Buffer    │
                 │ STM32 RAM          │
                 └──────────┬─────────┘
                            │
                            ▼
                       TIMER + DMA
                            │
                            ▼
                 ┌────────────────────┐
                 │        DAC         │
                 │ Digital → Analog   │
                 └──────────┬─────────┘
                            │
                            ▼
                 ┌────────────────────┐
                 │   Analog Filter    │
                 │   Low-Pass Filter  │
                 └──────────┬─────────┘
                            │
                            ▼
                 ┌────────────────────┐
                 │  Power Amplifier   │
                 └──────────┬─────────┘
                            │
                            ▼
                    ANALOG OUTPUT
                       /        \
                      /          \
                     ▼            ▼
               Oscilloscope   FFT / Spectrogram
```

---

# 🌊 What Is a Sonar Ping?

A **ping** is one complete sonar transmission.

For example:

```text
One Ping
│
├── Start
│
├── Transmit waveform
│
├── End
│
└── Listen/process echo
```

A ping could be a fixed-frequency pulse or an LFM chirp.

For example:

```text
ONE LFM PING

100 kHz ─────────────────────→ 300 kHz
         Continuous frequency sweep
```

The complete 5 ms chirp, for example, is **one ping**.

---

# 📡 Waveforms Supported

## 1. LFM Chirp

LFM stands for **Linear Frequency Modulation**.

The instantaneous frequency changes approximately linearly with time.

Example:

```text
100 kHz → 150 kHz → 200 kHz → 250 kHz → 300 kHz
```

Conceptually:

```text
Frequency
   ↑
300k│                 /
    │              /
    │           /
    │        /
100k│_______/________________→ Time
```

### Why use LFM?

LFM provides a large controllable bandwidth and is widely useful for pulse-compression sonar processing.

For a bandwidth:

$$
B = f_{end} - f_{start}
$$

the ideal range-resolution relationship for pulse-compressed sonar is approximately:

$$
\Delta R = \frac{c}{2B}
$$

where:

* \(\Delta R\) = range resolution
* \(c\) = speed of sound in water
* \(B\) = signal bandwidth

Therefore:

```text
Bandwidth ↑
     ↓
Range-resolution distance ↓
     ↓
Better ability to separate closely spaced targets in range
```

---

# 📈 2. Geometric Frequency Sweep

A geometric sweep changes frequency according to a ratio rather than a constant frequency increment.

Example:

```text
100 kHz
120 kHz
144 kHz
173 kHz
208 kHz
250 kHz
```

Here the frequency approximately follows:

```text
f(next) = f(current) × ratio
```

### Why use it?

A geometric sweep provides a different distribution of time across the frequency range compared with an LFM chirp.

It can be useful when the application benefits from:

* Non-linear frequency coverage
* Frequency-ratio-based sweeps
* Logarithmic/octave-oriented analysis

---

# 🔐 3. Phase-Coded Pulse

Instead of continuously changing frequency, the waveform can encode information using phase changes.

For example:

```text
Code:

+   +   -   +   -   -

+ = 0° phase
- = 180° phase
```

Conceptually:

```text
+ + - + - -
│ │ │ │ │ │
▼ ▼ ▼ ▼ ▼ ▼
Phase-coded waveform
```

The receiver can correlate the received signal with the known transmitted code.

### Why use it?

Phase coding can provide:

* Coded waveform diversity
* Correlation-based detection
* Pulse-compression capability
* Processing gain depending on the selected code and receiver

---

# 🔄 Why Support Multiple Waveforms?

There is no single waveform that is optimal for every sonar mission.

The software-defined architecture allows the same hardware platform to generate different waveforms.

```text
                 SAME HARDWARE
                       │
                       ▼
                Software Engine
                       │
        ┌──────────────┼──────────────┐
        ▼              ▼              ▼
      LFM          Geometric      Phase-Coded
      Chirp          Sweep           Pulse
        │              │              │
        └──────────────┼──────────────┘
                       ▼
                      DAC
                       ↓
                    Output
```

This makes the transmitter **reconfigurable through software**.

---

# 🪟 Digital Windowing

A finite-duration waveform that is abruptly switched ON and OFF has sharp edges.

Sharp transitions introduce unwanted spectral components and can increase sidelobes.

Therefore, a window function can be applied to smoothly control the amplitude.

Without windowing:

```text
0 → 100% → 0
```

With windowing:

```text
0 → 20% → 50% → 80% → 100%
                    ↓
100% → 80% → 50% → 20% → 0
```

Mathematically:

$$
x[n] = s[n]w[n]
$$

where:

* \(s[n]\) = original waveform
* \(w[n]\) = window coefficients
* \(x[n]\) = final windowed waveform

Supported windows can include:

* Hann
* Hamming
* Blackman

### Important distinction

```text
CHIRP
→ controls frequency with time

WINDOW
→ controls amplitude with time
```

Windowing does not create the chirp. It shapes its amplitude envelope.

---

# ⚙️ Timer + DMA + DAC

A major embedded optimization in this project is the use of **hardware timers and DMA**.

## Without DMA

The CPU would need to repeatedly send waveform samples:

```text
CPU → Sample 1 → DAC
CPU → Sample 2 → DAC
CPU → Sample 3 → DAC
CPU → Sample 4 → DAC
...
```

This consumes CPU time.

## With DMA

The waveform is first stored in memory:

```text
Waveform Buffer
      ↓
     DMA
      ↓
     DAC
```

A hardware timer determines when each sample should be transferred:

```text
Timer Trigger
      ↓
DMA Transfer
      ↓
DAC
      ↓
Next Sample
```

The CPU only needs to prepare/configure the transfer rather than manually handle every sample.

### Benefits

* Precise sample timing
* Lower CPU involvement
* Continuous waveform streaming
* Better real-time behavior
* Suitable for low-power embedded operation

---

# 🔊 DAC and Analog Signal Chain

The DAC converts the digital waveform into an analog voltage.

```text
Digital Samples
      ↓
     DAC
      ↓
Analog Voltage
```

The DAC output can contain unwanted high-frequency components associated with the sampling process.

Therefore:

```text
DAC
 ↓
Analog Low-Pass Filter
 ↓
Cleaner Analog Signal
 ↓
Amplifier
 ↓
Output
```

The amplifier provides the required electrical drive for the next stage.

For a complete sonar system, the amplified signal would ultimately drive an appropriate acoustic transducer through a suitable power-driver stage.

---

# 🔬 Physical Validation

This project is designed as a **physical hardware prototype**, not merely a simulation.

The analog output can be connected to:

### Oscilloscope

Used to observe:

* Time-domain waveform
* Amplitude
* Pulse duration
* Chirp behavior
* Signal distortion
* Windowed pulse envelope

### FFT / Spectrum Analyzer

Used to analyze:

* Frequency content
* Bandwidth
* Spectral leakage
* Sidelobes
* Unwanted frequency components

### Spectrogram

Especially useful for verifying a chirp.

For an up-chirp:

```text
Frequency
   ↑
High│              /
    │            /
    │          /
    │        /
Low │_______/____________→ Time
```

The diagonal trace demonstrates that the frequency is changing with time.

---

# 🧠 Adaptive Decision Logic

The adaptive algorithm can be implemented initially as a rule-based system.

Example:

```text
IF water is clear
AND depth is shallow
        ↓
Prioritize resolution
        ↓
Higher-frequency operating region
Wider bandwidth
Shorter pulse
```

Another operating condition:

```text
IF turbidity is high
AND depth is high
        ↓
Prioritize propagation
        ↓
Lower-frequency operating region
Longer pulse
Appropriate bandwidth
```

The exact values are not universal. They must be selected according to:

* Sonar transducer
* Amplifier
* DAC/sample rate
* Available frequency band
* Required range
* Required resolution
* Water conditions
* Power budget

---

# 🔋 Low-Power Architecture

A major design goal is to minimize unnecessary CPU activity.

Instead of:

```text
CPU
 ↓
Calculate sample
 ↓
Send sample
 ↓
Calculate sample
 ↓
Send sample
```

the system uses:

```text
CPU
 ↓
Generate/configure waveform buffer
 ↓
Configure Timer + DMA
 ↓
DMA automatically streams samples
 ↓
CPU performs other tasks / waits
```

This allows the hardware peripherals to perform the repetitive high-speed data movement.

---

# 🆚 Existing Approach vs Proposed Approach

| Feature                  | Conventional / Preconfigured Approach | Proposed System                |
| ------------------------ | ------------------------------------- | ------------------------------ |
| Waveform                 | Predefined configuration              | Software-reconfigurable        |
| Frequency                | Fixed or predefined                   | Dynamically selectable         |
| Bandwidth                | Predefined                            | Dynamically selectable         |
| Pulse duration           | Predefined                            | Dynamically selectable         |
| Amplitude                | Predefined                            | Dynamically adjustable         |
| Environmental adaptation | Limited/preconfigured                 | Direct adaptive input          |
| Waveform types           | Application-dependent                 | LFM, geometric, phase-coded    |
| Sample streaming         | Implementation dependent              | Timer-triggered DMA            |
| CPU involvement          | Potentially higher                    | Reduced during streaming       |
| Output                   | System dependent                      | Physical analog prototype      |
| Validation               | Application dependent                 | Oscilloscope + FFT/spectrogram |

---

# 🚀 Innovation

The innovation of this project is not the invention of sonar waveforms themselves. LFM, phase-coded signals, and other advanced sonar waveforms are already established techniques.

The project focuses on integrating them into a **compact, adaptive, software-defined embedded transmitter architecture**.

### Key innovations

### 1. One Hardware Platform → Multiple Waveforms

```text
Same STM32
    ↓
Different firmware algorithms
    ↓
Different sonar waveforms
```

### 2. Environment → Waveform Adaptation

```text
Environmental Input
        ↓
Adaptive Decision
        ↓
Waveform Parameters
```

### 3. Hardware-Accelerated Data Streaming

```text
Timer + DMA + DAC
        ↓
Precise waveform generation
        ↓
Low CPU involvement
```

### 4. Physical Analog Validation

```text
Digital Algorithm
       ↓
Real DAC Output
       ↓
Analog Circuit
       ↓
Oscilloscope / FFT
```

This creates a complete chain from **environmental sensing to physical waveform generation and measurement**.

---

# 🛠️ Proposed Hardware

A possible prototype architecture is:

```text
STM32F407VGT6 Discovery
        │
        ├── ADC
        │    ├── Turbidity input
        │    ├── Depth input
        │    ├── Temperature input
        │    └── Salinity input
        │
        ├── Timer
        │
        ├── DMA
        │
        ├── DAC
        │
        └── Firmware
             ├── Adaptive Logic
             ├── LFM Generator
             ├── Geometric Sweep Generator
             ├── Phase-Coded Generator
             └── Windowing
                    │
                    ▼
                 DAC
                    │
                    ▼
              Analog Filter
                    │
                    ▼
             Power Amplifier
                    │
                    ▼
              Analog Output
```

---

# 💻 Firmware Architecture

The firmware can be organized into the following layers:

```text
Application
│
├── Environmental Acquisition
│
├── Adaptive Decision Engine
│
├── Waveform Manager
│   ├── LFM Generator
│   ├── Geometric Generator
│   └── Phase-Coded Generator
│
├── Windowing Engine
│
├── Waveform Buffer Manager
│
└── Transmission Manager
    ├── Timer
    ├── DMA
    └── DAC
```

---

# 🔄 Complete Working Flow

The complete operation is:

```text
        UNDERWATER ENVIRONMENT
                  ↓
              SENSORS
                  ↓
                 ADC
                  ↓
       Environmental Parameters
                  ↓
        ADAPTIVE DECISION ENGINE
                  ↓
      ┌───────────┼───────────┐
      ↓           ↓           ↓
 Frequency     Bandwidth   Duration
      │           │           │
      └───────────┼───────────┘
                  ↓
          Select Waveform
                  ↓
        ┌─────────┼─────────┐
        ↓         ↓         ↓
       LFM     Geometric  Phase
      Chirp      Sweep     Coded
        └─────────┼─────────┘
                  ↓
             Windowing
                  ↓
           Waveform Buffer
                  ↓
              Timer + DMA
                  ↓
                 DAC
                  ↓
           Analog Filtering
                  ↓
              Amplifier
                  ↓
           Physical Output
             /          \
            ↓            ↓
      Oscilloscope      FFT
                         ↓
                    Spectrogram
```

---

# 📊 Example Operating Scenario

### Scenario: Clear Shallow Reef

Environmental input:

```text
Turbidity → Low
Depth → Shallow
```

Adaptive decision:

```text
Operating mode → High-resolution mapping
```

Waveform configuration could be:

```text
Center Frequency → Higher
Bandwidth → Wider
Pulse Duration → Shorter
Amplitude → Moderate
Waveform → LFM
```

Result:

```text
Wideband LFM Chirp
        ↓
Pulse compression at receiver
        ↓
Fine range resolution
```

---

### Scenario: Deep / Turbid Region

Environmental input:

```text
Turbidity → High
Depth → High
```

Adaptive decision:

```text
Operating mode → Propagation-oriented
```

Possible configuration:

```text
Frequency → Lower operating region
Bandwidth → Selected according to mission/hardware
Pulse Duration → Longer
Amplitude → Increased when required
```

Result:

```text
Longer-duration waveform
        ↓
More transmitted energy
        ↓
Prioritize usable propagation
```

---

# 🔬 Expected Demonstration

The prototype demonstration will show:

### 1. Environmental input

Rotate potentiometers or change sensor inputs.

### 2. Adaptive decision

The selected parameters change.

Example:

```text
Mode: HIGH RESOLUTION

Frequency: 250–450 kHz
Bandwidth: 200 kHz
Duration: 5 ms
```

Then:

```text
Mode: PROPAGATION

Frequency: 100–180 kHz
Bandwidth: 80 kHz
Duration: 10 ms
```

### 3. Waveform change

The actual waveform generated by the STM32 changes.

### 4. Oscilloscope validation

Observe the physical analog output.

### 5. FFT / Spectrogram validation

Verify the frequency characteristics and chirp behavior.

---

# 📈 Key Technical Concepts Demonstrated

This project combines multiple embedded and DSP concepts:

```text
Embedded Systems
      +
ADC
      +
Signal Processing
      +
Waveform Synthesis
      +
LFM Chirp
      +
Digital Windowing
      +
Timers
      +
DMA
      +
DAC
      +
Analog Filtering
      +
Amplification
      +
FFT / Spectrogram
      +
Adaptive Control
```

---

# 🎓 What This Project Demonstrates

This project demonstrates practical knowledge of:

* STM32 embedded programming
* ADC configuration
* Hardware timers
* DMA
* DAC
* Real-time waveform generation
* Digital signal processing
* LFM chirp synthesis
* Frequency sweeps
* Phase coding
* Window functions
* FFT analysis
* Analog filtering
* Operational amplifiers
* Signal amplification
* Embedded power optimization
* Hardware/software co-design
* Real-time adaptive systems

---

# 🔮 Future Improvements

The prototype can be extended with:

* Real underwater turbidity sensor
* Pressure-based depth measurement
* Waterproof temperature sensor
* Conductivity-based salinity measurement
* External high-speed DAC
* Dedicated sonar power amplifier
* Actual acoustic transducer
* Hydrophone receiver
* Matched filtering
* Pulse compression
* Real-time echo processing
* Target detection
* Range estimation
* AUV navigation integration
* Battery-aware waveform optimization
* Closed-loop transmit/receive adaptation
* Custom PCB
* Waterproof AUV payload enclosure

---

# 📌 Important Scope

This project focuses primarily on the **adaptive sonar transmitter payload**.

The prototype demonstrates:

```text
Environmental Sensing
        ↓
Adaptive Decision
        ↓
Digital Waveform Generation
        ↓
Timer + DMA
        ↓
DAC
        ↓
Analog Signal Conditioning
        ↓
Physical Waveform Validation
```

A complete sonar system would additionally require a receiver, hydrophone/transducer, receive-side amplification, filtering, synchronization, matched filtering/pulse compression, target detection, and range estimation.

---

# 🏁 Final Concept

The entire project can be summarized in one line:

> **Sense the underwater environment → decide the appropriate sonar parameters → synthesize a suitable waveform → efficiently stream it through Timer + DMA + DAC → condition the analog signal → validate the physical output.**

Or simply:

```text
          SENSE
            ↓
          DECIDE
            ↓
        SYNTHESIZE
            ↓
          TRANSMIT
            ↓
          VERIFY
```

### Core idea

```text
Changing Environment
        ↓
Changing Requirements
        ↓
Changing Waveform
        ↓
Same Hardware
        ↓
Software-Defined Sonar
```

---

## 👨‍💻 Project Focus

**Embedded Platform:** STM32
**Primary Development Language:** Embedded C
**Signal Generation:** Digital waveform synthesis
**Waveforms:** LFM, Geometric Sweep, Phase-Coded
**Windowing:** Hann / Hamming / Blackman
**Data Transfer:** DMA
**Timing:** Hardware Timer
**Conversion:** DAC
**Analog Processing:** Filter + Amplifier
**Validation:** Oscilloscope + FFT / Spectrogram

---

## ⭐ Final Takeaway

This project is designed to demonstrate how an embedded system can move beyond a **fixed sonar transmitter** toward a **software-defined adaptive transmitter**, where the same hardware can intelligently reconfigure its waveform based on environmental information and transmit that waveform efficiently using hardware peripherals.

**Sense → Decide → Synthesize → Transmit → Verify**

