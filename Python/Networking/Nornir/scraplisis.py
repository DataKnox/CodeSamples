from nornir import InitNornir
from nornir_scrapli.tasks import netconf_get_config, netconf_get, netconf_edit_config, send_command
from nornir_utils.plugins.functions import print_result
import xmltodict
import os
import logging
from scrapli.driver.core import IOSXEDriver
from ttp import ttp
from nornir.core.task import Task, Result

script_dir = os.path.dirname(os.path.realpath(__file__))
ttp_template = """
{{hostname}}            {{is-level}}   {{int}}       {{nei_ip | IP}}      {{state}}   {{holdtime}}       {{circuit}}  
"""
nr = InitNornir(config_file=f"{script_dir}/config.yml")


def show_isis_nei(task):
    response = task.run(task=send_command, command="show isis nei")
    # print(response.result)
    data_to_parse = response.result
    # create parser object and parse data using template:
    parser = ttp(data=data_to_parse, template=ttp_template)
    parser.parse()
    # print result in JSON format
    results = parser.result(format='json')[0]
    return Result(host=task.host, result=results)


def create_isis(task):
    print(f"{task.host.name} does not ISIS")
    mac_path = '//interfaces/interface[name="GigabitEthernet1"]/bia-address'
    bia_results = task.run(
        task=netconf_get, filter_type='xpath', filter_=mac_path)
    mac_dict = xmltodict.parse(bia_results.result)
    bia = mac_dict['rpc-reply']['data']['interfaces']['interface']['bia-address']
    bia = bia.replace(':', '')
    bia = '.'.join(bia[i:i+4] for i in range(0, len(bia), 4))
    # bia = bia_results[]
    isis_config = f"""
        <config>
         <native xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-native">
         <interface>
           <GigabitEthernet>
            <name>2</name>
            <ip>
              <router>
                 <isis xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-isis"></isis>
              </router>
            </ip>
           </GigabitEthernet>
         </interface>
          <router>
            <isis xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-isis">
              <net>
                <tag>49.0000.{bia}.00</tag>
              </net>
            </isis>
          </router>
          </native>
        </config>
"""
    task.run(task=netconf_edit_config,
             target='running', config=isis_config)


def check_for_isis(task):
    result = task.run(task=netconf_get_config, severity_level=logging.DEBUG)
    data = xmltodict.parse(result.result)

    if 'isis' in data['rpc-reply']['data']['native']['router']:
        task.run(task=show_isis_nei)

    if 'isis' not in data['rpc-reply']['data']['native']['router']:
        task.run(task=create_isis)


results = nr.run(task=check_for_isis)
print_result(results)
