import requests
import json

################ LOGIN ######################
base_url = "https://sandboxdnac2.cisco.com/dna/"
auth_endpoint = "system/api/v1/auth/token"
user = 'devnetuser'
pw = 'Cisco123!'

response = requests.post(
    url=f"{base_url}{auth_endpoint}", auth=(user, pw)).json()
# print(response)
token = response['Token']

headers = {
    'x-auth-token': token,
    'Accept': 'application/json'
}

device_endpoint = "intent/api/v1/network-device"

dev_response = requests.get(
    url=f"{base_url}{device_endpoint}", headers=headers).json()
print(json.dumps(dev_response, indent=2))
