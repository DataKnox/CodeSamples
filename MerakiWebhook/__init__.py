import logging
import json
import azure.functions as func


def main(req: func.HttpRequest, msg: func.Out[func.QueueMessage]) -> str:
    logging.info('Python HTTP trigger function processed a request.')

    try:
        req_body = req.get_json()
    except ValueError:
        pass
    else:
        sharedSecret = req_body.get('sharedSecret')

    if sharedSecret == 'foo':
        msg.set(json.dumps(req_body))
        return func.HttpResponse(body=json.dumps(req_body), status_code=200, headers={'Content-Type': 'application/json'})
    else:
        return func.HttpResponse(
            "Please supply correct shared Secret",
            status_code=401
        )
