import Foundation
import UIKit

extension Int {
    var adaptToScreenSize: CGFloat {
        return CGFloat(self) * Constants.ScreenSizeConstant
    }
}
