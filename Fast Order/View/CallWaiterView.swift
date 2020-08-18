//
//  CallWaiterView.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class CallWaiterView: UIView {
   // let successfulWaiterCallImageview = UIImageView()
    let informationAboutSuccessOfWaiterCallLabel = UILabel()
    let timeStampLabel = UILabel()
    let callWaiterButton = UIButton()
    let emojiLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    private func render() {
        self.backgroundColor = .black
        setUpElements()
        setUpConstraints()
    }
    
    private func setUpElements(){
        self.addSubview(callWaiterButton)
        callWaiterButton.setTitleColor(.red, for: .normal)
        callWaiterButton.setTitle("Pozovi konobara", for: .normal)
        callWaiterButton.backgroundColor = .white
        callWaiterButton.layer.cornerRadius = 20
        callWaiterButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        
        self.addSubview(emojiLabel)
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.textAlignment = .center
        emojiLabel.backgroundColor = .black
        emojiLabel.text = "🏃‍♂️"
        emojiLabel.adjustsFontSizeToFitWidth = true
        emojiLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 170.0)
        emojiLabel.textColor = UIColor.white
        emojiLabel.backgroundColor = .black
        emojiLabel.isHidden = true
        
        self.addSubview(informationAboutSuccessOfWaiterCallLabel)
        informationAboutSuccessOfWaiterCallLabel.translatesAutoresizingMaskIntoConstraints = false
        informationAboutSuccessOfWaiterCallLabel.textAlignment = .center
        informationAboutSuccessOfWaiterCallLabel.backgroundColor = .black
        informationAboutSuccessOfWaiterCallLabel.adjustsFontSizeToFitWidth = true
        informationAboutSuccessOfWaiterCallLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        informationAboutSuccessOfWaiterCallLabel.textColor = UIColor.white
        informationAboutSuccessOfWaiterCallLabel.backgroundColor = .black
        informationAboutSuccessOfWaiterCallLabel.isHidden = true
        
        self.addSubview(timeStampLabel)
        timeStampLabel.translatesAutoresizingMaskIntoConstraints = false
        timeStampLabel.textAlignment = .center
        timeStampLabel.backgroundColor = .black
        timeStampLabel.adjustsFontSizeToFitWidth = true
        timeStampLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        timeStampLabel.numberOfLines = 0
        timeStampLabel.textColor = UIColor.white
        timeStampLabel.backgroundColor = .black
        timeStampLabel.isHidden = true
    }
    
    private func setUpConstraints(){
        callWaiterButton.translatesAutoresizingMaskIntoConstraints = false
        callWaiterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        callWaiterButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        callWaiterButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        callWaiterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        emojiLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emojiLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        emojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        informationAboutSuccessOfWaiterCallLabel.translatesAutoresizingMaskIntoConstraints = false
        informationAboutSuccessOfWaiterCallLabel.topAnchor.constraint(equalTo: self.emojiLabel.bottomAnchor).isActive = true
        informationAboutSuccessOfWaiterCallLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        informationAboutSuccessOfWaiterCallLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        informationAboutSuccessOfWaiterCallLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        timeStampLabel.translatesAutoresizingMaskIntoConstraints = false
        timeStampLabel.topAnchor.constraint(equalTo: self.informationAboutSuccessOfWaiterCallLabel.bottomAnchor, constant: 20).isActive = true
        timeStampLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        timeStampLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        timeStampLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
