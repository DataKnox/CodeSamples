import json
import sys
import requests

# Set up variables
url = "https://fmcrestapisandbox.cisco.com"
login_url = '/api/fmc_platform/v1/auth/generatetoken'
headers = {'Content-Type': 'application/json'}

user = 'knox'
pw = 'BtNdJM9k'

try:
    # POST the login ans password to the login endpoint
    login_response = requests.post(
        f'{url}{login_url}', auth=(user, pw), verify=False)

    # Parse out the headers
    resp_headers = login_response.headers

    # Grab the token from the response headers
    token = resp_headers.get('X-auth-access-token', default=None)
    if token == None:
        print('Failed to get a token. Try again')
        sys.exit()

    # Set the token in the headers to be used in the next call
    headers['X-auth-access-token'] = token
except Exception as err:
    print(f"error raised! {err}")

# Get monitored apps
apps_url = '/api/fmc_config/v1/domain/e276abec-e0f2-11e3-8169-6d9ed49b625f/object/applications'

try:
    apps_response = requests.get(
        f'{url}{apps_url}', headers=headers, verify=False).json()

    print(json.dumps(apps_response, indent=2, sort_keys=True))
except Exception as err:
    print(f"error raised! {err}")
finally:
    if apps_response:
        apps_response.close()
