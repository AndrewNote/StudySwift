//
//  PokemonCell.swift
//  PokemonCollection
//
//  Created by Andrew on 2023/07/20.
//

import UIKit

protocol PokemonCellProtocol {
    func showPopup(pokemon: Pokemon)
}

class PokemonCell: UICollectionViewCell {
    
    // MARK: Properties
    private var idNumber = 1
    private let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didTapCell))
    private let delegate: PokemonCellProtocol?

    @objc private func didTapCell(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
//            guard let pokemon = self.pokemonNa else { return }
            delegate?.showPopup(pokemon: pokemon)
        }
    }
    
    private let pokemonImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let pokemonNameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemOrange
        label.textAlignment = .center
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
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor),
            pokemonNameLabel.widthAnchor.constraint(equalTo: widthAnchor),
            pokemonNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
        ])
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    func sendData(name: String) {
        pokemonNameLabel.text = name
    }
    
    func configureImage(with imageUrl: URL) {
        pokemonImageView.load(url: imageUrl)
    }
    
    func imageURL(for idNumber: Int) -> URL? {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(idNumber).png")
    }
    
}
