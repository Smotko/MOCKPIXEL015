import Foundation

struct InfoCellViewModel {
    let title: String
    let isMoving: Bool
    init(title: String, isMoving: Bool) {
        self.title = title
        self.isMoving = isMoving
    }
    var titleLabel: String {
        return title
    }
    var isCarMoving: Bool {
        return isMoving
    }
}
