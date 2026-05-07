# 0x04. Content Discovery

## Description

This project focuses on the techniques and methodologies used to uncover hidden content on web servers that is not intended for public viewing. Content discovery is a critical phase of reconnaissance, as it often leads to the identification of backup files, administrative panels, configuration files, and unlinked development directories.

By mastering both automated and manual discovery methods, you will learn how to map the full attack surface of a web application and identify potential entry points that standard crawling might miss.

## Key Concepts

### Automated Discovery (Fuzzing)
- **Directory Brute-forcing:** Using wordlists to guess common directory names (e.g., `/admin`, `/backup`, `/config`).
- **File Enumeration:** Searching for specific file extensions that might contain sensitive data (e.g., `.php`, `.sql`, `.env`, `.old`, `.bak`).
- **Recursive Scanning:** Automatically diving deeper into discovered directories to find nested content.

### Manual Discovery
- **Robots.txt:** Analyzing the instructions meant for search engine crawlers to find directories they are explicitly told to ignore.
- **Sitemap.xml:** Reviewing the map of the website intended for search engines to identify all public-facing pages.
- **HTTP Headers:** Checking headers like `X-Powered-By` or `Server` for version information and potential clues about the backend structure.
- **Source Code Analysis:** Reviewing HTML/JavaScript comments for hidden links, developer notes, or API endpoints.

### OSINT (Open Source Intelligence)
- **Google Dorking:** Using advanced search operators (e.g., `site:target.com filetype:log`) to find indexed sensitive information.
- **Wayback Machine:** Exploring historical versions of a website to find pages or files that have been "deleted" but are still archived.
- **GitHub Recon:** Searching public repositories for leaked source code or configuration files belonging to the target organization.

### Subdomain Enumeration
- Finding subdomains (e.g., `dev.target.com`, `staging.target.com`) which often have weaker security controls than the main production site.

## Technical Stack

- **Tools:** GoBuster, Dirbuster, ffuf (Fuzz Faster U Fool), Wfuzz
- **Wordlists:** SecLists (Discovery category), directory-list-2.3-medium
- **Recon:** Google Hacking Database (GHDB), Waybackpack

---

**Repository**: holbertonschool-cyber_security  
**Project**: 0x04. Content Discovery  
**Module**: Web Application Security  
**Level**: Intermediate  
**Last Updated**: 2026
