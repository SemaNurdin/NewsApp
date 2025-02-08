import UIKit
// swiftlint: disable void_function_in_ternary
final class AppCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        super.init()
    }
    
    override func start() {
        runMainFlow()
    }

    private func runFlow() {
        runMainFlow()
    }
    
    private func runMainFlow() {
        var (coordinator, module) = coordinatorFactory.makeTabbarCordinator(router: router)
        
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.runFlow()
            self?.removeDependency(coordinator)
        }

        addDependency(coordinator)
        router.setRootModule(module, hideBar: true)
        coordinator.start()
    }
}
