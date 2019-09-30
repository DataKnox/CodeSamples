import requests
import json

url = "https://172.16.1.131/api/routing/static"

headers = {
    'Authorization': "Basic Y2lzY286Y2lzY28="
}

get_response = requests.get(url, headers=headers, verify=False).json()['items']

print(json.dumps(get_response, indent=2, sort_keys=True))
