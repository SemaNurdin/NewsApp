import Foundation
import UIKit

final class NewsBuilder: ModuleBuilder {
    var contentView: NewsCV
    var viewModel: NewsVM
    var viewController: NewsVC
    
    required init() {
        contentView = NewsCV()
        viewModel = NewsVM()
        viewController = NewsVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> NewsVC {
        return viewController
    }
}
