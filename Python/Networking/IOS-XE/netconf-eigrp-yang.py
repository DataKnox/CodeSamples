from ncclient import manager
from pprint import pprint
import xmltodict

import logging
logging.basicConfig(level=logging.DEBUG)

router = {"host": "10.10.10.2", "port": "830",
          "username": "knox", "password": "cisco"}
print(router["host"])
print(router["port"])
print(router["username"])
print(router["password"])

netconf_filter = """
<filter>
<eigrp-oper-data xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-eigrp-oper"  xmlns:eigrp-ios-xe-oper="http://cisco.com/ns/yang/Cisco-IOS-XE-eigrp-oper">
  <eigrp-instance>       
    <eigrp-topo><topo-id>0</topo-id></eigrp-topo>
    </eigrp-instance>
</eigrp-oper-data>
</filter>
"""

with manager.connect(host=router["host"], port=router["port"], username=router["username"], password=router["password"], hostkey_verify=False) as m:
    for capability in m.server_capabilities:
        print('*' * 50)
        print(capability)
    # get the running config on the filtered out interface
    print('Connected')
    interface_netconf = m.get(filter=netconf_filter)
    print('getting running config')
# below, xml is a property of interface_conf

# XMLDOM for formatting output to xml
# -----UNCOMMENT BELOW
# xmlDom = xml.dom.minidom.parseString(str(interface_netconf))
# print(xmlDom.toprettyxml(indent="  "))
# print('*' * 25 + 'Break' + '*' * 50)
# -----UNCOMMENT ABOVE

# XMLTODICT for converting xml output to a python dictionary
interface_python = xmltodict.parse(interface_netconf.xml)[
    "rpc-reply"]["data"]
pprint(interface_python)
