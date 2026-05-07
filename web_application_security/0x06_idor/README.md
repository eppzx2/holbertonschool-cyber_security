# 0x06. IDOR (Insecure Direct Object Reference)

## Description

This project explores **IDOR (Insecure Direct Object Reference)**, a type of access control vulnerability that occurs when an application uses user-supplied input to access objects directly without performing adequate authorization checks. This flaw allows attackers to bypass access controls and interact with data belonging to other users, such as personal profiles, private files, or financial records.

Understanding IDOR is fundamental for web security professionals, as it highlights the critical difference between **Authentication** (knowing who a user is) and **Authorization** (determining what a user is allowed to do).

## Key Concepts

### What is an IDOR?
- **Direct Object Reference:** When an internal implementation object (like a database primary key or a filename) is exposed in the URL or parameters (e.g., `?user_id=123`).
- **Insecure Reference:** When the application fails to verify if the person requesting `user_id=123` actually has permission to view that specific record.

### Common Identification Points
- **URL Parameters:** `https://example.com/api/v1/getInvoice?id=5540`
- **POST Body Parameters:** `{"account_number": "98765"}`
- **Cookies:** Using a cookie like `user_id=10` to track the session instead of a secure session token.
- **File Paths:** `https://example.com/download?file=report_10.pdf`

### Types of IDOR Attacks
- **Horizontal Privilege Escalation:** Accessing data of another user with the same level of privileges (e.g., User A viewing User B's private messages).
- **Vertical Privilege Escalation:** Accessing data or functions intended for higher-privileged users (e.g., a regular user modifying an admin’s profile).
- **Mass Enumeration:** Using automated scripts to cycle through IDs (e.g., 1001, 1002, 1003) to exfiltrate an entire database.

### Mitigation & Prevention
- **Indirect Reference Maps:** Using non-predictable, mapped values (like UUIDs or Hashes) instead of sequential database IDs.
- **Robust Access Control:** Implementing server-side checks for every single request to verify user ownership of the requested object.
- **Never Trust Client Input:** Always validating that the authenticated session user has the right to access the specific resource identifier provided in the request.

## Technical Stack

- **Tools:** Burp Suite (Proxy & Intruder), Firefox Multi-Account Containers
- **Environment:** PortSwigger Web Security Academy, OWASP Juice Shop, TryHackMe
- **Techniques:** Parameter Fuzzing, GUID/UUID analysis, Automated ID Cycling

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x06. IDOR  
**Module**: Web Application Security  
**Level**: Intermediate  
**Last Updated**: 2026
