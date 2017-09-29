import Foundation

struct AlertCellViewModel {
    let alert: Alert
    init(alert: Alert) {
        self.alert = alert
    }
    var title: String {
        return alert.text
    }
    var date: String {
        return alert.date
    }
}
