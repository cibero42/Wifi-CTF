import requests
import json
# Info of the book
payload = {
   'user': 'John Doe',
   'message': 'Hey!'
}
# header of our post request indicating content type to be JSON
headers = {'Content-type': 'application/json'}
# Sending a post request to our API
response = requests.post(url='http://10.42.47.4:5000/add_message',
                        data=json.dumps(payload),
                        headers=headers)
# Printing out the response.
print(response.text)