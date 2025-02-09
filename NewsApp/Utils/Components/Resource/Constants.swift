import CoreServices
import UIKit

enum Constants {
    static var baseUrl = "https://newsdata.io"
    static var apiKey = "pub_68447c7ebe3c5fe03f49bf9714e84f754e37a"
    
    enum UI {
        static let viewsTop: CGFloat = 16.adaptToScreenSize
        static let viewsLeadingTrailing: CGFloat = 16.adaptToScreenSize
        static let idButtonHeight: CGFloat = 56.adaptToScreenSize
        static let bottom: CGFloat = 20.adaptToScreenSize
        static let padding4: CGFloat = 4.adaptToScreenSize
        static let padding6: CGFloat = 6.adaptToScreenSize
        static let padding8: CGFloat = 8.adaptToScreenSize
        static let padding10: CGFloat = 10.adaptToScreenSize
        static let padding12: CGFloat = 12.adaptToScreenSize
        static let padding14: CGFloat = 14.adaptToScreenSize
        static let padding18: CGFloat = 18.adaptToScreenSize
        static let padding20: CGFloat = 20.adaptToScreenSize
        static let padding28: CGFloat = 28.adaptToScreenSize
        static let padding32: CGFloat = 32.adaptToScreenSize
        static let padding40: CGFloat = 40.adaptToScreenSize
    }
    
    enum SystemImages {
        static let newspaper = "newspaper"
        static let newspaperFill = "newspaper.fill"
        static let newspaperCircle = "newspaper.circle"
        static let newspaperCircleFill = "newspaper.circle.fill"
    }
    
    static var ScreenSizeConstant: CGFloat {
        switch DeviceScreenSize.current {
        case .large:
            return 1.0
        case .normal:
            return 0.8
        case .small:
            return 0.7
        }
    }
}
