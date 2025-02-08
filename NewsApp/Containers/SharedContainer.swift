import Defaults
import Factory
import Foundation
import RealHTTP

extension SharedContainer {
    var client: Factory<HTTPClient> {
        self {
            let client = HTTPClient(baseURL: URL(string: Constants.baseUrl))
            client.validators.append(ResponseLogValidator())
            return client
        }
        .singleton
    }
    
    var appRemoteDataSource: Factory<AppDataSource> {
        self { AppRemoteDataSource(client: self.client()) }
    }
    
    var app: Factory<AppRepository> {
        self { AppDataRepository(self.appRemoteDataSource()) }
    }
}
