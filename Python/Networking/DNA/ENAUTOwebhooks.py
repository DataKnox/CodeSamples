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

event_endpoint = "intent/api/v1/events?tags=ASSURANCE"

# events_response = requests.get(
#     url=f"{base_url}{event_endpoint}", headers=headers).json()

# print(json.dumps(events_response, indent=2))

events = ["NETWORK-DEVICES-3-207", "NETWORK-DEVICES-3-103"]

payload = [
    {
        "name": "CBT Nuggets webhook sub",
        "subscriptionEndpoints": [
            {
                "subscriptionDetails": {
                    "connectorType": "REST",
                    "name": "Azure Function App",
                    "description": "Ingest into CosmosDB Function",
                    "method": "POST",
                    "url": "Https://knoxsfunction.azurewebsites.net/myWebApp"
                }
            }
        ],
        "filter": {
            "eventIds": events
        }
    }
]

event_sub_endpoint = "intent/api/v1/event/subscription"

event_response = requests.post(
    url=f"{base_url}{event_sub_endpoint}", headers=headers, data=json.dumps(payload))
print(event_response)
print(event_response.text)
