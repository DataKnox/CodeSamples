import requests
import json

url = "http://10.10.10.152:8080/rpc/get-interface-information"

headers = {
    'Accept': "application/json",
    'Content-Type': "application/xml"
}

response = requests.get(url, headers=headers, auth=('knox', 'juniper1')).json()

print(json.dumps(response, indent=2, sort_keys=True))
