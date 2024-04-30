import UIKit

class AlarmController: UIViewController {
    
    private let startButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("시작", for: .normal)
        return button
    }()
    
    private let labButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("랩", for: .normal)
        return button
    }()
    
    private let buttonStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(startButton)
        view.addSubview(labButton)
        
        NSLayoutConstraint.activate([
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
}
