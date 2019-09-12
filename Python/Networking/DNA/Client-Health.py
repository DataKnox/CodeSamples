import requests
import json

url = "https://sandboxdnac2.cisco.com/dna/intent/api/v1/client-health"

querystring = {"timestamp": ""}

headers = {
    'x-auth-token': "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1Y2U3MTJiMDhlZTY2MjAyZmEyZWI4ZjgiLCJhdXRoU291cmNlIjoiaW50ZXJuYWwiLCJ0ZW5hbnROYW1lIjoiVE5UMCIsInJvbGVzIjpbIjViNmNmZGZmNDMwOTkwMDA4OWYwZmYzNyJdLCJ0ZW5hbnRJZCI6IjViNmNmZGZjNDMwOTkwMDA4OWYwZmYzMCIsImV4cCI6MTU2ODMwMzMwNSwidXNlcm5hbWUiOiJkZXZuZXR1c2VyIn0.Tb0o7nO85Inp4RiPnhDqQc3oHiJKsWK5NmXBUBzGGVQ",
    'User-Agent': "PostmanRuntime/7.16.3",
    'Accept': "*/*",
    'Cache-Control': "no-cache",
    'Postman-Token': "393a9fdd-f109-4fd3-821b-0ae2a03da256,3d2299b4-7515-4f80-9964-b33c2ae9c2ab",
    'Host': "sandboxdnac2.cisco.com",
    'Accept-Encoding': "gzip, deflate",
    'Connection': "keep-alive",
    'cache-control': "no-cache"
}

response = requests.get(url, headers=headers, params=querystring).json()

#print(json.dumps(response, indent=2, sort_keys=True))

print(
    f"Clients: {response['response'][0]['scoreDetail'][0]['clientCount']}")

scores = response['response'][0]['scoreDetail']

for score in scores:
    if score['scoreCategory']['value'] == 'WIRED':
        print(f"Wired Clients: {score['clientCount']}")
        score_values = score['scoreList']
        for score_value in score_values:
            print(
                f"  {score_value['scoreCategory']['value']} ({score_value['clientCount']})")
    elif score['scoreCategory']['value'] == 'WIRELESS':
        print(f"Wireless Clients: {score['clientCount']}")
        score_values = score['scoreList']
        for score_value in score_values:
            print(
                f"  {score_value['scoreCategory']['value']} ({score_value['clientCount']})")
