from nornir_pyez.plugins.tasks import pyez_rpc
import os
from nornir import InitNornir
from nornir_utils.plugins.functions import print_result
from rich import print

script_dir = os.path.dirname(os.path.realpath(__file__))

nr = InitNornir(config_file=f"{script_dir}/config.yml")

# xpath = 'interfaces/interface'
# xml = '<interfaces></interfaces>'
# database = 'committed'
extras = {
    "level-extra": "detail",
    "interface-name": "ge-0/0/0"
}

response = nr.run(
    task=pyez_rpc, func='get-interface-information', extras=extras)

# response is an AggregatedResult, which behaves like a list
# there is a response object for each device in inventory
devices = []
for dev in response:
    print(response[dev].result)
