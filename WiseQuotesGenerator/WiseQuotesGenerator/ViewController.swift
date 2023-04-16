//
//  ViewController.swift
//  WiseQuotesGenerator
//
//  Created by Andrew on 2023/04/12.
//

import UIKit

class ViewController: UIViewController {
    
    private let appNameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "명언 생성기"
        return label
    }()
    
    private let backgroundImage = {
        let image = UIImage(named: "Wallpaper")
        return image
    }()
    
    private lazy var nextButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapNextButton() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(appNameLabel)
        view.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appNameLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

