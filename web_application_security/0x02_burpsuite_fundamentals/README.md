# 0x02. Burp Suite Fundamentals

## Description

This project introduces **Burp Suite**, the industry-standard graphical tool for testing Web Application Security. The focus is on understanding the intercepting proxy mechanism, which allows security researchers to pause, analyze, and modify web traffic between a browser and a server in real-time.

Mastering Burp Suite is a foundational requirement for any Web Pentester or SOC Analyst, as it provides deep visibility into HTTP/HTTPS communication and automates the discovery of common web vulnerabilities.

## Key Concepts

### Intercepting Proxy
- **The Man-in-the-Middle:** How Burp acts as a proxy to capture requests and responses.
- **SSL/TLS Termination:** Installing the Burp CA Certificate to intercept encrypted HTTPS traffic.
- **Intercept On/Off:** Learning when to pause traffic for manual modification and when to let it flow.

### Core Burp Suite Modules
- **Proxy:** The heart of Burp, used for intercepting and logging web traffic.
- **Repeater:** A tool for manually modifying and reissuing individual HTTP requests to test server responses.
- **Intruder:** Used for automating customized attacks, such as fuzzing, brute-forcing, and parameter exhaustion.
- **Decoder:** A utility for transforming data (URL encoding, Base64, Hex, etc.) to uncover hidden information.
- **Sequencer:** Analyzing the randomness of session tokens and cookies to predict their generation patterns.

### Target & Site Mapping
- **Scope Definition:** Setting the target scope to ensure you only test authorized domains.
- **Site Map:** Building a visual representation of the application’s structure based on discovered endpoints.

### Basic Web Vulnerability Identification
- **Parameter Manipulation:** Changing input values to test for logic flaws.
- **Information Disclosure:** Identifying sensitive data leaked in HTTP headers or HTML comments.
- **Cookie Security:** Analyzing flags like `HttpOnly`, `Secure`, and `SameSite` for session protection.

## Technical Stack

- **Primary Tool:** Burp Suite (Community/Professional)
- **Browser Integration:** FoxyProxy, Burp's Embedded Browser
- **Environment:** Web Security Academy (PortSwigger), OWASP Juice Shop
- **Analysis:** HTTP/1.1 & HTTP/2 Protocol Analysis

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x02. Burp Suite Fundamentals  
**Module**: Web Application Security  
**Level**: Intermediate  
**Last Updated**: 2026
