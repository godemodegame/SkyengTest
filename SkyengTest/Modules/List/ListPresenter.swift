import Foundation // swiftlint:disable:this foundation_using

protocol ListViewOutput: ViewOutput {
    func search(text: String)
    func didTapCell(with model: Meaning, title: String?)
}

final class ListPresenter: ListViewOutput {
    weak var view: ListViewInput?
    var interactor: ListInteractorInput?
    var router: ListRouter?
    
    func search(text: String) {
        interactor?.obtainMeanings(with: text)
        view?.update(state: .loading)
    }
    
    func didTapCell(with model: Meaning, title: String?) {
        router?.openDetail(with: model, text: title)
    }
    
    private func createState(meaningsArray: [SearchResponse]) -> State<MeaningCellModel> {
        let cellModels = meaningsArray.map { MeaningCellModel.defaultCell(model: $0)}
        return .success(cellModels)
    }
}

extension ListPresenter: ListInteractorOutput {
    func didSucceedToObtain(meaningsArray: [SearchResponse]) {
        let state = createState(meaningsArray: meaningsArray)
        view?.update(state: state)
    }
    
    func didFailToObtainMeanings(error: NSError) {
        view?.update(state: .error([.errorCell(error: error)]))
    }
}

protocol ListViewInput: AnyObject {
    func update(state: State<MeaningCellModel>)
}
