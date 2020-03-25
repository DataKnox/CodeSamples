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

payload = {
    "templateName": "vManage_template",
    "templateDescription": "vmanage demo",
    "deviceType": "vmanage",
    "configType": "template",
    "factoryDefault": False,
    "policyId": "",
    "featureTemplateUidRange": [],
    "generalTemplates": [
        {
            "templateId": "476b52d0-3196-4625-82be-1deb124a5199",
            "templateType": "aaa"
        },
        {
            "templateId": "777f1262-1ae7-4dea-82d1-b24b2132d548",
            "templateType": "system-vedge"
        },
        {
            "templateId": "bf3fcac8-8ab3-46a3-9ab5-c0d3e6107826",
            "templateType": "vpn-vsmart"
        },
    ]

}

create_url = "dataservice/template/device/feature"
headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
}

# response = sesh.post(url=f"{base_url}{create_url}", headers=headers,
#                      data=json.dumps(payload), verify=False).json()
# print(json.dumps(response, indent=2))

device_temp_payload = {
    "templateId": "d43a284d-c69c-4919-aaf3-012492f539c8",
    "deviceIds": ["e85cd6d5-4dea-46a1-affb-38fd4cd8debd"],
    "isEdited": False,
    "isMasterEdited": False
}

device_temp_url = "dataservice/template/device/config/input"

response = sesh.post(url=f"{base_url}{device_temp_url}", headers=headers,
                     data=json.dumps(device_temp_payload), verify=False)
