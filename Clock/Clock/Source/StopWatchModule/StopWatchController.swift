import UIKit

enum StopWatchState {
    case start
    case stop
}

class StopWatchController: UIViewController {
    
    var stopWatchState: StopWatchState = .start
    
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
        button.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.5)
        button.setTitle("시작", for: .normal)
        button.layer.cornerRadius = 25 // 50의 절반인 25로 설정
//        button.layer.masksToBounds = true // cornerRadius가 적용되도록 설정
        button.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapStartButton(_ sender: UIButton) {
        if stopWatchState == .start {
            stopWatchState = .stop
            sender.setTitle("중단", for: .normal)
            sender.backgroundColor = UIColor.systemRed.withAlphaComponent(0.5)
            labButton.setTitle("랩", for: .normal)
            
        } else {
            stopWatchState = .start
            sender.setTitle("시작", for: .normal)
            sender.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.5)
            labButton.setTitle("재설정", for: .normal)
        }
        
    }
    
    private let labButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        button.setTitle("재설정", for: .normal)
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
            labButton.widthAnchor.constraint(equalToConstant: 50),
            labButton.heightAnchor.constraint(equalToConstant: 50),
            
            startButton.topAnchor.constraint(equalTo: stopWatchLabel.bottomAnchor, constant: 100),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            startButton.widthAnchor.constraint(equalToConstant: 50),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
