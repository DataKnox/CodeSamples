from jnpr.junos import Device
from jnpr.junos.utils.config import Config
from jnpr.junos.exception import *


switch = {'host': '10.10.10.150', 'user': 'root', 'pw': 'S0lut1ons'}

conn = Device(host=switch['host'],
              user=switch['user'], password=switch['pw'])
try:
    conn.open()
    config = Config(conn)
    payload = """vlans
        vlan101{
            vlan-id 101;
            }
        }
        """
    config.lock()
    config.load(payload, format='text')
    config.pdiff()
    if config.commit_check():
        config.commit()
    else:
        config.rollback()
    config.unlock()

except ConnectAuthError as error:
    print('Authentication error occurred. Check your creds')
    print(str(error))
except ConfigLoadError as error:
    print(f'Config Load error: {str(error)}')
finally:
    conn.close()
