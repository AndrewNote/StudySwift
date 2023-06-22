//
//  MenuListCell.swift
//  MiniGameHeaven
//
//  Created by Andrew on 2023/05/24.
//
import UIKit

class MenuListCell: UICollectionViewListCell {
    
    private let gameImageLabel = {
        let label = UILabel()
        return label
    }()
    
    private let gameTitleLabel = {
        let label = UILabel()
        return label
    }()
    
    private let menuStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        menuStackView.addArrangedSubview(gameImageLabel)
        menuStackView.addArrangedSubview(gameTitleLabel)
        addSubview(menuStackView)
        
        NSLayoutConstraint.activate([
            menuStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            menuStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(imageLabel: String ,titleLabel: String) {
        gameImageLabel.text = imageLabel
        gameTitleLabel.text = titleLabel
    }
    
}
