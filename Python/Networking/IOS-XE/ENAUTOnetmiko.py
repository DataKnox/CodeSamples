from netmiko import ConnectHandler
from dotenv import load_dotenv
load_dotenv()
router = {
    "host": "ios-xe-mgmt-latest.cisco.com",
    "port": 8181,
    "username": "root",
    "password": "D_Vay!_10&",
    "device_type": "cisco_ios"
}

configs = ['int loopback101', 'ip address 10.99.98.1 255.255.255.0', 'no shut']

try:
    c = ConnectHandler(**router)
    c.enable()
    c.send_config_set(configs)
    response = c.send_command("show ip int brief", use_textfsm=True)
    c.disconnect()
except Exception as ex:
    print(ex)
else:
    print(response)
