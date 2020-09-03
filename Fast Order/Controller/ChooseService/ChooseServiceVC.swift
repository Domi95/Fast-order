//
//  ChooseServiceVC.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 27/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class ChooseServiceVC: UIViewController {
    
    let password = "404"
    var window: UIWindow?
    let chooseServiceView = ChooseServiceView()
    
    init(win: UIWindow){
        super.init(nibName: nil, bundle: nil)
        window = win
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        setUpChooseServiceView()
        setUpNavigationBar()
        setUpButtonsAction()
        chooseServiceView.passwordTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func userEnteredPassword() {
        if password == chooseServiceView.passwordTextField.text! {
            chooseServiceView.wrongPasswordLabel.isHidden = true
            let waiterTabBar = WaiterTabbar(win: window!)
            window?.rootViewController = waiterTabBar
            window?.makeKeyAndVisible()
        } else {
            chooseServiceView.wrongPasswordLabel.isHidden = false
            chooseServiceView.wrongPasswordLabel.pulsate()
        }
    }
    
    @objc private func customerButtonPressed() {
        let customTabBar = CustomTabBarController(win: window!)
        window?.rootViewController = customTabBar
        window?.makeKeyAndVisible()
    }
    
    @objc private func waiterButtonPressed() {
        chooseServiceView.passwordTextField.isHidden = false
    }
    
    private func setUpButtonsAction() {
        chooseServiceView.waiterButton.addTarget(self, action: #selector(waiterButtonPressed), for: .touchUpInside)
        chooseServiceView.customerButton.addTarget(self, action: #selector(customerButtonPressed), for: .touchUpInside)
    }
    
    private func setUpNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.topItem?.title = Constants.caffeBarName
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Arial-BoldItalicMT", size: 28)!
        ]
    }
    
    private func setUpChooseServiceView(){
        view.addSubview(chooseServiceView)
        chooseServiceView.translatesAutoresizingMaskIntoConstraints = false
        chooseServiceView.topAnchor.constraint(equalTo: view.topAnchor, constant: -1).isActive = true
        chooseServiceView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        chooseServiceView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        chooseServiceView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
 
extension ChooseServiceVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userEnteredPassword()
        textField.resignFirstResponder()
        return true
    }
}
