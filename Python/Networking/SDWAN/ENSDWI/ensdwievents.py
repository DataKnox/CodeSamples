import requests
import json
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def getEvents(url, session):
    events_endpoint = "dataservice/event"
    sesh = session
    events = sesh.get(
        url=f"{url}{events_endpoint}", verify=False).json()

    #print(json.dumps(events, indent=2))
    return events
