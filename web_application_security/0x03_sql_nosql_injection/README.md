# 0x03. SQL & NoSQL Injection

## Description

This project explores the mechanics of injection vulnerabilities within database management systems. It covers the exploitation of traditional Relational Databases (SQL) and modern Document-Oriented Databases (NoSQL). The focus is on understanding how improper input sanitization allows attackers to manipulate queries, bypass authentication, and extract sensitive data.

Mastering these techniques is essential for both penetration testers and security analysts to identify, demonstrate, and mitigate one of the most persistent threats in the OWASP Top 10.

## Key Concepts

### SQL Injection (SQLi)
- **Classic SQLi:** Using `UNION` based techniques to extract data from multiple tables.
- **Error-Based SQLi:** Triggering database error messages to reveal information about the database structure.
- **Blind SQLi:** 
    - **Boolean-based:** Inferring data by observing changes in the application's response (True/False).
    - **Time-based:** Using database pause commands (e.g., `SLEEP`) to confirm the existence of a vulnerability based on response time.
- **Out-of-Band SQLi:** Forcing the database to make an external network request (e.g., DNS or HTTP) to exfiltrate data.

### NoSQL Injection
- **Syntax Manipulation:** Exploiting databases like **MongoDB** by injecting operator objects (e.g., `$gt`, `$ne`, `$regex`) into JSON queries.
- **Authentication Bypass:** Using logic operators to skip password checks in NoSQL-based login forms.
- **Data Exfiltration:** Using regular expressions to brute-force and extract field values character by character.

### Impact of Injection Attacks
- **Authentication Bypass:** Logging in as administrative users without a valid password.
- **Data Leakage:** Unauthorized access to PII (Personally Identifiable Information), credentials, and financial records.
- **Data Modification/Loss:** Using `UPDATE`, `DELETE`, or `DROP` commands to corrupt or destroy database integrity.

### Mitigation & Prevention
- **Prepared Statements:** Using parameterized queries to separate code from data.
- **Input Validation:** Implementing strict allow-lists for user-supplied input.
- **Principle of Least Privilege:** Running database services with minimal necessary permissions to limit the scope of a potential breach.

## Technical Stack

- **Databases:** MySQL, PostgreSQL, SQLite (SQL); MongoDB (NoSQL)
- **Tools:** Burp Suite, SQLmap, Python (for custom exploit scripts)
- **Environment:** OWASP Juice Shop, PortSwigger Web Security Academy

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x03. SQL & NoSQL Injection  
**Module**: Web Application Security  
**Level**: Advanced  
**Last Updated**: 2026
