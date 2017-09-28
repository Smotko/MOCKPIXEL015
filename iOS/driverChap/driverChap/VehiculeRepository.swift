import Foundation

class VehiculeRepository {
    let apiProvider: APIVehiculeProvider
    var car = Vehicule()
    init(apiProvider: APIVehiculeProvider) {
        self.apiProvider = apiProvider
    }
}
extension VehiculeRepository {
    func getCar() -> Vehicule {
        return car
    }
    func getIsMoving(){}
    func getNotifications(){}
}
