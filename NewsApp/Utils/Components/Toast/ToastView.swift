import UIKit

class ToastView: UIView {
    let padding: CGFloat = 16
    
    let iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let progressView: UIProgressView = {
        let view = UIProgressView()
        view.backgroundColor = .white.withAlphaComponent(0.6)
        view.progressTintColor = .clear
        view.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        return view
    }()
    
    override var backgroundColor: UIColor? {
        didSet {
            progressView.progressTintColor = backgroundColor
        }
    }
    
    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        self.textLabel.text = text
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ToastView: Customizable {
    func setSubviews() {
        self.cornerRadius = 5
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(textLabel)
        addSubview(progressView)
    }
    
    func setConstraints() {
        iconImageView.anchor(
            .leading(leadingAnchor, constant: 24),
            .centerY(centerYAnchor),
            .width(24),
            .heightToWidth(1)
        )
        
        titleLabel.anchor(
            .top(topAnchor, constant: padding),
            .leading(iconImageView.trailingAnchor, constant: padding),
            .trailing(trailingAnchor, constant: padding)
        )
        
        textLabel.anchor(
            .top(titleLabel.bottomAnchor, constant: 2),
            .leading(titleLabel.leadingAnchor),
            .trailing(trailingAnchor, constant: padding),
            .bottom(bottomAnchor, constant: padding)
        )
        
        progressView.anchor(
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .bottom(bottomAnchor),
            .height(6)
        )
    }
}
