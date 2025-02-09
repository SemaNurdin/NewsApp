import UIKit

protocol SavedNewsFactoryImpl {
    func makeSavedNewsVC() -> SavedNewsVC
    func makeNewsDetailsVC(news: NewsModel) -> NewsDetailsVC
}

final class SavedNewsFactory: SavedNewsFactoryImpl {
    func makeNewsDetailsVC(news: NewsModel) -> NewsDetailsVC {
        NewsDetailsBuilder().build()
    }
    
    func makeSavedNewsVC() -> SavedNewsVC {
        SavedNewsBuilder().build()
    }
}
