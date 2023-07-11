//
//  ProfileCell.swift
//  Instagram
//
//  Created by Andrew on 2023/07/09.
//

import UIKit

class ProfileHeaderView: UICollectionReusableView {
    
    // MARK: Properties
    private let profileImage = {
        let image = UIImage()
        return image
    }()
    
    private let myPostButton = {
        let button = UIButton()
        button.setTitle("0\n게시물", for: .normal)
        return button
    }()
    
    private let myFollowerButton = {
        let button = UIButton()
        button.setTitle("1\n팔로워", for: .normal)
        return button
    }()
    
    private let myfollowingButton = {
        let button = UIButton()
        button.setTitle("3\n팔로잉", for: .normal)
        return button
    }()
    
    private let profileEditButton = {
        let button = UIButton()
        button.setTitle("프로필 편집", for: .normal)
        button.backgroundColor = .systemGray5
        return button
    }()
    
    private let profileShareButton = {
        let button = UIButton()
        button.setTitle("프로필 공유", for: .normal)
        button.backgroundColor = .systemGray5
        return button
    }()
    
    private let findPeopleButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        return button
    }()
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Method
    private func configureUI() {

    }
    
}
