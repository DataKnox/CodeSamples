import requests
import json

router = {
    "host": "ios-xe-mgmt-latest.cisco.com",
    "port": "9443",
    "user": "root",
    "password": "D_Vay!_10&"
}

headers = {
    "Accept": "application/yang-data+json",
    "Content-Type": "application/yang-data+json"
}

url = f"https://{router['host']}:{router['port']}/restconf/data/ietf-interfaces:interfaces/interface=Loopback100"

# payload = {
#     "ietf-interfaces:interface": {
#         "name": "Loopback100",
#         "description": "Added by CBT Nuggets",
#         "type": "iana-if-type:softwareLoopback",
#         "enabled": True,
#         "ietf-ip:ipv4": {
#             "address": [
#                 {
#                     "ip": "172.16.100.1",
#                     "netmask": "255.255.255.0"
#                 }
#             ]
#         }
#     }
# }

response = requests.delete(url=url, headers=headers, auth=(
    router['user'], router['password']),  verify=False)

if response.status_code == 204:
    print(response)
    print(response.text)
