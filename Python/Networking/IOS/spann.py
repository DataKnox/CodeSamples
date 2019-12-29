import os
from dotenv import load_dotenv
from netmiko import ConnectHandler
import json

load_dotenv()

user = os.environ.get('username')
pw = os.environ.get('password')
sec = os.environ.get('secret')

# Connect
switch = {
    'device_type': 'cisco_ios_telnet',
    'ip': '10.10.10.2',
    'username': user,
    'password': pw,
    'secret': sec,
    'port': 23
}


try:
    c = ConnectHandler(**switch)
    c.enable()
    stps = c.send_command('show spanning-tree', use_textfsm=True)
    print(json.dumps(stps, indent=2))
    for stp in stps:
        print(' ')
        print(
            f"{stp['interface']}.{stp['vlan_id']} is currently in role {stp['role']}")
    c.disconnect()
except Exception as e:
    print(e)
