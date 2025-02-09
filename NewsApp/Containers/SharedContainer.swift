import Defaults
import RealmSwift
import Factory
import Foundation
import RealHTTP

extension SharedContainer {
    var client: Factory<HTTPClient> {
        self {
            let client = HTTPClient(baseURL: URL(string: Constants.baseUrl))
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
    
    var realmManager: Factory<RealmDatabaseManager> {
        self {
            var realmConfigs = Realm.Configuration()
            realmConfigs.deleteRealmIfMigrationNeeded = true
            let realmManager = try! RealmDatabaseManager(configuration: realmConfigs)
            return realmManager
        }.singleton
    }
}
