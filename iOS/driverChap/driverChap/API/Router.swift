import Foundation
import Alamofire
import RealmSwift

enum Route {
    case car
    case lock
    case setGeo
    case setSpeed
    case setRadius
    case setMiles
    case setTimer
    case isMoving
    case notificationsList
}
struct Router {
    fileprivate let baseURLString = "localhost:5000"
    let postRouterType: Route
    
    fileprivate func getRelativePath() -> String  {
        switch self.postRouterType {
        case .car:
            return "categories"
        case .lock:
            return "cities"
        case .setGeo:
            return "geocode"
        case .setSpeed:
            return "location_details"
        case .setRadius:
            return "cuisines"
        case .setMiles:
            return "cuisines"
        case .setTimer:
            return "cuisines"
        case .isMoving:
            return "cuisines"
        case .notificationsList:
            return "cuisines"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: baseURLString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.getRelativePath()))
        urlRequest.allHTTPHeaderFields = ["user-key": "4320ca1f3eb10513657eed84e055b6ab"]
        urlRequest.httpMethod = Alamofire.HTTPMethod.post.rawValue
        print("URL Request: \(urlRequest)")
        return try! Alamofire.JSONEncoding.default.encode(urlRequest)
    }
}
