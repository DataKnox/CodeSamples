import json
import os
import logging
from flask import Flask, request, jsonify
from flask.logging import create_logger

app = Flask(__name__)
LOG = create_logger(app)

# Set up application and dynamically determine the path that this script is running in
script_dir = os.path.dirname(os.path.realpath(__file__))
logging.basicConfig(filename=f'{script_dir}\\filename.log', level=logging.DEBUG,
                    format=f'%(asctime)s %(levelname)s %(name)s %(threadName)s : %(message)s')
LOG.info(f"script directory: {script_dir}")
LOG.info(f"DB file: {script_dir}\db.txt")

# Create endpoints
# http://127.0.0.1:5000/


@app.route('/')
def index():
    return jsonify({'name': 'knox',
                    'email': 'knox@knoxsdata.com',
                    'locale': 'https://youtube.com/c/dataknox'})

# GET http://127.0.0.1:5000/routers?hostname=SW1


@app.route('/routers', methods=['GET'])
def getRouter():
    try:
        hostname = request.args.get('hostname')
        print(hostname)
        if (hostname is None) or (hostname == ""):
            LOG.warning('No hostname specified')
            raise ValueError
        with open(f'{script_dir}\\db.txt', 'r') as f:
            data = f.read()
            records = json.loads(data)
            for record in records:
                if record['hostname'] == hostname:
                    LOG.info('Routers returned')
                    return jsonify(record), 200
                if record['hostname'] != hostname:
                    LOG.warning('No matching router')
                    return jsonify({"response": "No match"}), 200
    except ValueError:
        LOG.error("NO HOSTNAME SPECIFIED")
        return jsonify({"error": "NO_HOSTNAME_SPECIFIED"}), 400
    except Exception as err:
        LOG.error(f'Error during GET {err}')
        return jsonify({"error": err}), 500

# POST http://127.0.0.1:5000/routers


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

# DELETE http://127.0.0.1:5000/routers?hostname=SW1


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


# Run the app
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
