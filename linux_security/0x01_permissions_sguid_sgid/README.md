# 0x01. Permissions, SUID & SGID

## Description

This project explores the Linux permission system in depth, with a particular focus on special permissions (SUID, SGID, and Sticky Bit). Through a series of Bash scripts, you will learn how to manage users, groups, and manipulate permissions to secure and audit a Linux system.

Special permissions provide an advanced control layer beyond basic permissions (read, write, execute). They enable granular privilege management and are essential for the security of multi-user systems.

## Key Concepts

### Linux Special Permissions

#### SUID (Set User ID)
- Bit 4000  
- Applied to an executable file  
- Allows execution with the privileges of the **file owner**  
- Representation: `s` in user permissions (e.g. `-rwsr-xr-x`)  
- Use case: `/usr/bin/passwd`, which must modify `/etc/shadow` (a root-owned file)  
- **Security risk**: Privilege escalation if the program is vulnerable  

#### SGID (Set Group ID)
- Bit 2000  
- **On a file**: Execution with the privileges of the **group** owner  
- **On a directory**: New files inherit the group of the parent directory  
- Representation: `s` in group permissions (e.g. `-rwxr-sr-x`)  
- Use case: Collaborative directories where all files must belong to the same group  

#### Sticky Bit
- Bit 1000  
- Applies only to **directories**  
- Restricts deletion: only the file owner can delete their files  
- Representation: `t` in other permissions (e.g. `drwxrwxrwt`)  
- Use case: `/tmp`, where multiple users create temporary files  
