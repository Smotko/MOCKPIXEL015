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
            /*container.register(AdsViewController.self) { r in
                AdsViewController(viewModel: r.resolve(AdsViewModel.self)!)
            }
            container.register(AdsViewModel.self) { r in
                return AdsViewModel(repository: r.resolve(AdsRepository.self)!)
            }
            container.register(AdsRepository.self) { r in
                AdsRepository(apiProvider: r.resolve(APIAdsProvider.self)!, dbProvider: r.resolve(DBAdsProvider.self)!)
                }.inObjectScope(.container)
            
            container.register(APIAdsProvider.self) { r in
                APIAdsProvider()
            }
            container.register(DBAdsProvider.self) { r in
                DBAdsProvider(realm: r.resolve(Realm.self)!)
            }*/
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

