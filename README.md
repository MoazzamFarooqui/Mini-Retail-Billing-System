# Mini Retail Billing System

A console-based retail billing system developed in **x86 Assembly Language (EMU8086)** as part of the **Computer Architecture & Organization (CAO)** course during the **4th semester** at NED University of Engineering & Technology.

The project simulates a basic retail checkout system where users can purchase products, generate an invoice, and receive discounts based on the total purchase amount.

---

## Features

* Menu-driven interface
* Multiple product selection
* Quantity input for each product
* Running total displayed after every purchase
* Automatically generated invoice
* Item-wise quantity, unit price, and total calculation
* Discount calculation based on purchase amount
* Final bill generation with subtotal, discount, and grand total

---

## Technologies Used

| Category      | Technology            |
| ------------- | --------------------- |
| **Language**  | x86 Assembly Language |
| **Assembler** | EMU8086               |
| **Platform**  | DOS Console           |

---

## Products Available

| Product        | Unit Price (Rs.) |
| -------------- | ---------------: |
| Vegetables     |               80 |
| Eggs (Dozen)   |              300 |
| Candies        |                5 |
| Dairy Products |              250 |
| Fruits         |              150 |

---

## Discount Policy

|      Purchase Amount | Discount |
| -------------------: | -------: |
|    Rs. 2,000 – 3,999 |      10% |
|    Rs. 4,000 – 5,999 |      20% |
|    Rs. 6,000 – 9,999 |      30% |
| Rs. 10,000 and above |      50% |

---

## Workflow

1. Display the welcome screen and product menu.
2. Allow the user to select a product.
3. Accept the required quantity.
4. Update the running total after each purchase.
5. Repeat until the user chooses to generate the invoice.
6. Display an itemized invoice showing:

   * Product name
   * Quantity purchased
   * Unit price
   * Total price for each item
7. Calculate the subtotal.
8. Apply the appropriate discount based on the subtotal.
9. Display the final payable amount.

---

## Assembly Concepts Demonstrated

* Data Segment and Code Segment
* Macros
* Procedures
* Arrays
* Pointer Arrays
* Loops
* Conditional Branching
* Arithmetic Operations
* Keyboard Input
* Console Output
* Integer to ASCII Conversion
* Stack Operations
* DOS Interrupts (`INT 21H`)
* BIOS Interrupts (`INT 10H`)

---

## Project Structure

The project is organized into modular procedures for improved readability and maintainability.

* **Item Selection** – Handles menu navigation and product selection.
* **Purchase Handler** – Records quantities and updates the running total.
* **Invoice Generator** – Displays an itemized bill using arrays and loops.
* **Discount Calculator** – Applies discounts according to predefined purchase ranges.
* **Helper Procedures** – Includes routines for reading quantities, printing numbers, and formatting output.

---

## Learning Outcomes

This project demonstrates practical implementation of:

* Assembly language programming
* Low-level arithmetic operations
* Memory management using arrays
* Modular programming with procedures
* Menu-driven application design
* Billing and invoice generation logic

---

## Getting Started

1. Open the project in **EMU8086**.
2. Assemble the source code.
3. Run the program.
4. Follow the on-screen instructions to purchase products and generate the final invoice.

---

## Screenshots

<img width="646" height="205" alt="image" src="https://github.com/user-attachments/assets/21ecfe5b-0504-40df-b19c-ae2c6ace610a" />

<img width="573" height="256" alt="image" src="https://github.com/user-attachments/assets/78e05061-f5b9-4a67-9197-5a22f51a45b1" />

<img width="558" height="233" alt="image" src="https://github.com/user-attachments/assets/20a8bc67-48f2-4252-9f19-f571f6428aaa" />





