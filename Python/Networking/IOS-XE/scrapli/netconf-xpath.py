from scrapli_netconf.driver import NetconfScrape
from mydevice import *

import logging
logging.basicConfig(level=logging.DEBUG)


eigrp_filter = '/eigrp-oper-data/eigrp-instance/eigrp-topo/eigrp-network[afi="eigrp-af-ipv4" and ip-prefix="192.168.10.0/24"]/rd-vecmetric'

conn = NetconfScrape(**switch)
conn.open()
response = conn.get(
    filter_=eigrp_filter, filter_type='xpath',)
print(response.result)
