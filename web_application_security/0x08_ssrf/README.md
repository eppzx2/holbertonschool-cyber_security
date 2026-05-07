# 0x08. SSRF (Server-Side Request Forgery)

## Description

This project explores **Server-Side Request Forgery (SSRF)**, a vulnerability that allows an attacker to induce the server-side application to make requests to an unintended location. Often, SSRF targets internal systems that are protected by firewalls and are not accessible from the external network, such as internal databases, cloud metadata services, and administrative APIs.

Understanding SSRF is crucial for securing modern cloud-native applications and microservices architectures, where internal communication between services is a common practice.

## Key Concepts

### What is SSRF?
- **The Mechanism:** The attacker provides or modifies a URL which the server-side code reads and submits a request to.
- **Bypassing Perimeters:** Since the request originates from the trusted server itself, it can bypass firewalls and Access Control Lists (ACLs) to reach internal resources.

### Common Targets of SSRF
- **Internal Network Scanning:** Probing internal IP addresses (e.g., `192.168.1.x`, `10.0.0.x`) and ports to map the internal infrastructure.
- **Cloud Metadata Services:** Accessing sensitive cloud credentials and instance information (e.g., `http://169.254.169.254/latest/meta-data/` on AWS/Azure/GCP).
- **Loopback Access:** Accessing services running on the same server via `localhost` or `127.0.0.1` (e.g., an unauthenticated admin panel on port 8080).

### Types of SSRF
- **Basic SSRF:** The server returns data from the requested resource directly to the attacker.
- **Blind SSRF:** The server does not return any data in its response. The attacker must infer the result based on response time, HTTP status codes, or out-of-band (OOB) techniques (e.g., DNS/HTTP logs on an attacker-controlled server).

### Evasion & Bypass Techniques
- **IP Encoding:** Using decimal, octal, or hexadecimal versions of IP addresses to bypass string filters.
- **DNS Rebinding:** Utilizing a DNS record that switches between a safe IP and a target internal IP to trick the server's validation logic.
- **URL Schema Manipulation:** Using alternative schemas like `file:///etc/passwd`, `dict://`, or `gopher://` to interact with local files or different protocols.

### Mitigation & Prevention
- **Deny-listing:** Blocking requests to private IP ranges and sensitive hostnames (prone to bypasses).
- **Allow-listing:** The most secure method; only allowing requests to a strictly defined list of trusted domains or IPs.
- **Disabling Unused Schemas:** Only allowing `http` and `https` schemas if other protocols are not required.
- **Network Isolation:** Placing the web server in a isolated segment (DMZ) with no access to internal management APIs.

## Technical Stack

- **Tools:** Burp Suite (Repeater & Collaborator), cURL, Ffuf
- **Environment:** PortSwigger Web Security Academy, TryHackMe, OWASP Juice Shop
- **Cloud Specifics:** AWS/Azure/Google Cloud Metadata API structures

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x08. SSRF  
**Module**: Web Application Security  
**Level**: Advanced  
**Last Updated**: 2026
