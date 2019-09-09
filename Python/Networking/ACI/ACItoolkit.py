from acitoolkit.acitoolkit import *

# See capabilities
# dir()

url = 'https://sandboxapicdc.cisco.com'
user = 'admin'
pw = 'ciscopsdt'

# Create the session object
session = Session(url, user, pw)

# Login to the session
session.login()

# Get tenants
tenants = Tenant.get(session)
for tenant in tenants:
    print(tenant.name)
    print(tenant.descr)
    print('*' * 30)
    print(' ')

new_tenant = Tenant("Tenant Name Here")
new_tenant.get_url()
new_tenant.get_json()

session.push_to_apic(new_tenant.get_url(), new_tenant.get_json())
