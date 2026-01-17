# 0x04 Nmap Live Hosts Discovery

This project contains Bash scripts for discovering live hosts on a network using different scanning techniques with Nmap.

## Description

Live host discovery is a fundamental step in network reconnaissance. This project implements various scanning techniques to detect online machines on a given network, each adapted to different scenarios and network environments.

## Available Scripts

### 0-arp_scan.sh
**ARP Ping Scan**
```bash
./0-arp_scan.sh <target>
```
- Uses ARP requests to discover hosts on the local network
- Very effective on local networks (same subnet)
- Nmap option: `-sn -PR`

### 1-icmp_echo_scan.sh
**ICMP Echo Scan**
```bash
./1-icmp_echo_scan.sh <target>
```
- Sends ICMP Echo Request packets (traditional ping)
- Works well if ICMP is not blocked by firewalls
- Nmap option: `-sn -PE`

### 2-icmp_timestamp_scan.sh
**ICMP Timestamp Scan**
```bash
./2-icmp_timestamp_scan.sh <target>
```
- Uses ICMP Timestamp requests
- Alternative when Echo Requests are blocked
- Nmap option: `-sn -PP`

### 3-icmp_address_mask_scan.sh
**ICMP Address Mask Scan**
```bash
./3-icmp_address_mask_scan.sh <target>
```
- Sends ICMP Address Mask requests
- Can bypass certain ICMP restrictions
- Nmap option: `-sn -PM`

### 4-tcp_syn_ping.sh
**TCP SYN Ping**
```bash
./4-tcp_syn_ping.sh <target>
```
- Sends TCP SYN packets to ports 22, 80, 443
- Effective when ICMP is blocked
- Nmap option: `-sn -PS22,80,443`

### 5-tcp_ack_ping.sh
**TCP ACK Ping**
```bash
./5-tcp_ack_ping.sh <target>
```
- Sends TCP ACK packets to ports 22, 80, 443
- Can bypass certain stateless firewalls
- Nmap option: `-sn -PA22,80,443`

### 6-udp_ping_scan.sh
**UDP Ping Scan**
```bash
./6-udp_ping_scan.sh <target>
```
- Sends UDP packets to ports 53, 161, 162
- Useful when TCP and ICMP are blocked
- Nmap option: `-sn -PU53,161,162`
