from pyntc import ntc_device
from ntc_templates.parse import parse_output
import json
# device types =
# cisco_ios_ssh
# cisco_nxos_nxapi
# juniper_junos_netconf
srx = ntc_device(host='10.10.10.152', username='knox',
                 password='juniper1', device_type='juniper_junos_netconf')

response = srx.show('show interfaces')

print(response)
