import Factory
import Foundation

final class NewsDetailsVM: ViewModelType {
    @Injected(\.realmManager) var realmManager: RealmDatabaseManager
    
    var onBackAction: SimpleNavigation?
    var newsModel: NewsModel!
}
