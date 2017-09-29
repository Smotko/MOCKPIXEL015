import Foundation

enum percentageState {
    case low
    case medium
    case high
}
struct FuelCellViewModel {
    let percentage: Float
    init(percentage: Float) {
        self.percentage = percentage
    }
}
extension FuelCellViewModel {
    var percentageState: percentageState {
        switch percentage {
        case 0..<0.2:
            return .low
        case 0.2..<0.5:
            return .medium
        default:
            return .high
        }
    }
    var currentProgress: Float {
        return percentage
    }
    var title: String {
        return "Fuel Level"
    }
}
