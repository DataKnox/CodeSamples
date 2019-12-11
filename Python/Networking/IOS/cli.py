import os
from dotenv import load_dotenv
import logging
from netmiko import ConnectHandler
logging.basicConfig(level=logging.DEBUG,
                    format=' %(asctime)s - %(levelname)s - %(message)s')
logging.disable(logging.CRITICAL)

# load creds from environment variables
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
c = ConnectHandler(**switch)
c.enable()
results = c.send_command('show run')
c.disconnect()

filename = f"{switch['ip']}.txt"
file = open(
    f"/home/knox/Documents/CodeSamples/Python/Networking/IOS/{filename}", 'w')
file.write(results)
file.close()
