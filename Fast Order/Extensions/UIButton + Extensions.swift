//
//  UIButton + Extensions.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

extension UIButton {
    
    func style(isHidden: Bool = false, cornerRadius: CGFloat = 25, size: CGFloat, bgColor: UIColor, title: String = "", titleColor: UIColor = .white) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.isHidden = isHidden
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: .bold)
        self.backgroundColor = bgColor
        self.setTitleColor(titleColor, for: .normal)
    }
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.3
        pulse.fromValue = 0.95
        pulse.toValue = 1
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 2.5
        
        layer.add(pulse, forKey: nil)
    }
}
