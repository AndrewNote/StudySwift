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
        imageView.layer.cornerRadius = 15
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    private let userName = CustomLabel(text: "UserName")
    
    private let moreButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "more"), for: .normal)
        return button
    }()
    
    private let postImage = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
    
    private let likeLabel = CustomLabel(text: "좋아요 930,411개")
    private let commentCountLabel = CustomLabel(text: "댓글 69개 모두 보기", textColor: .systemGray5)
    private let dateLabel = CustomLabel(text: "6월 29일", textColor: .systemGray3)
    
    private let profileStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private let buttonStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private let postBottomStackView = {
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
        addSubview(profileStackView)
        addSubview(postImage)
        addSubview(buttonStackView)
        addSubview(postBottomStackView)
        
        NSLayoutConstraint.activate([
            profileStackView.topAnchor.constraint(equalTo: topAnchor),
            profileStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            profileStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            profileImage.widthAnchor.constraint(equalToConstant: 30),
            profileImage.heightAnchor.constraint(equalToConstant: 30),
            
            postImage.topAnchor.constraint(equalTo: profileStackView.bottomAnchor, constant: 10),
            postImage.widthAnchor.constraint(equalTo: widthAnchor),
            postImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.2),
            postImage.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -10),
            
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            postBottomStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor,constant: 10),
            postBottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            postBottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            postBottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
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
        
        postBottomStackView.addArrangedSubview(likeLabel)
        postBottomStackView.addArrangedSubview(commentCountLabel)
        postBottomStackView.addArrangedSubview(dateLabel)
    }
}
