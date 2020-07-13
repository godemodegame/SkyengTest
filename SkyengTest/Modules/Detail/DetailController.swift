import Kingfisher
import UIKit

final class DetailController: UIViewController, ViewSpecificController {
    typealias RootView = DetailView
    
    var presenter: DetailViewOutput?
    
    override func loadView() {
        view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        targeting()
    }
    
    private func targeting() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(labelDidTap))
        view().transcriptionLabel.isUserInteractionEnabled = true
        view().transcriptionLabel.addGestureRecognizer(tap)
    }
    
    @objc private func labelDidTap() {
        presenter?.didTapTranscriptionLabel()
    }
}

extension DetailController: DetailViewInput {
    func setImage(from url: URL) {
        view().imageView.kf.setImage(with: url,
                                     placeholder: nil,
                                     options: [
                                        .transition(.fade(0.2)),
                                        .cacheOriginalImage,
                                        .scaleFactor(UIScreen.main.scale)
            ])
    }
    
    func setLabels(text: String, transcription: String) {
        view().textLabel.text = text.capitalized
        view().transcriptionLabel.text = "[\(transcription)]"
    }
}
