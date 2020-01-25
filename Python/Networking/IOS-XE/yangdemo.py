from ncclient import manager
import xml.etree.ElementTree as ET

router = {"host": "ios-xe-mgmt-latest.cisco.com", "port": "10000",
          "username": "developer", "password": "C1sco12345"}

with manager.connect(host=router['host'], port=router['port'], username=router['username'], password=router['password'], hostkey_verify=False) as m:
    ip_schema = m.get_schema('ietf-yang-types')
    root = ET.fromstring(ip_schema.xml)
    yang_tree = list(root)[0].text
    f = open('ietf-yang-types  .yang', 'w')
    f.write(yang_tree)
    f.close()
