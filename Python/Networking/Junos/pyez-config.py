from jnpr.junos import Device
from jnpr.junos.utils.config import Config


switch = {'host': '10.10.10.150', 'user': 'root', 'pw': ''}

device = Device(host=switch['host'],
                user=switch['user'], password=switch['pw'])
device.open()
config = Config(device)
payload = """vlans{
    vlan101{
        vlan-id 101;
        }
    }
    """
config.lock()
config.load(payload, format='text')
config.pdiff()
if config.commit_check() == True:
    config.commit()
else:
    config.rollback()
config.unlock()
device.close()
