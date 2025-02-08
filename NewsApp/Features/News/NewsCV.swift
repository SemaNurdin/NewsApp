import UIKit

public final class NewsCV: UIView {
    lazy var tableView = makeTableView()
    
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
extension NewsCV: Customizable {
    public func setSubviews() {
        addSubview(tableView)
    }
    
    public func setConstraints() {
        tableView.anchor(
            .leading(leadingAnchor),
            .trailing(trailingAnchor),
            .top(safeAreaLayoutGuide.topAnchor),
            .bottom(safeAreaLayoutGuide.bottomAnchor)
        )
    }
    
    public func setProperties() {
        backgroundColor = .white
    }
}

private extension NewsCV {
    func makeTableView() -> TableView {
        let tableView = TableView(style: .plain,
                                  backgroundColor: .clear,
                                  cells: [NewsTVCell.self])
        return tableView
    }
}
