import Foundation
import RealHTTP

final class AppDataRepository: AppRepository {
    private let remoteDataSource: AppDataSource

    public init(_ remoteDataSource: AppDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getLatestNews(nextPage: String?) async throws -> NewsContainerModel {
        try await remoteDataSource.getLatestNews(nextPage: nextPage)
    }
}
