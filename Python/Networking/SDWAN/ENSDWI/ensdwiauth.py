import requests
import json


def getAuth(url, username, password, port=8443):
    login_body = {
        "j_username": username,
        "j_password": password
    }
    base_url = f"{url}:{port}/"
    auth_endpoint = "j_security_check"
    sesh = requests.session()
    login_response = sesh.post(
        url=f"{base_url}{auth_endpoint}", data=login_body, verify=False)

    if not login_response.ok or login_response.text:
        print('login failed')
        import sys
        sys.exit(1)
    else:
        print('login succeeded')
        return sesh
