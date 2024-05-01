import requests
import json
# Sending a GET request to our API
response = requests.get(url="http://192.168.2.161:5000/get_last_message")
# printing out the response
print(response.text)