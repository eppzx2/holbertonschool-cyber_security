# PowerShell Transcription Log Exploitation — Writeup

**Sistem:** DESKTOP-V9578RL (Windows 10 Pro)
**Mövzu:** PowerShell Transcription Logs vasitəsilə Privilege Escalation

---

## 1. Giriş — Transcription Mühitinin Anlaşılması

Sistemdə Group Policy vasitəsilə PowerShell Transcription aktiv edilmişdi:

```
Registry Path: HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription
EnableTranscripting    : 1
OutputDirectory        : C:\Users\Student\Documents\PowerShell
EnableInvocationHeader : 1
```

Bu konfiqurasiya sistemdə icra olunan **hər bir PowerShell sessiyasının** (kim tərəfindən, hansı hesabla, hansı komandaların icra olunduğunun) avtomatik olaraq mətn faylı şəklində qeydə alınmasını təmin edir.

---

## 2. Transkript Fayllarının Aşkarlanması

`OutputDirectory`-ə əsasən aşağıdakı yerdə tarix-əsaslı alt qovluqlarla təşkil olunmuş transkript arxivi tapıldı:

```
C:\Users\Student\Documents\PowerShell\
├── 20240815\
├── 20250102\
├── 20250211\
└── 20260718\
```

Hər fayl `PowerShell_transcript.<HOSTNAME>.<RandomID>.<Timestamp>.txt` formatındadır və hər sessiya üçün ayrıca yaradılır.

---

## 3. Privilege Escalation Analizi — Tapılan İz

`20240815` qovluğundakı `...m9JnuBnY.20240815122325.txt` faylında **SuperAdministrator** hesabı adından icra olunan aşağıdakı komanda ardıcıllığı aşkarlandı:

```powershell
PS C:\Windows\system32> (Get-PSReadLineOption).HistorySavePath
C:\Users\SuperAdministrator\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt

PS C:\Windows\system32> cp C:\Users\SuperAdministrator\AppData\Roaming\...\ConsoleHost_history.txt `
    C:\Users\Student\AppData\Roaming\...\ConsoleHost_history.txt

PS C:\Windows\system32> $passwd = ConvertTo-SecureString "Stud1337Password@123" -AsPlainText -Force
PS C:\Windows\system32> Set-LocalUser -Name SuperAdministrator -Password $passwd
```

### Baş verənlərin izahı:

1. **Parolun açıq mətndə ifşası:** `SuperAdministrator` hesabının yeni parolu (`Stud1337Password@123`) `ConvertTo-SecureString ... -AsPlainText` komandası ilə **açıq mətn** kimi daxil edilib. Transcription aktiv olduğu üçün bu, avtomatik olaraq log faylına yazılıb — normalda gizli qalmalı olan məlumat beləliklə fayl sistemində oxuna bilən şəkildə qalıb.

2. **Command history-nin köçürülməsi:** `SuperAdministrator`-ın komanda tarixçəsi (`ConsoleHost_history.txt`) qəsdən aşağı səlahiyyətli `Student` istifadəçisinin profilinə **kopyalanıb**. Bu, faktiki olaraq imtiyazlı hesabın fəaliyyət izini adi istifadəçiyə "təhvil vermək" deməkdir.

3. **Nəticə:** `Student` istifadəçisi transkript/history fayllarını oxumaqla `SuperAdministrator`-un parolunu əldə etdi və bu parolla sistemə **SuperAdministrator** kimi giriş edərək hüquqlarını yüksəltdi (privilege escalation).

Bu, MITRE ATT&CK çərçivəsinə görə **T1552 (Unsecured Credentials)** və **T1078 (Valid Accounts)** texnikalarına uyğun gəlir.

---

## 4. Gizli Flag-ın Tapılması

Aşkar edilmiş parol (`Stud1337Password@123`) ilə `SuperAdministrator` hesabına giriş edildikdən sonra flag həmin sessiyada tapıldı.

---

## 5. Metodologiya (İstifadə Olunan Əsas Komandalar)

```powershell
# Konfiqurasiyanı yoxlamaq
Get-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription"

# Transkript fayllarını tapmaq
Get-ChildItem -Path "C:\Users\Student\Documents\PowerShell" -Recurse -Force

# Şübhəli açar sözləri axtarmaq
Select-String -Path <fayllar> -Pattern "password|SuperAdministrator|RunAs User" -Context 3,3

# Parolla giriş
runas /user:DESKTOP-V9578RL\SuperAdministrator powershell
```

---

## 6. PowerShell Transkriptlərinin Əhəmiyyəti

### Müdafiə (Blue Team) baxımından — nə üçün faydalıdır:
- **Tam audit izi:** Hər PowerShell sessiyasının kim, nə vaxt, hansı maşında və hansı komandaları icra etdiyini qeyd edir — insident təhqiqatı (forensics) üçün əvəzsizdir.
- **Anomaliya aşkarlanması:** Adi olmayan komandalar (`Set-ExecutionPolicy bypass`, `whoami /priv`, `net localgroup administrators`) transkriptlərdə asanlıqla görünür və erkən xəbərdarlıq siqnalı ola bilər.
- **Uyğunluq (Compliance):** Bir çox tənzimləyici çərçivə (PCI-DSS, HIPAA və s.) inzibati fəaliyyətlərin loglanmasını tələb edir; transcription bunu sistem səviyyəsində təmin edir.

### Hücum (Red Team) / risk baxımından — nə üçün təhlükəli ola bilər:
- **Həssas məlumatın sızması:** Əgər istifadəçilər parolları, API açarlarını və ya token-ləri açıq mətn şəklində komanda sətrində yazırlarsa (necə ki bu tapşırıqda `ConvertTo-SecureString -AsPlainText` ilə oldu), bu məlumat **birbaşa transkript faylında saxlanılır**.
- **Fayl icazələri kritikdir:** Əgər transkript qovluğuna aşağı səlahiyyətli istifadəçilərin oxuma icazəsi varsa (məsələn defolt `Documents` qovluğu), onlar bu fayllardan imtiyazlı hesabların məlumatlarını oxuya bilər — məhz bu ssenaridə baş verdiyi kimi.
- **Nəticə:** Transcription özü təhlükəsizlik aləti olsa da, **düzgün qorunmadıqda** (fayl icazələri, mərkəzləşdirilmiş/uzaqdan saxlama olmadan) o, əksinə hücumçular üçün etibar məlumatlarının mənbəyinə çevrilə bilər.

### Tövsiyələr:
1. Transkript qovluqlarına yalnız administratorların yazma/oxuma icazəsi olmalıdır (Student kimi adi istifadəçilər deyil).
2. Transkriptlər mərkəzi, təhlükəsiz log serverinə (SIEM) real vaxtda göndərilməlidir, lokal diskdə saxlanılmamalıdır.
3. Skriptlərdə heç vaxt parol/token açıq mətn şəklində istifadə edilməməlidir — `Get-Credential`, Secret Management modulları və ya Vault həlləri istifadə olunmalıdır.
4. `ConsoleHost_history.txt` fayllarına da eyni səviyyədə diqqət yetirilməlidir, çünki onlar da transkript kimi həssas məlumat sızdıra bilər.

---

**Nəticə:** Bu lab, PowerShell Transcription-un ikili təbiətini göstərir — güclü audit aləti olsa da, düzgün qorunmadıqda özü də bir hücum vektoruna çevrilə bilər.
