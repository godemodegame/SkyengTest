import Nibless
import UIKit

final class DetailView: NLView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let transcriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .link
        return label
    }()
    
    lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textLabel, transcriptionLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.contentMode = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        addSubview(imageView)
        addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        ])
    }
}
