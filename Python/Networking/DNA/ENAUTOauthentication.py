import requests
import json

base_url = "https://dcloud-dna-center-inst-rtp.cisco.com/dna/"
auth_endpoint = "system/api/v1/auth/token"

user = 'demo'
password = 'demo1234!'

auth_response = requests.post(
    url=f"{base_url}{auth_endpoint}", auth=(user, password)).json()

token = auth_response['Token']

headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "x-auth-token": token
}
