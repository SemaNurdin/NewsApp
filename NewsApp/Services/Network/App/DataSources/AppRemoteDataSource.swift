import Foundation
import RealHTTP

final class AppRemoteDataSource: AppDataSource {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
}
