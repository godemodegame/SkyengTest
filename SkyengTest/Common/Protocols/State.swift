enum State<T>: Equatable {
    static func == (lhs: State<T>, rhs: State<T>) -> Bool {
        lhs.itemsCount == rhs.itemsCount
    }
    
    case none
    case loading
    case success([T])
    case error(_ error: [T])
    
    // MARK: - Properties
    
    var items: [T]? {
        switch self {
        case .success(let items):
            return items
        case .error(let error):
            return error
        case .loading, .none:
            return nil
        }
    }
    
    var itemsCount: Int {
        switch self {
        case .success(let items): return items.count
        case .error: return 1
        case .loading, .none: return 0
        }
    }
}
