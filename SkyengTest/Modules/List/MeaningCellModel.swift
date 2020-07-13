import UIKit

enum MeaningCellModel {
    case defaultCell(model: SearchResponse)
    case errorCell(error: NSError)
    
    // MARK: - Public properties
    
    var model: ViewModelProtocol {
        switch self {
        case .defaultCell(let model):
            return model
        case .errorCell(let error):
            return error
        }
    }
    
    var identifier: String {
        switch self {
        case .defaultCell:
            return MeaningCell.reuseId
        case .errorCell:
            return ErrorTableViewCell.reuseId
        }
    }
    
    var cellHeight: CGFloat { UITableView.automaticDimension }
}
