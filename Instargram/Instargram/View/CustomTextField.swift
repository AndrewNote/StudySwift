//
//  CustomTextField.swift
//  Instargram
//
//  Created by Andrew on 2023/07/03.
//

import UIKit

class CustomTextField: UITextField {
    init(placeholderText: String) {
        super.init(frame: .zero)
        placeholder = placeholderText
        backgroundColor = .white
        layer.borderWidth = 1
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 5
        layer.borderColor = UIColor.systemGray3.cgColor
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        leftViewMode = .always
        tintColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
