import AVKit

protocol DetailViewOutput: ViewOutput {
    func didTapTranscriptionLabel()
}

final class DetailPresenter: DetailViewOutput {
    weak var view: DetailViewInput?
    let model: DetailAssembly.Model
    
    lazy var player = AVPlayer()
    var playerItem: AVPlayerItem?
    
    init(model: DetailAssembly.Model) {
        self.model = model
    }
    
    func viewDidLoad() {
        if let imageUrl = model.imageUrl {
            view?.setImage(from: imageUrl)
        }
        view?.setLabels(text: model.text ?? "", transcription: model.transcription)
        guard let url = model.soundUrl else { return }
        playerItem = AVPlayerItem(url: url)
    }
    
    func didTapTranscriptionLabel() {
        guard let playerItem = playerItem else { return }
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
}

protocol DetailViewInput: AnyObject {
    func setImage(from url: URL)
    func setLabels(text: String, transcription: String)
}
