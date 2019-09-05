from meraki_sdk.meraki_sdk_client import MerakiSdkClient
import json
from pprint import pprint
# import logging
# logging.basicConfig(level=logging.DEBUG)


# CREATE Connection Object
x_cisco_meraki_api_key = '6bec40cf957de430a6f1f2baa056b99a4fac9ea0'  # Demo DevNet Sandbox
meraki = MerakiSdkClient(x_cisco_meraki_api_key)

# Get Orgs
orgs = meraki.organizations.get_organizations()
# print(json.dumps(orgs, indent=2, sort_keys=True))
# pprint(orgs)


# Set OrgId
for org in orgs:
    if org['name'] == "DevNet Sandbox":
        orgId = org['id']

# Get Networks in Org
params = {}
params['organization_id'] = orgId
networks = meraki.networks.get_organization_networks(params)
pprint(networks)

# Set NetworkId
for network in networks:
    if network['name'] == "DevNet Always On Read Only":
        netId = network['id']
# print(netId)

# GET VLANS
vlans = meraki.vlans.get_network_vlans(netId)


vlan = vlans[0]
# CHANGE VLAN NAME HERE
vlan['name'] = 'Default'


updatedVlan = {}
updatedVlan['network_id'] = netId
updatedVlan['vlan_id'] = vlan['id']
updatedVlan['update_network_vlan'] = vlan
# pprint(updatedVlan)
result = meraki.vlans.update_network_vlan(updatedVlan)

# VERIFY
vlans = meraki.vlans.get_network_vlans(netId)
pprint(vlans)
