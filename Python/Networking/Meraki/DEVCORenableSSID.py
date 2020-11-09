from dotenv import load_dotenv
import requests
import json
import os
from DEVCORgetnets import get_net_id
from DEVCORgetssids import get_ssids

load_dotenv()

token = os.environ.get('TOKEN')

headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "X-Cisco-Meraki-API-Key": token
}

base_url = "https://api.meraki.com/api/v0"


def set_ssids():
    net_id = get_net_id()
    ssid_data = get_ssids()
    ssid_no = ssid_data['id']
    if not ssid_data['status']:
        print(f"Status is False {ssid_data['status']}")
        ssids_url = f'/networks/{net_id}/ssids/{ssid_no}'
        payload = {
            'name': ssid_data['name'],
            'enabled': True
        }
        response = requests.put(
            url=f"{base_url}{ssids_url}", headers=headers, data=json.dumps(payload))
        # print(response.status_code)
        # print(response)
        return response


if __name__ == "__main__":
    resp = set_ssids()
    print(resp)
