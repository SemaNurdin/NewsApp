import UIKit

public final class NewsDetailsCV: UIView {
    lazy var navigationBar = makeNavigationBar()
    lazy var stackView = makeStackView()
    lazy var imageView = makeImageView()
    lazy var titleLabel = makeLabel(size: 17, weight: .semibold)
    lazy var descriptionLabel = makeLabel(size: 16, weight: .regular)
    lazy var authorLabel = makeLabel(size: 15, weight: .semibold)
    lazy var linkLabel = makeLabel(size: 15, weight: .semibold)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setProperties()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup subviews and constraints
extension NewsDetailsCV: Customizable {
    public func setSubviews() {
        addSubview(navigationBar)
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(linkLabel)
    }
    
    public func setConstraints() {
        navigationBar.anchor(
            .leading(leadingAnchor, constant: Constants.UI.viewsLeadingTrailing),
            .trailing(trailingAnchor, constant: Constants.UI.viewsLeadingTrailing),
            .top(safeAreaLayoutGuide.topAnchor)
        )
        
        stackView.anchor(
            .leading(leadingAnchor, constant: Constants.UI.viewsLeadingTrailing),
            .trailing(trailingAnchor, constant: Constants.UI.viewsLeadingTrailing),
            .top(navigationBar.bottomAnchor, constant: Constants.UI.padding12)
        )
        
        imageView.anchor(
            .height(UIScreen.main.bounds.height * 0.2)
        )
    }
    
    public func setProperties() {
        backgroundColor = .white
    }
}

private extension NewsDetailsCV {
    func makeNavigationBar() -> NavigationBar {
        let navbar = NavigationBar()
        return navbar
    }
    
    func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.UI.padding8
        return stackView
    }
    
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.cornerRadius = Constants.UI.padding4
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        return view
    }
    
    func makeLabel(size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: size, weight: weight)
        label.numberOfLines = 0
        return label
    }
    
}
