from ncclient import manager
from pprint import pprint
from ncclient.xml_ import *

# set device configs
switch = {"host": "10.10.10.150", "port": "830",
          "username": "root", "password": ""}

# make initial connection and save session as variable m
with manager.connect(host=switch["host"], port=switch["port"], username=switch["username"], password=switch["password"], hostkey_verify=False, device_params={"name": "junos"}) as m:
    # retrieve config in XML format
    response = m.get_configuration(format='xml')

    interfaces = response.xpath('configuration/interfaces/interface')

    for interface in interfaces:
        int_name = interface.xpath('name')[0].text
        int_unit = interface.xpath('unit/name')[0].text
        ip = []
        for name in interface.xpath('unit/family/inet/address/name'):
            ip.append(name.text)
        print(f"{int_name}.{int_unit} {ip}")
        # print(response)
