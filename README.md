# Mini Retail Billing System

A console-based retail billing system developed using x86 Assembly Language (EMU8086). The project simulates a basic retail checkout system where users can purchase products, generate an invoice, and receive discounts based on the total purchase amount.

---

## Badges

![Assembly](https://img.shields.io/badge/Assembly-x86-blue?style=for-the-badge)
![EMU8086](https://img.shields.io/badge/EMU8086-Assembler-success?style=for-the-badge)
![DOS](https://img.shields.io/badge/Platform-DOS-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

---

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Products Available](#products-available)
- [Discount Policy](#discount-policy)
- [Technologies Used](#technologies-used)
- [Workflow](#workflow)
- [Assembly Concepts Demonstrated](#assembly-concepts-demonstrated)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)

---

# Project Overview

The Mini Retail Billing System is a menu-driven console application developed in x86 Assembly Language using EMU8086. It allows users to purchase multiple products, calculates the total bill, applies discounts based on predefined purchase ranges, and generates a detailed invoice.

The project was developed as part of the Computer Architecture & Organization (CAO) course during the 4th semester at NED University of Engineering & Technology.

---

# Features

- Menu-driven interface
- Multiple product selection
- Quantity input for each product
- Running total after every purchase
- Automatically generated invoice
- Item-wise billing
- Discount calculation
- Final bill generation

---

# Products Available

| Product | Unit Price (Rs.) |
|---------|-----------------:|
| Vegetables | 80 |
| Eggs (Dozen) | 300 |
| Candies | 5 |
| Dairy Products | 250 |
| Fruits | 150 |

---

# Discount Policy

| Purchase Amount | Discount |
|---------------:|---------:|
| Rs. 2,000 – 3,999 | 10% |
| Rs. 4,000 – 5,999 | 20% |
| Rs. 6,000 – 9,999 | 30% |
| Rs. 10,000 and above | 50% |

---

# Technologies Used

- x86 Assembly Language
- EMU8086
- DOS Console

---

# Workflow

1. Display the welcome screen and product menu.
2. Allow the user to select a product.
3. Accept the quantity.
4. Update the running total.
5. Repeat until invoice generation.
6. Display an itemized invoice.
7. Calculate the subtotal.
8. Apply the discount.
9. Display the final payable amount.

---

# Assembly Concepts Demonstrated

- Data Segment and Code Segment
- Macros
- Procedures
- Arrays
- Pointer Arrays
- Loops
- Conditional Branching
- Arithmetic Operations
- Keyboard Input
- Console Output
- Integer to ASCII Conversion
- Stack Operations
- DOS Interrupts (`INT 21H`)
- BIOS Interrupts (`INT 10H`)

---

# Installation

### Open the project in EMU8086.

### Assemble the source code.

### Run the program.

---

# Usage

1. Select products from the menu.
2. Enter the desired quantity.
3. Continue shopping or generate the invoice.
4. View the subtotal, discount, and final payable amount.

---

# Screenshots

### Main Menu

<img width="646" height="205" alt="image" src="https://github.com/user-attachments/assets/21ecfe5b-0504-40df-b19c-ae2c6ace610a" />

---

### Invoice Generation

<img width="573" height="256" alt="image" src="https://github.com/user-attachments/assets/78e05061-f5b9-4a67-9197-5a22f51a45b1" />

---

### Final Bill

<img width="558" height="233" alt="image" src="https://github.com/user-attachments/assets/20a8bc67-48f2-4252-9f19-f571f6428aaa" />
