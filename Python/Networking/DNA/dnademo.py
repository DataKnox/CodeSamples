import requests
import json
import urllib3

# declare headers first
headers = {
    'content-type': "application/json",
    'x-auth-token': ""
}
# set user and pw
dna_center = {'username': 'devnetuser', 'password': 'Cisco123!'}


def dna_login(host, username, password):
    url = f"https://{host}/api/system/v1/auth/token"
    login_response = requests.post(url,
                                   auth=(username,
                                         password),
                                   headers=headers, verify=False)
    return login_response.json()["Token"]


def get_devices(host, token):
    url = f"https://{host}/api/v1/network-device"
    headers['x-auth-token'] = token
    devices_response = requests.get(url, headers=headers, verify=False)
    return devices_response.json()["response"]


# BEGIN CODE
if __name__ == '__main__':
    token = dna_login('sandboxdnac.cisco.com',
                      dna_center['username'], dna_center['password'])

    device_list = get_devices('sandboxdnac.cisco.com', token)

    for device in device_list:
        if device_list.index(device) == 0:
            print('*' * 50)
            print(
                f"The first device is {device['hostname']} which is a {device['family']}")
        else:
            print(
                f"The next device is {device['hostname']} which is a {device['family']}")
        print(f"The management IP is {device['managementIpAddress']}")
        print(f"Device role is {device['role']}")
        print(f"The reachability status is {device['reachabilityStatus']}")
        print('*' * 50)
