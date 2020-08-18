//
//  CustomTabBarController.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//
import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(win: UIWindow){
        super.init(nibName: nil, bundle: nil)
        window = win
        configureTabBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureTabBar() {
        let menuViewController = MenuViewController()
        let menuItem = UITabBarItem()
        menuItem.title = "Menu"
        menuItem.image = UIImage(named:"menuIcon")
        
        let navigationController1 = UINavigationController(rootViewController: menuViewController)
        navigationController1.tabBarItem = menuItem

        let callWaiterViewController = CallWaiterViewController()
        let callWaiterItem = UITabBarItem()
        callWaiterItem.title = "Pozovi konobara"
        callWaiterItem.image = UIImage(named:"callWaiterIcon")
        let navigationController2 = UINavigationController(rootViewController: callWaiterViewController)
        navigationController2.tabBarItem = callWaiterItem

        self.viewControllers = [navigationController1, navigationController2]
        self.selectedViewController = navigationController1
    }
}



