import requests
import json
from requests.exceptions import HTTPError

merakikey = "6bec40cf957de430a6f1f2baa056b99a4fac9ea0"
base_url = 'https://api.meraki.com/api/v0'
endpoint = '/organizations'

headers = {
    'X-Cisco-Meraki-API-Key': merakikey
}

try:
    response = requests.get(url=f"{base_url}{endpoint}", headers=headers)
    if response.status_code == 200:
        orgs = response.json()
        for org in orgs:
            if org['name'] == 'DevNet Sandbox':
                orgid = org['id']
except Exception as ex:
    print(ex)

endpoint = f"/organizations/{orgid}/networks"

try:
    response = requests.get(url=f"{base_url}{endpoint}", headers=headers)
    if response.status_code == 200:
        nets = response.json()
        for net in nets:
            if net['name'] == 'DNSMB3-Szywalski@tcc.de':
                netid = net['id']
except HTTPError as http:
    print(http)
except Exception as ex:
    print(ex)

endpoint = f"/networks/{netid}/devices"

try:
    response = requests.get(url=f"{base_url}{endpoint}", headers=headers)
    if response.status_code == 200:
        devices = response.json()
        for device in devices:
            print(device)
except HTTPError as http:
    print(http)
except Exception as ex:
    print(ex)
