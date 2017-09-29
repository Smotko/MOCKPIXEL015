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
        return 8
    }
    func getDisclosureCellViewModel(index: Int) -> DisclosureCellViewModel? {
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
            return nil
        }
    }
    func getSwitchCellViewModel(index: Int) -> SwitchCellViewModel? {
        switch index {
        case 0:
            return SwitchCellViewModel(title: "Lock", value: car.lock)
        case 6:
            return SwitchCellViewModel(title: "Immobilyzer", value: car.isMobilized)
        default:
            return nil
        }
    }
    func getFuelCellViewModel() -> FuelCellViewModel {
        return FuelCellViewModel(percentage: car.fuelLevel)
    }
    func getInfoCellViewModel(index: Int) -> InfoCellViewModel {
        return InfoCellViewModel(title: "Moving", isMoving: car.isMoving)
    }
    func cellIdentifier(index: Int) -> String {
        switch index {
        case 0,6:
            return "switchCell"
        case 1,2,3,4:
            return "disclosureCell"
        case 5:
            return "infoCell"
        case 7:
            return "fuelCell"
        default:
            return ""
        }
    }
}
