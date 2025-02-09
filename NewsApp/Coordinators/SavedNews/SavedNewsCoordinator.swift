import ContactsUI

final class SavedNewsCoordinator: BaseCoordinator, SavedNewsCoordinatorResult {
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let mainRouter: Router
    private let factory: SavedNewsFactory
    
    init(router: Router, factory: SavedNewsFactory, mainRouter: Router) {
        self.router = router
        self.factory = factory
        self.mainRouter = mainRouter
        super.init()
    }
    
    override func start() {
        showSavedNewsVC()
    }
    
    // MARK: - Run current flow's controllers
    private func showSavedNewsVC() {
        let module = factory.makeSavedNewsVC()
        module.viewModel.onDetailsAction = showNewsDetailsVC
        router.setRootModule(module, hideBar: false)
    }
    
    private func showNewsDetailsVC(news: NewsModel) {
        let module = factory.makeNewsDetailsVC(news: news)
        module.viewModel.newsModel = news
        module.viewModel.onBackAction = router.popModule
        router.push(module, hideBottomBar: true)
    }
}
