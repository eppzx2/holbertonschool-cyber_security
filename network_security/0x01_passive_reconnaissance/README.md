# 🔍 Passive Reconnaissance - 0x01 Network Security

## 📋 Project Overview

This project focuses on **passive reconnaissance** techniques in network security through DNS enumeration, subdomain discovery, and OSINT (Open Source Intelligence) gathering. Passive reconnaissance involves collecting information about targets without directly interacting with them, making it stealthy and undetectable.

**Project**: `0x01_passive_reconnaissance`  
**Environment**: Linux with DNS tools and reconnaissance utilities  
**Repository**: `holbertonschool-cyber_security`

## 🎯 Learning Objectives

After completing this project, you will be able to:

- 🌐 Perform comprehensive DNS enumeration and record analysis
- 📧 Extract contact information from domain registration data
- 🔍 Discover subdomains using automated reconnaissance tools
- 📊 Analyze DNS records for security assessment purposes
- 🎯 Conduct OSINT gathering through various online resources
- 📝 Generate structured reports from reconnaissance data

## 📁 Project Structure

| Task | Script | Description | Key Tool |
|------|--------|-------------|----------|
| **0** | `0-whois.sh` | Domain registration information extraction | `whois` |
| **1** | `1-a_record.sh` | DNS A record resolution | `nslookup` |
| **2** | `2-mx_record.sh` | Mail exchange record enumeration | `nslookup` |
| **3** | `3-txt_record.sh` | TXT record information gathering | `nslookup` |
| **4** | `4-dig_all.sh` | Comprehensive DNS record analysis | `dig` |
| **5** | `5-subfinder.sh` | Automated subdomain discovery | `subfinder` |
| **Bonus** | Flag files | OSINT challenge completion | Manual research |
