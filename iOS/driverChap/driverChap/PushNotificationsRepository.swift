import Foundation
import RxSwift

class PushNotificationsRepository {
    let apiProvider: APIPushNotificationsProvider
    var pushs = [Alert]()
    let updateSubject = PublishSubject<Bool>()
    init(apiProvider: APIPushNotificationsProvider) {
        self.apiProvider = apiProvider
        self.pushs = self.apiProvider.getPush()
    }
}
extension PushNotificationsRepository {
    func getNotifications() -> [Alert] {
        return pushs
    }
    func deletePush(index: Int) {
        pushs = pushs.filter({$0 != pushs[index]})
        updateSubject.onNext(true)
    }
}
