import UIKit

class TableViewCell<ContentView: Customizable>: UITableViewCell {
    public let mainContentView = ContentView()
    private let highlightionView = UIView(backgroundColor: .black.withAlphaComponent(0.2))
    var shouldHighlightOnTap = false
    
    var highlightionViewConstraints: AnchoredConstraints?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.addSubview(mainContentView)
        self.mainContentView.fillSuperview()
        self.highlightionView.alpha = 0
        self.contentView.addSubview(highlightionView)
        highlightionViewConstraints = highlightionView.fillSuperview()
        self.backgroundColor = .clear
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        guard shouldHighlightOnTap else {
            return
        }
        UIView.animate(withDuration: 0.1) {
            self.highlightionView.alpha = highlighted ? 1 : 0
        }
    }
}
