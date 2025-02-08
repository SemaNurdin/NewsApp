import UIKit

final class NewsVC: BaseVC<NewsCV, NewsVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setTargets() {
    }
}

// MARK: - Actions
@objc extension NewsVC {
    func onBackAction() {
        viewModel.onBackAction?()
    }
}
