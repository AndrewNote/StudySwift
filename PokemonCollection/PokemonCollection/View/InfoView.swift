//
//  InfoView.swift
//  PokemonCollection
//
//  Created by Andrew on 2023/08/08.
//

import UIKit

protocol InfoViewProtocol {
    func removeInfoView()
}

class InfoView: UIView {
    var delegate: InfoViewProtocol?
    var pokemon: Pokemon? {
        didSet {
            configurePokemon()
        }
    }
    
    // MARK: Properties
    private let nameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        return label
    }()
    
    private let imageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let weightLabel = {
        let label = UILabel()
        label.text = "Weight : "
        return label
    }()
    
    private let heightLabel = {
        let label = UILabel()
        label.text = "Height : "
        return label
    }()
    
    private let typeLabel = {
        let label = UILabel()
        label.text = "Type : "
        return label
    }()
    
    private let detailViewButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemYellow
        button.setTitle("상세 보기", for: .normal)
        button.addTarget(self, action: #selector(didTabDetailViewButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTabDetailViewButton() {
        delegate?.removeInfoView()
    }
    
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
        addSubview(nameLabel)
        addSubview(detailViewButton)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            detailViewButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailViewButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            detailViewButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            detailViewButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func settingCell() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    private func configurePokemon() {
        guard let pokemon = pokemon else { return }
        nameLabel.text = pokemon.name
        
    }
}
