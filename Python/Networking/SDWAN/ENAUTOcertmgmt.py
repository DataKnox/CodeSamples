import requests
import json
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

base_url = "https://10.10.20.90/"
auth_endpoint = "j_security_check"

login_body = {
    "j_username": "admin",
    "j_password": "admin"
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

cert_endpoint = "dataservice/certificate/vsmart/list"

headers = {
    "Accept": "application/json"
}

# response = sesh.get(url=f"{base_url}{cert_endpoint}", verify=False).json()

# print(json.dumps(response, indent=2))

root_endpoint = "dataservice/certificate/rootcertificate"

response = sesh.get(url=f"{base_url}{root_endpoint}",
                    headers=headers, verify=False).json()

print(json.dumps(response, indent=2))
