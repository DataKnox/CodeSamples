import requests
import json

router = {
    "host": "ios-xe-mgmt.cisco.com",
    "port": "9443",
    "user": "root",
    "password": "D_Vay!_10&"
}

url = f"https://{router['host']}:{router['port']}/restconf/data/netconf-state/capabilities"

headers = {
    "Accept": "application/yang-data+json",
    "Content-Type": "application/yang-data+json"
}

response = requests.get(url=url, headers=headers, auth=(
    router['user'], router['password']), verify=False)

if response.status_code == 200:
    response_dict = response.json()
    for capability in response_dict['ietf-netconf-monitoring:capabilities']['capability']:
        print(capability)
