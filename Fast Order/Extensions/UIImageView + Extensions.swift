//
//  UIImageView + Extensions.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

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
