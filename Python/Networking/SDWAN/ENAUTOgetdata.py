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

cert_status = "dataservice/certificate/stats/summary"

# response = sesh.get(url=f"{base_url}{cert_status}", verify=False).json()

# print(json.dumps(response, indent=2))

alarm_counter = 'dataservice/alarms/count'
# response = sesh.get(url=f"{base_url}{alarm_counter}", verify=False).json()

# print(json.dumps(response, indent=2))

tunnel_endpoint = 'dataservice/device/tunnel/statistics?deviceId=4.4.4.61'

response = sesh.get(url=f"{base_url}{tunnel_endpoint}", verify=False).json()

print(json.dumps(response, indent=2))
