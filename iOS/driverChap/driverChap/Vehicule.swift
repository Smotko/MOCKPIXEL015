import Foundation
import RealmSwift

class Vehicule: Object {
    dynamic var id = 0
    dynamic var lat = ""
    dynamic var lon = ""
    dynamic var timer = 0
    dynamic var speedLimit = 0
    dynamic var miles = 0
    dynamic var isMoving = false
    dynamic var lock = false
    dynamic var isMobilized = false
    var pushNotifications = List<Alert>()
    override static func primaryKey() -> String? {
        return "id"
    }
}
