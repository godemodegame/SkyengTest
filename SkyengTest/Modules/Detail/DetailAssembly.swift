import UIKit.UIViewController

final class DetailAssembly: Assembly {
    
    struct Model: TransitionModel {
        let text: String?
        let translation: String
        let transcription: String
        let imageUrl: URL?
        let soundUrl: URL?
    }
    
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        guard let model = model as? Model else { fatalError("Wrong model for DetailAssembly") }
        
        let view = DetailController()
        let presenter = DetailPresenter(model: model)
        
        presenter.view = view
        view.presenter = presenter
        
        view.title = model.translation.capitalized
        
        return view
    }
}
