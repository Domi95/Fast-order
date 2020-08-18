//
//  Beverage.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import Foundation

struct Beverage {
    let name: String
    let imageString: String
    let price: Int
    var beverageCounter: Int
    
    init(name: String, imageString: String, price: Int, orderedBeverageCounter: Int) {
        self.name = name
        self.imageString = imageString
        self.price = price
        self.beverageCounter = orderedBeverageCounter
    }
}
