import requests
import json

################ LOGIN ######################
url = "https://dcloud-dna-center-inst-rtp.cisco.com/dna/system/api/v1/auth/token"

user = 'demo'
pw = 'demo1234!'

response = requests.post(url, auth=(user, pw)).json()

print(response)
token = response['Token']

url = "https://dcloud-dna-center-inst-rtp.cisco.com/dna/intent/api/v1/site"

payload = {}
headers = {
    'x-auth-token': token,
    'Accept': 'application/json'
}

response = requests.get(url, headers=headers).json()

print(json.dumps(response, indent=2))
