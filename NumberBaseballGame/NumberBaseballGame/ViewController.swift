//
//  ViewController.swift
//  NumberBaseballGame
//
//  Created by Andrew on 2023/04/25.
//

import UIKit

class ViewController: UIViewController {

    private var chance = 9
    private let imageViewNames = ["circle", "triangle", "prohibition"]
    private var timer: Timer?
    var spinCount = 0
    
    private lazy var chanceLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chance: \(String(chance))"
        return label
    }()
    
    private let leftImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "prohibition")
        return imageView
    }()
    private let centerImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "prohibition")
        return imageView
    }()
    private let rightImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "prohibition")
        return imageView
    }()
    
    private lazy var slotImageViewStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftImageView, centerImageView, rightImageView])
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var mainStackView = {
        let stackView = UIStackView(arrangedSubviews: [chanceLabel, slotImageViewStackView, actionButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let actionButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .darkGray
        return button
    }()
    
    @objc private func didTapButton() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        actionButton.isEnabled = false
    }
    
    @objc func update() {
            for _ in 0..<imageViewNames.count {
                let imageName = imageViewNames.randomElement()!
                centerImageView.image = UIImage(named: imageName)
            }
            
            spinCount += 1
            
            if spinCount >= 20 {
                timer?.invalidate()
                timer = nil
                actionButton.isEnabled = true
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        var numbers = [Int]()
        while numbers.count < 3 {
            let randomNumber = Int.random(in: 1...9)
            if !numbers.contains(randomNumber) {
                numbers.append(randomNumber)
            }
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slotImageViewStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            slotImageViewStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

}
