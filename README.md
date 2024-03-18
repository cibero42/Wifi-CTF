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

### WPA3
 -

## Used equipment
 - 1x APU4C4 Router with OpenWRT

## Useful stuff
 - [How to Markdown](https://www.markdownguide.org/basic-syntax/#links)
 - [Kali Docs](https://www.kali.org/docs/)
