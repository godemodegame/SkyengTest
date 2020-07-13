import Nibless

protocol Reusable: AnyObject {
    static var reuseId: String { get }
}

extension Reusable where Self: NLTableViewCell {
    static var reuseId: String {
        return String(describing: self)
    }
}
