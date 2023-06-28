//
//  FeedCell.swift
//  Instargram
//
//  Created by Andrew on 2023/06/28.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: Properties
    private let userName = {
        let label = UILabel()
        return label
    }()
    
    private let profileImage = {
        let image = UIImage()
        return image
    }()
    
    private let moreButton = {
        let button = UIButton()
        return button
    }()
    
    private let topStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private let postImage = {
        let image = UIImage()
        return image
    }()
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        AddStackView()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Method
    private func configureUI() {
        addSubview(topStackView)
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func AddStackView() {
        topStackView.addArrangedSubview(userName)
//        topStackView.addArrangedSubview(profileImage)
        topStackView.addArrangedSubview(moreButton)
    }
    
    func configureCell(text: String) {
        userName.text = text
    }
    
}
