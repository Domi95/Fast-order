//
//  SuccessfulOrderView.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 12/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import Foundation
import UIKit

class SuccessfulOrderView: UIView {

   let successfulOrderImageview = UIImageView()
   let informationAboutSuccessOfOrderLabel = UILabel()
   let backToMenuButton = UIButton()

override init(frame: CGRect) {
    super.init(frame: frame)
    render()
}

private func render() {
    self.backgroundColor = .black
    setUpElements()
    setUpConstraints()
}
    
    func setUpElements(){
        self.addSubview(successfulOrderImageview)
        successfulOrderImageview.image = UIImage(named: "successfulOrderImage")
        
        self.addSubview(informationAboutSuccessOfOrderLabel)
        informationAboutSuccessOfOrderLabel.translatesAutoresizingMaskIntoConstraints = false
        informationAboutSuccessOfOrderLabel.text = "Narudžba dolazi!🥳"
        informationAboutSuccessOfOrderLabel.textAlignment = .center
        informationAboutSuccessOfOrderLabel.backgroundColor = .black
        informationAboutSuccessOfOrderLabel.adjustsFontSizeToFitWidth = true
        informationAboutSuccessOfOrderLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 24.0)
        informationAboutSuccessOfOrderLabel.textColor = UIColor.white
        informationAboutSuccessOfOrderLabel.backgroundColor = .black
        
        self.addSubview(backToMenuButton)
        backToMenuButton.setTitleColor(.red, for: .normal)
        backToMenuButton.setTitle("Nazad na Meni", for: .normal)
        backToMenuButton.backgroundColor = .white
        backToMenuButton.layer.cornerRadius = 20
        backToMenuButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
    }
    
    func setUpConstraints(){
        successfulOrderImageview.translatesAutoresizingMaskIntoConstraints = false
        successfulOrderImageview.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        successfulOrderImageview.widthAnchor.constraint(equalToConstant: 200).isActive = true
        successfulOrderImageview.heightAnchor.constraint(equalToConstant: 200).isActive = true
        successfulOrderImageview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        informationAboutSuccessOfOrderLabel.translatesAutoresizingMaskIntoConstraints = false
        informationAboutSuccessOfOrderLabel.topAnchor.constraint(equalTo: self.successfulOrderImageview.bottomAnchor, constant: 20).isActive = true
        informationAboutSuccessOfOrderLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        informationAboutSuccessOfOrderLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        informationAboutSuccessOfOrderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        backToMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backToMenuButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        backToMenuButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        backToMenuButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        backToMenuButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    required init?(coder: NSCoder) {
           super.init(coder: coder)
           fatalError("init(coder:) has not been implemented")
       }
}

