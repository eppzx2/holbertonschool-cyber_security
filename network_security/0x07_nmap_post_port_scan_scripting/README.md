# 0x07. Nmap: Post Port Scan Scripting

## Description

This project focuses on the automation of security audits and vulnerability discovery using the **Nmap Scripting Engine (NSE)**. While port scanning identifies open services, NSE allows for deep interaction with those services to detect misconfigurations, default credentials, and known vulnerabilities (CVEs) immediately after the discovery phase.

By leveraging Lua-based scripts, you will learn how to transform Nmap from a simple network scanner into a powerful, automated vulnerability assessment tool that can be integrated into larger security workflows.

## Key Concepts

### NSE Architecture
- **Lua Programming:** NSE scripts are written in the Lua language, known for being lightweight and fast.
- **The Script Database (`nmap-scripts.db`):** Understanding how Nmap catalogs and locates available scripts.
- **Script Stages:** Knowing when scripts run (Pre-scanning, Script-scanning per host/port, and Post-scanning).

### Advanced Script Categories
- **`vuln`:** Checking for specific known vulnerabilities (e.g., EternalBlue, Heartbleed).
- **`exploit`:** Actively attempting to exploit a vulnerability (use with caution).
- **`brute`:** Automating credential guessing against services like SSH, FTP, or MySQL.
- **`discovery`:** Querying public registries, SNMP, or Active Directory to gather more information about the network.

### Custom Script Execution
- **Arguments (`--script-args`):** Passing specific parameters to scripts, such as defining a custom wordlist for a brute-force attack or setting a target URI.
- **Script Selection:** Using Boolean expressions to run specific sets of scripts (e.g., `--script "http-* and not intrusive"`).
- **Updating the Database:** Using `--script-updatedb` to ensure new custom or downloaded scripts are recognized by Nmap.

### Practical Use Cases
- **HTTP Enumeration:** Automatically discovering hidden directories and web server headers.
- **SSL/TLS Auditing:** Checking for weak ciphers and expired certificates.
- **Database Probing:** Identifying database versions and checking for "root" users with no password.

## Technical Stack

- **Primary Tool:** Nmap
- **Language:** Lua (for NSE scripts)
- **Vulnerability Databases:** Vulners, Vulscan
- **Output Formats:** XML (`-oX`) for integration with tools like Metasploit or specialized reporting parsers.

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x07. Nmap: Post Port Scan Scripting  
**Module**: Networking & Reconnaissance  
**Level**: Advanced  
**Last Updated**: 2026
