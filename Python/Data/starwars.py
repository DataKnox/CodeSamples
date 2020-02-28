import requests
import json

base_url = 'https://swapi.co/api/'
endpoint = 'people/2/'
headers = {'Accept': 'application/json'}

response = requests.get(url=f"{base_url}{endpoint}", headers=headers)

if response.status_code == 200:
    data = response.json()
    print(f"Name: {data['name']}")
    print(f"Height {data['height']}")
    print(
        f"Homeworld: {requests.get(data['homeworld'],headers=headers).json()['name']}")
