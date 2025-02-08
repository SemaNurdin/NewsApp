protocol AppRepository {
    func getLatestNews() async throws -> NewsContainerModel
}
