import requests
import json

url_base = 'http://localhost:8080/api'
auth = ("admin", "admin")
accept_header = [
    'application/vnd.yang.api+json',
    'application/vnd.yang.datastore+json',
    'application/vnd.yang.data+json',
    'application/vnd.yang.collection+json'
]
headers = {'Accept': ','.join(accept_header)}

response = requests.get(
    f'{url_base}/running/devices/device', auth=auth, headers=headers).json()
print(json.dumps(response, indent=2, sort_keys=True))
