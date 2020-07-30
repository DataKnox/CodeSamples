import requests
import json
import time
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

base_url = "https://192.168.10.214/dna"
auth_endpoint = "/system/api/v1/auth/token"

username = 'admin'
password = 'dnacenter!@#99'

auth_headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
}

auth_response = requests.post(url=f"{base_url}{auth_endpoint}", auth=(
    username, password), headers=auth_headers, verify=False).json()

#print(json.dumps(auth_response, indent=2))

token = auth_response['Token']

req_headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "x-auth-token": token
}

device_endpoint = "/intent/api/v1/network-device"

devices = requests.get(url=f"{base_url}{device_endpoint}",
                       headers=req_headers, verify=False).json()['response']

# Create an empty array to store Device IDs
device_ids = []
# Get Device IDs and add them to array
for device in devices:
    device_ids.append(device['id'])
print(device_ids)
# Create payload of command to run and against which IDs
payload = {
    "commands": [
        "show ip int br"
    ],
    "deviceUuids": device_ids
}

command_endpoint = "/intent/api/v1/network-device-poller/cli/read-request"
# Initiate the Command Runner request by creating a Task
cli_response = requests.post(
    url=f"{base_url}{command_endpoint}", headers=req_headers, data=json.dumps(payload), verify=False).json()['response']

print(json.dumps(cli_response, indent=2))
# Get the status of the task. The task is not completed unless it returns a FileID
task_response = requests.get(
    url=f"https://192.168.10.214/dna/intent/api/v1/task/{cli_response['taskId']}", headers=req_headers, verify=False).json()
while task_response['response']['progress'] == 'CLI Runner request creation':
    print(task_response['response']['progress'])
    # If a FileID is not returned, wait 7 seconds, and run it again
    time.sleep(7)
    task_response = requests.get(
        url=f"https://192.168.10.214/dna/intent/api/v1/task/{cli_response['taskId']}", headers=req_headers, verify=False).json()

print(task_response['response']['progress'])

# Remove Content-Type and Accept since file will not be JSON
req_headers = {
    "x-auth-token": token
}

file = requests.get(
    url=f"https://192.168.10.214/dna/intent/api/v1/file/{json.loads(task_response['response']['progress'])['fileId']}", headers=req_headers, verify=False)

print(file.content)
# Output to a file
output = open("runner.txt", "wb")
output.write(file.content)
output.close()
