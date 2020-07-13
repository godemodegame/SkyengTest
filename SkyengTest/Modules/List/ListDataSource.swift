import UIKit.UITableView

final class ListDataSource: NSObject, UITableViewDataSource {
    
    private var state: State<MeaningCellModel>
    
    init(state: State<MeaningCellModel>) {
        self.state = state
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        state.itemsCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (state.items?[section].model as? SearchResponse)?.meanings.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        (state.items?[section].model as? SearchResponse)?.text
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch state {
        case .loading, .none: return UITableViewCell()
        case .success(let viewModel), .error(let viewModel):
            let viewModel = viewModel[indexPath.section]
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.identifier, for: indexPath)
            if let model = (viewModel.model as? SearchResponse)?.meanings[indexPath.item] {
                (cell as? Decoratable)?.decorate(model: model)
            }
            
            return cell
        }
    }
}
