# Web Application Security - Web Fundamentals

## Overview

This project covers fundamental concepts of web application security and common vulnerabilities. It provides a practical introduction to defensive exploitation techniques for understanding and protecting modern web applications.

## Learning Objectives

By the end of this project, you should be able to:

- Understand client-server architecture and web protocols
- Identify common web application vulnerabilities
- Use ethical penetration testing techniques
- Implement appropriate defensive security measures
- Analyze and exploit security flaws in a controlled environment

## Project Structure

### Scripts and Tools

#### `1-host_header_injection.sh`
**Purpose**: Script to test Host header injection vulnerabilities
**Usage**: `./1-host_header_injection.sh <malicious_host> <target_url> <post_data>`
**Description**: Tests if a web application is vulnerable to Host header injection attacks, often used for cache poisoning or malicious redirections.

### Payloads and Exploitation

#### `3-xss_payload.txt`
**Purpose**: Cross-Site Scripting (XSS) payload for testing
**Usage**: Content used to test XSS vulnerabilities
**Security**: Use only on your own applications or in authorized test environments

#### `7-rce_payload.txt`
**Purpose**: Remote Code Execution (RCE) payload for testing
**Usage**: Payload to identify remote code execution vulnerabilities
**⚠️ Warning**: Use strictly limited to authorized test environments

### Results and Flags

The project contains several flag files obtained during practical exercises:

- `2-flag.txt` - Flag obtained during exploitation challenge 2
- `4-flag.txt` - Flag obtained during exploitation challenge 4  
- `6-flag.txt` - Flag obtained during exploitation challenge 6
- `8-flag.txt` - Flag obtained during exploitation challenge 8

### Support Ticket

#### `5-ticket.txt`
**Purpose**: Simulation of a support ticket or security incident
**Content**: Information related to a discovered security incident
