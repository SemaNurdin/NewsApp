import Foundation
import RealmSwift
// MARK: - AreaMapItem
class NewsContainerModel: Object, Codable {
    @Persisted var status: String
    @Persisted var totalResults: Int
    @Persisted var results: List<NewsModel>
    @Persisted var nextPage: String
}
 // MARK: - Document types
class NewsModel: Object, Codable {
    @Persisted var title: String
    @Persisted var link: String
    @Persisted var storedDescription: String? // Use a different stored property
    @Persisted var pubDate: String
    @Persisted var imageUrl: String?
    @Persisted var sourceName: String?
    @Persisted var articleId: String

    init(title: String, link: String, storedDescription: String? = nil, pubDate: String, imageUrl: String? = nil, sourceName: String? = nil, articleId: String) {
        self.title = title
        self.link = link
        self.storedDescription = storedDescription
        self.pubDate = pubDate
        self.imageUrl = imageUrl
        self.sourceName = sourceName
        self.articleId = articleId
    }
    
    override required init() {
        super.init()
    }
    
    override class func primaryKey() -> String? {
        return "articleId"
    }
    
    // Custom CodingKeys to map "description" to "storedDescription"
    private enum CodingKeys: String, CodingKey {
        case title, link, storedDescription = "description", pubDate, imageUrl = "image_url", sourceName = "source_name", articleId = "article_id"
    }
    
    func detached() -> NewsModel {
        return NewsModel(
            title: self.title,
            link: self.link,
            storedDescription: self.storedDescription,
            pubDate: self.pubDate,
            imageUrl: self.imageUrl,
            sourceName: self.sourceName,
            articleId: self.articleId
        )
    }
}

