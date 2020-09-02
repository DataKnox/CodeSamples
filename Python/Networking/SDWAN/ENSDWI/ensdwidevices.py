import requests
import json
from ensdwiauth import getAuth
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def getDevices(url, session):
    device_endpoint = "dataservice/device/monitor"
    sesh = session
    devices = sesh.get(
        url=f"{url}{device_endpoint}", verify=False).json()

    #print(json.dumps(devices, indent=2))
    return devices
