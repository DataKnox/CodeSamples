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

# admin_endpoint = "dataservice/admin/user"

# payload = {
#     "group": ["netadmin"],
#     "description": "Knox Data",
#     "userName": "knox",
#     "password": "Password!23"
# }

# headers = {
#     "Accept": "application/json",
#     "Content-Type": "application/json"
# }

# response = sesh.post(url=f"{base_url}{admin_endpoint}", data=json.dumps(
#     payload), headers=headers, verify=False)

# print(response.text)

pw_endpoint = "dataservice/admin/user/password/knox"

payload = {
    "userName": "knox",
    "password": "fnefAA!334"
}

headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
}

response = sesh.put(url=f"{base_url}{pw_endpoint}",
                    data=json.dumps(payload), headers=headers, verify=False)
print(response.text)
