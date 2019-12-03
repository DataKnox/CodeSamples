from jnpr.junos import Device

switch = {'host': '10.10.10.151', 'user': 'root', 'pw': 'S0lut1ons'}

device = Device(host=switch['host'],
                user=switch['user'], password=switch['pw'])

device.open()

routes_xml = device.rpc.get_route_information(table='inet.0')

routes = routes_xml.findall('.//rt')

for route in routes:
    if route.findtext('rt-entry/protocol-name') != 'Local':
        dest = route.findtext('rt-destination')
        via = route.findtext('rt-entry/nh/via')
        print(f"{dest} via {via}")
