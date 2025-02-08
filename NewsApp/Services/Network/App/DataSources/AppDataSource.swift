import Foundation

protocol AppDataSource {
    func getLatestNews(nextPage: String?) async throws -> NewsContainerModel
}
