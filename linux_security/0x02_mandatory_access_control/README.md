# 0x02. Mandatory Access Control (MAC)

## Description

This project explores Mandatory Access Control (MAC) mechanisms in Linux, specifically focusing on SELinux (Security-Enhanced Linux) and AppArmor. Unlike Discretionary Access Control (DAC), which relies on file ownership, MAC enforces security policies at the kernel level to restrict the capabilities of processes and users based on defined security contexts.

Implementing MAC is a crucial step in system hardening, as it provides an additional layer of defense that can prevent compromised applications from accessing unauthorized parts of the system, even if they are running with root privileges.

## Key Concepts

### Mandatory Access Control (MAC) vs DAC
- **DAC (Discretionary Access Control):** Access is based on user identity and permissions (rwx). The owner can change permissions.
- **MAC (Mandatory Access Control):** Access is governed by a central security policy. Even the owner or root must comply with the policy.

### SELinux (Security-Enhanced Linux)
- **Security Contexts:** Files, processes, and users are labeled with a context (`user:role:type:level`).
- **Modes:**
  - **Enforcing:** Policy is enforced, and unauthorized access is blocked.
  - **Permissive:** Policy is not enforced, but violations are logged (useful for debugging).
  - **Disabled:** SELinux is completely turned off.
- **Booleans:** On/off switches that allow changing SELinux policy at runtime without writing new rules.

### AppArmor
- **Profile-Based:** Focuses on restricting individual programs (e.g., Apache, MySQL) via profiles.
- **Modes:**
  - **Enforcement:** Restricts access based on the profile.
  - **Complain:** Logs policy violations but does not stop them.
- **Path-Based:** Unlike SELinux (label-based), AppArmor uses file paths to identify objects.

### Security Auditing & Troubleshooting
- **Audit Logs:** Analyzing `/var/log/audit/audit.log` or `/var/log/messages` to identify MAC denials.

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x02. Mandatory Access Control  
**Module**: Linux Security  
**Level**: Intermediate  
**Last Updated**: 2026
