import Foundation

struct APIVehiculeProvider {
    
    func getCar() {}
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
