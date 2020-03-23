from ncclient import manager
from router_info import router

config_template = open(
    "E:/dev/CodeSamples/Python/Networking/IOS-XE/ios_config.xml").read()

netconf_config = config_template.format(
    interface_name="GigabitEthernet2", interface_desc="CBT Nuggets wuz here")

with manager.connect(**router, hostkey_verify=False) as m:
    response = m.edit_config(netconf_config, target="candidate")

print(response)
