# NET4101 - HACK THE FLAG

# PLAN
1. Introduction (Sarra) 
2. Vulnerabilities \
2.1. Eavesdropping (Sarra) \
2.1.1. Definition \
2.1.2. Attack implementation \
2.2. Brute Force (Amine) \
2.2.1. Definition \
2.2.2. Attack implementation \
2.3. Rainbow Table (Mayssa) \
2.3.1. Definition \
2.3.2. Attack implementation \
2.4. Evil Twin  (Amine) \
2.4.1. Definition \
2.4.2. Attack implementation \
2.5. DragonBlood (Renato) \
2.5.1.  Definition \
2.5.2.  Fixes 
3. Capture the flag \
3.1. Architecture (Renato) \
3.2. Configuration \
3.2.1. Router (Renato) \
3.2.2. OPEN Clients (Amine) \
3.2.3. WPA2 Clients (Mayssa) \
3.2.4. WPA3 Clients (Renato) \
3.3. How to Hack (Renato) 
4. Conclusion (Amine) 



# 1. INTRODUCTION

In today's digitized world, the importance of cybersecurity cannot be overstated. As society becomes increasingly reliant on digital technologies for communication, commerce, and critical infrastructure, the risks associated with cyber threats grow concurrently. Cybersecurity serves as the cornerstone for protecting sensitive information, preserving privacy, and maintaining the integrity of systems and networks.

In the domain of wireless networks, especially Wi-Fi connectivity, cybersecurity plays a paramount role. With wireless communication expanding across diverse domains, including homes, businesses, and public spaces, the vulnerabilities inherent in these networks become more pronounced. The broadcast nature of wireless transmissions amplifies the risk of eavesdropping, interception, unauthorized access, and network exploitation.

Securing Wi-Fi networks is essential. By implementing robust encryption mechanisms like WPA2 (Wi-Fi Protected Access 2) or WPA3, these protocols ensure that data transmitted over Wi-Fi networks remains confidential and secure.

Well-known security protocols implemented to date include:

- **WEP (Wired Equivalent Privacy):**
Released in 1999, WEP was one of the earliest encryption protocols used to secure wireless networks. It utilized the RC4 encryption algorithm but was soon found to be vulnerable to various attacks, such as the Fluhrer-Mantin-Shamir (FMS) attack and the KoreK attack.

- **WPA (Wi-Fi Protected Access):**
Utilizing the TKIP (Temporal Key Integrity Protocol) protocol, WPA was introduced in 2003 as an interim solution to address the weaknesses of WEP. However, it too faced vulnerabilities, notably through TKIP, which led to successful attacks such as dictionary attacks. 

- **WPA2 (Wi-Fi Protected Access 2):**
Released in 2004, WPA2 represented a significant improvement in Wi-Fi security, incorporating the more secure AES (Advanced Encryption Standard) encryption algorithm. While initially considered robust, vulnerabilities such as the KRACK (Key Reinstallation Attack) were discovered in 2017, highlighting the need for ongoing vigilance and updates in response to evolving threats.

- **WPA3 (Wi-Fi Protected Access 3):**
Introduced in 2018, WPA3 aims to improve upon its predecessors by introducing stronger encryption and authentication mechanisms, such as the Simultaneous Authentication of Equals (SAE) protocol. This enhances protection against brute-force attacks. Because WPA3 is relatively new, it has not been compromised yet. Despite some initial vulnerabilities, they have been addressed, ensuring WPA3 remains reliable as of 2024.

This lab was created with the purpose of gaining fundamental knowledge of various known attacks, such as Rainbow Table and Evil Twin. To achieve this goal, the lab employs a multi-protocol architecture, utilizing OPEN, WPA2, and WPA3, which automatically generates traffic while concealing a flag within it. The objective is to compete in capturing the flag by executing attacks on the architecture.

# 2. VULNERABILITIES
## 2.1. Eavesdropping
### 2.1.1. Definition

Open WiFi networks are wireless networks where traffic is not secured or encrypted, allowing users to connect without authentication. They are commonly found in public places, but their lack of security poses significant risks.
Eavesdropping attacks involve the unauthorized interception of communication between two parties, through which the attacker gains access to sensitive information.

There are various types of eavesdropping attacks:

- Physical Eavesdropping: This involves directly accessing communication lines or physical devices to intercept data. For instance, attackers might tap into telephone lines or place listening devices (bugs) in physical locations to capture conversations.

- Network Eavesdropping: In network eavesdropping attacks, attackers intercept data transmitted over a network. This can be accomplished by capturing and analyzing network traffic using packet sniffing tools. Attackers can monitor wireless transmissions to capture sensitive information or launch other types of attacks, such as session hijacking or Man-in-the-Middle attacks.

An eavesdropping attack simply listens to traffic and steals information from it. Therefore, it can be easily implemented on an open access point. However, to execute the attack on an encrypted network, it is necessary to know the Wi-Fi password for WPA/WPA2/WPA3.

### 2.1. Attack implementation

Tools-used: iw (linux default), ifconfig, wireshark 

#### Step 1 : Check your Wi-Fi modems

```
sudo iw dev
```

#### Step 2 : Delete previous interface from the modem that will be used
```
sudo iw dev <interface_name> del
```

#### Step 3 :  Add a monitor interface to the modem that will be used
Here, we are going to name the monitor interface as **mon0**.

```
sudo iw phy <physical_interface> interface add mon0 type monitor
```

#### Step 4 : List interfaces to ensure that the monitor interface was created and is in monitor mode
```
sudo iw dev
```

#### Step 5 : Change interface status to UP
```
sudo ifconfig mon0 up
```

#### Step 6 : Open Wireshark
```
sudo wireshark
```

#### Step 7 : Select the interface

In the Wireshark GUI, select the created monitor interface **mon0**.

#### Step 8 : Add wireless toolbar

In the Wireshark GUI, go to the menu **View** and enable the **Wireless Toolbar**

#### Step 9 : Select channel and bandwidth

In the Wireshark GUI, select the channel and bandwidth according to the specifications of the Wi-Fi network for which you want to monitor the traffic.

#### Step 10 : Filter the traffic

##### 10.1 : Find out the BSSID from the network

In the Wireshark GUI, filter the traffic by beacon packets and ssid.

```
wlan.fc.type_subtype == 8 && wlan.ssid == "<SSID>"
```

##### 10.2 : Filter traffic by BSSID

Inside the **IEEE 802.11 Beacon Frame**, search for the BSSID, right-click on it and select **Apply as filter > Selected**

**Now you can see all the Wi-Fi traffic from the network!**


## 2.2. Brute Force
### 2.2.1. Definition
**(Amine)**

### 2.2.2. Attack implementation
**(Amine)**

## 2.3. Rainbow Table
### 2.3.1. Definition
The passwords in a computer system are not stored directly as plain texts but are hashed using encryption. A hash function is a 1-way function, which means that it can’t be decrypted. Whenever a user enters a password, it is converted into a hash value and is compared with the already stored hash value. If the values match, the user is authenticated.

The rainbowtable is a precomputed dictionary of plaintext passwords and their corresponding hash values that can be used to find out what plaintext password produces a particular hash. Doing an rainbowntable attack is quicker than a simple bruteforce attack because the hash value was previously calculated.

## Prerequisites : 
Before performing a rainbowTable attack, you need to :
- find the hash of the password  you want to decrypt. 
- find information about the form of the plaintext password (minimum and maximum length, format: numbers, alphabet, special characters..) by looking at the format of allowed passwords of the target application/system.

### 2.3.2. Attack implementation

#### Step1: Install rainbowcrack package

Open a terminal in kali and install the rainbowcrack package:
```
sudo apt install rainbowcrack
```


#### Step2: Generate a rainbow table

Open the help menu of rtgen to display the options:
```
rtgen -h
```


Choose an option that corresponds to the form of the password and modify the following according to your case. 
```
rtgen <hash_algorithm> <charset> <length_min> <length_max> <table_index> <chain_min> <chain_num> <part_index>
```

Example: for a password "12345678", the following options can be used:    
```
sudo rtgen md5 numeric 1 8 0 100000 100000 0
```

We chose the values of 100000 and 100000 for the chain_length and chain_num to be able to have a larger rainbowTable (so it will include our password).

The creation of the rainbow table takes much time and storage space on system, but after creating it, we will be able to use it to crack passwords faster than with brute force.

The rainbow table will be stored in /usr/share/rainbowcrack directory.

## Step3: sort the rainbowTable
Go to the directory where the table file .rt is stored and sort the rainbowTable.
```
cd /usr/share/rainbowcrack
sudo rtsort .
```

#### Step4: find the password
Use RainbowCrack tool to crack the password hash.
```
rcrack . -h <hash_of_password>
```

In our example, the md5 hash of the password "12345678" is "25d55ad283aa400af464c76d713c07ad".

## 2.4. Evil Twin
### 2.4.1. Definition
An evil twin attack is a type of cyber attack where a malicious actor sets up a rogue wireless access point (AP) with the same Service Set Identifier (SSID) as a legitimate AP. This deceitful AP appears to be a trusted network, enticing unsuspecting users to connect to it, unaware that they are falling into a trap. Once connected, the attacker can intercept sensitive information such as usernames, passwords, and other confidential data transmitted over the network. Evil twin attacks are often carried out in public Wi-Fi hotspots, exploiting the convenience of open networks to lure in targets.
This attack can be particularly effective in places like airports, cafes, and hotels, where users frequently connect to public Wi-Fi networks without verifying their legitimacy. \
In this report, we will demonstrate our implementation of the evil twin attack on an OPEN, WPA or WPA2 Wi-Fi network.

### 2.4.2. Attack implementation
**(Amine)**
installing wget : sudo apt-get install wget.
cloning the Login page of CAS TSP : wget --mirror --convert-links --adjust-extension --page-requisites --no-parent https://cas6.imtbs-tsp.eu/cas/login?service=https://ecampus.imtbs-tsp.eu/uPortal/Login

## 2.5. DragonBlood
### 2.5.1. Definition
In April 2019, Mathy Vanhoef and Eyal Ronen published a paper titled "Dragonblood: Analyzing the Dragonfly Handshake of WPA3 and EAP-pwd," which exposed five vulnerabilities in the WPA3 protocol. Despite being heralded as "unbreakable" upon its release by the Wi-Fi Alliance, these vulnerabilities shed light on potential weaknesses in the protocol, particularly in its Dragonfly handshake mechanism. For the purpose of this Capture the Flag competition, this report will focus on the vulnerabilities related to the Dragonfly handshake, omitting discussion of EAP-pwd as enterprise networks are not within the scope.

1. **Downgrade Attack Against WPA3-Transition:** This attack exploits the transition mode defined in the WPA3 specification, where a Wi-Fi network supports both WPA3 and WPA2 with the same password. An adversary can set up a rogue WPA2-only network to lure clients that support WPA3. By capturing partial WPA2 handshakes, the attacker can then launch brute-force or dictionary attacks to recover the password without needing a man-in-the-middle position.

2. **Security Group Downgrade Attack:** During the handshake initiation, the client sends a commit frame indicating the preferred security group. If the AP doesn't support this group, it responds with a decline message, prompting the client to select another group. An attacker can impersonate an AP and send forged decline messages to force clients into choosing a weaker security group, thereby compromising the network's security.

3. **Timing-Based Side-Channel Attack:** This attack leverages timing discrepancies in AP responses to commit frames to infer information about the password. While NIST elliptic curves don't leak timing information, other curves like Brainpool or multiplicative security groups modulo a prime do. By analyzing response times, an attacker can execute a dictionary attack to guess the password.

4. **Cache-Based Side-Channel Attack:** By observing memory access patterns on a victim's device during the construction of a commit frame in a Dragonfly handshake, an attacker can deduce information about the password. This can be achieved through controlling applications on the victim's device or even executing JavaScript code in the victim's browser. The leaked patterns facilitate a dictionary attack to guess the password.

5. **Denial-of-Service (DoS) Attack:** This attack involves overloading Access Points (APs) by generating a relatively low number of forged commit frames per second. This causes high CPU usage on the AP, draining its battery, and impeding or delaying other devices from connecting via WPA3. Additionally, it may disrupt other functionalities of the AP, resulting in a DoS scenario.

In practice the WPA3 attacks which are more relevant are downgrade attacks and timing attacks against resource-constrained devices.

### 2.5.2. Fixes
Months following the discovery of the vulnerabilities, the Wi-Fi Alliance took proactive steps to address the issues by privately formulating backward-compatible security guidelines. In November 2019, they publicly released a set of guidelines aimed at bolstering the security of WPA3:

- **Prohibition of Brainpool Curves:** The guidelines explicitly prohibited the use of Brainpool curves, which were found to be susceptible to timing-based side-channel attacks.

- **Avoidance of Side-Channels in SAE Implementations:** It was mandated that implementations of Simultaneous Authentication of Equals (SAE) must mitigate the risk of side-channel attacks, enhancing the robustness of the protocol.

- **Enforcement of Separate Passwords for WPA3 and WPA2 Networks:** To mitigate the risk of downgrade attacks, vendors were instructed that if their implementation of WPA3-Transition did not meet all security requirements, WPA3 and WPA2 networks should utilize distinct passwords and be logically segregated from each other.

However, these implementations were found to be resource-intensive and negatively impacted the performance of lightweight IoT devices, prompting concerns within the industry.

As of 2024, most vendors have implemented fixes to address the vulnerabilities, effectively bolstering the security of WPA3 once again. For instance, during our research, attempts were made to execute a WPA3 downgrade attack using a Samsung Android 14 client. However, the attack was unsuccessful, as the client promptly detected the suspicious activity and displayed a warning message.

# 3. CAPTURE THE FLAG
## 3.1. Requirements
The hardware requirements for the Capture the Flag competition are relatively straightforward:

- **Router:** It should include firewall capabilities, support the creation of multiple Wi-Fi networks, and have WPA2/WPA3 encryption enabled.

- **Clients:** Four Raspberry Pi devices or computers running the Raspberry Pi OS, each equipped with WPA2/WPA3 compatible network cards.

To streamline the setup process for the competition, it is advisable to utilize OpenWrt. Below, we outline a step-by-step configuration guide (section 3.3.1) for implementing OpenWrt.

## 3.2. Architecture
The competition's infrastructure comprises three wireless networks employing different levels of security: no-encryption, WPA2-PSK, and WPA3-SAE. These technologies were selected based on their prevalence in wireless networks as of 2024.

The deployment of an open wireless network serves as a distractor, intentionally devoid of any relevant information leading to the flag. However, this network generates significant traffic from a single client, adding to the challenge for participants. Introducing distractions enhances the competition's complexity, as the winner is determined by a timely manner.

Within the WPA2 network, two clients engage in HTTP traffic, simulating an unencrypted chat application. At a certain point in the conversation, one of the clients inadvertently reveals the WPA3 password.

Inside the WPA3 network, a single client is connected, generating minimal traffic as possible. This client has a weak SSH password, and the flag is concealed within its files, encoded in base64. Upon gaining access to the WPA3 network, participants must locate and infiltrate this client, decipher the message within the unidentified flag file, and successfully obtain the flag.

## 3.3. Configuration
### 3.3.1. Router
**(Renato)**

### 3.3.2. OPEN Clients
**(Amine)**

### 3.3.3. WPA2 Clients
**(Mayssa)**

### 3.3.4. WPA3 Clients
**(Renato)**

## 3.4. Getting The Flag
**(Renato)**

# 4. CONCLUSION
**(Amine)**

# 5. REFERENCES
https://security.stackexchange.com/questions/92903/rainbow-tables-hash-tables-versus-wpa-wpa2
