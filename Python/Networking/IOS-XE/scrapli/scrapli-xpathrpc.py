from scrapli_netconf.driver import NetconfScrape
from mydevice import *

# import logging
# logging.basicConfig(level=logging.DEBUG)

xpath_filter = '''
<get>
<filter xmlns:t="http://cisco.com/ns/yang/Cisco-IOS-XE-ospf-oper" type="xpath" select="/ospf-oper-data" />
</get>
'''

conn = NetconfScrape(**router)
conn.open()
response = conn.rpc(
    filter_=xpath_filter)
print(response.result)
