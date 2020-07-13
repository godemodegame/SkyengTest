import UIKit

final class ListAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view = ListController()
        let presenter = ListPresenter()
        let interactor = ListInteractor(meaningService: MeaningServiceImp())
        let router = ListRouter(view: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
