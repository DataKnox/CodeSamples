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

new_tenant = Tenant("Tenant_Name_Here")
new_tenant.get_url()
new_tenant.get_json()
print(new_tenant.get_url())
print(new_tenant.get_json())

response = session.push_to_apic(
    new_tenant.get_url(), data=new_tenant.get_json())
print(response)

tenants = Tenant.get(session)
for tenant in tenants:
    if tenant.name == 'Tenant_Name_Here':
        print(tenant.name)
    else:
        print(tenant.name)
        print(tenant.descr)
        print('*' * 30)
        print(' ')


new_tenant.mark_as_deleted()
session.push_to_apic(new_tenant.get_url(), new_tenant.get_json())
