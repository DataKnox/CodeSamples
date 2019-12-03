import requests

url = "http://10.10.10.152:8080/rpc/get-interface-information"

headers = {
    'Accept': "application/xml",
    'Content-Type': "application/xml",
    'Authorization': "Basic a25veDpqdW5pcGVyMQ==",
    'User-Agent': "PostmanRuntime/7.19.0",
    'Cache-Control': "no-cache",
    'Postman-Token': "373d2816-9083-4a32-84e1-aa8acf2b7341,04b4dcb9-d0c8-4c0d-94c2-46ecef4b179b",
    'Host': "10.10.10.152:8080",
    'Accept-Encoding': "gzip, deflate",
    'Connection': "keep-alive",
    'cache-control': "no-cache"
}

response = requests.request("GET", url, headers=headers)

print(response.text)
