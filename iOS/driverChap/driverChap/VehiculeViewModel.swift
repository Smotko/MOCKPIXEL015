import Foundation

class VehiculeViewModel {
    let repository: VehiculeRepository
    var car = Vehicule()
    init(repository: VehiculeRepository) {
        self.repository = repository
        self.car = self.repository.getCar()
        print(self.car)
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
            return DisclosureCellViewModel(title: "Speed Limit", value: "Limit")
        case 3:
            return DisclosureCellViewModel(title: "Miles", value: "Value")
        case 4:
            return DisclosureCellViewModel(title: "Timer", value: "150 minutes")
        default:
            return DisclosureCellViewModel(title: "Geo", value: "Geo Value")
        }
    }
    func getSwitchCellViewModel(index: Int) -> SwitchCellViewModel {
        return SwitchCellViewModel(title: "Lock", value: 0)
    }
    func getInfoCellViewModel(index: Int) -> InfoCellViewModel {
        return InfoCellViewModel(title: "Moving", isMoving: 1)
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
