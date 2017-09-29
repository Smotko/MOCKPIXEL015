import Foundation

struct InfoCellViewModel {
    let title: String
    let isMoving: Int
    init(title: String, isMoving: Int) {
        self.title = title
        self.isMoving = isMoving
    }
    var titleLabel: String {
        return title
    }
    var isCarMoving: Bool {
        return isMoving == 0 ? false : true
    }
}
