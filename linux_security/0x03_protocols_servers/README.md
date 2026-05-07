# 0x03. Protocols & Servers

## Description

This project dives into the fundamental networking protocols that power the internet and the server architectures that implement them. Understanding how data is exchanged between clients and servers is critical for identifying communication vulnerabilities and misconfigurations. 

Through this module, you will explore the inner workings of common protocols, analyze traffic patterns, and learn how to secure server environments against common network-based attacks.

## Key Concepts

### Network Protocols & Communication

- **TCP/IP Model:** Understanding the four-layer architecture (Link, Internet, Transport, Application) and data encapsulation.
- **HTTP/HTTPS:** The difference between cleartext and encrypted web traffic, SSL/TLS handshakes, and certificate management.
- **FTP vs. SFTP/SCP:** Why legacy protocols like FTP are insecure and how to transition to secure file transfer methods.
- **DNS (Domain Name System):** How domain resolution works and the risks of DNS spoofing or cache poisoning.

### Server Architectures

- **Web Servers:** Configuring and securing servers like **Apache** and **Nginx**.
- **Database Servers:** Understanding the communication between application layers and backend databases (MySQL, PostgreSQL).
- **SSH Servers:** Best practices for securing the OpenSSH daemon to prevent brute-force attacks.

### Protocol Vulnerabilities

- **Cleartext Exploitation:** Identifying sensitive data (passwords, cookies) in unencrypted traffic using packet sniffers.
- **Man-in-the-Middle (MITM):** How protocols can be intercepted and manipulated if not properly secured with encryption.
- **Banner Grabbing:** Techniques used by attackers to identify server versions and service types via protocol headers.

### Security Analysis Tools

- **Wireshark / TShark:** For deep packet inspection and traffic analysis.
- **Netcat (nc):** The "Swiss Army knife" for testing connectivity and manual protocol interaction.
- **Nmap:** Identifying open ports and the services (protocols) running on a remote host.

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x03. Protocols & Servers  
**Module**: Networking & Server Security  
**Level**: Intermediate  
**Last Updated**: 2026
