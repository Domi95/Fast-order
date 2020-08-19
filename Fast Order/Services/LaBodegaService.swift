//
//  LaBodegaService.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//


import Foundation

class LaBodegaService {
    
    func fillBeveragesMenu() -> [MenuSection]{
        //Returns menu for restaurant LaBodega
        
        var menu: [MenuSection] = []
        
        let beveragesInMenuSection0 = [Beverage(name: "Kava s mlijekom", imageString: "coffeMilkImage", price: 12, beverageCounter: 0),
                                       Beverage(name: "Espresso", imageString: "espressoImage", price: 10, beverageCounter: 0),
                                       Beverage(name: "Cappuccino", imageString: "cappuccinoImage", price: 14, beverageCounter: 0)
        ]
        let menuSection0 = MenuSection(isExpanded: false, imageString: "coffeImage2", title: "KAVE", beverages: beveragesInMenuSection0, counterOfOrdersInMenuSection: 0)
        menu.append(menuSection0)
        
        
        
        let beveragesInMenuSection1 = [Beverage(name: "Crni čaj", imageString: "blackTeaImage", price: 16, beverageCounter: 0),
                                       Beverage(name: "Bijeli čaj", imageString: "whiteTeaImage", price: 15, beverageCounter: 0),
                                       Beverage(name: "Čaj od kamilice", imageString: "chamomileTeaImage", price: 13, beverageCounter: 0)
        ]
        let menuSection1 = MenuSection(isExpanded: false, imageString: "teaSectionImage", title: "ČAJEVI", beverages: beveragesInMenuSection1, counterOfOrdersInMenuSection: 0)
        menu.append(menuSection1)
        
        
        
        let beveragesInMenuSection2 = [Beverage(name: "Sprite", imageString: "spriteImage", price: 11, beverageCounter: 0),
                                       Beverage(name: "Coca Cola", imageString: "cocaColaImage", price: 12, beverageCounter: 0),
                                       Beverage(name: "Fanta", imageString: "fantaImage", price: 11, beverageCounter: 0)
        ]
        let menuSection2 = MenuSection(isExpanded: false, imageString: "nonAlcoholImage2", title: "BEZALKOHOLNA PIĆA", beverages: beveragesInMenuSection2, counterOfOrdersInMenuSection: 0)
        menu.append(menuSection2)
        
        
        
        let beveragesInMenuSection3 = [Beverage(name: "Jack Daniels", imageString: "jackDanielsImage", price: 22, beverageCounter: 0),
                                       Beverage(name: "Pelinkovac", imageString: "pelinkovacImage", price: 18, beverageCounter: 0),
                                       Beverage(name: "Pivo", imageString: "pivoImage", price: 17, beverageCounter: 0),
                                       Beverage(name: "Rakija", imageString: "rakijaImage", price: 999, beverageCounter: 0)
        ]
        let menuSection3 = MenuSection(isExpanded: false, imageString: "alcoholImage", title: "ALKOHOLNA PIĆA", beverages: beveragesInMenuSection3, counterOfOrdersInMenuSection: 0)
        menu.append(menuSection3)
        
        
        
        let beveragesInMenuSection4 = [Beverage(name: "Old Fashioned", imageString: "oldFashionedImage", price: 35, beverageCounter: 0),
                                       Beverage(name: "Negroni", imageString: "negroniImage", price: 30, beverageCounter: 0),
                                       Beverage(name: "Dry Martini", imageString: "dryMartini", price: 29, beverageCounter: 0)
        ]
        let menuSection4 = MenuSection(isExpanded: false, imageString: "cocktailsImage", title: "KOKTELI", beverages: beveragesInMenuSection4, counterOfOrdersInMenuSection: 0)
        menu.append(menuSection4)
        return menu
    }
}
