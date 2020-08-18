//
//  Extensions.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
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

class MyTapGesture: UITapGestureRecognizer {
    var section = 0
    var row = 0
}

class MyButton: UIButton {
    var section = 0
    var row = 0
}

extension UIButton {
    
    func pulsate(){
        
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

extension UIImageView {
    
    func pulsate(){
        
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



