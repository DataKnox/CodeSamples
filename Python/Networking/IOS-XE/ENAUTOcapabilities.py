from ncclient import manager
import logging

logging.basicConfig(level=logging.DEBUG)

router = {
    "host": "ios-xe-mgmt-latest.cisco.com",
    "port": "10000",
    "username": "developer",
    "password": "C1sco12345"
}

with manager.connect(**router, hostkey_verify=False) as m:
    print('hello world')
