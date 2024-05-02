# import requests
#import json
# Sending a GET request to our API
#response = requests.get(url="http://192.168.192.162:5000/get_last_message")
# printing out the response
#print(response.text) 

import requests
import json

# Function to prompt user for IP address and save it
def get_ip_address():
    ip_address = input("Enter the IP Address of the other machine: ")
    with open("ip_address.txt", "w") as file:
        file.write(ip_address)
    return ip_address

# Function to read saved IP address from file
def read_ip_address():
    try:
        with open("ip_address.txt", "r") as file:
            return file.read().strip()
    except FileNotFoundError:
        return None

# Check if IP address is already saved
saved_ip_address = read_ip_address()

if saved_ip_address:
    other_machine_ip = saved_ip_address
else:
    other_machine_ip = get_ip_address()

# Construct the URL with the provided IP Address
url = f"http://{other_machine_ip}:5000/get_last_message"

# Sending a GET request to our API
response = requests.get(url=url)

# printing out the response
print(response.text)

