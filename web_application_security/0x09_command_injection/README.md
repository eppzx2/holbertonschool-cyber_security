# 0x09. Command Injection

## Description

This project explores **Command Injection**, a critical vulnerability that occurs when an application passes unsafe user-supplied data (forms, cookies, HTTP headers, etc.) to a system shell. An attacker can leverage this flaw to execute arbitrary operating system commands on the server, potentially leading to a complete system compromise, data exfiltration, and unauthorized access to the internal network.

Mastering command injection is essential for understanding the dangers of improper input handling and the critical importance of keeping application logic separate from system-level execution.

## Key Concepts

### What is Command Injection?
- **The Mechanism:** The application takes user input and uses it as part of a command that is executed by the OS (e.g., using functions like `system()`, `exec()`, or `passthru()` in PHP, or `os.system()` in Python).
- **The Vulnerability:** Failing to sanitize or validate the input, allowing attackers to "break out" of the intended command using shell metacharacters.

### Common Injection Operators
Attackers use these characters to chain or manipulate commands:
- **`;` (Semicolon):** Executes the second command after the first (e.g., `ping 127.0.0.1 ; cat /etc/passwd`).
- **`&` and `&&` (AND):** Executes the second command if the first succeeds.
- **`|` and `||` (OR):** Pipes output or executes the second command if the first fails.
- **`` ` `` (Backticks) and `$()`:** Used for command substitution, executing a command inside another command.
- **`\n` (Newline):** Can sometimes bypass filters to start a new command.

### Types of Command Injection
- **In-Band (Direct):** The application returns the output of the executed command directly in the HTTP response.
- **Blind Command Injection:** The application does not return the output. Attackers must use other methods:
    - **Time-based:** Using commands like `sleep` to confirm execution based on response delay.
    - **Out-of-Band (OOB):** Forcing the server to make an external network request (e.g., `curl` or `nslookup`) to an attacker-controlled listener.

### Detection & Exploitation Techniques
- **Identification:** Finding input fields that interact with the system (e.g., network diagnostic tools, file converters, or system monitors).
- **Payload Crafting:** Bypassing simple filters (e.g., using `${IFS}` instead of spaces or using base64 encoding to hide malicious strings).
- **Reverse Shells:** Executing a command that forces the server to connect back to the attacker's machine, providing an interactive terminal.

### Mitigation & Prevention
- **Avoid System Calls:** Use built-in language APIs instead of executing shell commands (e.g., use `mkdir()` instead of `system("mkdir ...")`).
- **Input Validation:** Use strict allow-lists for permitted characters and formats.
- **Escape Shell Arguments:** Use functions like `escapeshellarg()` or `escapeshellcmd()` to properly sanitize input.
- **Principle of Least Privilege:** Run the web application under a low-privileged user account to limit the impact of a successful injection.

## Technical Stack

- **Tools:** Burp Suite, Netcat (for reverse shells), Curl, Python
- **Environment:** TryHackMe, PortSwigger Web Security Academy, DVWA (Damn Vulnerable Web App)
- **Common Targets:** PHP, Python, Node.js, and Bash-based web interfaces

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x09. Command Injection  
**Module**: Web Application Security  
**Level**: Advanced  
**Last Updated**: 2026
