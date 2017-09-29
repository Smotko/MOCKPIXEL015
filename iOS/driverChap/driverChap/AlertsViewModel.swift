import Foundation

class AlertsViewModel {
    var repository: PushNotificationsRepository
    init(repository: PushNotificationsRepository) {
        self.repository = repository
    }
}
