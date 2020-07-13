import Foundation // swiftlint:disable:this foundation_using

protocol ListRouterInput: AnyObject {
    func openDetail(with model: Meaning, text: String?)
}


final class ListRouter {
    
    // MARK: - Private properties

    private weak var view: ModuleTransitionHandler?
    
    // MARK: - init
    
    init(view: ModuleTransitionHandler) {
        self.view = view
    }
}


extension ListRouter: ListRouterInput {
    func openDetail(with model: Meaning, text: String?) {
        view?.push(with: DetailAssembly.Model(text: text,
                                              translation: model.translation.text,
                                              transcription: model.transcription,
                                              imageUrl: URL(string: "https:" + (model.imageUrl ?? "")),
                                              soundUrl: URL(string: "https:" + (model.soundUrl ?? ""))),
                   moduleType: DetailAssembly.self)
    }
}
