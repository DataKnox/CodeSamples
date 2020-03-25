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

############ GET CLIENT HEALTH STATS ################

health_url = "intent/api/v1/client-health"

querystring = {"timestamp": ""}

headers = {
    'x-auth-token': token,
    'Accept': "application/json"
}

response = requests.get(
    url=f"{base_url}{health_url}", headers=headers, params=querystring).json()

print(json.dumps(response, indent=2, sort_keys=True))

print(
    f"Clients: {response['response'][0]['scoreDetail'][0]['clientCount']}")


scores = response['response'][0]['scoreDetail']

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
