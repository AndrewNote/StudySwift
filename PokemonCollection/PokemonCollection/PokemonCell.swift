//
//  PokemonCell.swift
//  PokemonCollection
//
//  Created by Andrew on 2023/07/20.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    // MARK: Properties
    private let pokemonImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let pokemonNameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pokemon Name"
        return label
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
        backgroundColor = .tertiarySystemGroupedBackground
        addSubview(pokemonImageView)
        addSubview(pokemonNameLabel)
        
        NSLayoutConstraint.activate([
            pokemonImageView.widthAnchor.constraint(equalTo: widthAnchor),
            pokemonImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            pokemonNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor),
        ])
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
