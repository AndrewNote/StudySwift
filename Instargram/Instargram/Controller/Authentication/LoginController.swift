//
//  LoginController.swift
//  Instargram
//
//  Created by Andrew on 2023/07/01.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    private let logoImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let emailTextField = {
        let textField = UITextField()
        textField.placeholder = "사용자 이름, 이메일 주소 또는 휴대폰 번호"
        textField.borderStyle = .none
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.backgroundColor = UIColor.systemGray4.cgColor
        return textField
    }()
    
    private let passwordTextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.backgroundColor = UIColor.systemGray4.cgColor
        textField.frame.size.height = 15
        return textField
    }()
    
    private let loginButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    private let lostPasswordButton = {
        let button = UIButton()
        button.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        return button
    }()
    
    private let registrationButton = {
        let button = UIButton()
        button.setTitle("새 계정 만들기", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        return button
    }()
    
    private let loginStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let metaImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addStackView()
    }
    
    // MARK: Method
    private func configureUI() {
        view.backgroundColor = .systemGray5
        view.addSubview(loginStackView)
        
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            loginStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            loginStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addStackView() {
        loginStackView.addArrangedSubview(logoImageView)
        loginStackView.addArrangedSubview(emailTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        loginStackView.addArrangedSubview(loginButton)
        loginStackView.addArrangedSubview(lostPasswordButton)
        loginStackView.addArrangedSubview(registrationButton)
        loginStackView.addArrangedSubview(metaImageView)
    }
}
