import UIKit

final class NewsVC: BaseVC<NewsCV, NewsVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
        presentActivity()
        viewModel.getLatestNews()
    }
    
    override func setDelegates() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
    override func addObservers() {
        viewModel.successSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.dismissActivity()
                self.contentView.tableView.reloadData()
            }
            .store(in: &bag)
        
        viewModel.errorSubject
            .sink { [weak self] error in
                guard let self = self else { return }
                self.dismissActivity()
                self.presentToast(with: error, messageType: .error)
                self.contentView.tableView.changePlaceholder(viewModel.news.isEmpty ? .visible : .hidden)
            }
            .store(in: &bag)
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsTVCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setupWith(news: viewModel.news[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.size.height
        if position > contentHeight - frameHeight * 2, !viewModel.isFetching {
            viewModel.getLatestNews()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let copy = viewModel.news[indexPath.row].detached()
        viewModel.onDetailsAction?(copy)
    }
}
