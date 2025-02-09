protocol CoordinatorFactory {
    func makeTabbarCordinator(router: Router) -> (configurator: Coordinator & TabbarCoordinatorResult, toPresent: Presentable?)
    func makeMainNewsCoordinator(navController: BaseNC?, mainRouter: Router) -> Coordinator & MainNewsCoordinatorResult
    func makeSavedNewsCoordinator(navController: BaseNC?, mainRouter: Router) -> Coordinator & SavedNewsCoordinatorResult
}
