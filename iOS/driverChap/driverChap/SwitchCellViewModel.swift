import Foundation

struct SwitchCellViewModel {
    let title: String
    let value: Bool
    
    init(title: String, value: Bool) {
        self.title = title
        self.value = value
    }
    var titleLabel: String {
        return title
    }
    var switchState: Bool {
        return value
    }
}
