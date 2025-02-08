import UIKit

protocol MainNewsFactoryImpl {
    func makeNewsVC() -> NewsVC
}

final class MainNewsFactory: MainNewsFactoryImpl {
    func makeNewsVC() -> NewsVC {
        NewsBuilder().build()
    }
}
