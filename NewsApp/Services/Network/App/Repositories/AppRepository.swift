protocol AppRepository {
    func getLatestNews(nextPage: String?) async throws -> NewsContainerModel
}
