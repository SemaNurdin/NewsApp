import Combine
import Factory
import UIKit

final class TabbarVC: UITabBarController, TabbarView {
    var onMainNewsFlowSelect: ((BaseNC) -> Void)?
    var onSavedNewsFlowSelect: ((BaseNC) -> Void)?
    
    var onViewDidLoad: ((BaseNC) -> Void)?
    
    var bag = Set<AnyCancellable>()
    
    enum Tab: Int {
        case mainNews
        case savedNews
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewControllers?.count ?? 0 >= 1, let controller = viewControllers?[0] as? BaseNC {
            onViewDidLoad?(controller)
        }
    }
}

extension TabbarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? BaseNC else { return }
        guard let tabIndex = Tab(rawValue: selectedIndex) else { return }
        
        switch tabIndex {
        case .mainNews:
            onMainNewsFlowSelect?(controller)
        case .savedNews:
            onSavedNewsFlowSelect?(controller)
        }
    }
}
