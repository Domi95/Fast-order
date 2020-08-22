//
//  SuccessfulOrderViewController.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 14/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class SuccessfulOrderViewController: UIViewController {
    
    let successfulOrderView = SuccessfulOrderView()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        setUpSuccessfulOrderView()
        setUpButtonsActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        successfulOrderView.successfulOrderImageview.pulsate()
    }
    
    private func setUpButtonsActions(){
        successfulOrderView.backToMenuButton.addTarget(self, action: #selector(backToMenuButtonPressed), for: .touchUpInside)
    }
    
    @objc func backToMenuButtonPressed(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setUpSuccessfulOrderView(){
        view.addSubview(successfulOrderView)
        successfulOrderView.translatesAutoresizingMaskIntoConstraints = false
        successfulOrderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        successfulOrderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        successfulOrderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        successfulOrderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

