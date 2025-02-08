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
    
    func setup() {
        mainContentView.titleLabel.text = "How to prepare for interview as an iOS developer?"
        mainContentView.authorLabel.text = "Author: Nurdinov Syimyk Nurdinov Syimyk"
        mainContentView.dateLabel.text = "Date: 12.01.2014"
        mainContentView.previewImageView.image = UIImage(systemName: "photo")
    }
}
