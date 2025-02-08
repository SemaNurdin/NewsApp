import UIKit

final class NewsTVCellCV: UIView {
    lazy var separatorView = makeSeparatorView()
    lazy var previewImageView = makeImageView()
    lazy var labelsStackView = makeLabelsStackView()
    lazy var titleLabel = makeLabel(size: 14)
    lazy var authorLabel = makeLabel(size: 12)
    lazy var dateLabel = makeLabel(size: 12)
    
    private let imageViewHeightWidth: CGFloat = 68.adaptToScreenSize
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setConstraints()
        setProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helper functions
extension NewsTVCellCV {
}

// MARK: - BaseCV functions
extension NewsTVCellCV: Customizable {
    func setSubviews() {
        addSubview(previewImageView)
        addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(authorLabel)
        labelsStackView.addArrangedSubview(dateLabel)
        addSubview(separatorView)
    }
    
    func setConstraints() {
        previewImageView.anchor(
            .height(imageViewHeightWidth),
            .width(imageViewHeightWidth),
            .trailing(trailingAnchor, constant: Constants.UI.viewsLeadingTrailing),
            .centerY(labelsStackView.centerYAnchor)
        )
        
        labelsStackView.anchor(
            .leading(leadingAnchor, constant: Constants.UI.viewsLeadingTrailing),
            .trailing(previewImageView.leadingAnchor, constant: Constants.UI.padding4),
            .top(topAnchor, constant: Constants.UI.padding4),
            .bottom(separatorView.topAnchor, constant: Constants.UI.padding8)
        )
        
        separatorView.anchor(
            .height(1),
            .bottom(bottomAnchor),
            .leading(leadingAnchor),
            .trailing(trailingAnchor)
        )
    }
    
    func setProperties() {
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
    }
}

// MARK: - Factory functions
private extension NewsTVCellCV {
    func makeSeparatorView() -> UIView {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }
    
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.cornerRadius = Constants.UI.padding4
        view.contentMode = .scaleAspectFit
        return view
    }
    
    func makeLabelsStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.UI.padding4
        return stackView
    }
    
    func makeLabel(size: CGFloat) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: size)
        return label
    }
}
