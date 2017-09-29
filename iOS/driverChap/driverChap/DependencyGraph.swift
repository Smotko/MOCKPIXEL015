import Foundation
import Swinject
import RealmSwift

struct DependencyGraph: DependencyGraphProtocol {
    fileprivate let dependencies: Resolver
    
    init() {
        let assembler = try! Assembler(assemblies:
            [
                UIAssembly() as Assembly,
                DBAssembly(),
                ]
        )
        self.dependencies = (assembler.resolver as! Container).synchronize()
    }
    
    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return self.dependencies.resolve(serviceType)
    }
    class UIAssembly: Assembly {
        func assemble(container: Container) {
            //tab bar Assemble
            container.register(UITabBarController.self) {
                r in
                let tabBarController = UITabBarController()
                let vehiculeNC = UINavigationController()
                let alertsNC = UINavigationController()
        
                let vehiculeVC = r.resolve(VehiculeViewController.self)!
                let alertsVC = r.resolve(AlertsViewController.self)!
                
                vehiculeNC.addChildViewController(vehiculeVC)
                vehiculeVC.title = "car"
                
                alertsNC.addChildViewController(alertsVC)
                alertsVC.title = "alerts"
                
                vehiculeNC.tabBarItem.image = UIImage(named: "tab_vehicule")
                alertsNC.tabBarItem.image = UIImage(named: "tab_alert")
                
                tabBarController.tabBar.isTranslucent = false
                tabBarController.tabBar.barTintColor = UIColor.white
                tabBarController.tabBar.tintColor = UIColor.gray
                tabBarController.viewControllers = [vehiculeNC, alertsNC]
                return tabBarController
            }
            //Vehicule Assemble
            container.register(VehiculeViewController.self) { r in
                VehiculeViewController(viewModel: r.resolve(VehiculeViewModel.self)!)
            }
            container.register(VehiculeViewModel.self) { r in
                return VehiculeViewModel(repository: r.resolve(VehiculeRepository.self)!)
            }
            container.register(VehiculeRepository.self) { r in
                VehiculeRepository(apiProvider: r.resolve(APIVehiculeProvider.self)!)
                }.inObjectScope(.container)
            
            container.register(APIVehiculeProvider.self) { r in
                APIVehiculeProvider()
            }
            //Alerts Assemble
            container.register(AlertsViewController.self) { r in
                AlertsViewController(viewModel: r.resolve(AlertsViewModel.self)!)
            }
            container.register(AlertsViewModel.self) { r in
                return AlertsViewModel(repository: r.resolve(PushNotificationsRepository.self)!)
            }
            container.register(PushNotificationsRepository.self) { r in
                PushNotificationsRepository(apiProvider: r.resolve(APIPushNotificationsProvider.self)!)
                }.inObjectScope(.container)
            
            container.register(APIPushNotificationsProvider.self) { r in
                APIPushNotificationsProvider()
            }
        }
    }
    class DBAssembly: Assembly {
        func assemble(container: Container) {
            container.register(Realm.self) { r in
                return try! Realm()
                }.inObjectScope(.container)
        }
    }
}
