import Foundation

struct APIVehiculeProvider {
    
    func getCar() -> Vehicule {
        let car = Vehicule()
        car.id = 1
        car.lat = "1231231"
        car.lon = "123123"
        car.timer = 20
        car.speedLimit = 50
        car.miles = 300
        car.isMoving = true
        car.lock = true
        return car
    }
    func getIsMoving(){}
    func getNotifications(){}
    func setCenter(lat: String, lon: String) {}
    func setSpeedLimit(limit: Int) {}
    func setKmsLimit(limit: Int) {}
    func setTimer(timer: Int) {}
    func isMoving() -> Bool {
        return false
    }
    func getPushNotifications() -> [Alert] {
        return [Alert()]
    }
}
