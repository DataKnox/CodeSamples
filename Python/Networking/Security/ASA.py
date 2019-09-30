import requests
import json

url = "https://172.16.1.131/api/routing/static"

headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
}

userpw = ('cisco', 'cisco')

get_response = requests.get(
    url, headers=headers, auth=userpw, verify=False).json()['items']

print(json.dumps(get_response, indent=2, sort_keys=True))
