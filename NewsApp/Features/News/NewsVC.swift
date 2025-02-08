import UIKit

final class NewsVC: BaseVC<NewsCV, NewsVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setTargets() {
    }
    
    override func setDelegates() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
}

// MARK: - Actions
@objc extension NewsVC {
    func onBackAction() {
        viewModel.onBackAction?()
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsTVCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
