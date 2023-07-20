//
//  PokemonCell.swift
//  PokemonCollection
//
//  Created by Andrew on 2023/07/20.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    // MARK: Properties
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Method
    private func configureUI() {
        backgroundColor = .tertiarySystemGroupedBackground
    }
}
