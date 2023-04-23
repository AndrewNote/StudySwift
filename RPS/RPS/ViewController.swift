//
//  ViewController.swift
//  RPS
//
//  Created by Andrew on 2023/04/22.
//

import UIKit

class ViewController: UIViewController {

    private lazy var startButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapStartButton() {
        if startButton.backgroundColor == .green {
            startButton.backgroundColor = .red
            startButton.setTitle("Reset", for: .normal)
        } else {
            startButton.backgroundColor = .green
            startButton.setTitle("Start", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
