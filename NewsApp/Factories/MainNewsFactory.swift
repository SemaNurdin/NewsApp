import UIKit

protocol MainNewsFactoryImpl {
    func makeNewsVC() -> NewsVC
    func makeNewsDetailsVC(news: NewsModel) -> NewsDetailsVC
}

final class MainNewsFactory: MainNewsFactoryImpl {
    func makeNewsVC() -> NewsVC {
        NewsBuilder().build()
    }
    
    func makeNewsDetailsVC(news: NewsModel) -> NewsDetailsVC {
        NewsDetailsBuilder().build()
    }
}
