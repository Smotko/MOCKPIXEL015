# Author Niki
import requests, json
HOST = 'https://api.prod.smartservices.car2go.com/vega/vehicles/MOCKPIXEL015/'


def set_lock(lock_var):
    """
    Lock/Unlock the car
    :param lock_var: 1/0
    :return: New car settings
    """
    if lock_var == 1 :
        r = requests.put(HOST + 'doors/lock', cert='pixelcamp.pem')
    if lock_var == 0 :
        r = requests.put(HOST + 'doors/unlock', cert='pixelcamp.pem')

    return (r.status_code,get_car())


def set_immobilizer(immobilizer_var):
    """
    Activates/deactivates the immobilizer for the car
    :param immobilizer_var: 1/0
    :return: New car settings
    """
    if immobilizer_var == 1 :
        r = requests.put(HOST + 'immobilizer/engage', cert='pixelcamp.pem')
    if immobilizer_var == 0 :
        r = requests.put(HOST + 'immobilizer/disengage', cert='pixelcamp.pem')

    return (r.status_code, get_car())


def set_tracking(tracking_var):
    """
    Activates/deactivates live tracking for the car
    :param tracking_var: 1/0
    :return: New car settings
    """
    if tracking_var == 1 :
        r = requests.put(HOST + 'livetracking/activate', cert='pixelcamp.pem')
    if tracking_var == 0 :
        r = requests.put(HOST + 'livetracking/deactivate', cert='pixelcamp.pem')

    return (r.status_code, get_car())


def set_geoFence(fence_var):
    """
    Set car's accepted parameter
    :param fence_var: polygon of geo points
    :return: New car settings
    """
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

    return (r.status_code, get_car())


def set_speed():
    """
    Set a speed limit to the car
    :return:
    """
    pass


def set_miles():
    """
    Set monthly mileage use
    :return:
    """
    pass


def set_lock_time():
    """
    sets a timer for the car to be locked(immobilizer active)
    :return: New car settings
    """

    pass


def get_lock_time():
    """
    checks and returns if there is a timer for the car to be locked(immobilizer active)
    :return: timer/Null
    """
    pass


def get_car():
    """
    The function returns all vihicle's data
    :return: json file
    """
    params = (
        ('fields', 'batteryLevel,connection.connected,connection.since,doors.allClosed,doors.leftOpen,doors.locked,doors.rightOpen,doors.trunkOpen,engineOn,fuelLevel,geo.latitude,geo.longitude,immobilizerEngaged,mileage,powerState,vin'),)
    r = requests.get(HOST, params=params, cert='pixelcamp.pem')
    print(json.dumps(r.json(), sort_keys=True, indent=2))
    return r.json()
