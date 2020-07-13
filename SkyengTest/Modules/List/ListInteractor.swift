import Foundation // swiftlint:disable:this foundation_using

protocol ListInteractorInput: AnyObject {
    func obtainMeanings(with text: String)
}

final class ListInteractor: ListInteractorInput {
    weak var presenter: ListInteractorOutput?
    let meaningService: MeaningService
    var title: String = ""
    
    init(meaningService: MeaningService) {
        self.meaningService = meaningService
    }
    
    func obtainMeanings(with text: String) {
        meaningService.fetchMeanings(searchText: text) { [weak self] result in
            switch result {
            case .success(let response):
                self?.presenter?.didSucceedToObtain(meaningsArray: response)
            case .failure(let error as NSError): self?.presenter?.didFailToObtainMeanings(error: error)
            }
        }
    }
    
}

protocol ListInteractorOutput: AnyObject {
    func didSucceedToObtain(meaningsArray: [SearchResponse])
    func didFailToObtainMeanings(error: NSError)
}
