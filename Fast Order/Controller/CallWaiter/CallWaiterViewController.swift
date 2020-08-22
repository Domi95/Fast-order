//
//  CallWaiterViewController.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.

import UIKit

class CallWaiterViewController: UIViewController {
    let callWaiterView = CallWaiterView()
    let services = Services()
    
    override func viewDidLoad() {
        setUpMenuView()
        setUpButtonsAction()
        setUpNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        callWaiterView.emojiLabel.pulsateLongerVersion()
    }
    
    private func setUpButtonsAction(){
        callWaiterView.callWaiterButton.addTarget(self, action: #selector(callWaiterButtonPressed), for: .touchUpInside)
    }
    
    private func callWaiter(){
    services.sendWaiterRequestToFirestore(tableNumber: "404")
    }
    
    @objc func callWaiterButtonPressed(){
        callWaiterView.showElementsWhenWaiterCalled()
        services.sendWaiterRequestToFirestore(tableNumber: "404")
    }
    
    private func setUpNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setUpMenuView(){
        view.addSubview(callWaiterView)
        callWaiterView.translatesAutoresizingMaskIntoConstraints = false
        callWaiterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        callWaiterView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        callWaiterView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        callWaiterView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
