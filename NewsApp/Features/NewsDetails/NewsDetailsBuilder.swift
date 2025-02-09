import Foundation
import UIKit

final class NewsDetailsBuilder: ModuleBuilder {
    var contentView: NewsDetailsCV
    var viewModel: NewsDetailsVM
    var viewController: NewsDetailsVC
    
    required init() {
        contentView = NewsDetailsCV()
        viewModel = NewsDetailsVM()
        viewController = NewsDetailsVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> NewsDetailsVC {
        return viewController
    }
}
