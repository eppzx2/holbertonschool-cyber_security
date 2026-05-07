# 0x0C. Service Discovery & Log Analysis Script

## Description

This lightweight Bash script is designed for rapid log analysis during the **Detection & Analysis** phase of an incident response. It focuses on the `auth.log` file (typically found in `/var/log/auth.log` on Debian/Ubuntu systems) to identify which system services or processes are generating the most activity.

By automating the extraction and frequency analysis of service tags, this tool helps security analysts quickly identify brute-force attempts, unauthorized access patterns, or service misconfigurations.

## How it Works

The script utilizes a powerful pipe-lined command structure:

1. **`awk '{print $5}'`**: Extracts the 5th column from the log file, which contains the process/service name (e.g., `sshd`, `sudo`, `systemd`).
2. **`sort`**: Alphabetically sorts the extracted service names.
3. **`uniq -c`**: Counts the unique occurrences of each service, providing a frequency map.
4. **`sort -rn`**: Sorts the final count in descending numerical order, placing the most active services at the top.

## Use Cases

- **Brute-Force Detection:** Identifying a high volume of `sshd` entries which may indicate an active SSH brute-force attack.
- **Privilege Escalation Audit:** Monitoring the frequency of `sudo` or `su` commands.
- **System Health Check:** Finding services that are failing or restarting frequently.

## Usage

Ensure you have read permissions for the log file and run:
```bash
# To analyze a specific auth.log file
awk '{print $5}' /var/log/auth.log | sort | uniq -c | sort -rn
