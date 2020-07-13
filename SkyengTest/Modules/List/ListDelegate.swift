import UIKit.UITableView

final class ListDelegate: NSObject, UITableViewDelegate {
    private var state: State<MeaningCellModel>
    
    var onTap: ((Meaning?, String?) -> Void)?

    init(state: State<MeaningCellModel>) {
        self.state = state
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch state {
        case .loading, .none:
            return 0
        case .success(let model), .error(let model):
            return model[indexPath.row].cellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .white
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch state {
        case .success(let model):
            let searchReponse = model[indexPath.section].model as? SearchResponse
            onTap?(searchReponse?.meanings[indexPath.row], searchReponse?.text)
        default:
            break
        }
    }
}
