import UIKit

final class ListController: UIViewController, ViewSpecificController {
    
    typealias RootView = ListView
    
    // MARK: Private properties
    
    var presenter: ListViewOutput?
    
    private var dataSource: ListDataSource? {
        didSet {
            view().tableView.dataSource = dataSource
        }
    }
    
    private var delegate: ListDelegate? {
        didSet {
            view().tableView.delegate = delegate
            delegate?.onTap = { [weak self] model, title in
                guard let model = model else { return }
                self?.presenter?.didTapCell(with: model, title: title)
            }
        }
    }
    
    private var state: State<MeaningCellModel> = .none {
        didSet {
            updateWithNew(state: self.state)
        }
    }
    
    // MARK: Lyfecycle
    
    override func loadView() {
        view = ListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    // MARK: Private methods
    
    private func updateWithNew(state: State<MeaningCellModel>) {
        DispatchQueue.main.async {
            if self.state == .loading {
                self.view().addSpinner()
            } else {
                self.view().removeSpinner()
            }
            
            self.dataSource = ListDataSource(state: self.state)
            self.delegate = ListDelegate(state: self.state)
        }
    }
}

// MARK: UISearchBarDelegate

extension ListController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.search(text: searchText)
    }
}

// MARK: ListViewInput

extension ListController: ListViewInput {
    func update(state: State<MeaningCellModel>) {
        self.state = state
    }
}
