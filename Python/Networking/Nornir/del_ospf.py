from nornir_pyez.plugins.tasks import pyez_config, pyez_diff, pyez_commit
from nornir import InitNornir
from nornir_utils.plugins.functions import print_result
from nornir.core.filter import F
import os

script_dir = os.path.dirname(os.path.realpath(__file__))

nr = InitNornir(config_file=f"{script_dir}/config.yml")

junos_devices = nr.filter(F(node_type="router"))


payload = "delete protocols isis"

send_result = junos_devices.run(
    task=pyez_config, payload=payload, data_format='set', commit_now=True)
print_result(send_result)
