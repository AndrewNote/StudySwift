//
//  ViewController.swift
//  WiseQuotesGenerator
//
//  Created by Andrew on 2023/04/12.
//

import UIKit

class ViewController: UIViewController {
    
    private let topText = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "오늘의 명언"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(topText)
        
        NSLayoutConstraint.activate([
            topText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topText.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

