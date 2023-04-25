//
//  ViewController.swift
//  NumberBaseballGame
//
//  Created by Andrew on 2023/04/25.
//

import UIKit

class ViewController: UIViewController {

    private var chance = 9
    
    private lazy var chanceLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chance: \(String(chance))"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(chanceLabel)
        
        NSLayoutConstraint.activate([
            chanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chanceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
    }

}
