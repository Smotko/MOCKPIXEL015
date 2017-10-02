# Author Niki
import requests, json
HOST = 'https://api.prod.smartservices.car2go.com/vega/vehicles/MOCKPIXEL015/'


def set_lock(lock_var):
    if lock_var == 1 :
        r = requests.put(HOST + 'doors/lock', cert='pixelcamp.pem')
    if lock_var == 0 :
        r = requests.put(HOST + 'doors/unlock', cert='pixelcamp.pem')

    return (r.status_code,get_car())

def set_immobilizer(immobilizer_var):
    if immobilizer_var == 1 :
        r = requests.put(HOST + 'immobilizer/engage', cert='pixelcamp.pem')
    if immobilizer_var == 0 :
        r = requests.put(HOST + 'immobilizer/disengage', cert='pixelcamp.pem')

    return (r.status_code,get_car())

def set_tracking(tracking_var):
    if tracking_var == 1 :
        r = requests.put(HOST + 'livetracking/activate', cert='pixelcamp.pem')
    if tracking_var == 0 :
        r = requests.put(HOST + 'livetracking/deactivate', cert='pixelcamp.pem')

    return (r.status_code,get_car())

def set_geoFence(fence_var):
    try:
        json_object = json.loads(fence_var)
    except:
        return "it returned"

    headers = {
    'accept': 'application/json',
    'content-type': 'application/json',
    }

    fenceRequest = requests.get(HOST + 'geofences', headers=headers, cert='pixelcamp.pem')
    fence_object = json.loads(fenceRequest.content)[0]
    if not fence_object:
        r = requests.post(HOST + 'geofences', headers=headers, data=json_object, cert='pixelcamp.pem')
    else:
        #print(fence_object['id'])
        r = requests.put(HOST + 'geofences/'+fence_object['id'], headers=headers, data=json_object, cert='pixelcamp.pem')


    return



def set_geo_radius():
    pass


def set_speed():
    pass


def set_miles():
    pass

def get_car():
    params = (
        ('fields', 'batteryLevel,connection.connected,connection.since,doors.allClosed,doors.leftOpen,doors.locked,doors.rightOpen,doors.trunkOpen,engineOn,fuelLevel,geo.latitude,geo.longitude,immobilizerEngaged,mileage,powerState,vin'),)
    r = requests.get('https://api.prod.smartservices.car2go.com/vega/vehicles/MOCKPIXEL015', params=params, cert='pixelcamp.pem')
    print(json.dumps(r.json(),sort_keys=True, indent=2))
    return r.json()
