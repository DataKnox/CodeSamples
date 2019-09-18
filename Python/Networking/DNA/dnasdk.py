from dnacentersdk import api
import json
import time
import calendar

dna = api.DNACenterAPI(base_url='https://sandboxdnac2.cisco.com',
                       username='devnetuser', password='Cisco123!')


##### NETWORKS AND SITES ####

# Print Site Topology
sites = dna.networks.get_site_topology()
for site in sites.response.sites:
    if site.parentId == 'a7cbac22-d82e-42ed-a705-b51829e955fa':
        print(site.name)
        for child_sites in sites.response.sites:
            if child_sites.parentId == site.id:
                print(f'  {child_sites.name}')
            for more_children in sites.response.sites:
                if more_children.parentId == child_sites.id and child_sites.parentId == site.id:
                    print(f'    {more_children.name}')
    print(' ')

# Print Vlans
vlans = dna.networks.get_vlan_details()
for vlan in vlans.response:
    print(vlan)

# Physical Topology Details
phys_top = dna.networks.get_physical_topology()
print(json.dumps(phys_top, indent=2, sort_keys=True))


############### DEVICES #############
# Print Device Details
devices = dna.devices.get_device_list()
for device in devices.response:
    print(device.type)
    print(device.hostname)
    print(device.managementIpAddress)
    print(device.id)
    print(" ")

# Get a specific device
device = dna.devices.get_device_by_id('10cdbf6d-3672-4b4d-ae75-5b661fa0a5bc')
print(device)


######## HEALTH CHECKS ################
############# CLIENTS ##############
# Get Client Health with Epoch Datetime
epoch_datetime = calendar.timegm(time.gmtime())

client_health = dna.clients.get_overall_client_health(
    timestamp=str(epoch_datetime))

print(json.dumps(client_health, indent=2, sort_keys=True))
print(' ')
# # GET NETWORK HEALTH
# net_health = dna.networks.get_overall_network_health(timestamp=str(epoch_datetime)
#                                                      )
# print(net_health)
# print(' ')
# # GET SITE HEALTH
# site_health = dna.sites.get_site_health(timestamp=str(epoch_datetime))
# print(json.dumps(site_health, indent=2, sort_keys=True))
