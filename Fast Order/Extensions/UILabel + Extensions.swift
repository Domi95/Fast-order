//
//  UILabel + Extensions.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

extension UILabel {
    
    func style(isHidden: Bool = false, size: CGFloat = 20, text: String = "", color: UIColor = .white, bgColor: UIColor = .black) {
        self.font = .boldSystemFont(ofSize: size)
        self.textColor = color
        self.text = text
        self.textAlignment = .center
        self.isHidden = isHidden
        self.clipsToBounds = true
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func flash(){
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 2
        flash.fromValue = 0
        flash.toValue = 1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.repeatCount = 1
        layer.add(flash, forKey: nil)
    }
    
    func pulsate(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.95
        pulse.toValue = 1
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
    }
    
    func pulsateLongerVersion(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 3
        pulse.fromValue = 0.8
        pulse.toValue = 1
        pulse.repeatCount = 10
        pulse.initialVelocity = 0.5
        pulse.damping = 3
        
        layer.add(pulse, forKey: nil)
    }
}
