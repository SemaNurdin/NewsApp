import Foundation
import UIKit

extension UITabBarItem {
    convenience init(title: String, image: UIImage, selectedImage: UIImage?, tag: Int) {
        self.init()
        self.title = title
        self.image = image.withRenderingMode(.alwaysOriginal)
        self.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        self.tag = tag
    }
}
