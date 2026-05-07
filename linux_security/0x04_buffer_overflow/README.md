# 0x04. Buffer Overflow

## Description

This project introduces the fundamental concepts of memory corruption vulnerabilities, specifically focus on **Buffer Overflows**. 

Understanding Buffer Overflows is essential for both exploit development and secure coding, as it highlights the critical importance of memory safety in C and C++ programming.

## Key Concepts

### Memory Layout
- **The Stack:** A Last-In-First-Out (LIFO) structure that stores local variables and function return addresses.
- **The Heap:** Dynamically allocated memory for larger data structures.
- **Registers:** Understanding **EIP/RIP** (Instruction Pointer), **ESP/RSP** (Stack Pointer), and **EBP/RBP** (Base Pointer).

### The Vulnerability
- **Buffer:** A temporary storage area in memory.
- **Overflow:** Occurs when more data is written to a buffer than it can hold, overwriting adjacent memory locations.
- **Smashing the Stack:** Specifically overwriting the **Return Address** to control the program's next instruction.


---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x04. Buffer Overflow  
**Module**: Binary Security & Exploit Development  
**Level**: Advanced  
**Last Updated**: 2026
