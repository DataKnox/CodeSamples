import requests
import xml.dom.minidom
import xmltodict
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
#### For use with the DevNet Sandbox CUCM 11.5 #####
url = 'https://10.10.20.1/cucm-uds'
endpoint = 'users'

users_url = f'{url}/{endpoint}'

headers = {
    'Accept': 'application/xml',
    'Content-Type': 'application/xml'
}

username = 'administrator'
pw = 'ciscopsdt'

r = requests.get(users_url, auth=(username, pw), verify=False)

# Pretty up the XML response
tree = xml.dom.minidom.parseString(r.text)
pretty = tree.toprettyxml()

# Convert to Python Dict
xmldata = xmltodict.parse(pretty)
#print(json.dumps(xmldata, indent=2, sort_keys=True))
users = xmldata['users']['user']
for user in users:
    print(f"{user['lastName']} {user['firstName']}")
    print(f"ID: {user['id']}")
    print(" ")
