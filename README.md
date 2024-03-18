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
 -Brute Force Attack: An attacker attempts to guess the Wi-Fi passphrase by trying numerous combinations of characters until the correct one is found. This can be done using specialized software like Aircrack-ng or Hashcat.
 How to do it using Kali Linux ?
     Tool: Aircrack-ng
    Description: Aircrack-ng is a suite of tools used for auditing wireless networks. It includes tools for capturing packets, performing dictionary and brute force attacks on WPA/WPA2 handshakes, and analyzing the results.
    Usage: Use the aircrack-ng command along with captured handshake files and a wordlist for performing brute force attacks on WPA passphrases.
 
 -Dictionary Attack: Similar to a brute force attack, but instead of trying all possible combinations, the attacker uses a pre-existing list of commonly used passwords (dictionary) to attempt to guess the passphrase.
 How to do it using Kali Linux ?
     Tool: Aircrack-ng (with Crunch)
    Description: Crunch is a wordlist generator that can be used to create custom wordlists for dictionary attacks. Aircrack-ng can then be used to perform the dictionary attack on captured WPA/WPA2 handshakes.
    Usage: Generate a wordlist using Crunch and then use Aircrack-ng to perform the dictionary attack.
    
 -Evil Twin Attack: While WPA provides encryption, it doesn't prevent the creation of rogue access points. An attacker can set up an evil twin access point with the same SSID as the legitimate network, tricking users into connecting to it and revealing their passphrase.
 How to do it using Kali Linux ?
     Tool: Fluxion
    Description: Fluxion is a tool for creating rogue access points and conducting man-in-the-middle attacks on Wi-Fi networks. It automates the process of setting up an evil twin access point and capturing login credentials.
    Usage: Launch Fluxion and follow the interactive menu to create a rogue access point with the same SSID as the target network.
 
 -Rainbow Table Attack: Rainbow tables are precomputed tables used for reversing cryptographic hash functions, such as those used to secure WPA passphrases. Attackers can use rainbow tables to quickly find the passphrase corresponding to a captured WPA handshake.
 How to do it using Kali Linux ?
     Tool: Cowpatty
    Description: Cowpatty is a WPA/WPA2 handshake capture and brute force tool that can utilize precomputed hash tables (rainbow tables) for faster passphrase recovery.
    Usage: Capture a WPA handshake using tools like Airodump-ng, and then use Cowpatty along with a rainbow table to crack the passphrase.

### WPA2
 - [KRACK](https://www.enisa.europa.eu/publications/info-notes/an-overview-of-the-wi-fi-wpa2-vulnerability)
 - [KRACK - Key Reinstallation Attacks: Forcing Nonce Reuse in WPA2](https://www.youtube.com/watch?v=fOgJswt7nAc)
 - [Explaining the KRACK Vulnerability](https://www.youtube.com/watch?v=q7KYoyNw7Ss)
 - [Krack Attacks (WiFi WPA2 Vulnerability) - Computerphile](https://www.youtube.com/watch?v=mYtvjijATa4&t=122s)
 - [Protocoles de sécurité sans-fil WPA WPA2 et WPA3](https://cisco.goffinet.org/ccna/wlan/protocoles-securite-sans-fil-wpa-wpa2-wpa3)

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
