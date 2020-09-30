import requests
import json

base_url = "https://192.168.10.214/dna"
auth_endpoint = "/system/api/v1/auth/token"

username = 'admin'
password = 'dnacenter!@#99'

auth_headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
}

auth_response = requests.post(url=f"{base_url}{auth_endpoint}", auth=(
    username, password), headers=auth_headers, verify=False).json()

#print(json.dumps(auth_response, indent=2))

token = auth_response['Token']

req_headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "x-auth-token": token
}

cli_endpoint = '/intent/api/v1/global-credential?credentialSubType=CLI'

cli_credentials = requests.get(
    url=f"{base_url}{cli_endpoint}", headers=req_headers, verify=False).json()

snmp_wr_endpoint = '/intent/api/v1/global-credential?credentialSubType=SNMPV2_WRITE_COMMUNITY'

snmp_wr_credentials = requests.get(
    url=f"{base_url}{snmp_wr_endpoint}", headers=req_headers, verify=False).json()

cli_cred_id = cli_credentials['response'][0]['id']
snmp_wr_id = snmp_wr_credentials['response'][0]['id']

payload = {
    "name": "Fusion Router Discovery",
    "discoveryType": "Range",
    "ipAddressList": "192.168.1.5-192.168.1.6",
    "timeout": 1,
    "protocolOrder": "ssh,telnet",
    "preferredMgmtIPMethod": "None",
    "globalCredentialIdList": [cli_cred_id, snmp_wr_id]
}

discovery_endpoint = '/intent/api/v1/discovery'

disc_response = requests.post(url=f"{base_url}{discovery_endpoint}",
                              headers=req_headers, data=json.dumps(payload), verify=False).json()

print(json.dumps(disc_response, indent=2))
