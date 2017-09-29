import Foundation

struct DisclosureCellViewModel {
    let title: String
    let value: String
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    var titleLabel: String {
        return title
    }
    var valueLabel: String {
        return value
    }
}
