from ncclient import manager
from pprint import pprint
import xmltodict
import xml.dom.minidom
switch = {"host": "10.10.10.150", "port": "830",
          "username": "root", "password": ""}

#rpc_filter = "<get-interface-information><interface-name>ge-0/0/1</interface-name><detail/></get-interface-information>"
rpc_filter = "<get-interface-information><terse/></get-interface-information>"

with manager.connect(host=switch["host"], port=switch["port"], username=switch["username"], password=switch["password"], hostkey_verify=False, device_params={"name": "junos"}) as m:
    for capability in m.server_capabilities:
        print('*' * 50)
        print(capability)
    # get the running config on the filtered out interface
    print('Connected')
    netconf_response = m.rpc(rpc_filter)
    print('getting interface details')
    # print(netconf_response)
    interface_name = netconf_response.xpath('//physical-interface/name')
    interface_status = netconf_response.xpath(
        '//physical-interface/oper-status')
    int_admin = netconf_response.xpath('//physical-interface/admin-status')
    logical_name = netconf_response.xpath(
        '//physical-interface/logical-interface/name')
    local_address = netconf_response.xpath(
        '//physical-interface/logical-interface/address-family/interface-address/ifa-local')

    for ph_name, status, admin, l_name in zip(interface_name, interface_status, int_admin, logical_name):
        ph_name = ph_name.text.split('\n')[1]
        status = status.text.split('\n')[1]
        admin = admin.text.split('\n')[1]
        l_name = l_name.text.split('\n')[1]

        print(f"{ph_name} , {status} , {admin} , {l_name}")
