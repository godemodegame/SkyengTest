import Kingfisher
import Nibless
import UIKit

final class MeaningCell: ReusableTableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        textLabel?.numberOfLines = 0
    }
}

// MARK: - Decorator

extension MeaningCell: Decoratable {
    func decorate(model: ViewModelProtocol) {
        guard let model = model as? Meaning else { fatalError("Wrong model for MeaningCell") }
        textLabel?.text = model.translation.text.capitalized
    }
}
