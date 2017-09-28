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
        
    }
    func getSwitchCellViewModel(index: Int) {
        
    }
    func getInfoCellViewModel(index: Int) {
        
    }
}
