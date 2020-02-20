import requests
import json
from datetime import datetime

url = "https://dashboard.meraki.com/api/v0/organizations"

headers = {
    'X-Cisco-Meraki-API-Key': "17d06f8fd988574af1d3280be9bdc9216134524a",
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
    if response_org['name'] == 'Knoxs Data':
        orgId = response_org['id']

net_url = f'{url}/{orgId}/networks'

networks = requests.get(net_url, headers=headers).json()
# print(networks)
for network in networks:
    if network['name'] == 'SoHo':
        netId = network['id']


client_url = f'https://dashboard.meraki.com/api/v0/networks/{netId}/switch/settings'
clients = requests.get(client_url, headers=headers).json()
print(json.dumps(clients, indent=2))
