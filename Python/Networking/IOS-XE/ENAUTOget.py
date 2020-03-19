from ncclient import manager
#import logging
import xmltodict

# logging.basicConfig(level=logging.DEBUG)

router = {
    "host": "ios-xe-mgmt-latest.cisco.com",
    "port": "10000",
    "username": "developer",
    "password": "C1sco12345"
}

int_filter = """
 <filter>
  <interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
    <interface>
      <name>GigabitEthernet2</name>
    </interface>
  </interfaces>
  <interfaces-state xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
    <interface>
      <name>GigabitEthernet2</name>
    </interface>
  </interfaces-state>
</filter>
"""

with manager.connect(**router, hostkey_verify=False) as m:
    netconf_response = m.get(int_filter)

python_response = xmltodict.parse(netconf_response.xml)["rpc-reply"]["data"]
op = python_response["interfaces-state"]["interface"]
config = python_response["interfaces"]["interface"]

print(f"Name: {config['name']['#text']}")
print(f"Packets In: {op['statistics']['in-unicast-pkts']}")
