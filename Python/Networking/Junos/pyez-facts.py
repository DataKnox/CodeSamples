from jnpr.junos import Device
from pprint import pprint

switch = {'host': '10.10.10.150', 'user': 'root', 'pw': ''}

conn = Device(host=switch['host'],
              user=switch['user'], password=switch['pw'])

conn.open()
# pprint(conn.facts)
hostname = conn.facts['hostname']
style = conn.facts['switch_style']
print(f"{hostname} has the style type of {style}")
conn.close()
