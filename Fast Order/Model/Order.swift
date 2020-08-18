//
//  Order.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//
import Foundation

struct Order {
    let id: String
    let tableNumber: Int
    var beveragesCounter: Int
    var beveragesPriceSum: Int
    var beverages: [Beverage]
    
    init(id: String, tableNumber: Int, orderedBeveragesSum: Int, orderedBeveragesPriceSum: Int, beverages: [Beverage]  ) {
        self.tableNumber = tableNumber
        self.beveragesCounter = orderedBeveragesSum
        self.beveragesPriceSum = orderedBeveragesPriceSum
        self.beverages = beverages
        self.id = id
    }
}
