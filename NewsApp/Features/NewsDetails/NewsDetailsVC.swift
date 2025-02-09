import Kingfisher
import UIKit

final class NewsDetailsVC: BaseVC<NewsDetailsCV, NewsDetailsVM> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setTargets() {
        contentView.navigationBar.backButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
    }
    
    override func localize() {
        super.localize()
        contentView.navigationBar.titleLabel.text = "News details"
        contentView.imageView.kf.setImage(with: URL(string: viewModel.newsModel.imageUrl ?? ""),
                                          placeholder: UIImage(systemName: "photo"))
        contentView.titleLabel.text = viewModel.newsModel.title
        contentView.descriptionLabel.text = viewModel.newsModel.storedDescription
        contentView.authorLabel.text = "Author: \(viewModel.newsModel.sourceName ?? "Unknown author")"
        // Create an attributed string with a link
        let attributedString = NSMutableAttributedString(string: viewModel.newsModel.link)
        attributedString.addAttribute(.link, value: viewModel.newsModel.link, range: NSRange(location: 0, length: attributedString.length))
        
        // Set the attributed text to the label
        contentView.linkLabel.attributedText = attributedString
        contentView.linkLabel.textColor = .blue // Make it look like a link
        contentView.linkLabel.isUserInteractionEnabled = true // Enable user interaction
        
        // Add a tap gesture recognizer to the label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        contentView.linkLabel.addGestureRecognizer(tapGesture)
    }
    
}
// MARK: - Actions
@objc extension NewsDetailsVC {
    func onBackAction() {
        viewModel.onBackAction?()
    }
    
    func onSaveAction() {}
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        guard let label = gesture.view as? UILabel else { return }
        
        // Check if the tap location is within the label's bounds
        let tapLocation = gesture.location(in: label)
        if label.bounds.contains(tapLocation) {
            // Open the link
            if let url = URL(string: viewModel.newsModel.link) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
