from dotenv import load_dotenv
import requests
import json
import os
from DEVCORgetnets import get_net_id

load_dotenv()

token = os.environ.get('TOKEN')

headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "X-Cisco-Meraki-API-Key": token
}

base_url = "https://api.meraki.com/api/v0"


def get_ssids():
    net_id = get_net_id()
    ssids_url = f'/networks/{net_id}/ssids'
    try:
        ssids_response = requests.get(
            url=f"{base_url}{ssids_url}", headers=headers)
        print(ssids_response)
        if ssids_response.status_code == 200:
            ssids = json.loads(ssids_response.text)
            for ssid in ssids:
                # print(ssid)
                if ssid['name'] == 'Unconfigured SSID 2':
                    ssid_details = {}
                    ssid_details['id'] = ssid['number']
                    ssid_details['name'] = ssid['name']
                    ssid_details['status'] = ssid['enabled']
                    return ssid_details
    except Exception as err:
        print(err)


ssid = get_ssids()
print(ssid)
