import requests
import json
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

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

# Response returns a 200 OK no matter what
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
    ip = device['local-system-ip']
    print(f"IP: {device['local-system-ip']}")
    print(f"Model: {device['device-model']}")
    vpn_url = f"https://sandboxsdwan.cisco.com:8443/dataservice/device/ipsec/outbound?deviceId={ip}"
    vpn_response = session.get(vpn_url, verify=False).json()['data']
    # print(vpn_response)
    for tunnel in vpn_response:
        if vpn_response.index(tunnel) == 0:
            print('First VPN tunnel')
        else:
            print('Next tunnel')
        print(tunnel['dest-ip'])
        print(tunnel['remote-tloc-address'])
    print(' ')


# Get Templates
# template_url = 'https://sandboxsdwan.cisco.com:8443/dataservice/template/device'
# template_response = session.get(template_url, verify=False).json()['data']
# print(template_response)
# ip = '4.4.4.61'
# url = f"https://sandboxsdwan.cisco.com:8443/dataservice/device/policy/qosschedulerinfo?deviceId={ip}"
# pol_response = session.get(url, verify=False).json()['data']
# print(pol_response)
