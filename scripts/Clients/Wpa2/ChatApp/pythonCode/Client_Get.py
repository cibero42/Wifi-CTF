import requests
import json
# Sending a GET request to our API
response = requests.get(url="http://10.42.47.4:5000/add_message")
# printing out the response
print(response.text)