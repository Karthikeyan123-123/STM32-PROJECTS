# STM32L4S5 HTTP Client – Local Server Communication

## Overview

This project demonstrates how an **STM32L4S5** communicates with a **local HTTP server** over Wi-Fi using the **ISM43362 Wi-Fi module**.

The STM32 acts as an **HTTP client**. It connects to a local Wi-Fi network, establishes a TCP connection to a computer running a local HTTP server, sends an HTTP request, and receives the HTTP response.

### Final communication path

```text
STM32L4S5
    │
    │ SPI3
    ▼
ISM43362 Wi-Fi Module
    │
    │ Wi-Fi
    ▼
Wi-Fi Access Point / Router
    │
    │ Local LAN
    ▼
PC / Laptop
    │
    │ TCP
    ▼
Local HTTP Server
    │
    │ HTTP Response
    ▼
STM32L4S5
```

---

# 1. Project Objective

The objective is to understand and implement a complete HTTP client communication flow on an embedded system.

The STM32:

1. Initializes the ISM43362 Wi-Fi module.
2. Scans available Wi-Fi networks.
3. Connects to a Wi-Fi access point.
4. Obtains an IP address using DHCP.
5. Establishes a TCP connection with a local PC.
6. Sends an HTTP request.
7. Receives the HTTP response.
8. Processes/displays the response.

This project demonstrates the relationship between:

```text
Wi-Fi
   ↓
IP
   ↓
TCP
   ↓
HTTP
```

---

# 2. Hardware

| Component | Purpose |
|---|---|
| B-L4S5I-IOT01A | Main development board |
| STM32L4S5VIT6 | Main MCU |
| ISM43362-M3G-L44 | Wi-Fi module |
| Wi-Fi Router / Hotspot | Local network |
| PC / Laptop | Local HTTP server |

The STM32 communicates with the ISM43362 through **SPI3**.

---

# 3. Protocol Stack

```text
Application Layer
       │
      HTTP
       │
       ▼
      TCP
       │
       ▼
      IP
       │
       ▼
     Wi-Fi
       │
       ▼
   ISM43362
       │
       ▼
     SPI3
       │
       ▼
   STM32L4S5
```

### Protocol responsibilities

| Protocol | Responsibility |
|---|---|
| SPI | STM32 ↔ ISM43362 communication |
| IEEE 802.11 | Wireless communication |
| IP | Logical addressing |
| TCP | Reliable transport |
| HTTP | Request/response application protocol |

---

# 4. Network Architecture

Example network:

```text
Wi-Fi Router
IP: 192.168.1.1
       │
       ├───────────────┐
       │               │
       ▼               ▼
 STM32/ISM43362       PC
 192.168.1.20       192.168.1.10
                       │
                       │ TCP : 8080
                       ▼
                 Python HTTP Server
```

The important requirement is that the STM32 and PC must be on the **same local network**.

For example:

```text
STM32 IP : 192.168.1.20
PC IP    : 192.168.1.10
```

Both belong to:

```text
192.168.1.x
```

and can communicate through the local router.

---

# 5. Local HTTP Server

A simple Python HTTP server can be used for testing.

Create a file:

```text
server.py
```

with:

```python
from http.server import BaseHTTPRequestHandler, HTTPServer


class Handler(BaseHTTPRequestHandler):

    def do_GET(self):

        response = b"Hello from Local HTTP Server!"

        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.send_header("Content-Length", str(len(response)))
        self.end_headers()

        self.wfile.write(response)


server = HTTPServer(("0.0.0.0", 8080), Handler)

print("HTTP server running on port 8080...")

server.serve_forever()
```

Run:

```bash
python server.py
```

The server will listen on:

```text
0.0.0.0:8080
```

From another device on the same LAN, the server is accessed using the PC's actual IP address:

```text
http://192.168.1.10:8080/
```

Replace `192.168.1.10` with the PC's actual LAN IP address.

---

# 6. Test the Local Server First

Before testing the STM32, test the server from the PC itself:

```text
http://localhost:8080/
```

Expected response:

```text
Hello from Local HTTP Server!
```

Then test using the PC's LAN IP:

```text
http://192.168.1.10:8080/
```

If this works, the HTTP server is ready for the STM32.

---

# 7. Wi-Fi Connection

The STM32 uses the ST ES-WIFI middleware to communicate with the ISM43362.

The sequence is:

```text
ES_WIFI_Init()
       ↓
Wi-Fi Scan
       ↓
ES_WIFI_Connect()
       ↓
DHCP
       ↓
Get IP address
```

Example:

```text
Wi-Fi CONNECT command SUCCESS
Wi-Fi CONNECTED!

NETWORK SETTINGS
IP Address : 192.168.1.20
Subnet Mask: 255.255.255.0
Gateway    : 192.168.1.1
DNS1       : 192.168.1.1
```

---

# 8. TCP Connection to the Local Server

HTTP normally runs over TCP.

For the local test server:

```text
Server IP   : 192.168.1.10
Server Port : 8080
Protocol    : TCP
```

The STM32 creates a TCP client connection:

```text
STM32
  │
  │ TCP SYN
  ▼
PC : 8080
  │
  │ SYN-ACK
  ▼
STM32
  │
  │ ACK
  ▼
TCP connection established
```

After TCP is established, HTTP data can be sent.

---

# 9. HTTP Request

The STM32 sends an HTTP GET request.

Example:

```http
GET / HTTP/1.1
Host: 192.168.1.10:8080
Connection: close

```

In C:

```c
const char http_request[] =
    "GET / HTTP/1.1\r\n"
    "Host: 192.168.1.10:8080\r\n"
    "Connection: close\r\n"
    "\r\n";
```

### Important: `\r\n`

HTTP headers are terminated using:

```text
\r\n
```

The blank line at the end:

```text
\r\n\r\n
```

tells the HTTP server:

```text
The HTTP request headers are finished.
```

---

# 10. Sending the HTTP Request

After the TCP connection is established:

```c
uint16_t sent_len;

ES_WIFI_SendData(
    &WiFiObj,
    conn.Number,
    (const uint8_t *)http_request,
    strlen(http_request),
    &sent_len,
    5000);
```

Check:

```c
sent_len == strlen(http_request)
```

to confirm that the complete request was transmitted.

Example output:

```text
TCP connection established

HTTP request sent
Bytes sent = 61
```

---

# 11. HTTP Response

The local Python server responds with something similar to:

```http
HTTP/1.0 200 OK
Server: BaseHTTP/0.6 Python/3.x
Date: ...
Content-Type: text/plain
Content-Length: 29

Hello from Local HTTP Server!
```

The STM32 receives this data through:

```c
ES_WIFI_ReceiveData()
```

Example:

```c
uint8_t rx_buffer[1024];
uint16_t received_len;

status =
    ES_WIFI_ReceiveData(
        &WiFiObj,
        conn.Number,
        rx_buffer,
        sizeof(rx_buffer) - 1,
        &received_len,
        5000);
```

Add:

```c
rx_buffer[received_len] = '\0';
```

and print:

```c
printf("%s\r\n", rx_buffer);
```

---

# 12. Expected STM32 Output

A successful run can look like:

```text
========================================
       HTTP LOCAL SERVER TEST
========================================

Wi-Fi CONNECTED!

STM32 IP:
192.168.1.20

Server IP:
192.168.1.10

Connecting to HTTP server...
TCP connection established

HTTP request sent

========== HTTP RESPONSE ==========

HTTP/1.0 200 OK
Server: BaseHTTP/0.6 Python/3.x
Content-Type: text/plain
Content-Length: 29

Hello from Local HTTP Server!

====================================
HTTP RESPONSE RECEIVED SUCCESSFULLY
====================================
```

---

# 13. Complete HTTP Client Flow

```text
                 STM32L4S5
                     │
                     │ SPI3
                     ▼
               ┌───────────┐
               │ ISM43362  │
               │   Wi-Fi   │
               └─────┬─────┘
                     │
                     │ 802.11
                     ▼
               ┌───────────┐
               │ Wi-Fi AP  │
               └─────┬─────┘
                     │
                     │ LAN
                     ▼
               ┌───────────┐
               │    PC     │
               │           │
               │ TCP :8080 │
               └─────┬─────┘
                     │
                     ▼
             Python HTTP Server
                     │
                     │
               HTTP RESPONSE
                     │
                     ▼
               STM32L4S5
```

---

# 14. Layer-by-Layer Understanding

## Layer 1 — SPI

STM32 communicates with the Wi-Fi module:

```text
STM32 ↔ SPI3 ↔ ISM43362
```

SPI itself does not carry HTTP directly.

It is the interface used to control the Wi-Fi module.

---

## Layer 2 — Wi-Fi

ISM43362 connects to the access point:

```text
STM32
  ↓
ISM43362
  ↓
Wi-Fi AP
```

---

## Layer 3 — IP

The STM32 obtains an IP address:

```text
STM32 = 192.168.1.20
PC    = 192.168.1.10
```

Now both devices can communicate using IP.

---

## Layer 4 — TCP

The STM32 opens:

```text
192.168.1.10:8080
```

TCP provides:

- Reliable delivery
- Ordered data
- Retransmission
- Connection management

---

## Layer 5 — HTTP

After TCP is established, the STM32 sends:

```http
GET / HTTP/1.1
Host: 192.168.1.10:8080
Connection: close

```

The server sends:

```http
HTTP/1.0 200 OK
Content-Type: text/plain

Hello from Local HTTP Server!
```

This is the important relationship:

```text
HTTP
  ↓
uses
  ↓
TCP
  ↓
uses
  ↓
IP
  ↓
uses
  ↓
Wi-Fi
```

---

# 15. HTTP Request vs HTTP Response

### Request

STM32 → Server

```http
GET / HTTP/1.1
Host: 192.168.1.10:8080
Connection: close
```

### Response

Server → STM32

```http
HTTP/1.0 200 OK
Content-Type: text/plain
Content-Length: 29

Hello from Local HTTP Server!
```

The STM32 is therefore acting as:

```text
HTTP CLIENT
```

while the PC is:

```text
HTTP SERVER
```

---

# 16. Sending Sensor Data Using HTTP

The same architecture can later be extended to send HTS221 data.

For example:

```json
{
  "temperature": 28.90,
  "humidity": 62.00
}
```

The STM32 could send:

```http
POST /sensor HTTP/1.1
Host: 192.168.1.10:8080
Content-Type: application/json
Content-Length: 39

{"temperature":28.90,"humidity":62.00}
```

The Python server could then receive and process the sensor data.

This creates a simple local IoT architecture:

```text
HTS221
   ↓
STM32
   ↓
Wi-Fi
   ↓
TCP
   ↓
HTTP POST
   ↓
Python Server
   ↓
Sensor Data
```

---

# 17. Troubleshooting

## TCP connection fails

Check:

- PC and STM32 are on the same Wi-Fi/LAN.
- PC IP address is correct.
- Server is running.
- Server port is correct.
- Windows Firewall allows the Python server.
- Port 8080 is listening.

On Windows:

```cmd
ipconfig
```

Find the Wi-Fi adapter IPv4 address.

For example:

```text
IPv4 Address : 192.168.1.10
```

Use that address in the STM32 code.

---

## Server works on localhost but STM32 cannot connect

This is usually because:

```text
localhost
```

means:

```text
the same PC
```

It does not mean the STM32.

Do not use:

```text
127.0.0.1
```

in the STM32.

Use the PC's LAN IP:

```text
192.168.1.10
```

---

## TCP connects but HTTP response is empty

Check the HTTP request carefully.

It must end with:

```text
\r\n\r\n
```

Example:

```c
const char request[] =
    "GET / HTTP/1.1\r\n"
    "Host: 192.168.1.10:8080\r\n"
    "Connection: close\r\n"
    "\r\n";
```

---

## HTTP response is larger than the receive buffer

HTTP responses can be larger than one TCP receive operation.

Do not assume:

```text
one TCP Receive = complete HTTP response
```

TCP is a byte stream.

For a production implementation, keep receiving until:

```text
Connection: close
```

or until the HTTP `Content-Length` bytes have been received.

---

# 18. Important TCP Concept

One of the most important lessons from this project is:

```text
TCP is a STREAM, not a MESSAGE protocol.
```

For example, the server may send:

```text
Packet 1:
HTTP/1.0 200 OK\r\n
```

and:

```text
Packet 2:
Content-Type: text/plain\r\n
```

and:

```text
Packet 3:
\r\n
Hello from Local HTTP Server!
```

The STM32 may receive these in different chunks.

Therefore:

```c
ES_WIFI_ReceiveData(...)
```

does not necessarily return the complete HTTP response in one call.

---

# 19. HTTP vs MQTT

This project is useful for understanding the difference between HTTP and MQTT.

### HTTP

```text
STM32
  │
  │ HTTP REQUEST
  ▼
Server
  │
  │ HTTP RESPONSE
  ▼
STM32
```

Usually request/response oriented.

### MQTT

```text
STM32
  │
  │ PUBLISH
  ▼
MQTT Broker
  │
  │ distributes message
  ▼
Many MQTT Clients
```

MQTT is designed around publish/subscribe messaging.

---

# 20. MQTT vs HTTP Architecture

The two projects together demonstrate two important IoT communication models.

### HTTP Local Server

```text
STM32
   │
   │ HTTP
   ▼
Local Python Server
```

### MQTT Cloud

```text
STM32
   │
   │ MQTT + TLS
   ▼
HiveMQ Cloud
   │
   ├── MQTT Client
   ├── Dashboard
   └── Other Subscribers
```

---

# 21. Future Improvements

Possible extensions:

- [ ] HTTP POST sensor data
- [ ] Send HTS221 temperature/humidity to the local server
- [ ] Parse HTTP status codes
- [ ] Parse HTTP headers
- [ ] Parse JSON response
- [ ] Implement HTTP request timeout
- [ ] Implement TCP reconnect
- [ ] Implement Wi-Fi reconnect
- [ ] Add HTTP server REST API
- [ ] Add FreeRTOS HTTP task
- [ ] Add local web dashboard
- [ ] Add HTTPS using TLS
- [ ] Send sensor data periodically
- [ ] Compare HTTP vs MQTT performance
- [ ] Measure latency and packet sizes using Wireshark

---

# 22. Final Project Summary

This project demonstrates a complete **STM32 HTTP client** communicating with a **local Python HTTP server** over Wi-Fi.

The STM32 uses the ISM43362 Wi-Fi module through SPI3. After connecting to the Wi-Fi network and obtaining an IP address, the STM32 establishes a TCP connection to the PC running the HTTP server. It then sends an HTTP GET request and receives the HTTP response.

The complete communication path is:

```text
STM32L4S5
   ↓
SPI3
   ↓
ISM43362
   ↓
Wi-Fi
   ↓
IP
   ↓
TCP
   ↓
HTTP GET
   ↓
Python Local Server
   ↓
HTTP RESPONSE
   ↓
STM32
```

Example:

```http
GET / HTTP/1.1
Host: 192.168.1.10:8080
Connection: close
```

Response:

```http
HTTP/1.0 200 OK
Content-Type: text/plain

Hello from Local HTTP Server!
```

This project provides a practical foundation for implementing **REST APIs, HTTP POST sensor uploads, local IoT servers, web dashboards, and HTTPS communication** on STM32.
