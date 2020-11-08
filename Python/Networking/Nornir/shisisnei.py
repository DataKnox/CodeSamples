from scrapli.driver.core import IOSXEDriver
from ttp import ttp


ttp_template = """
{{hostname}}            {{l}}   {{int}}       {{nei_ip | IP}}      {{state}}   {{hold}}       {{cir}}  
"""

my_device = {
    "host": "10.10.21.121",
    "auth_username": "cisco",
    "auth_password": "cisco",
    "auth_strict_key": False,
}

conn = IOSXEDriver(**my_device)
conn.open()
response = conn.send_command("show isis nei")
print(response.result)
data_to_parse = response.result
# create parser object and parse data using template:
parser = ttp(data=data_to_parse, template=ttp_template)
parser.parse()

# print result in JSON format
results = parser.result(format='json')[0]
print(results)
