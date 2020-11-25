from nornir_pyez.plugins.tasks import pyez_int_terse
from nornir import InitNornir
from nornir_utils.plugins.functions import print_result
from nornir.core.filter import F
import os

script_dir = os.path.dirname(os.path.realpath(__file__))

nr = InitNornir(config_file=f"{script_dir}/config.yml")

junos_devices = nr.filter(F(platform="junos"))

send_result = junos_devices.run(task=pyez_int_terse)
print_result(send_result)
