# 0x03. Cryptography Basics

## Description

This project explores the fundamental principles of cryptography and its essential role in securing information. It covers the evolution of encryption from classical ciphers to modern cryptographic algorithms, focusing on how data confidentiality, integrity, and authenticity are maintained in digital communications.

By completing this module, you will understand the mathematical foundations of encryption and learn how to apply cryptographic techniques to protect sensitive data from unauthorized access.

## Key Concepts

### Core Pillars of Information Security (CIA)
- **Confidentiality:** Ensuring that only authorized parties can read the data (Encryption).
- **Integrity:** Ensuring that data has not been altered during transit (Hashing).
- **Authenticity/Non-repudiation:** Proving the identity of the sender and ensuring they cannot deny sending the message (Digital Signatures).

### Types of Cryptography
- **Symmetric Encryption:** Using a single shared key for both encryption and decryption (e.g., AES, DES). Fast and efficient for bulk data.
- **Asymmetric Encryption (Public Key):** Using a pair of keys—a **Public Key** for encryption and a **Private Key** for decryption (e.g., RSA, ECC).
- **Hashing:** One-way functions that generate a fixed-size string (fingerprint) from data (e.g., SHA-256, MD5). Used for integrity checks.

### Protocols & Applications
- **SSL/TLS:** How cryptography secures web traffic (HTTPS).
- **Public Key Infrastructure (PKI):** The system of digital certificates and Certificate Authorities (CAs) that manage trust.
- **SSH & PGP:** Practical applications of asymmetric encryption for secure remote access and email communication.

### Common Attacks on Cryptography
- **Brute Force:** Attempting every possible key until the correct one is found.
- **Dictionary Attacks:** Using a pre-defined list of likely passwords or keys.
- **Rainbow Tables:** Using pre-computed tables of hash values to reverse a hash.

## Technical Stack

- **Tools:** OpenSSL, GnuPG (GPG), Hashcat
- **Algorithms:** AES-256, RSA, SHA-256, Diffie-Hellman
- **Analysis:** Cryptool, CyberChef

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x03. Cryptography Basics  
**Module**: Cybersecurity Foundations  
**Level**: Beginner  
**Last Updated**: 2026
