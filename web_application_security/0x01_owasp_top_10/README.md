# Web Application Security - OWASP Top 10

## Overview

This project explores the 10 most critical web security vulnerabilities according to OWASP (Open Web Application Security Project). It offers a practical and defensive approach to understand, identify, and protect against these major threats.

## Learning Objectives

By the end of this project, you should be able to:

- Identify and understand OWASP Top 10 2021 vulnerabilities
- Exploit these vulnerabilities in a controlled environment for educational purposes
- Implement appropriate protection measures
- Use decoding and security analysis tools
- Develop a methodical approach to web application security testing

## Project Structure

### Main Scripts and Tools

#### `1-xor_decoder.sh`
**Purpose**: XOR decoding script for analyzing encrypted data
**Usage**: Decoding obfuscated strings using XOR algorithm
**Documentation**: See `1-xor_decoder_documentation.md` for complete details
**Application**: Used in cryptographic failures tasks

### Results and Challenges

The project contains results from 4 main OWASP challenges:

#### `0-flag.txt` - Session Hijacking
**Vulnerability**: A01:2021 - Broken Access Control
**Technique**: Exploitation of predictable session cookies
**Objective**: Understand the importance of secure session identifier generation

#### `2-flag.txt` - Cryptographic Failures  
**Vulnerability**: A02:2021 - Cryptographic Failures
**Technique**: Authentication header analysis and multi-step decoding
**Tools Used**: Base64 decoder + XOR decoder
**Objective**: Identify flaws in sensitive data protection

#### `3-flag.txt` - Stored XSS (Part 1)
**Vulnerability**: A03:2021 - Injection (Cross-Site Scripting)
**Technique**: Profile identification and exploitation for XSS propagation
**Context**: Simulation of the Samy worm (MySpace 2005)
**Objective**: Understand stored XSS attack propagation

#### `4-vuln.txt` - XSS Field Discovery
**Vulnerability**: A03:2021 - Injection (Cross-Site Scripting)
**Technique**: Identification of field vulnerable to stored XSS
**Method**: Systematic testing of input fields
**Result**: Name of identified vulnerable field
