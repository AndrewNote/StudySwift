//
//  FeedCell.swift
//  Instargram
//
//  Created by Andrew on 2023/06/28.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: Properties
    private let profileImage = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    private let userName = {
        let label = UILabel()
        label.text = "UserName"
        return label
    }()
    
    private let moreButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "more"), for: .normal)
        return button
    }()
    
    private let postImage = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let likeButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "likeUnSeleted"), for: .normal)
        return button
    }()
    
    private let commentButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        return button
    }()
    
    private let shareButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "shared"), for: .normal)
        return button
    }()
    
    private let collectionButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "collection"), for: .normal)
        return button
    }()
    
    private let likeLabel = {
        let label = UILabel()
        label.text = "좋아요 930,411개"
        return label
    }()
    
    private let commentCountLabel = {
        let label = UILabel()
        label.textColor = .systemGray5
        label.text = "댓글 69개 모두 보기"
        return label
    }()
    
    private let dateLabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.text = "6월 29일"
        return label
    }()
    
    private let profileStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private let buttonStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private let feedCellStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
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
        addSubview(feedCellStackView)
        
        NSLayoutConstraint.activate([
            postImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.2),
            
            feedCellStackView.topAnchor.constraint(equalTo: topAnchor),
            feedCellStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            feedCellStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            feedCellStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func AddStackView() {
        profileStackView.addArrangedSubview(profileImage)
        profileStackView.addArrangedSubview(userName)
        profileStackView.addArrangedSubview(moreButton)
        
        buttonStackView.addArrangedSubview(likeButton)
        buttonStackView.addArrangedSubview(commentButton)
        buttonStackView.addArrangedSubview(shareButton)
        buttonStackView.addArrangedSubview(collectionButton)
        
        feedCellStackView.addArrangedSubview(profileStackView)
        feedCellStackView.addArrangedSubview(postImage)
        feedCellStackView.addArrangedSubview(buttonStackView)
        feedCellStackView.addArrangedSubview(likeLabel)
        feedCellStackView.addArrangedSubview(commentCountLabel)
        feedCellStackView.addArrangedSubview(dateLabel)
    }
}
