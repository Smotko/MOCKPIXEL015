import Foundation

struct SwitchCellViewModel {
    let title: String
    let value: Int
    
    init(title: String, value: Int) {
        self.title = title
        self.value = value
    }
    var titleLabel: String {
        return title
    }
    var switchState: Bool {
        return value == 0 ? false : true
    }
}
