import requests
import json
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def getControlConnections(url, session, device_id):
    controlconn_endpoint = f"dataservice/device/control/connections?deviceId={device_id}"
    sesh = session
    controlconn = sesh.get(
        url=f"{url}{controlconn_endpoint}", verify=False).json()

    #print(json.dumps(events, indent=2))
    return controlconn
