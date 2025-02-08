import Kingfisher
import UIKit

final class NewsTVCell: TableViewCell<NewsTVCellCV> {
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWith(news: NewsModel) {
        mainContentView.titleLabel.text = news.title
        mainContentView.authorLabel.text = "Author: \(news.sourceName ?? "Unknown author")"
        mainContentView.dateLabel.text = "Date: \(news.pubDate)"
        mainContentView.previewImageView.kf.setImage(with: URL(string: news.imageUrl ?? ""),
                                                     placeholder: UIImage(systemName: "photo"))
        
    }
}
