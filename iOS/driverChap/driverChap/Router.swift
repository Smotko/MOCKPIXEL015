import Foundation
import Alamofire
import RealmSwift

enum Route {
    case lock
    case setCenter
    case setRadius
}
struct Router {
    //    fileprivate let baseURLString = "https://developers.zomato.com/api"
    fileprivate let baseURLString = "localhost:5000"
    let postRouterType: Route
    let params: [String: Any]?
    
    fileprivate func getRelativePath() -> String  {
        switch self.postRouterType {
        case .lock:
            return "categories"
        case .setCenter:
            return "cities"
        case .setRadius:
            return "geocode"
        }
    }
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: baseURLString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.getRelativePath()))
        //urlRequest.allHTTPHeaderFields = ["user-key": "4320ca1f3eb10513657eed84e055b6ab"]
        urlRequest.httpMethod = Alamofire.HTTPMethod.post.rawValue
        print("URL Request: \(urlRequest)")
        return try! Alamofire.JSONEncoding.default.encode(urlRequest)
    }
}
