//
//  UITextField + Extensions.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 27/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

extension UITextField {
    
    func style() {
        self.placeholder = "Unesite šifru"
        self.backgroundColor = .white
        self.font = .boldSystemFont(ofSize: 20)
        self.layer.cornerRadius = 10
        self.isSecureTextEntry = true
        self.textAlignment = .center
        self.clipsToBounds = true
        self.adjustsFontSizeToFitWidth = true
        self.isHidden = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
