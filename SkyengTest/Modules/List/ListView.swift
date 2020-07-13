import Nibless
import UIKit

final class ListView: NLView {
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
        tableView.register([MeaningCell.self, ErrorTableViewCell.self])
        return tableView
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        addSubview(tableView)
    }
    
    override func layoutSubviews() {
        tableView.frame = bounds
    }
    
    // MARK: - Public methods
    
    func addSpinner() {
        activityIndicatorView.startAnimating()
        tableView.backgroundView = activityIndicatorView
    }
    
    func removeSpinner() {
        activityIndicatorView.stopAnimating()
        tableView.backgroundView = nil
    }
}
