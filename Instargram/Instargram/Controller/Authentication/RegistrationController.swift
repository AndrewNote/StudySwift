//
//  RegistrationController.swift
//  Instargram
//
//  Created by Andrew on 2023/07/01.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Properties
    private let titleLabel = CustomLabel(text: "이름 입력")
    private let subTitleLabel = CustomLabel(text: "친구들이 회원님을 찾을 수 있도록 이름을 추가해주세요.")
    private let nameTextField = CustomTextField(placeholder: "성명")
    private let nextButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let stackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addStackView()
    }
    
    // MARK: Method
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.backBarButtonItem?.isHidden = true
        navigationItem.backBarButtonItem?.tintColor = .systemBackground
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }
    
    private func addStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(nextButton)
    }
}
