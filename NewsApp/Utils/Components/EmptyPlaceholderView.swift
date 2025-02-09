import UIKit

public enum EmptyPlaceholderType {
    case news
    case savedNews
}

public class EmptyPlaceholderView: UIView {
    public enum State {
        case hidden
        case visible
    }
    
    public lazy var emptyBoxImageView = makeEmptyBoxImageView()
    public lazy var mainLabel = makeMainLabel()
    public lazy var titleLabel = makeTitleLabel()
    
    private let emptyBoxImageViewHeightWidth: CGFloat = 158 * Constants.ScreenSizeConstant
    private let emptyBoxImageViewCenterY: CGFloat = 80 * Constants.ScreenSizeConstant
    private let mainLabelTop: CGFloat = 12 * Constants.ScreenSizeConstant
    private let actionButtonTop: CGFloat = 24 * Constants.ScreenSizeConstant
    
    var emptyBoxImageViewConstraint: AnchoredConstraints?
    var actionButtonConstraint: AnchoredConstraints?
    var mainLabelConstraint: AnchoredConstraints?
    
    var emptyPlaceholderType: EmptyPlaceholderType = .news {
        didSet {
            switch emptyPlaceholderType {
            case .savedNews:
                mainLabel.text = "No Saved News!"
            case .news:
                mainLabel.text = "No News!"
            }
        }
    }
    
    public init() {
        super.init(frame: .zero)
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmptyPlaceholderView: Customizable {
    public func setSubviews() {
        addSubview(emptyBoxImageView)
        addSubview(mainLabel)
        addSubview(titleLabel)
    }
    
    public func setConstraints() {
        emptyBoxImageViewConstraint = emptyBoxImageView.anchor(
            .centerY(centerYAnchor, constant: -emptyBoxImageViewCenterY),
            .centerX(centerXAnchor),
            .height(emptyBoxImageViewHeightWidth),
            .width(emptyBoxImageViewHeightWidth)
        )
        
        mainLabelConstraint = mainLabel.anchor(
            .top(emptyBoxImageView.bottomAnchor, constant: mainLabelTop),
            .leading(leadingAnchor, constant: Constants.UI.viewsLeadingTrailing),
            .trailingGreaterThanEqual(trailingAnchor, constant: Constants.UI.viewsLeadingTrailing)
        )
    }
}

private extension EmptyPlaceholderView {
    func makeEmptyBoxImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    
    func makeMainLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }
}
