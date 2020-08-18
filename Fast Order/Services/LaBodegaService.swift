//
//  LaBodegaService.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//


import Foundation

class LaBodegaService {
    
    func fillBeveragesMenu() -> [SectionOfMenu]{
         //Returns menu for restaurant LaBodega
        
        var menu: [SectionOfMenu] = []
        
        let beveragesInMenuSection0 = [Beverage(name: "Kava s mlijekom", imageString: "coffeMilkImage", price: 12, orderedBeverageCounter: 0),
                                   Beverage(name: "Espresso", imageString: "espressoImage", price: 10, orderedBeverageCounter: 0),
                                   Beverage(name: "Cappuccino", imageString: "cappuccinoImage", price: 14, orderedBeverageCounter: 0)
        ]
        let menuSection0 = SectionOfMenu(isExpanded: false, title: "KAVE I ČAJEVI", beverages: beveragesInMenuSection0, counterOfOrdersInMenuSection: 0)
        menu.append(menuSection0)
        
        
        let beveragesInMenuSection1 = [Beverage(name: "Sprite", imageString: "spriteImage", price: 11, orderedBeverageCounter: 0),
                                   Beverage(name: "Coca Cola", imageString: "cocaColaImage", price: 12, orderedBeverageCounter: 0),
                                   Beverage(name: "Fanta", imageString: "fantaImage", price: 11, orderedBeverageCounter: 0)
        ]
        let menuSection1 = SectionOfMenu(isExpanded: false, title: "BEZALKOHOLNA PIĆA", beverages: beveragesInMenuSection1, counterOfOrdersInMenuSection: 0)
        menu.append(menuSection1)
        
        
        let beveragesInMenuSection2 = [Beverage(name: "Jack Daniels", imageString: "jackDanielsImage", price: 22, orderedBeverageCounter: 0),
                                   Beverage(name: "Pelinkovac", imageString: "pelinkovacImage", price: 18, orderedBeverageCounter: 0),
                                   Beverage(name: "Pivo", imageString: "pivoImage", price: 17, orderedBeverageCounter: 0),
                                   Beverage(name: "Rakija", imageString: "rakijaImage", price: 999, orderedBeverageCounter: 0)
        ]
        let menuSection2 = SectionOfMenu(isExpanded: false, title: "ALKOHOLNA PIĆA", beverages: beveragesInMenuSection2, counterOfOrdersInMenuSection: 0)
        menu.append(menuSection2)
        return menu
    }
}
