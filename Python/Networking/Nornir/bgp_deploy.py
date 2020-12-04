from nornir_pyez.plugins.tasks import *
from nornir import InitNornir
from nornir_utils.plugins.functions import print_result
from nornir.core.filter import F
import os

script_dir = os.path.dirname(os.path.realpath(__file__))

nr = InitNornir(config_file=f"{script_dir}/config.yml")

junos_devices = nr.filter(F(node_type="router"))


def bgp_deploy(task):
    ints = task.run(name='Collecting Interfaces', task=pyez_int_terse)
    neighbors = task.run(name='getting IS-IS neighbors',
                         task=pyez_rpc, func='get-isis-layer2-map-information')


response = junos_devices.run(task=bgp_deploy)
print_result(response)
