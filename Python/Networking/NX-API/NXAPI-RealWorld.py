import requests
import json
import re
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

switchuser = 'cisco'
switchpassword = 'cisco'

url = 'https://172.16.1.68/ins'
myheaders = {'content-type': 'application/json'}
payload = {
    "ins_api": {
        "version": "1.0",
        "type": "cli_show",
        "chunk": "0",
        "sid": "1",
        "input": "show cdp nei",
        "output_format": "json"
    }
}
response = requests.post(url, data=json.dumps(
    payload), headers=myheaders, auth=(switchuser, switchpassword), verify=False).json()

# print(json.dumps(response, indent=2, sort_keys=True))
nei_count = response['ins_api']['outputs']['output']['body']['neigh_count']

# print(nei_count)
counter = 0

# LOGIN AND SET COOKIE
auth_url = 'https://172.16.1.68/api/mo/aaaLogin.json'
auth_body = {"aaaUser": {"attributes": {
    "name": switchuser, "pwd": switchpassword}}}
auth_response = requests.post(
    auth_url, json=auth_body, timeout=5, verify=False).json()
token = auth_response['imdata'][0]['aaaLogin']['attributes']['token']
print(token)
cookies = {}
cookies['APIC-Cookie'] = token
headers = {"content-type": "application/json"}

while counter < nei_count:
    hostname = response['ins_api']['outputs']['output']['body'][
        'TABLE_cdp_neighbor_brief_info']['ROW_cdp_neighbor_brief_info'][counter]['device_id']
    local_int = response['ins_api']['outputs']['output']['body'][
        'TABLE_cdp_neighbor_brief_info']['ROW_cdp_neighbor_brief_info'][counter]['intf_id']
    # print(local_int)
    remote_int = response['ins_api']['outputs']['output']['body'][
        'TABLE_cdp_neighbor_brief_info']['ROW_cdp_neighbor_brief_info'][counter]['port_id']
    counter += 1

    body = {
        "l1PhysIf": {
            "attributes": {
                "descr": 'Connected to '+hostname+' Remote if is '+remote_int
            }
        }
    }

    if local_int != 'mgmt0':
        # FORMAT THE INTERFACE NAME TO BE LIKE ETH1/1 TO CONSTRUCT URL
        int_name = str.lower(str(local_int[:3]))
        int_num = re.search(r'[1-9]/[1-9]*', local_int)
        # print(int_name+str(int_num.group(0)))
        int_url = 'https://172.16.1.68/api/mo/sys/intf/phys-['+int_name+str(
            int_num.group(0))+'].json'
        post_response = requests.post(int_url, data=json.dumps(
            body), headers=headers, cookies=cookies, verify=False).json()
        print(post_response)
