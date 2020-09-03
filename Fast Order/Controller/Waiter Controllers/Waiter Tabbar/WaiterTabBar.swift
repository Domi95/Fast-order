//
//  TabBarController.swift
//  fastOrder
//
//  Created by Domagoj Beronic on 24/06/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class WaiterTabbar: UITabBarController {
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
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTabBar() {
        let waiterMenuViewController = OrderListVC()
        let menuItem = UITabBarItem()
        menuItem.title = "Narudžbe"
        menuItem.image = UIImage(named:"menuIcon")
        
        let navigationController1 = UINavigationController(rootViewController: waiterMenuViewController)
        navigationController1.tabBarItem = menuItem

        let requestedWaiterCallsViewController = WaiterRequestsViewController()
        let requestedWaiterItem = UITabBarItem()
        requestedWaiterItem.title = "Poziv gosta"
        requestedWaiterItem.image = UIImage(named:"callWaiterIcon")
        let navigationController2 = UINavigationController(rootViewController: requestedWaiterCallsViewController)
        navigationController2.tabBarItem = requestedWaiterItem

        self.viewControllers = [navigationController1, navigationController2]
        self.selectedViewController = navigationController1
    }
}
