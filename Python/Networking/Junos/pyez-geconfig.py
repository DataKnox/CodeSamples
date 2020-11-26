from jnpr.junos import Device
from lxml import etree

with Device(host='10.10.10.152', user='knox', password='juniper1') as dev:
    data = dev.rpc.get_config(options={'database': 'committed'})
    print(etree.tostring(data, encoding='unicode', pretty_print=True))
