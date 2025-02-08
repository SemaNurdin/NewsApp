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

    // Custom CodingKeys to map "description" to "storedDescription"
    private enum CodingKeys: String, CodingKey {
        case title, link, storedDescription = "description", pubDate, imageUrl = "image_url", sourceName = "source_name"
    }
}

