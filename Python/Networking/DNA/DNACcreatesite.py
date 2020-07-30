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

site_endpoint = '/intent/api/v1/site'

payload = {
    "type": "area",
    "site": {
        "area": {
            "name": "Illinois",
            "parentName": "Global"
        }
    }
}

site_response = requests.post(url=f"{base_url}{site_endpoint}",
                              headers=req_headers, data=json.dumps(payload), verify=False).json()
print(json.dumps(site_response, indent=2))
