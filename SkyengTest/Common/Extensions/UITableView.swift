import Nibless
import UIKit

typealias ReusableTableViewCell = Reusable & NLTableViewCell

extension UITableView {
    func register(_ array: [ReusableTableViewCell.Type]) {
        array.forEach { (type) in
            self.register(type.self, forCellReuseIdentifier: type.reuseId)
        }
    }
}
