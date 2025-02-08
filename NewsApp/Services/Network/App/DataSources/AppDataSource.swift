import Foundation

protocol AppDataSource {
    func getLatestNews() async throws -> NewsContainerModel
}
