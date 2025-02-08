import UIKit

protocol InteractionBlockable {
    func enableInteraction()
    func disableInteraction()
}

extension InteractionBlockable where Self: UIViewController {
    func enableInteraction() {
        view.isUserInteractionEnabled = true
        navigationController?.navigationBar.isUserInteractionEnabled = true
        tabBarController?.tabBar.isUserInteractionEnabled = true
    }
    
    func disableInteraction() {
        view.isUserInteractionEnabled = false
        navigationController?.navigationBar.isUserInteractionEnabled = false
        tabBarController?.tabBar.isUserInteractionEnabled = false
    }
}
