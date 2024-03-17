# Wireless Hack The Flag
**Télécom SudParis NET4104**

This project aims to teach the common Wi-Fi vunerabilites, using a cool Hack The Flag game.
You can find all instructions and explanations [here](https://github.com/l4ti/TSP-NET4104-HackTheFlag/blob/main/REPORT.md) and all automation attack shell scripts can be found [here](https://github.com/l4ti/TSP-NET4104-HackTheFlag/blob/main/scripts)


## Members
 - Renato DE CASTRO FERREIRA
 - Sarra KOSSENTINI
 - Mayssa AYACHI
 - Mohamed Amine KHLIF

## Objective
 - Set-up configuration
 - Explain attacks using Kali Linux (tbd, around 5)
 - Automation of cited attacks (Shell Scripts)
 - Step-by-step flag capturing

## Known vunerabilities
### OPEN
 - [Network Eavesdropping](https://www.fortinet.com/resources/cyberglossary/eavesdropping)
	 + Man in the middle attack: an attacker intercepts and possibly alters communication between two parties without their knowledge. This can be done using tools like Wireshark or Ettercap.
	 + Packet Sniffing: it involves the capturing and analysis of data packets transmitted over a network. 
	 + Evil Twin Attack: the attacker sets up a rogue wireless access point with a name (SSID) similar to a legitimate access point. Users unknowingly connect to the rogue access point, allowing the attacker to intercept their traffic and potentially perform various attacks.
- Rogue Access Point Attack: A rogue access point attack involves the installation of unauthorized wireless access points on a network. These access points can be used to intercept traffic, launch attacks, or provide unauthorized access to the network.
- DNS Spoofing Attack: DNS spoofing involves manipulating DNS responses to redirect users to malicious websites.
- Session Hijacking Attack: Session hijacking involves stealing or impersonating a user's session identifier to gain unauthorized access to their accounts or services. 
 

### WEP
 - [Fluhrer, Mantin and Shamir - FMS](https://en.wikipedia.org/wiki/Fluhrer,_Mantin_and_Shamir_attack)
 - [Pyshkin, Tews, and Weinmann - PTW](https://eprint.iacr.org/2007/120.pdf)

### WPA
 - 

### WPA2
 - [KRACK](https://www.enisa.europa.eu/publications/info-notes/an-overview-of-the-wi-fi-wpa2-vulnerability)

### WPA3
 - [Dragonblood vulnerabilities](https://www.zdnet.com/article/dragonblood-vulnerabilities-disclosed-in-wifi-wpa3-standard/) : In total, five vulnerabilities are part of the Dragonblood ensemble --a denial of service attack, two downgrade attacks, and two side-channel information leaks.
While the denial of service attack is somewhat unimportant as it only leads to crashing WPA3-compatible access points, the other four are the ones that can be used to recover user passwords.
	 + [Full paper](https://papers.mathyvanhoef.com/dragonblood.pdf)
	 + [How to launch the attacks](https://github.com/neildalal/wpa3-attacks-ids#Overview)
 

## Used equipment
 - 1x APU4C4 Router with OpenWRT

## Useful stuff
 - [How to Markdown](https://www.markdownguide.org/basic-syntax/#links)
 - [Kali Docs](https://www.kali.org/docs/)
