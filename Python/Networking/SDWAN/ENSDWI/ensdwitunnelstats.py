import requests
import json
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def getTunnelStats(url, session, device_id):
    tunnelstats_endpoint = f"dataservice/device/tunnel/statistics?deviceId={device_id}"
    sesh = session
    tunnelstats = sesh.get(
        url=f"{url}{tunnelstats_endpoint}", verify=False).json()

    #print(json.dumps(events, indent=2))
    return tunnelstats
