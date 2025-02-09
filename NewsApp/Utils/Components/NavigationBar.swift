import UIKit

// MARK: - Main
final class NavigationBar: UIView {
    lazy var stackView = makeStackView()
    lazy var backButton = makeButton(with: "chevron.backward")
    lazy var saveButton = makeButton(with: "arrow.down.square")
    lazy var titleLabel = makeTitleLabel()
    
    override init(frame: CGRect) {
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
extension NavigationBar {
}

// MARK: - Content view setupable
extension NavigationBar: Customizable {
    func setSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(saveButton)
    }
    
    func setConstraints() {
        stackView.fillSuperview()
        backButton.anchor(
            .height(Constants.UI.padding40),
            .width(Constants.UI.padding40)
        )
        
        saveButton.anchor(
            .height(Constants.UI.padding40),
            .width(Constants.UI.padding40)
        )
    }
    
    func setProperties() {
        backgroundColor = .clear
    }
}

// MARK: - Factory functions
extension NavigationBar {
    func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    func makeButton(with image: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: image), for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        return button
    }
    
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }
    
}
