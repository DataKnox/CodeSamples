from ucsmsdk.ucshandle import UcsHandle
handle = UcsHandle("10.10.20.113", "ucspe", "ucspe")
handle.login()
# DOCUMENTATION https://github.com/CiscoUcs/ucsmsdk https://ucsmsdk.readthedocs.io/en/latest/
######## ORG INFO ###########
org = handle.query_classid(class_id="orgOrg", hierarchy=True)
print(org)

########## Server Blade info ############
servers = handle.query_classid("computeBlade")
# print(srv)
for server in servers:
    print(server)

for server in servers:
    print(server.dn, server.num_of_cpus, server.available_memory)

####### Specific DN query ###############
blade = handle.query_dn('sys/chassis-3/blade-1')
print(blade)
# Logout
handle.logout()
