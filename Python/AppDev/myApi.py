#!/usr/bin/env python
# encoding: utf-8
import json
from flask import Flask, request, jsonify
app = Flask(__name__)


@app.route('/')
def index():
    return jsonify({'name': 'knox',
                    'email': 'knox@knoxsdata.com',
                    'locale': 'https://youtube.com/c/dataknox'})


@app.route('/routers', methods=['GET'])
def getRouter():
    hostname = request.args.get('hostname')
    print(hostname)
    with open('c:\\Code\\CodeSamples\\Python\\AppDev\\db.txt', 'r') as f:
        data = f.read()
        records = json.loads(data)
        for record in records:
            if record['hostname'] == hostname:
                return jsonify(record)
        return jsonify({'error': 'data not found'})


@app.route('/routers', methods=['POST'])
def addRouter():
    record = json.loads(request.data)
    new_records = []
    with open('c:\\Code\\CodeSamples\\Python\\AppDev\\db.txt', 'r') as f:
        data = f.read()
        records = json.loads(data)
    for r in records:
        if r['hostname'] != record['hostname']:
            new_records.append(r)
    with open('c:\\Code\\CodeSamples\\Python\\AppDev\\db.txt', 'w') as f:
        f.write(json.dumps(new_records, indent=2))
    return jsonify(record)


@app.route('/routers', methods=['DELETE'])
def delteRouter():
    record = json.loads(request.data)
    new_records = []
    with open('c:\\Code\\CodeSamples\\Python\\AppDev\\db.txt', 'r') as f:
        data = f.read()
        records = json.loads(data)
        for r in records:
            if r['hostname'] == record['hostname']:
                continue
            new_records.append(r)
    with open('c:\\Code\\CodeSamples\\Python\\AppDev\\db.txt', 'w') as f:
        f.write(json.dumps(new_records, indent=2))
    return jsonify(record)


app.run()
