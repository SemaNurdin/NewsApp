import Combine
import Factory
import Foundation

final class SavedNewsVM: ViewModelType {
    @Injected(\AppContainer.app) var app: AppRepository
    @Injected(\.realmManager) var realmManager: RealmDatabaseManager
    
    var onDetailsAction: ((_ news: NewsModel) -> Void)?
}
