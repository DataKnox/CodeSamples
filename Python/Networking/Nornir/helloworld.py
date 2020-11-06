from nornir import InitNornir
from nornir_scrapli.tasks import netconf_get
import os
script_dir = os.path.dirname(os.path.realpath(__file__))

nr = InitNornir(
    config_file=f"{script_dir}\config.yml")
ospf_xpath = '/ospf-oper-data/ospf-state/ospf-instance[af="address-family-ipv4" and router-id="16843009"]/ospf-area[area-id=0]/ospf-interface[name="GigabitEthernet2"]/ospf-neighbor[neighbor-id="2.2.2.2"]/state'
result = nr.run(task=netconf_get, filter_type='xpath', filter_=ospf_xpath)
print(result)
