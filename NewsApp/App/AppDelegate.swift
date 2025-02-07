import Factory
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    @Injected(\AppContainer.coordinator) var coordinator

    var window: UIWindow? = AppContainer.shared.window()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator.start()
        return true
    }
}
