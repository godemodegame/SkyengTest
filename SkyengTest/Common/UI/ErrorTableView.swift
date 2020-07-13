import Nibless
import UIKit

final class ErrorTableViewCell: ReusableTableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        textLabel?.textAlignment = .center
        textLabel?.textColor = .red
        textLabel?.numberOfLines = 0
    }
}

// MARK: - Decorator

extension ErrorTableViewCell: Decoratable {
    func decorate(model: ViewModelProtocol) {
        guard let model = model as? NSError else { return }
        textLabel?.text = model.localizedDescription
    }
}
