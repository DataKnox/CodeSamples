import requests
import json

# requests.packages.urllib3.disable_warnings()

# Set URL and login body
# Note the body is a python dict - NOT a JSON body
url = 'https://sandboxsdwan.cisco.com:8443/j_security_check'
login_body = {
    'j_username': 'devnetuser',
    'j_password': 'Cisco123!'
}

# MUST use a session for SD-WAN
session = requests.session()

response = session.post(url, data=login_body, verify=False)

# IF the response body contains any text then auth failed
if not response.ok or response.text:
    print('login failure')
    import sys
    sys.exit(1)
else:
    print('login worked! Yay!')

# Get Devices
url = 'https://sandboxsdwan.cisco.com:8443/dataservice/device'

device_response = session.get(url, verify=False).json()['data']
#print(json.dumps(get_response, indent=2, sort_keys=True))
for device in device_response:
    print(f"Hostname: {device['host-name']}")
    print(f"IP: {device['local-system-ip']}")
    print(f"Model: {device['device-model']}")
    print(' ')

# Get Templates
# template_url = 'https://sandboxsdwan.cisco.com:8443/dataservice/template/device'
# template_response = session.get(template_url, verify=False).json()['data']
# print(template_response)
