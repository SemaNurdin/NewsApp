import Foundation
import RealHTTP

final class AppRemoteDataSource: AppDataSource {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getLatestNews(nextPage: String?) async throws -> NewsContainerModel {
        try await client.fetch(AppRequests.GetLatesNews(nextPage: nextPage))
    }
}
