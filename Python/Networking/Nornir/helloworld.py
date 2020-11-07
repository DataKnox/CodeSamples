from nornir import InitNornir
from nornir_scrapli.tasks import netconf_get
from nornir_utils.plugins.functions import print_result
import xmltodict
import os

script_dir = os.path.dirname(os.path.realpath(__file__))

nr = InitNornir(config_file=f"{script_dir}/config.yml")


ospf_xpath = '/ospf-oper-data/ospf-state/ospf-instance'
node_data = {}

results = nr.run(task=netconf_get, filter_type='xpath', filter_=ospf_xpath)
# Get address family and router-id
for result in results.keys():
    data = xmltodict.parse(results[result].result)
    node_data[result] = {}
    node_data[result]['af'] = data['rpc-reply']['data']['ospf-oper-data']['ospf-state']['ospf-instance']['af']
    node_data[result]['router-id'] = data['rpc-reply']['data']['ospf-oper-data']['ospf-state']['ospf-instance']['router-id']
    node_data[result]['area-id'] = data['rpc-reply']['data']['ospf-oper-data']['ospf-state']['ospf-instance']['ospf-area']['area-id']
    for ints in data['rpc-reply']['data']['ospf-oper-data']['ospf-state']['ospf-instance']['ospf-area']['ospf-interface']:
        if 'ospf-neighbor' in ints:
            node_data[result]['if-name'] = ints['name']
            node_data[result]['neighbor-id'] = ints['ospf-neighbor']['neighbor-id']

for result in results.keys():
    if result in node_data:
        ospf_xpath = f'/ospf-oper-data/ospf-state/ospf-instance[af="{node_data[result]["af"]}" and router-id="{node_data[result]["router-id"]}"]/ospf-area[area-id={node_data[result]["area-id"]}]/ospf-interface[name="{node_data[result]["if-name"]}"]/ospf-neighbor[neighbor-id="{node_data[result]["neighbor-id"]}"]/state'
        result = nr.run(task=netconf_get, filter_type='xpath',
                        filter_=ospf_xpath)
        print_result(result)
