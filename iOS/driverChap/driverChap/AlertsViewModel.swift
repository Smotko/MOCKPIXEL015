import Foundation
import RxSwift

class AlertsViewModel {
    var refreshSubject = PublishSubject<Bool>()
    let disposeBag = DisposeBag()
    var repository: PushNotificationsRepository
    init(repository: PushNotificationsRepository) {
        self.repository = repository
        setupBindings()
    }
}
extension AlertsViewModel {
    var numberOfRows: Int {
        return repository.getNotifications().count
    }
    func getCellViewModel(index: Int) -> AlertCellViewModel {
        return AlertCellViewModel(alert: repository.getNotifications()[index])
    }
}
extension AlertsViewModel {
    func removePush(index: Int) {
        repository.deletePush(index: index)
    }
    func update() {
        refreshSubject.onNext(true)
    }
    func setupBindings() {
        repository
            .updateSubject
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { _ in
                self.refreshSubject.onNext(true)
            })
            .addDisposableTo(disposeBag)
    }
}
