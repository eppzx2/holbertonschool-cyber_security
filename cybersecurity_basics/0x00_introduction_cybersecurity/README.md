# 🛡️ Cybersecurity Basics - 0x00 Introduction to Cybersecurity

## 📋 Project Overview

This project introduces fundamental cybersecurity concepts and tools through practical Bash scripting exercises on **Kali Linux**. Students will learn essential security operations including system information gathering, secure password generation, cryptographic validation, SSH key management, and process monitoring for security analysis.

**Project**: `0x00_introduction_cybersecurity`  
**Environment**: Kali Linux  
**Repository**: `holbertonschool-cyber_security`

## 🎯 Learning Objectives

After completing this project, you will be able to:

- 🔍 Gather system information for security assessments and environment validation
- 🔐 Generate cryptographically secure passwords using system entropy
- 🔒 Validate file integrity using SHA256 cryptographic hashes
- 🔑 Create and manage RSA SSH key pairs for secure authentication
- 👁️ Monitor and filter system processes for security analysis and incident response

## 📁 Project Structure

| Task | Script | Description | Key Tool |
|------|--------|-------------|----------|
| **0** | `0-release.sh` | System distributor identification | `lsb_release` |
| **1** | `1-gen_password.sh` | Cryptographically secure password generation | `/dev/urandom` |
| **2** | `2-sha256_validator.sh` | File integrity validation with SHA256 | `sha256sum` |
| **3** | `3-gen_key.sh` | RSA SSH key pair generation | `ssh-keygen` |
| **4** | `4-root_process.sh` | User process monitoring and filtering | `ps` |
