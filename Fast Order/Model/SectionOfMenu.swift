//
//  SectionOfMenu.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//
import UIKit

struct SectionOfMenu {
    var isExpanded: Bool
    var imageString: String
    let title: String
    var beverages: [Beverage]
    //Counter of alcoholic drinks, non alcoholic, etc..
    var counterOfOrdersInMenuSection: Int
}

