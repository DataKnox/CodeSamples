import requests
import json

url = "https://dashboard.meraki.com/api/v0/organizations"

headers = {
    'X-Cisco-Meraki-API-Key': "6bec40cf957de430a6f1f2baa056b99a4fac9ea0",
    'User-Agent': "PostmanRuntime/7.16.3",
    'Accept': "*/*",
    'Cache-Control': "no-cache",
    'Postman-Token': "67a3f4c9-bcb4-43a5-bcde-c05ec3e976af,b27f7dd9-3ebc-4d17-a0a8-d62ab5cafb99",
    'Accept-Encoding': "gzip, deflate",
    'Referer': "https://api.meraki.com/api/v0/organizations",
    'Connection': "keep-alive",
    'cache-control': "no-cache"
}

response = requests.get(url, headers=headers).json()

#print(json.dumps(response, indent=2, sort_keys=True))

for response_org in response:
    if response_org['name'] == 'DevNet Sandbox':
        orgId = response_org['id']

net_url = f'{url}/{orgId}/networks'

networks = requests.get(net_url, headers=headers).json()
# print(networks)
for network in networks:
    if network['name'] == 'DNSMB4-s.jayaraj007007@gmail.com':
        netId = network['id']

client_url = f'https://dashboard.meraki.com/api/v0/networks/{netId}/clients'
clients = requests.get(client_url, headers=headers).json()
#print(json.dumps(clients, indent=2, sort_keys=True))
for client in clients:
    if client['id'] == 'k0191cb':
        clientid = client['id']
traffic_url = f"https://dashboard.meraki.com/api/v0/networks/{netId}/clients/{clientid}/events"
historys = requests.get(traffic_url, headers=headers).json()
print(json.dumps(historys, indent=2, sort_keys=True))
