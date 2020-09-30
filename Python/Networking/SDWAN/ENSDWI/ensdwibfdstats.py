import requests
import json
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def getBfdStats(url, session):
    bfdstats_endpoint = "dataservice/statistics/bfd"
    sesh = session
    bfdstats = sesh.get(
        url=f"{url}{bfdstats_endpoint}", verify=False).json()['data']

    # print(bfdstats.text)
    return bfdstats
