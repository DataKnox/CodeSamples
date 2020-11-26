from nornir_pyez.plugins.tasks import pyez_config, pyez_diff, pyez_commit
from nornir import InitNornir
from nornir_utils.plugins.functions import print_result
from nornir.core.filter import F
import os

script_dir = os.path.dirname(os.path.realpath(__file__))

nr = InitNornir(config_file=f"{script_dir}/config.yml")

junos_devices = nr.filter(F(node_type="routers"))


def ospf_config(task):
    data = {}

    data['ospf_int'] = {}
    for intf in task.host['ospf_int']:
        data['ospf_int'][intf] = {}
        for area in task.host['ospf_int'][intf]:
            data['ospf_int'][intf][area] = task.host['ospf_int'][intf][area]
    data['interfaces'] = {}
    for inte in task.host['interfaces']:
        data['interfaces'][inte] = {}
        for add in task.host['interfaces'][inte]:
            data['interfaces'][inte]['ipv4_address'] = task.host['interfaces'][inte][add]
    print(data)
    int_response = task.run(name='int config', task=pyez_config, template_path='/mnt/c/Code/CodeSamples/Python/Networking/Nornir/interfaces.j2',
                            template_vars=data, data_format='xml')
    if int_response:
        diff = task.run(task=pyez_diff, name='int diff')
    if diff:
        commit = task.run(task=pyez_commit, name='int commit')
    response = task.run(task=pyez_config, template_path='/mnt/c/Code/CodeSamples/Python/Networking/Nornir/ospf.j2',
                        template_vars=data, data_format='xml', name='config ospf')
    if response:
        diff = task.run(pyez_diff)
    if diff:
        commit = task.run(pyez_commit)


send_result = junos_devices.run(
    task=ospf_config)
print_result(send_result)
