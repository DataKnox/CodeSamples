import requests
import json

base_url = "https://sandboxdnac2.cisco.com/dna/"
auth_endpoint = "system/api/v1/auth/token"

user = 'devnetuser'
password = 'Cisco123!'

auth_response = requests.post(
    url=f"{base_url}{auth_endpoint}", auth=(user, password)).json()

token = auth_response['Token']

headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "x-auth-token": token
}

cred_cli_endpoint = "intent/api/v1/global-credential?credentialSubType=CLI"

cli_response = requests.get(
    url=f"{base_url}{cred_cli_endpoint}", headers=headers).json()['response'][0]
print(cli_response)
cli_cred = cli_response['id']

cred_snmp_endpoint = "intent/api/v1/global-credential?credentialSubType=SNMPV2_WRITE_COMMUNITY"

snmp_response = requests.get(
    url=f"{base_url}{cred_cli_endpoint}", headers=headers).json()['response'][0]

snmp_cred = snmp_response['id']

payload = {
    "name": "IP Range Discovery",
    "discoveryType": "Range",
    "ipAddressList": "10.10.20.30-10.10.20.254",
    "timeout": 1,
    "protocolOrder": "ssh,telnet",
    "preferredMgmtIPMethod": "None",
    "globalCredentialIdList": [cli_cred, snmp_cred]
}

discovery_endpoint = "intent/api/v1/discovery"

discovery_response = requests.post(
    url=f"{base_url}{discovery_endpoint}", headers=headers, data=json.dumps(payload)).json()

print(discovery_response)
