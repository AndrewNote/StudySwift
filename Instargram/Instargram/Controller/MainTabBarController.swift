//
//  MainViewController.swift
//  Instargram
//
//  Created by Andrew on 2023/06/26.
//

import UIKit

class MainTabBarController: UIViewController {
    // MARK: Properties
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Method
    private func configureUI() {
        view.backgroundColor = .purple
    }
}
