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

health_endpoint = '/intent/api/v1/client-health'

client_health = requests.get(
    url=f"{base_url}{health_endpoint}", headers=req_headers, verify=False).json()

print(json.dumps(client_health, indent=2))


scores = client_health['response'][0]['scoreDetail']

for score in scores:
    if score['scoreCategory']['value'] == 'WIRED':
        print(f"Wired Clients: {score['clientCount']}")
        score_values = score['scoreList']
        for score_value in score_values:
            print(
                f"  {score_value['scoreCategory']['value']}: {score_value['clientCount']}")
    elif score['scoreCategory']['value'] == 'WIRELESS':
        print(f"Wireless Clients: {score['clientCount']}")
        score_values = score['scoreList']
        for score_value in score_values:
            print(
                f"  {score_value['scoreCategory']['value']}: {score_value['clientCount']}")
