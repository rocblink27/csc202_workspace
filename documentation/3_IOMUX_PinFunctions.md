# Pin Function Mapping
>Version 1.0  
>Date: Spring 2025
---
## Introduction to IOMUX on the MSPM0G3507 Microcontroller

The **IOMUX (Input/Output Multiplexer)** is a critical feature in the **MSPM0G3507** microcontroller that enables flexible pin usage. The microcontroller has pins that can serve various purposes depending on how the **IOMUX** is configured. These pins can function as **GPIOs (General Purpose Input/Output)**, or be assigned to other peripheral functions like **UART**, **SPI**, **I2C**, **PWM**, and more.

The **IOMUX** system allows you to configure the pins for different functions, giving you the ability to reuse physical pins for different roles in different applications. This flexibility is particularly useful when you're working with limited pin resources or need to interface with multiple peripherals.

In the following table provides a breakdown of the possible modes or functions for each pin, helping you understand how to map each pin to the desired functionality in your project.

### GPIOA Pin Functions

The image below shows a table for the **GPIOA** pins and the various modes they can be configured to. Each pin has multiple possible functions, including basic **digital input/output** or specialized functions like **UART**, **SPI**, and more.

![GPIOA Pin Functions](GPIOA_IOMUX_PinFunctions.png)  
*Figure 1: Table showing the various functions that can be assigned to GPIOA pins on the MSPM0G3507 microcontroller.*

### GPIOB Pin Functions

Similarly, the **GPIOB** pins can also be configured to serve a variety of functions. The table below outlines the different modes or peripheral functions that can be assigned to each GPIOB pin.

![GPIOB Pin Functions](./GPIOB_IOMUX_PinFunctions.png)  
*Figure 2: Table showing the various functions that can be assigned to GPIOB pins on the MSPM0G3507 microcontroller.*

---

### Note:
The table includes two columns:
1. **PINCM IDX**: Represents the index intot he array.
2. **SDK ENUM**: Corresponds to the **SDK enum** number.

The **IOMUX** register array starts at index 0, as is typical for most hardware register mappings. However, the **SDK ENUM** for the **MSPM0G3507** defines a **typedef enum** called `IOMUX_PINCM`. In this enum, the pin names are indexed starting from 1, rather than 0. 

For example:
- **IOMUX_PINCM1** in the SDK is defined as `(0)` in the IOMUX register array, indicating a shift in the index.

When using the SDK **enum**, you must account for the fact that the indexing starts at 1, which differs from the register array that starts at 0.
