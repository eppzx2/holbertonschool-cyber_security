# 0x07. File Inclusion

## Description

This project explores **File Inclusion** vulnerabilities, which occur when a web application allows users to influence the path of a file that is executed or rendered on the server. This module covers both **Local File Inclusion (LFI)** and **Remote File Inclusion (RFI)**, demonstrating how improper input validation can lead to sensitive data exposure, source code leakage, and Remote Code Execution (RCE).

Mastering file inclusion techniques is vital for understanding how backend file systems interact with web interfaces and how to implement secure coding practices to prevent unauthorized file access.

## Key Concepts

### Local File Inclusion (LFI)
- **Directory Traversal:** Using sequences like `../../` to escape the web root and access sensitive system files (e.g., `/etc/passwd`, `C:\Windows\win.ini`).
- **Log Poisoning:** Injecting malicious code into server logs (like Apache or SSH logs) and then including those logs via an LFI vulnerability to achieve RCE.
- **PHP Wrappers:** Using specialized wrappers like `php://filter` to encode source code in Base64, allowing attackers to read protected `.php` files without executing them.

### Remote File Inclusion (RFI)
- **External Payload Execution:** Including a file hosted on a remote, attacker-controlled server (e.g., `http://attacker.com/shell.txt`).
- **RCE via RFI:** If the server's configuration (like `allow_url_include` in PHP) allows it, the remote file is executed in the context of the vulnerable application, granting the attacker full control.

### Common Bypass Techniques
- **Null Byte Injection:** Using `%00` to terminate a file path string and bypass fixed extension checks (older versions of PHP).
- **Encoding:** Using URL encoding, double encoding, or UTF-8 sequences to bypass basic security filters.
- **Path Normalization:** Exploiting how different operating systems and web servers interpret redundant slashes or dots in a path.

### Mitigation & Prevention
- **Avoid Direct Input:** Never pass user-supplied input directly to file system APIs.
- **Allow-listing:** Using a strictly defined list of files that are permitted to be included.
- **Filesystem Permissions:** Running the web server with the least privilege to limit access to sensitive system directories.
- **Secure Configuration:** Disabling dangerous settings like `allow_url_include` and `allow_url_fopen`.

## Technical Stack

- **Tools:** Burp Suite, FFuf (for path discovery), Curl
- **Wrappers:** php://filter, php://input, data://
- **Environment:** TryHackMe, PortSwigger Web Security Academy, DVWA

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x07. File Inclusion  
**Module**: Web Application Security  
**Level**: Advanced  
**Last Updated**: 2026
