# Eavsdropping
Evasdropping is an attack which is able to capture the traffic from the network.

## Step 1 : Check your Wi-Fi modems

```
sudo iw dev
```

## Step 2 : Delete previous interface from the modem which will be used
```
sudo iw dev <interface_name> del
```

## Step 3 :  Add a monitor interface to the modem which is going to be used
Here, we are going to name the monitor interface as **mon0**.

```
sudo iw phy <physical_interface> interface add mon0 type monitor
```

## Step 4 : List interfaces to be sure that the monitor interface was created and is in monitor mode
```
sudo iw dev
```

## Step 5 : Change interface status to UP
```
sudo ifconfig mon0 up
```

## Step 6 : Open Wireshark
```
sudo wireshark
```


## Step 7 : Select the interface
In the Wireshark GUI, select the created monitor interface **mon0**

## Step 8 : Add wireless toolbar
In the Wireshark GUI, to go the menu **View** and the enable **Wireless Toolbar**

## Step 9 : Select channel and bandwidth
Select acccording to the spefications of the Wi-Fi which you want to see the traffic

## Step 10 : Filter the traffic
### 10.1 : Find out the BSSID from the network
Filter by beacon packets and ssid

```
wlan.fc.type_subtype == 8 && wlan.ssid == "<SSID>"
```

### 10.2 : Filter traffic by BSSID
Inside the **IEEE 802.11 Beacon Frame**, search for the BSSID, right-click on it and select **Apply as filter > Selected**

**Now you can see all the Wi-Fi traffic from the open network**






