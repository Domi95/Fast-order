//
//  SuccessfulOrderViewController.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 14/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import Foundation
import UIKit

class SuccessfulOrderViewController: UIViewController {
    
    let successfulOrderView = SuccessfulOrderView()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        render()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            //self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        successfulOrderView.successfulOrderImageview.pulsate()
    }
    
    func render(){
        setUpSuccessfulOrderView()
        setUpButtonsActions()
    }
    
    func setUpButtonsActions(){
        successfulOrderView.backToMenuButton.addTarget(self, action: #selector(backToMenuButtonPressed), for: .touchUpInside)
    }
    
    @objc func backToMenuButtonPressed(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setUpSuccessfulOrderView(){
        view.addSubview(successfulOrderView)
        successfulOrderView.translatesAutoresizingMaskIntoConstraints = false
        successfulOrderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        successfulOrderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        successfulOrderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        successfulOrderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

