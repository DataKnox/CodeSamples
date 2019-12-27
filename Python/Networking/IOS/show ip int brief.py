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
    interfaces = c.send_command('show ip int brief', use_textfsm=True)
    #print(json.dumps(interfaces, indent=2))
    for interface in interfaces:
        if interface['status'] == 'down':
            print(f"{interface['intf']} is down!")
    c.close()
except Exception as e:
    print(e)
