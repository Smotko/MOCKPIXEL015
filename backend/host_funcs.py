# Author Niki

from flask import Flask, request, jsonify
from models_app import set_lock, set_immobilizer, set_tracking, set_geoFence, get_car

app = Flask(__name__)


@app.route("/")
def hello():
    return app.send_static_file('index.html')


@app.route('/api/set_lock', methods=['POST'])
def set_lockAPI():
    if not request.json or not 'lock' in request.json:
        return "Error", 400
    return jsonify(set_lock(request.json['lock'])), 200


@app.route('/api/set_immobilizer', methods=['POST'])
def set_immobilizerAPI():
    if not request.json or not 'immobilizer' in request.json:
        return "Error", 400
    return jsonify(set_immobilizer(request.json['immobilizer'])), 200


@app.route('/api/set_tracking', methods=['POST'])
def set_trackingAPI():
    if not request.json or not 'tracking' in request.json:
        return "Error", 400
    return jsonify(set_tracking(request.json['tracking'])), 200


@app.route('/api/set_geoFence', methods=['POST'])
def set_geoFenceAPI():
    if not request.json or not 'fence' in request.json:
        return "Error", 400
    return jsonify(set_geoFence(request.json['fence'])), 200


@app.route('/api/get_car', methods=['GET'])
def get_carAPI():
    return jsonify(get_car()), 200

    
if __name__ == "__main__":
    app.run()
