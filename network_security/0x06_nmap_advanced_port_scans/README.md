# 0x06. Nmap: Advanced Port Scans

## Description

This project explores the advanced functionalities of **Nmap (Network Mapper)**, going beyond simple port discovery. The focus is on understanding the mechanics of various scan types, service version detection, OS fingerprinting, and the power of the Nmap Scripting Engine (NSE). 

Mastering advanced Nmap techniques is essential for stealthy reconnaissance, identifying security misconfigurations, and performing initial vulnerability assessments during a penetration test or security audit.

## Key Concepts

### Stealth & Advanced Scanning Techniques
- **TCP SYN Scan (`-sS`):** The default "half-open" scan that is faster and more stealthy than a full TCP connect scan.
- **UDP Scan (`-sU`):** Identifying open UDP ports (DNS, SNMP, DHCP), which are often overlooked but critical for security.
- **Fin, Null, and Xmas Scans:** Utilizing non-standard TCP flag combinations to bypass basic stateless firewalls and filters.
- **Idle Scan (`-sI`):** A completely blind scan technique that uses a "zombie" host to mask the attacker's true IP address.

### Detection & Fingerprinting
- **Service Version Detection (`-sV`):** Probing open ports to determine what software and version are actually running (essential for vulnerability mapping).
- **OS Detection (`-sO`):** Analyzing TCP/IP stack responses to identify the target's operating system and kernel version.
- **Aggressive Scan (`-A`):** Combining OS detection, version detection, script scanning, and traceroute in one command.

### Nmap Scripting Engine (NSE)
- **Automating Tasks:** Using Lua-based scripts to automate tasks such as vulnerability detection, malware discovery, and advanced reconnaissance.
- **Script Categories:** Understanding `auth`, `broadcast`, `default`, `discovery`, `dos`, `exploit`, `external`, `fuzzer`, `intrusive`, `malware`, `safe`, `version`, and `vuln`.

### Evading Firewalls & IDS
- **Fragmentation (`-f`):** Splitting packets into smaller fragments to evade Intrusion Detection Systems (IDS).
- **Decoys (`-D`):** Mixing your IP address with multiple "decoy" IPs to hide the origin of the scan.
- **Source Port Spoofing (`--source-port`):** Crafting packets to appear as if they are coming from a trusted port (e.g., DNS port 53).

## Technical Stack

- **Primary Tool:** Nmap (Network Mapper)
- **Automation:** NSE (Nmap Scripting Engine)
- **Analysis:** Zenmap (GUI), Ndiff (Comparing scan results)
- **Supporting Tools:** Wireshark (for analyzing Nmap packet structures)

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x06. Nmap: Advanced Port Scans  
**Module**: Networking & Reconnaissance  
**Level**: Intermediate  
**Last Updated**: 2026
