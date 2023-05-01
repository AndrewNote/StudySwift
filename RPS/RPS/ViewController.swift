//
//  ViewController.swift
//  RPS
//
//  Created by Andrew on 2023/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let gameTitleLabel = {
        let label = UILabel()
        label.text = "묵찌빠 게임"
        return label
    }()
    
    private let userLabel = {
        let label = UILabel()
        label.text = "User"
        return label
    }()
    
    private let computerLabel = {
        let label = UILabel()
        label.text = "Computer"
        return label
    }()
    
    private let userImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let computerImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let startOrSeleteButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    private let resetButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    private let labelStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let imageStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let mainStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureStackView() {
        labelStackView.addArrangedSubview(userLabel)
        labelStackView.addArrangedSubview(computerLabel)
        
        imageStackView.addArrangedSubview(userImageView)
        imageStackView.addArrangedSubview(computerImageView)
        
        mainStackView.addArrangedSubview(gameTitleLabel)
        mainStackView.addArrangedSubview(labelStackView)
        mainStackView.addArrangedSubview(imageStackView)
        mainStackView.addArrangedSubview(startOrSeleteButton)
        mainStackView.addArrangedSubview(resetButton)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        startOrSeleteButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
    }
    
    @objc private func didTapStartButton() {
        if startOrSeleteButton.backgroundColor == .blue {
            startOrSeleteButton.backgroundColor = .green
            startOrSeleteButton.setTitle("Selete", for: .normal)
        } else {
            startOrSeleteButton.backgroundColor = .blue
            startOrSeleteButton.setTitle("Start", for: .normal)
        }
    }
}
