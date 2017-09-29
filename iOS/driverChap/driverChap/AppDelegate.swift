import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let menuVC = DependencyInjection.sharedInstance.resolve(UITabBarController.self)
        window?.rootViewController = menuVC
        let attributes = [NSFontAttributeName:UIFont(name: "Helvetica", size: 14)]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}


}

