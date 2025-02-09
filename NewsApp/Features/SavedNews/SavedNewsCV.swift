import UIKit

public final class SavedNewsCV: UIView {
    lazy var tableView = makeTableView()
    lazy var emptyPlaceholderView = makeEmptyPlaceholderView()
    
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
extension SavedNewsCV: Customizable {
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

private extension SavedNewsCV {    
    func makeTableView() -> TableView {
        let tableView = TableView(style: .plain,
                                  backgroundColor: .clear,
                                  cells: [NewsTVCell.self],
                                  emptyPlaceholderView: emptyPlaceholderView)
        return tableView
    }
    
    func makeEmptyPlaceholderView() -> EmptyPlaceholderView {
        let view = EmptyPlaceholderView()
        view.emptyPlaceholderType = .savedNews
        return view
    }
}
