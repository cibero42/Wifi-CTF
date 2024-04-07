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
In April 2019, Mathy Vanhoef and Eyal Ronen published a paper titled "Dragonblood: Analyzing the Dragonfly Handshake of WPA3 and EAP-pwd," which exposed five vulnerabilities in the WPA3 protocol. Despite being heralded as "unbreakable" upon its release by the Wi-Fi Alliance, these vulnerabilities shed light on potential weaknesses in the protocol, particularly in its Dragonfly handshake mechanism. For the purpose of this Capture the Flag competition, this report will focus on the vulnerabilities related to the Dragonfly handshake, omitting discussion of EAP-pwd as enterprise networks are not within the scope.

1. **Downgrade Attack Against WPA3-Transition:** This attack exploits the transition mode defined in the WPA3 specification, where a Wi-Fi network supports both WPA3 and WPA2 with the same password. An adversary can set up a rogue WPA2-only network to lure clients that support WPA3. By capturing partial WPA2 handshakes, the attacker can then launch brute-force or dictionary attacks to recover the password without needing a man-in-the-middle position.

2. **Security Group Downgrade Attack:** During the handshake initiation, the client sends a commit frame indicating the preferred security group. If the AP doesn't support this group, it responds with a decline message, prompting the client to select another group. An attacker can impersonate an AP and send forged decline messages to force clients into choosing a weaker security group, thereby compromising the network's security.

3. **Timing-Based Side-Channel Attack:** This attack leverages timing discrepancies in AP responses to commit frames to infer information about the password. While NIST elliptic curves don't leak timing information, other curves like Brainpool or multiplicative security groups modulo a prime do. By analyzing response times, an attacker can execute a dictionary attack to guess the password.

4. **Cache-Based Side-Channel Attack:** By observing memory access patterns on a victim's device during the construction of a commit frame in a Dragonfly handshake, an attacker can deduce information about the password. This can be achieved through controlling applications on the victim's device or even executing JavaScript code in the victim's browser. The leaked patterns facilitate a dictionary attack to guess the password.

5. **Denial-of-Service (DoS) Attack:** This attack involves overloading Access Points (APs) by generating a relatively low number of forged commit frames per second. This causes high CPU usage on the AP, draining its battery, and impeding or delaying other devices from connecting via WPA3. Additionally, it may disrupt other functionalities of the AP, resulting in a DoS scenario.

In practice the WPA3 attacks which are more relevant are downgrade attacks and timing attacks against resource-constrained devices.

### 2.5.2 Fixes
Months following the discovery of the vulnerabilities, the Wi-Fi Alliance took proactive steps to address the issues by privately formulating backward-compatible security guidelines. In November 2019, they publicly released a set of guidelines aimed at bolstering the security of WPA3:

- **Prohibition of Brainpool Curves:** The guidelines explicitly prohibited the use of Brainpool curves, which were found to be susceptible to timing-based side-channel attacks.

- **Avoidance of Side-Channels in SAE Implementations:** It was mandated that implementations of Simultaneous Authentication of Equals (SAE) must mitigate the risk of side-channel attacks, enhancing the robustness of the protocol.

- **Enforcement of Separate Passwords for WPA3 and WPA2 Networks:** To mitigate the risk of downgrade attacks, vendors were instructed that if their implementation of WPA3-Transition did not meet all security requirements, WPA3 and WPA2 networks should utilize distinct passwords and be logically segregated from each other.

However, these implementations were found to be resource-intensive and negatively impacted the performance of lightweight IoT devices, prompting concerns within the industry.

As of 2024, most vendors have implemented fixes to address the vulnerabilities, effectively bolstering the security of WPA3 once again. For instance, during our research, attempts were made to execute a WPA3 downgrade attack using a Samsung Android 14 client. However, the attack was unsuccessful, as the client promptly detected the suspicious activity and displayed a warning message.

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