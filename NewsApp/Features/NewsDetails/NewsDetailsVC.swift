import Kingfisher
import UIKit

final class NewsDetailsVC: BaseVC<NewsDetailsCV, NewsDetailsVM> {
    
    private var newsSaved: Bool {
        return viewModel.realmManager.getObject(for: NewsModel.self, primaryKey: viewModel.newsModel.articleId) != nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setTargets() {
        contentView.navigationBar.backButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
        contentView.navigationBar.saveButton.addTarget(self, action: #selector(onSaveAction), for: .touchUpInside)
    }
    
    override func localize() {
        super.localize()
        if newsSaved {
            contentView.navigationBar.saveButton.setImage(UIImage(systemName: "arrow.down.square.fill"), for: .normal)
        } else {
            contentView.navigationBar.saveButton.setImage(UIImage(systemName: "arrow.down.square"), for: .normal)
        }
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
    
    func onSaveAction() {
        if newsSaved {
            if let savedNewsModel = viewModel.realmManager.getObject(for: NewsModel.self, primaryKey: viewModel.newsModel.articleId) {
                let newsCopy = savedNewsModel.detached()
                do {
                    try self.viewModel.realmManager.delete(objects: [savedNewsModel])
                    viewModel.newsModel = newsCopy // Update viewModel with safe copy
                    presentToast(with: "Unsaved!", messageType: .success)
                } catch {
                    presentToast(with: "Error unsaving -- \(error.localizedDescription)!", messageType: .error)
                }
            } else {
                presentToast(with: "Object not found!", messageType: .error)
            }
        } else {
            do {
                try viewModel.realmManager.save(objects: [viewModel.newsModel])
                presentToast(with: "Saved!", messageType: .success)
            } catch {
                presentToast(with: "Error saving -- \(error.localizedDescription)!", messageType: .error)
            }
        }
        localize()
    }

    
    func handleTap(_ gesture: UITapGestureRecognizer) {
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


// 2c44ec71c4c6d4aad63ccbe56f284c73
