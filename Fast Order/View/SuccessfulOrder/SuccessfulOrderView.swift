//
//  SuccessfulOrderView.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 12/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class SuccessfulOrderView: UIView {
    
    let successfulOrderImageview = UIImageView()
    private let informationAboutSuccessOfOrderLabel = UILabel()
    let backToMenuButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setUpElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpElements(){
        addSubview(successfulOrderImageview)
        successfulOrderImageview.image = UIImage(named: "successfulOrderImage")
        successfulOrderImageview.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(informationAboutSuccessOfOrderLabel)
        informationAboutSuccessOfOrderLabel.style(size: 24, text: "Narudžba dolazi!🥳")
    
        addSubview(backToMenuButton)
        backToMenuButton.style(cornerRadius: 20, size: 16, bgColor: .white, text: "Nazad na menu", titleColor: .red)
    }
    
    private func setUpConstraints(){
        successfulOrderImageview.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        successfulOrderImageview.widthAnchor.constraint(equalToConstant: 200).isActive = true
        successfulOrderImageview.heightAnchor.constraint(equalToConstant: 200).isActive = true
        successfulOrderImageview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        informationAboutSuccessOfOrderLabel.topAnchor.constraint(equalTo: self.successfulOrderImageview.bottomAnchor, constant: 20).isActive = true
        informationAboutSuccessOfOrderLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        informationAboutSuccessOfOrderLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        informationAboutSuccessOfOrderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        backToMenuButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        backToMenuButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        backToMenuButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        backToMenuButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

