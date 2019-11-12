from jnpr.junos import Device
from pprint import pprint

switch = {'host': '10.10.10.150', 'user': 'root', 'pw': ''}

conn = Device(host=switch['host'],
              user=switch['user'], password=switch['pw'])

conn.open()
routes_xml = conn.rpc.get_route_information(table='inet.0')
routes = routes_xml.findall('.//rt')
for route in routes:
    if route.findtext('rt-entry/protocol-name') != 'Local':
        dest = route.findtext('rt-destination')
        via = route.findtext('rt-entry/nh/via')
        print(f"{dest} via {via}")
