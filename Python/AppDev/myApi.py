#!/usr/bin/env python
# encoding: utf-8
import json
import os
from routerclass import Router
from flask import Flask, request, jsonify
from flask.logging import create_logger
import logging
logging.basicConfig(filename='c:\\Code\\CodeSamples\\Python\\AppDev\\filename.log', level=logging.DEBUG,
                    format=f'%(asctime)s %(levelname)s %(name)s %(threadName)s : %(message)s')
app = Flask(__name__)
LOG = create_logger(app)
# app.debug = True

script_dir = os.path.dirname(os.path.realpath(__file__))
LOG.info(f"script directory: {script_dir}")
LOG.info(f"DB file: {script_dir}\db.txt")


@app.route('/')
def index():
    return jsonify({'name': 'knox',
                    'email': 'knox@knoxsdata.com',
                    'locale': 'https://youtube.com/c/dataknox'})


@app.route('/routers', methods=['GET'])
def getRouter():
    try:
        hostname = request.args.get('hostname')
        print(hostname)
        with open(f'{script_dir}\\db.txt', 'r') as f:
            data = f.read()
            records = json.loads(data)
            for record in records:
                if record['hostname'] == hostname:
                    LOG.info('Routers returned')
                    return jsonify(record), 200
    except Exception as err:
        LOG.error(f'Error during GET {err}')
        return jsonify({"error": err}), 401


@app.route('/routers', methods=['POST'])
def addRouter():
    try:
        record = json.loads(request.data)
        LOG.info(f'inbound record {record}')
        with open(f'{script_dir}\\db.txt', 'r') as f:
            data = f.read()
            records = json.loads(data)
        if record in records:
            return jsonify({"status": "Device already exists"}), 200
        if record not in records:
            records.append(record)
            LOG.info(f"records output {records}")
            LOG.warning(f'router added {record["hostname"]}')
        with open(f'{script_dir}\\db.txt', 'w') as f:
            f.write(json.dumps(records, indent=2))
        return jsonify(record), 201
    except Exception as err:
        LOG.error(f'Error during ADD {err}')
        return jsonify({"error": err})


@app.route('/routers', methods=['DELETE'])
def deleteRouter():
    try:
        record = json.loads(request.data)
        new_records = []
        with open(f'{script_dir}\\db.txt', 'r') as f:
            data = f.read()
            records = json.loads(data)
            for r in records:
                if r['hostname'] == record['hostname']:
                    LOG.warning(f'Deleted {r["hostname"]}')
                    continue
                new_records.append(r)
        with open(f'{script_dir}\\db.txt', 'w') as f:
            f.write(json.dumps(new_records, indent=2))
        return jsonify(record), 204
    except Exception as err:
        LOG.error(f'ERROR RAISED: {err}')
        return jsonify({"error": err})


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
