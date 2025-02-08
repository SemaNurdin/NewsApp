import UIKit

final class NewsVC: BaseVC<NewsCV, NewsVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setTargets() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
