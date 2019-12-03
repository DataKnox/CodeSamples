from jnpr.junos import Device
from pprint import pprint

device = Device(host='10.10.10.150', user='root', password='')
device.open()
# pprint(device.facts)
print(device.facts['hostname'])
