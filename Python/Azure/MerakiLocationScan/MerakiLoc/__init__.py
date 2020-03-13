import logging
import json
import azure.functions as func


def main(req: func.HttpRequest, queueclient: func.Out[func.QueueMessage]) -> str:
    logging.info('Python HTTP trigger function processed a request.')
    print(req.method)
    if req.method == 'GET':
        queueclient.set('string')
        return func.HttpResponse(body='650a3212e0a8610f6e9eae1551f9e7e5727932d1', status_code=200)
    elif req.method == 'POST':
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            sharedSecret = req_body.get('secret')

        if sharedSecret == 'foo':
            queueclient.set(json.dumps(req_body))
            return func.HttpResponse(body=json.dumps(req_body), status_code=201, headers={'Content-Type': 'application/json'})
        else:
            return func.HttpResponse(
                body="<h1>Please pass a sharedSecret on the query string or in the request body</h1>",
                status_code=401
            )
