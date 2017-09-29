import Foundation

struct APIPushNotificationsProvider {
    func getPush() -> [Alert] {
        var alerts = [Alert]()
        let alert1 = Alert()
        alert1.text = "Jonh passed the 50km limit"
        alert1.date = "2017-09-27"
        let alert2 = Alert()
        alert2.text = "Time to check those tires pressure"
        alert2.date = "2017-09-28"
        let alert3 = Alert()
        alert3.text = "The car will be locked from 00:00 until 07:00 from Friday to Sunday"
        alert3.date = "2017-09-29"
        alerts.append(alert3)
        alerts.append(alert2)
        alerts.append(alert1)
        return alerts
    }
}
