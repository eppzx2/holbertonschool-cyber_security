-------------------------------------------------------------------------------
#1. OVERVIEW
-- Target Domain: holbertonschool.com
-- Method: Passive Recconnaissance
-- Tool: Shodan
-- Date: 25.12.2025

-------------------------------------------------------------------------------
#2. Discovered Subdomains 
-- apply.holbertonschool.com
-- read.holbertonschool.com
-- yriry2.holbertonschool.com

-------------------------------------------------------------------------------
#3. IP Adresses,     Subdomain,                 Port,     Isp,         ASN
-- 13.39.187.93  - apply.holbertonschool.com  - 80, 443 - Amazon.com - AS16509
-- 51.44.96.144  - apply.holbertonschool.com  - 80, 443 - Amazon.com - AS16509
-- 15.237.205.60 - apply.holbertonschool.com  - 80, 443 - Amazon.com - AS16509
-- 13.38.203.16  - apply.holbertonschool.com  - 80, 443 - Amazon.com - AS16509
-- 52.47.114.157 - read.holbertonschool.com   - 80, 443 - Amazon.com - AS16509
-- 52.47.143.83  - yriry2.holbertonschool.com - 80, 443 - Amazon.com - AS16509

-------------------------------------------------------------------------------
#4. Technologies and Frameworks
-- apply.holbertonschool.com  - nginx 1.20.0 - HTTP, HTTPS - SSL - AWS Provider
-- read.holbertonschool.com   - nginx 1.20.0 - HTTP, HTTPS - SSL - AWS Provider
-- yriry2.holbertonschool.com - nginx 1.21.6 - HTTP, HTTPS - SSL - AWS Provider

-------------------------------------------------------------------------------
#5. Observation
-- Multiple IP adresses are used for the same subdomain, indicating load balancing
-- Only standart web ports are exposed
-- Infrastructure is hosted entirely on AWS

-------------------------------------------------------------------------------
#6. CONCLUSION
-- This reconnaissance was conducted using SHODAN, relied on passive information gathering.
-- The analysis is providing visibility of IP, Provider, and technologies used by.

-------------------------------------------------------------------------------
