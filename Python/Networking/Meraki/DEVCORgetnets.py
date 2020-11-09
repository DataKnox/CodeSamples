from dotenv import load_dotenv
import requests
import json
import os

load_dotenv()

token = os.environ.get('TOKEN')

headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "X-Cisco-Meraki-API-Key": token
}

base_url = "https://api.meraki.com/api/v0"
org_url = "/organizations"


def get_net_id():
    try:
        org_response = requests.get(
            url=f"{base_url}{org_url}", headers=headers)
        if org_response.status_code == 200:
            orgs = json.loads(org_response.text)
            for org in orgs:
                if org['name'] == 'DevNet Sandbox':
                    org_id = org['id']
                    # print(org_id)
    except Exception as err:
        print(err)

    net_url = f"/organizations/{org_id}/networks"

    try:
        nets_response = requests.get(
            url=f"{base_url}{net_url}", headers=headers)
        # print(nets_response)
        if nets_response.status_code == 200:
            nets = json.loads(nets_response.text)
            # print(nets)
            for net in nets:
                # print(net['name'])
                if net['name'] == 'DNENT1-mxxxxx5gmail.com':
                    net_id = net['id']
                    print(f"Network ID is {net_id}")
    except Exception as err:
        print(err)
    return net_id
