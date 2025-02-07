import Factory
import UIKit.UINavigationController
import UIKit.UIWindow

final class AppContainer: SharedContainer {
    static var shared = AppContainer()
    
    var manager = ContainerManager()
    
    var appRemoteDataSource: Factory<AppDataSource> {
        self { AppRemoteDataSource(client: self.client()) }
    }
    
    var app: Factory<AppRepository> {
        self { AppDataRepository(self.appRemoteDataSource()) }
    }
    
    var rootViewController: Factory<UINavigationController> {
        self { UINavigationController() }
            .singleton
    }
    
    var window: Factory<UIWindow> {
        self {
            let window = UIWindow()
            window.rootViewController = self.rootViewController()
            window.makeKeyAndVisible()
            return window
        }
        .singleton
    }
    
    var coordinator: Factory<Coordinator> {
        self {
            let router = AppRouter(rootController: self.rootViewController())
            let appCoordinatorFactory = AppCoordinatorFactory()
            return AppCoordinator(
                router: router,
                coordinatorFactory: appCoordinatorFactory
            )
        }
        .singleton
    }
}
