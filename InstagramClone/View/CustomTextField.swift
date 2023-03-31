//
//  CustomTextField.swift
//  InstagramClone
//
//  Created by Vadim Kononenko on 31.03.2023.
//

import UIKit

class CustomTextField: UITextField {

    init(placeholder: String) {
        super.init(frame: .zero)
        
        let spacer = UIView(frame: CGRect(x: 0, y: 0,
                                          width: 12, height: 50))
        leftView = spacer
        leftViewMode = .always
        
        layer.cornerRadius = 5
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                      attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
