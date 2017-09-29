import Foundation

class PushNotificationsRepository {
    let apiProvider: APIPushNotificationsProvider
    var pushs = [Alert]()
    init(apiProvider: APIPushNotificationsProvider) {
        self.apiProvider = apiProvider
    }
}
extension PushNotificationsRepository {
    func getNotifications() -> [Alert] {
        return pushs
    }
}
