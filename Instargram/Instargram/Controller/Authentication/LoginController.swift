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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "instagram")
        return imageView
    }()
    
    private let emailTextField = CustomTextField(placeholder: "사용자 이름, 이메일 주소 또는 휴대폰 번호")
    private let passwordTextField = CustomTextField(placeholder: "비밀번호")
    
    private let loginButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let lostPasswordButton = {
        let button = UIButton()
        button.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
        
    private let loginStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let registrationButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("새 계정 만들기", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let metaImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "meta")
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
        view.addSubview(logoImageView)
        view.addSubview(loginStackView)
        view.addSubview(registrationButton)
        view.addSubview(metaImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 64),
            logoImageView.heightAnchor.constraint(equalToConstant: 64),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100),
            loginStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            loginStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            registrationButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            registrationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            registrationButton.bottomAnchor.constraint(equalTo: metaImageView.topAnchor, constant: -5),
            
            metaImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            metaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            metaImageView.widthAnchor.constraint(equalToConstant: 98),
            metaImageView.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
    
    private func addStackView() {
        loginStackView.addArrangedSubview(emailTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        loginStackView.addArrangedSubview(loginButton)
        loginStackView.addArrangedSubview(lostPasswordButton)
    }
}
