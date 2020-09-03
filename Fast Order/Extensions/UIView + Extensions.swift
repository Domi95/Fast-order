//
//  UIView + Extensions.swift
//  Fast Order Waiter App
//
//  Created by Domagoj Beronic on 23/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

extension UIView {
    
    func setCellView() {
        layer.cornerRadius = 10
        layer.shadowOpacity = 1
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.masksToBounds = true
        backgroundColor = .darkGray
    }
}
