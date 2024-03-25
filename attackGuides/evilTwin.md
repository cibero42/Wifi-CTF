# Evil Twin Attack
**Social Engineering Attack**
This attack:
1. Captures a handshake of the target (WPA/WPA2)
2. Creates a rogue AP with captive portal
3. Waits for victims to connect to the fake network and test the password inputed on the captive portal against the handshake - if the handshake is decripted, it means that the user inputed password is the right one

Used tools: airmon-ng, airgeddon

## Step 1 : Install airgeddon
```
sudo apt update && sudo apt install airgeddon
```

## Step 2 : Put interface on monitor mode
Killing Wi-Fi related processes
```
sudo airmon-ng check kill
```

Starting monitor interface (usually the interface name is wlan0, but you can check it running **sudo iw dev**).
```
sudo airmon-ng start wlan0
```

## Step 3 : Start airgeddon
```
sudo airgeddon
```

In the first run, airgeddon is going to check if you have all necessary packets installed. Press **Enter** to enter in airgeddon terminal.

## Step 4 : Select network in airgeddon
Check for **wlan0mon** in airgeddon list, and type the number corresponding to it.

## Step 5 : Start Evil Twin attack
### 5.1 Select attack
Select option 7

### 5.2 Find target
Select option 4 and then **Enter**. A new terminal will open. Let it run for a while to capture the networks, then press Ctrl+C and go back to the main terminal.

Select the desired network and press enter.

### 5.3 Select attack with captive portal 
Select option 9. Press enter twice. Let the scan run for a while and then press Ctrl+C.

### 5.4 Select network again
Select the desired SSID.

### 5.5 Select the Deauthntication attack method
Select option 1 (Deauth / disassoc amok mkd4 attack).

In "spoof your MAC address", select **y**

In "captures hadshake file", select **n**

In "timeout", type 100

Press **Enter**

If the handshake capture was successful, you'll see a message saying "Congratulations !!"

Press **Enter** four times

Select captive portal laguage.

In "captive lortal logo", select **n**

Press **Enter**

Wait for the victim to connect to the fake access point and type the right password.

When this happens, you'll get the Wi-Fi password :D




