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
