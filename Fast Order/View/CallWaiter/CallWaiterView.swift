//
//  CallWaiterView.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class CallWaiterView: UIView {

    let informationAboutSuccessOfWaiterCallLabel = UILabel()
    let timeStampLabel = UILabel()
    let callWaiterButton = UIButton()
    let emojiLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        setUpElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
           super.init(coder: coder)
       }
    
    private func setUpElements(){
        addSubview(callWaiterButton)
        callWaiterButton.style(cornerRadius: 20, size: 16, bgColor: .white, text: "Pozovi konobara", titleColor: .red)
        
        addSubview(emojiLabel)
        emojiLabel.style(isHidden: true, size: 170, text: "🏃‍♂️")
        
        addSubview(informationAboutSuccessOfWaiterCallLabel)
        informationAboutSuccessOfWaiterCallLabel.style(isHidden: true, size: 20)
        
        addSubview(timeStampLabel)
        timeStampLabel.style(isHidden: true, size: 20)
    }
    
    private func setUpConstraints(){
        callWaiterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        callWaiterButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        callWaiterButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        callWaiterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emojiLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        emojiLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emojiLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        emojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        informationAboutSuccessOfWaiterCallLabel.topAnchor.constraint(equalTo: self.emojiLabel.bottomAnchor).isActive = true
        informationAboutSuccessOfWaiterCallLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        informationAboutSuccessOfWaiterCallLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        informationAboutSuccessOfWaiterCallLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        timeStampLabel.topAnchor.constraint(equalTo: self.informationAboutSuccessOfWaiterCallLabel.bottomAnchor, constant: 20).isActive = true
        timeStampLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        timeStampLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        timeStampLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
