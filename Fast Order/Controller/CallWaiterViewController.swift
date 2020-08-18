//
//  CallWaiterViewController.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.

import Foundation
import UIKit

class CallWaiterViewController: UIViewController {
    let callWaiterView = CallWaiterView()
    let services = Services()
    
    override func viewDidLoad() {
        render()
    }
    
    func render(){
        setUpMenuView()
        setUpButtonsAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        callWaiterView.emojiLabel.pulsateLongerVersion()
    }
    
    func setUpButtonsAction(){
        callWaiterView.callWaiterButton.addTarget(self, action: #selector(callWaiterButtonPressed), for: .touchUpInside)
    }
    
    func callWaiter(){
    services.sendWaiterRequestToFirestore(tableNumber: "404")
    }
    
    @objc func callWaiterButtonPressed(){
        
        callWaiterView.callWaiterButton.pulsate()
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        let dateString = df.string(from: date)
        callWaiterView.emojiLabel.isHidden = false
        callWaiterView.emojiLabel.pulsateLongerVersion()
        callWaiterView.informationAboutSuccessOfWaiterCallLabel.isHidden = false
        callWaiterView.timeStampLabel.isHidden = false
        callWaiterView.informationAboutSuccessOfWaiterCallLabel.text = "Osoblje stiže\n\nVrijeme poziva \n\(dateString)"
        callWaiterView.timeStampLabel.text = "Vrijeme poziva \n\(dateString)"
        services.sendWaiterRequestToFirestore(tableNumber: "404")
    }
    
    func setUpMenuView(){
        view.addSubview(callWaiterView)
        callWaiterView.translatesAutoresizingMaskIntoConstraints = false
        callWaiterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        callWaiterView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        callWaiterView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        callWaiterView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
