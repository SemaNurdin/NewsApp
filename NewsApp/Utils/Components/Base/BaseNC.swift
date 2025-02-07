import UIKit

class BaseNC: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        interactivePopGestureRecognizer?.isEnabled = false
    }
    
    /// This method removes all controllers from the stack without unwanted transitions
    func popToRoot() {
        guard let root = viewControllers.first else { return }
        setViewControllers([root], animated: false)
    }
}
