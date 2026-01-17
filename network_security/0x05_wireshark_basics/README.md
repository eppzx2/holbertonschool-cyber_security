# 🔬 Wireshark Basics - 0x05 Network Security

## 📋 Project Overview

This project focuses on **network scanning detection** using Wireshark to identify and analyze various Nmap scanning techniques through packet-level analysis. Students learn to create precise display filters that detect specific scanning patterns, understand protocol behaviors, and develop advanced defensive monitoring capabilities for network security and intrusion detection.

**Project**: `0x05_wireshark_basics`  
**Environment**: Linux with Wireshark, Nmap, and network analysis tools  
**Repository**: `holbertonschool-cyber_security`

## 🎯 Learning Objectives

After completing this project, you will be able to:

- 🔍 Master Wireshark display filter syntax and advanced packet filtering techniques
- 📊 Identify and differentiate between various Nmap scanning methodologies (TCP, UDP, ICMP, ARP)
- 🌐 Analyze protocol-specific scanning signatures and behavioral patterns at the packet level
- 🔎 Detect sophisticated stealth scanning techniques through traffic analysis
- 🛡️ Develop comprehensive defensive monitoring capabilities for network security operations
- 📝 Create detection rules and implement security monitoring workflows
- 🧠 Understand the offensive perspective to strengthen defensive capabilities
- 📋 Perform forensic network analysis for incident response scenarios

## 📁 Project Structure

| Task | File | Description | Scan Type | Tool |
|------|------|-------------|-----------|------|
| **0** | `0-ip_scan.txt` | IP protocol scanning detection | Protocol scan | `nmap -sO` |
| **1** | `1-tcp_syn.txt` | TCP SYN scanning detection | Stealth scan | `nmap -sS` |
| **2** | `2-tcp_connect_scan.txt` | TCP Connect scanning detection | Full connect | `nmap -sT` |
| **3** | `3-tcp_fin.txt` | TCP FIN scanning detection | Stealth scan | `nmap -sF` |
| **4** | `4-tcp_ping_sweep.txt` | TCP ping sweep detection | Host discovery | `nmap -sn -PS/-PA` |
| **5** | `5-udp_port_scan.txt` | UDP port scanning detection | UDP scan | `nmap -sU` |
| **6** | `6-udp_ping_sweep.txt` | UDP ping sweep detection | Host discovery | `nmap -sn -PU` |
| **7** | `7-icmp_ping_sweep.txt` | ICMP ping sweep detection | Host discovery | `nmap -sn -PE` |
| **8** | `8-arp_scanning.txt` | ARP scanning detection | Layer 2 discovery | `arp-scan` |
| **Docs** | `ICMP_Types_Documentation.md` | Complete ICMP reference | Protocol docs | Reference |
