//
//  InfoView.swift
//  PokemonCollection
//
//  Created by Andrew on 2023/08/08.
//

import UIKit

class InfoView: UIView {
    
    // MARK: Properties
    private let nameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "NAME"
        return label
    }()
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        settingCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Method
    private func configureUI() {
        
    }
    
    private func settingCell() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
