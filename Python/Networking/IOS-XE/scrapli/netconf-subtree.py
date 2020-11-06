from scrapli_netconf.driver import NetconfScrape
from mydevice import *

ospf_filter = """
<ospf-oper-data xmlns="http://cisco.com/ns/yang/Cisco-IOS-XE-ospf-oper">
    <ospf-state>        
        <ospf-instance>
          <af>address-family-ipv4</af>
          <router-id>16843009</router-id>
          <ospf-area>
            <area-id>0</area-id>
              <ospf-interface>
               <name>Loopback0</name>
               <passive></passive>
              </ospf-interface>
            </ospf-area>
        </ospf-instance>
    </ospf-state>
</ospf-oper-data>
"""

conn = NetconfScrape(**router)
conn.open()
response = conn.get(
    filter_=ospf_filter, filter_type='subtree')
print(response.result)
