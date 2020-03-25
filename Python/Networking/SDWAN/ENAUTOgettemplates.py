import requests
import json

base_url = "https://sandboxsdwan.cisco.com:8443/"
auth_endpoint = "j_security_check"

login_body = {
    "j_username": "devnetuser",
    "j_password": "Cisco123!"
}

sesh = requests.session()
login_response = sesh.post(
    url=f"{base_url}{auth_endpoint}", data=login_body, verify=False)

if not login_response.ok or login_response.text:
    print('login failed')
    import sys
    sys.exit(1)
else:
    print('login succeeded')

template_url = "dataservice/template/feature?templateType=aaa"

template_response = sesh.get(
    url=f"{base_url}{template_url}", verify=False).json()['data']

print(json.dumps(template_response, indent=2))
