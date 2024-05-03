import UIKit

class StopWatchController: UIViewController {
    
    private let stopWatchLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00.00"
        label.font = UIFont.boldSystemFont(ofSize: 80)
        return label
    }()
    
    private let startButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.setTitle("시작", for: .normal)
        button.layer.cornerRadius = button.frame.size.width / 2
        return button
    }()
    
    private let labButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        button.setTitle("랩", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(stopWatchLabel)
        view.addSubview(labButton)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            stopWatchLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stopWatchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopWatchLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            labButton.topAnchor.constraint(equalTo: stopWatchLabel.bottomAnchor, constant: 100),
            labButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            startButton.topAnchor.constraint(equalTo: stopWatchLabel.bottomAnchor, constant: 100),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
