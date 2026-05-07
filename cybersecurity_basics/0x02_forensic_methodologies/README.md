# 0x02. Forensic Methodologies

## Description

This project introduces the standardized procedures and methodologies used in Digital Forensics and Incident Response (DFIR). The focus is on the scientific approach to identifying, preserving, extracting, and documenting digital evidence from various sources while maintaining the chain of custody.

Understanding forensic methodologies is essential for ensuring that digital evidence remains admissible in a court of law and for accurately reconstructing the timeline of a security breach.

## Key Concepts

### The Forensic Process
1. **Identification:** Recognizing potential sources of evidence (hard drives, volatile memory, cloud logs).
2. **Preservation:** Ensuring data integrity by preventing any changes to the original media (using Write Blockers).
3. **Analysis:** Using specialized tools to extract and interpret data from the acquired images.
4. **Documentation & Reporting:** Creating a detailed record of every action taken during the investigation.

### Order of Volatility
Understanding which data disappears first is critical:
- **CPU Cache & Registers** (Most volatile)
- **Routing Table, ARP Cache, Process Table, RAM**
- **Temporary File Systems**
- **Disk / Fixed Storage**
- **Remote Logging & Monitoring Data** (Least volatile)

### Chain of Custody
- Maintaining a chronological documentation that records the sequence of custody, control, transfer, and analysis of physical or electronic evidence. Any break in this chain can invalidate the evidence.

### Integrity & Hashing
- **MD5, SHA-1, and SHA-256:** Using cryptographic hashes to verify that the forensic image is an identical copy of the original source. If the hash changes, the evidence is compromised.

### Forensic Imaging
- **Live Acquisition:** Collecting data from a powered-on system (critical for RAM).
- **Dead Acquisition:** Collecting data from a powered-off system (best for disk integrity).
- **Tools:** `dd`, `dc3dd`, `FTK Imager`, and `Guymager`.

## Technical Stack

- **Evidence Acquisition:** FTK Imager, dd
- **Memory Forensics:** Volatility Framework
- **Disk Analysis:** Autopsy, Sleuth Kit (TSK)
- **Hash Verification:** md5sum, sha256sum

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x02. Forensic Methodologies  
**Module**: Digital Forensics & Incident Response  
**Level**: Intermediate  
**Last Updated**: 2026
