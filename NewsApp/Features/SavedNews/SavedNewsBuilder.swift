import Foundation
import UIKit

final class SavedNewsBuilder: ModuleBuilder {
    var contentView: SavedNewsCV
    var viewModel: SavedNewsVM
    var viewController: SavedNewsVC
    
    required init() {
        contentView = SavedNewsCV()
        viewModel = SavedNewsVM()
        viewController = SavedNewsVC(contentView: contentView, viewModel: viewModel)
    }
    
    func build() -> SavedNewsVC {
        return viewController
    }
}
