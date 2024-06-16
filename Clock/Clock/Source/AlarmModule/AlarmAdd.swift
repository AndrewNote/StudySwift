import UIKit

class AlarmAdd: UIViewController {
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "알람 추가"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let cancelButton = {
        let button = UIButton()
        button.setTitleColor(.systemOrange, for: .normal)
        button.setTitle("취소", for: .normal)
        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        return button
    }()
    
    private let saveButton = {
        let button = UIButton()
        button.setTitleColor(.systemOrange, for: .normal)
        button.setTitle("저장", for: .normal)
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView = {
        let stackView = UIStackView(arrangedSubviews: [cancelButton, titleLabel, saveButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 100
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func didTapCancelButton() {
        dismiss(animated: true)
    }
    
    @objc private func didTapSaveButton() {
        
    }
    
}
