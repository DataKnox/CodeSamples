import napalm
import json

driver = napalm.get_network_driver('junos')

device = driver(hostname='10.10.10.152', username='knox', password='juniper1')
device.open()
print(device.get_config(retrieve='running', full=False))
print(device.get_environment())
device.close()
