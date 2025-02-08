import UIKit

// swiftlint: disable line_length
class TabbarCoordinator: BaseCoordinator, TabbarCoordinatorResult {
    var finishFlow: (() -> Void)?
    
    private let tabbarVC: TabbarVC
    private let coordinatorFactory: CoordinatorFactory
    private let mainRouter: Router
    
    init(tabbarView: TabbarVC, coordinatorFactory: CoordinatorFactory, router: Router) {
        self.tabbarVC = tabbarView
        self.coordinatorFactory = coordinatorFactory
        self.mainRouter = router
    }
    
    override func start() {
        setCallbacksToTabs()
    }
    
    private func setCallbacksToTabs() {
        tabbarVC.onViewDidLoad = runMainNewsFlow()
        tabbarVC.onMainNewsFlowSelect = runMainNewsFlow()
    }
    
    private func runMainNewsFlow() -> ((BaseNC) -> Void) {
        return { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                var mainNewsCoordinator = self.coordinatorFactory.makeMainNewsCoordinator(navController: navController, mainRouter: mainRouter)
                mainNewsCoordinator.finishFlow = { [weak self] in
                    self?.finishFlow?()
                }
                self.addDependency(mainNewsCoordinator)
                mainNewsCoordinator.start()
            }
        }
    }
    
//    private func runSettingsFlow() -> ((BaseNC) -> Void) {
//        return { [unowned self] navController in
//            if navController.viewControllers.isEmpty {
//                var settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController, mainRouter: mainRouter)
//                settingsCoordinator.finishFlow = { [weak self] in
//                    self?.finishFlow?()
//                }
//                self.addDependency(settingsCoordinator)
//                settingsCoordinator.start()
//            }
//        }
//    }
}
