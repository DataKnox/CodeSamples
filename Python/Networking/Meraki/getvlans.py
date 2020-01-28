import requests
import json
from dotenv import load_dotenv
import os
load_dotenv()

url = "https://dashboard.meraki.com/api/v0/organizations"
token = os.environ.get('merakey')
headers = {
    'X-Cisco-Meraki-API-Key': token,
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

for response_org in response:
    if response_org['name'] == 'CBT Nuggets':
        orgId = response_org['id']

net_url = f'{url}/{orgId}/networks'

networks = requests.get(net_url, headers=headers).json()
print(json.dumps(networks, indent=2, sort_keys=True))

vlan_url = f'https://dashboard.meraki.com/api/v0/networks/{netId}/vlans'
vlans = requests.get(vlan_url, headers=headers).json()
print(json.dumps(vlans, indent=2, sort_keys=True))
