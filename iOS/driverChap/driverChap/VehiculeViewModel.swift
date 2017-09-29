import Foundation

class VehiculeViewModel {
    let repository: VehiculeRepository
    init(repository: VehiculeRepository) {
        self.repository = repository
    }
}
extension VehiculeViewModel {
    var numberOfRows: Int {
        return 6
    }
    func getDisclosureCellViewModel(index: Int) {
        switch index {
        case 0:
            break
        case 0:
            break
        case 0:
            break
        case 0:
            break
        default:
            break
        }
    }
    func getSwitchCellViewModel(index: Int) {
        
    }
    func getInfoCellViewModel(index: Int) {
        
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
