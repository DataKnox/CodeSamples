import requests
import json

auth_response = requests.post('https://sandboxdnac.cisco.com/dna/system/api/v1/auth/token', headers={'Authorization': 'Basic ZGV2bmV0dXNlcjpDaXNjbzEyMyE='}).json()

print (auth_response)

token = auth_response['Token']

headers = {
    "x-auth-token": token,
    "Accept": "application/json",
    "Content-Type": "application/json"
}

print(token)