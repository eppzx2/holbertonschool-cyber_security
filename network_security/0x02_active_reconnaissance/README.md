# 🕵️ Active Reconnaissance - 0x02 Network Security

## 📋 Project Overview

This project focuses on **active reconnaissance** techniques in network security through sequential hands-on tasks. Unlike passive reconnaissance, active reconnaissance involves direct interaction with target systems to gather information for security assessment purposes.

**Project**: `0x02_active_reconnaissance`  
**Environment**: Kali Linux / Linux with penetration testing tools  
**Repository**: `holbertonschool-cyber_security`

**Tasks are arranged in a sequential manner to help you understand the basic principles of hacking and develop a logical approach to performing actions.**

## 🎯 Learning Objectives

After completing this project, you will be able to:

- 🔍 Perform network port scanning and service identification
- 🌐 Analyze web applications and identify server technologies
- 💉 Discover SQL injection vulnerabilities through manual testing
- 🗃️ Enumerate databases using automated SQL injection tools
- 📁 Conduct directory enumeration to discover hidden web content
- 🎯 Extract sensitive information from web applications

## 📁 Project Structure

| Task | File | Description | Key Tool |
|------|------|-------------|----------|
| **0** | `0-ports.txt` | Open ports identification | `nmap` |
| **1** | `1-webserver.txt` | Web server identification | `wappalyzer` |
| **2** | `100-flag.txt` | Source code analysis flag | Manual inspection |
| **3** | `2-injectable.txt` | SQL injection endpoint discovery | Manual testing |
| **4** | `3-database.txt` + `4-tables.txt` | Database enumeration | `sqlmap` |
| **5** | `101-flag.txt` | Database flag extraction | `sqlmap` |
| **6** | `5-hidden_dir.txt` | Hidden directory discovery | `gobuster` |
| **7** | `102-flag.txt` | Admin panel flag extraction | Manual access |
