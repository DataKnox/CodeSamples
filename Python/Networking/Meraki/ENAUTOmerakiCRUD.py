import requests
import json
from requests.exceptions import HTTPError

merakikey = "meraki key"
base_url = 'https://api.meraki.com/api/v0'
endpoint = '/organizations'

headers = {
    'X-Cisco-Meraki-API-Key': merakikey,
    'Content-Type': 'application/json'
}

try:
    response = requests.get(url=f"{base_url}{endpoint}", headers=headers)
    if response.status_code == 200:
        orgs = response.json()
        for org in orgs:
            if org['name'] == 'Knoxs Data':
                orgid = org['id']
except Exception as ex:
    print(ex)

endpoint = f"/organizations/{orgid}/networks"

payload = {
    'name': 'My Demo Net',
    'type': 'appliance switch camera'
}

try:
    response = requests.post(
        url=f"{base_url}{endpoint}", headers=headers, data=json.dumps(payload))
    if response.status_code == 201:
        print(response.text)
except Exception as ex:
    print(ex)
