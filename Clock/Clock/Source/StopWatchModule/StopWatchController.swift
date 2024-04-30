import UIKit

class StopWatchController: UIViewController {
    
    private let stopWatchLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00.00"
        return label
    }()
    
    private let startButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.setTitle("시작", for: .normal)
        return button
    }()
    
    private let labButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        button.setTitle("랩", for: .normal)
        return button
    }()
    
    private lazy var buttonStackView = {
        let stackView = UIStackView(arrangedSubviews: [startButton, labButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(stopWatchLabel)
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            stopWatchLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stopWatchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stopWatchLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            buttonStackView.topAnchor.constraint(equalTo: stopWatchLabel.bottomAnchor, constant: 50),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
        ])
    }
}
