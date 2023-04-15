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
    
    private let nextButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(appNameLabel)
        
        NSLayoutConstraint.activate([
            appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appNameLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
        ])
    }
}

