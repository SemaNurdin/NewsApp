import Combine
import Factory
import Foundation

final class NewsVM: ViewModelType {
    @Injected(\AppContainer.app) var app: AppRepository
    
    let successSubject = PassthroughSubject<Bool, Never>()
    let errorSubject = PassthroughSubject<String, Never>()
    
    var news: [NewsModel] = []
    
    @MainActor
    func getLatestNews() {
        Task {
            do {
                let res = try await app.getLatestNews()
                news = res.results.toArray()
                successSubject.send(true)
            } catch {
                errorSubject.send(error.localizedDescription)
            }
        }
    }
}
