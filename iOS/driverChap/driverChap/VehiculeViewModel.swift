import Foundation

class VehiculeViewModel {
    let repository: VehiculeRepository
    var car = Vehicule()
    init(repository: VehiculeRepository) {
        self.repository = repository
        self.car = self.repository.getCar()
    }
}
extension VehiculeViewModel {
    var numberOfRows: Int {
        return 6
    }
    func getDisclosureCellViewModel(index: Int) -> DisclosureCellViewModel {
        switch index {
        case 1:
            return DisclosureCellViewModel(title: "Geo", value: "Geo Value")
        case 2:
            return DisclosureCellViewModel(title: "Speed Limit", value: String(car.speedLimit))
        case 3:
            return DisclosureCellViewModel(title: "Miles", value: String(car.miles))
        case 4:
            return DisclosureCellViewModel(title: "Timer", value: String(car.timer))
        default:
            return DisclosureCellViewModel(title: "Geo", value: "Geo Value")
        }
    }
    func getSwitchCellViewModel(index: Int) -> SwitchCellViewModel {
        return SwitchCellViewModel(title: "Lock", value: car.lock)
    }
    func getInfoCellViewModel(index: Int) -> InfoCellViewModel {
        return InfoCellViewModel(title: "Moving", isMoving: car.isMoving)
    }
    func cellIdentifier(index: Int) -> String {
        switch index {
        case 0:
            return "switchCell"
        case 1,2,3,4:
            return "disclosureCell"
        case 5:
            return "infoCell"
        default:
            return ""
        }
    }
}
