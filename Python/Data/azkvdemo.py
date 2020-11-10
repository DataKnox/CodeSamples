import os
from dotenv import load_dotenv
from azure.keyvault.secrets import SecretClient
from azure.identity import DefaultAzureCredential

load_dotenv()

key_vault = os.environ.get('KEY_VAULT_NAME')
kv_url = f"https://{key_vault}.vault.azure.net"

credential = DefaultAzureCredential()
client = SecretClient(vault_url=kv_url, credential=credential)

secretName = input("Input a name for your secret > ")
secretValue = input("Input a value for your secret > ")

client.set_secret(secretName, secretValue)

secret = client.get_secret(secretName)

print(f"The secret is {secret.value}")
