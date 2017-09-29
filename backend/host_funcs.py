# Author Niki

from flask import Flask, request, jsonify
from models_app import *

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

@app.route('/api/set_lock', methods=['POST'])
def set_lockAPI():
    if not request.json or not 'lock' in request.json:
        return "Error", 400
    return jsonify(set_lock(request.json['lock'])), 200

@app.route('/api/set_immobilizer', methods=['POST'])
def set_lockAPI():
    if not request.json or not 'immobilizer' in request.json:
        return "Error", 400
    return jsonify(set_immobilizer(request.json['immobilizer'])), 200

@app.route('/api/set_tracking', methods=['POST'])
def set_lockAPI():
    if not request.json or not 'tracking' in request.json:
        return "Error", 400
    return jsonify(set_tracking(request.json['tracking'])), 200

@app.route('/api/set_lock', methods=['POST'])
def set_lockAPI():
    if not request.json or not 'lock' in request.json:
        return "Error", 400
    return jsonify(set_lock(request.json['lock'])), 200


@app.route('/api/get_car', methods=['GET'])
def get_carAPI():
    return jsonify(get_car()), 200

    
if __name__ == "__main__":
    app.run()
