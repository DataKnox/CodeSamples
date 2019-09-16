import requests
import json

################ LOGIN ######################
url = "https://sandboxdnac2.cisco.com/dna/system/api/v1/auth/token"

user = 'devnetuser'
pw = 'Cisco123!'

response = requests.post(url, auth=(user, pw)).json()
# print(response)
token = response['Token']

############ GET CLIENT DETAIL ################
macAddress = '00:00:2A:01:00:2E'
url = f"https://sandboxdnac2.cisco.com/dna/intent/api/v1/client-detail?timestamp=&macAddress={macAddress}"


headers = {
    'x-auth-token': token,
    'User-Agent': "PostmanRuntime/7.16.3",
    'Accept': "*/*",
    'Cache-Control': "no-cache",
    'Postman-Token': "393a9fdd-f109-4fd3-821b-0ae2a03da256,3d2299b4-7515-4f80-9964-b33c2ae9c2ab",
    'Host': "sandboxdnac2.cisco.com",
    'Accept-Encoding': "gzip, deflate",
    'Connection': "keep-alive",
    'cache-control': "no-cache"
}

response = requests.get(url, headers=headers).json()

# print(json.dumps(response, indent=2, sort_keys=True))
device_details = response['topology']['nodes']
for device_detail in device_details:
    if device_detail['id'] == device_details[0]['id']:
        print(f"Client IP: {device_detail['ip']}")
        print(f"MAC: {device_detail['id']}")
        print(f"Health Score: {device_detail['healthScore']}")
        print(" ")
    elif device_detail['id'] == device_details[2]['id']:
        print(f"Connected to {device_detail['deviceType']}")
        print(f"WAP IP: {device_detail['ip']}")
