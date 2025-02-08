import Combine
import Factory
import Foundation

final class NewsVM: ViewModelType {
    @Injected(\AppContainer.app) var app: AppRepository
    
    let successSubject = PassthroughSubject<Bool, Never>()
    let errorSubject = PassthroughSubject<String, Never>()
    
    private var nextPage: String? = nil
    var news: [NewsModel] = []
    var isFetching = false
    
    @MainActor
    func getLatestNews() {
        guard !isFetching else { return }
        isFetching = true
        
        Task {
            do {
                let res = try await app.getLatestNews(nextPage: nextPage)
                news.append(contentsOf: res.results.toArray())
                nextPage = res.nextPage
                successSubject.send(true)
            } catch {
                errorSubject.send("News limit reached!")
            }
            isFetching = false
        }
    }
}
