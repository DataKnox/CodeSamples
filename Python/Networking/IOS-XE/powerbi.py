import requests
import json
from datetime import datetime
from router_info import router
# Router IOS-XE DevNet Sandbox

# router = {
#     'host': 'ios-xe-mgmt.cisco.com',
#     'port': '9443',
#     'user': 'developer',
#     'pw': 'C1sco12345'
# }

# Headers
headers = {
    'Content-Type': 'application/yang-data+json',
    'Accept': 'application/yang-data+json'
}

url = f"https://{router['host']}:{router['port']}/restconf/data/Cisco-IOS-XE-interfaces-oper:interfaces"

response = requests.get(url=url, headers=headers, auth=(
    router['username'], router['password']), verify=False).json()
interfaces = response['Cisco-IOS-XE-interfaces-oper:interfaces']['interface']
for interface in interfaces:
    #print(json.dumps(interface, indent=2))
    payload = []
    body = {
        'int-name': interface['name'],
        'in-packets': int(interface['statistics']['in-unicast-pkts']),
        'out-packets': int(interface['statistics']['out-unicast-pkts']),
        'datetime': datetime.now().isoformat()
    }
    payload.append(body)
    pbi_url = R"PBI URL HERE"
    requests.post(url=pbi_url, data=json.dumps(payload))
