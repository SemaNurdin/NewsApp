import UIKit

final class SavedNewsVC: BaseVC<SavedNewsCV, SavedNewsVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.tableView.reloadData()
        contentView.tableView.changePlaceholder(viewModel.realmManager.get(for: NewsModel.self).isEmpty ? .visible : .hidden)
    }
    
    override func setDelegates() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension SavedNewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.realmManager.get(for: NewsModel.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsTVCell = tableView.dequeueReusableCell(for: indexPath)
        let savedNews = viewModel.realmManager.get(for: NewsModel.self)
        cell.setupWith(news: savedNews[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let savedNews = viewModel.realmManager.get(for: NewsModel.self)
        let copy = savedNews[indexPath.row].detached()
        viewModel.onDetailsAction?(copy)
    }
}
