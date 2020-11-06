from scrapli_netconf.driver import NetconfScrape
my_device = {
    "host": "10.10.10.2",
    "auth_username": "knox",
    "auth_password": "cisco",
    "auth_strict_key": False,
    "port": 830
}
conn = NetconfScrape(**my_device)
conn.open()
response = conn.get(
    filter_='//eigrp-network[ip-prefix="192.168.10.0/24"]/rd-vecmetric', filter_type="xpath")
print(response.result)
