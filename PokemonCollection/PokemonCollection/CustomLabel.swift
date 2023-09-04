//
//  CustomLabel.swift
//  PokemonCollection
//
//  Created by Andrew on 2023/08/31.
//

import UIKit

class CustomLabel: UILabel {
    
    init(text: String, textColor: UIColor) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
