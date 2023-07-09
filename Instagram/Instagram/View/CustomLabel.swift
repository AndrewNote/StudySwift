//
//  CustomLabel.swift
//  Instargram
//
//  Created by Andrew on 2023/07/04.
//

import UIKit

class CustomLabel: UILabel {
    init(text: String, textColor: UIColor = .black) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
