import UIKit

extension UIApplication {
    static var getKeyWindow: UIWindow? {
        if #available(iOS 15, *) {
            return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    class func topViewController(base: UIViewController? = getKeyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
    func getBottomSafeAreaPadding() -> CGFloat {
        let window = UIApplication.getKeyWindow
        switch DeviceScreenSize.current {
        case .large:
            let bottom = window?.safeAreaInsets.bottom ?? 0
            return bottom == 0 ? 32 : bottom
        default:
            return window?.safeAreaInsets.bottom ?? 0
        }
    }
}
