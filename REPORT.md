# Plan 
1.Introduction (Sarra & Mayssa) \
2.Vulnerabilities \
2.1. Eavsdropping (Sarra & Mayssa) \
2.1.1 Definition \
2.1.2 Kali Linux \
2.2 Brute Force (Amine) \
2.3 Rainbow Table (Sarra & Mayssa) \
2.4 Evil Twin  (Amine) \
2.5 DragonBlood (Renato) \
2.5.1 Definition \
2.5.2 Fixes \
3.Capture the flag \
3.1 Architecture (Renato) \
3.2 Configuration \
3.2.1 Router (Renato) \
3.2.2 OPEN Clients (Amine & Renato) \
3.2.3 WPA2 Clients (Sarra & Mayssa) \
3.2.4 WPA3 Clients (Renato) \
3.3. How to Hack (Renato) \
4. Conclusion (Amine) \





OPEN wifi

Open WiFi networks are wireless networks in which traffic is not secured or encrypted, users can connect without authentication. They are often found in public places. They are not secured so they pose significant security risks.

Eavesdropping attacks involve the unauthorized interception of communication between two parties from which the attacker gains access to sensitive information.

There are many types of eavesdropping attacks:

    Physical Eavesdropping: This involves directly accessing communication lines or physical devices to intercept data. For example, attackers might tap into telephone lines or place listening devices (bugs) in physical locations to capture conversations.

    Network Eavesdropping: In network eavesdropping attacks, attackers intercept data transmitted over a network. This can be done by capturing and analyzing network traffic using packet sniffing tools. Attackers can monitor wireless transmissions to capture sensitive information or launch other types of attacks, such as session hijacking or Man-in-the-Middle attacks.
    
Forms of eavesdropping attacks: 

    Man-in-the-Middle (MitM) Attacks: In a MitM attack, the attacker intercepts communication between two parties, allowing them to eavesdrop on the conversation or manipulate the transmitted data.

    Packet Sniffing: Packet sniffing involves capturing and analyzing data packets transmitted over a network. Attackers can use packet sniffers to eavesdrop on sensitive information, such as login credentials or personal messages.

    Evil Twin Attacks: In an Evil Twin attack, the attacker sets up a rogue access point with the same SSID as a legitimate WiFi network. Users unknowingly connect to the rogue access point, allowing the attacker to intercept their traffic and potentially eavesdrop on their communication.


# 1 INTRODUCTION
**(Sarra & Mayssa)**

# 2 VULNERABILITIES
## 2.1 Eavsdropping
### 2.1.1 Definition
**(Sarra & Mayssa)**

### 2.1.2 Attack Implementation
**(Sarra & Mayssa)**

## 2.2 Brute Force
### 2.2.1 Definition
**(Amine)**

### 2.2.2 Attack Implementation
**(Amine)**

## 2.3 Rainbow Table
### 2.3.1 Definition
**(Sarra & Mayssa)**

### 2.3.2 Attack Implementation
**(Sarra & Mayssa)**

## 2.4 Evil Twin
### 2.4.1 Definition
**(Amine)**

### 2.4.2 Attack Implementation
**(Amine)**

## 2.5 DragonBlood
### 2.5.1 Definition
**(Renato)**

### 2.5.2 Fixes
**(Renato)**

# 3 CAPTURE THE FLAG
## 3.1 Requirements
The hardware requirements for the Capture the Flag competition are relatively straightforward:
- **Router:** It should include firewall capabilities, support the creation of multiple Wi-Fi networks, and have WPA2/WPA3 encryption enabled.
- **Clients:** Four Raspberry Pi devices or computers running the Raspberry Pi OS, each equipped with WPA2/WPA3 compatible network cards.

To streamline the setup process for the competition, it is advisable to utilize OpenWrt. Below, we outline a step-by-step configuration guide (section 3.3.1) for implementing OpenWrt.

## 3.2 Architecture
The competition's infrastructure comprises three wireless networks employing different levels of security: no-encryption, WPA2-PSK, and WPA3-SAE. These technologies were selected based on their prevalence in wireless networks as of 2024.

The deployment of an open wireless network serves as a distractor, intentionally devoid of any relevant information leading to the flag. However, this network generates significant traffic from a single client, adding to the challenge for participants. Introducing distractions enhances the competition's complexity, as the winner is determined by a timely manner.

Within the WPA2 network, two clients engage in HTTP traffic, simulating an unencrypted chat application. At a certain point in the conversation, one of the clients inadvertently reveals the WPA3 password.

Inside the WPA3 network, a single client is connected, generating minimal traffic as possible. This client has a weak SSH password, and the flag is concealed within its files, encoded in base64. Upon gaining access to the WPA3 network, participants must locate and infiltrate this client, decipher the message within the unidentified flag file, and successfully obtain the flag.

## 3.3 Configuration
### 3.3.1 Router
**(Renato)**

### 3.3.2 OPEN Clients
**(Amine)**

### 3.3.3 WPA2 Clients
**(Sarra & Mayssa)**

### 3.3.4 WPA3 Clients
**(Renato)**

## 3.4 Getting The Flag
**(Renato)**

# 4 CONCLUSION
**(Amine)**