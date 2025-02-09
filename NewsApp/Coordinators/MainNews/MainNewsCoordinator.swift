import ContactsUI

final class MainNewsCoordinator: BaseCoordinator, MainNewsCoordinatorResult {
    var finishFlow: (() -> Void)?
    
    private let router: Router
    private let mainRouter: Router
    private let factory: MainNewsFactory
    
    init(router: Router, factory: MainNewsFactory, mainRouter: Router) {
        self.router = router
        self.factory = factory
        self.mainRouter = mainRouter
        super.init()
    }
    
    override func start() {
        showNewsVC()
    }
    
    // MARK: - Run current flow's controllers
    private func showNewsVC() {
        let module = factory.makeNewsVC()
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
