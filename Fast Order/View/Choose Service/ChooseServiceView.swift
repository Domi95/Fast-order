//
//  ChooseServiceView.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 27/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class ChooseServiceView: UIView {
    
    let customerButton = UIButton()
    let waiterButton = UIButton()
    let passwordTextField = UITextField()
    let wrongPasswordLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setUpElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpElements() {
        addSubview(customerButton)
        customerButton.style(cornerRadius: 25, size: 24, bgColor: .darkGray, title: "Gost", titleColor: .white)
        
        addSubview(waiterButton)
        waiterButton.style(cornerRadius: 25, size: 24, bgColor: .darkGray, title: "Konobar", titleColor: .white)
        
        addSubview(passwordTextField)
        passwordTextField.style()
        
        addSubview(wrongPasswordLabel)
        wrongPasswordLabel.style(isHidden: true, size: 20, text: "Pogrešna šifra", textColor: .red, bgColor: .white)
        wrongPasswordLabel.layer.cornerRadius = 15
    }
    
    private func setUpConstraints() {
        customerButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        customerButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        customerButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        customerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        waiterButton.topAnchor.constraint(equalTo: customerButton.bottomAnchor, constant: 20).isActive = true
        waiterButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        waiterButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        waiterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: waiterButton.bottomAnchor, constant: 20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        wrongPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        wrongPasswordLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        wrongPasswordLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        wrongPasswordLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
