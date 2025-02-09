import UIKit

// swiftlint: disable line_length
final class AppCoordinatorFactory: CoordinatorFactory {
    func makeTabbarCordinator(router: Router) -> (configurator: Coordinator & TabbarCoordinatorResult, toPresent: Presentable?) {
        let controller = TabbarVC()
        let factory = AppCoordinatorFactory()
        let coordinator = TabbarCoordinator(tabbarView: controller, coordinatorFactory: factory, router: router)
        let firstController = makeNC(title: "News",
                                     image: UIImage(systemName: Constants.SystemImages.newspaper)!,
                                     selectedImage: UIImage(systemName: Constants.SystemImages.newspaperFill)!,
                                     tag: 0)
        let secondController = makeNC(title: "Saved News",
                                      image: UIImage(systemName: Constants.SystemImages.newspaperCircle)!,
                                      selectedImage: UIImage(systemName: Constants.SystemImages.newspaperCircleFill)!,
                                      tag: 1)
        controller.viewControllers = [firstController, secondController]
        controller.tabBar.backgroundColor = .white
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red]
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.black
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.red
        controller.tabBar.standardAppearance = tabBarAppearance
        controller.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        controller.tabBar.layer.borderWidth = 1
        controller.tabBar.layer.borderColor = UIColor.black.cgColor
        controller.tabBar.clipsToBounds = true
        
        return (coordinator, controller)
    }
    
    func makeMainNewsCoordinator(navController: BaseNC?, mainRouter: Router) -> Coordinator & MainNewsCoordinatorResult {
        let factory = MainNewsFactory()
        return MainNewsCoordinator(router: router(navController), factory: factory, mainRouter: mainRouter)
    }
    
    func makeSavedNewsCoordinator(navController: BaseNC?, mainRouter: Router) -> Coordinator & SavedNewsCoordinatorResult {
        let factory = SavedNewsFactory()
        return SavedNewsCoordinator(router: router(navController), factory: factory, mainRouter: mainRouter)
    }
}
extension AppCoordinatorFactory {
    private func router(_ navController: BaseNC?) -> Router {
        return AppRouter(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: BaseNC?) -> BaseNC {
        if let navController = navController {
            return navController
        } else { return BaseNC() }
    }
    
    private func makeNC(title: String, image: UIImage, selectedImage: UIImage, tag: Int) -> BaseNC {
        let controller = BaseNC()
        controller.setNavigationBarHidden(true, animated: false)
        controller.tabBarItem = UITabBarItem(
            title: title,
            image: image,
            selectedImage: selectedImage,
            tag: tag
        )
        controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        return controller
    }
}
