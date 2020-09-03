//
//  WaiterRequest.swift
//  Fast Order Waiter App
//
//  Created by Domagoj Beronic on 17/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import Foundation

struct WaiterRequest {
    let tableNumber: String
    let timeStamp: String
    
    init(tableNumber: String, timeStamp: String) {
        self.tableNumber = tableNumber
        self.timeStamp = timeStamp
    }
}
