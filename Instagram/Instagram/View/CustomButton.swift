//
//  CustomButton.swift
//  Instargram
//
//  Created by Andrew on 2023/07/06.
//

import UIKit

class CustomButton: UIButton {
    init(imageName: String) {
        super.init(frame: .zero)
        self.setImage(#imageLiteral(resourceName: imageName), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
