import requests
import json

base_url = "https://192.168.10.214/dna"
auth_endpoint = "/system/api/v1/auth/token"

username = 'admin'
password = 'dnacenter!@#99'

auth_headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
}

auth_response = requests.post(url=f"{base_url}{auth_endpoint}", auth=(
    username, password), headers=auth_headers, verify=False).json()

#print(json.dumps(auth_response, indent=2))

token = auth_response['Token']

req_headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "x-auth-token": token
}

device_endpoint = "/intent/api/v1/network-device"

devices = requests.get(url=f"{base_url}{device_endpoint}",
                       headers=req_headers, verify=False).json()['response']

#print(json.dumps(devices, indent=2))
for device in devices:
    if device['hostname'] == "NOLA-EDGE2.nuggetlab.local":
        dev_ip = device['managementIpAddress']

sda_endpoint = f"/intent/api/v1/business/sda/device?deviceIPAddress={dev_ip}"

response = requests.get(
    url=f"{base_url}{sda_endpoint}", headers=req_headers, verify=False).json()

print(json.dumps(response, indent=2))
