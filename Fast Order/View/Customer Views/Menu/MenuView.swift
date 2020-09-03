//
//  MenuView.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class MenuView: UIView {
    let tableView = UITableView()
    let makeOrderButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setUpElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func minusTapped(beveragesCounter: Int, beveragesPriceCounter: Int) {
        DispatchQueue.main.async {
            self.makeOrderButton.setTitle("Narući \(beveragesCounter) za \(beveragesPriceCounter) Kn", for: .normal)
            self.makeOrderButton.pulsate()
            
            if beveragesCounter == 0 {
               self.makeOrderButton.isHidden = true
            }
        }
    }
    
    func plusTapped(beveragesCounter: Int, beveragesPriceCounter: Int) {
        DispatchQueue.main.async {
            self.makeOrderButton.isHidden = false
            self.makeOrderButton.setTitle("Narući \(beveragesCounter) za \(beveragesPriceCounter) Kn", for: .normal)
            self.makeOrderButton.pulsate()
        }
    }
    
    private func setUpElements(){
        self.addSubview(makeOrderButton)
        makeOrderButton.style(isHidden: true, size: 19, bgColor: .systemGray)
        
        self.addSubview(tableView)
        tableView.style()
    }
    
    private func setUpConstraints(){
        makeOrderButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -6).isActive = true
        makeOrderButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        makeOrderButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        makeOrderButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -351).isActive = true
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 378).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.makeOrderButton.topAnchor).isActive = true
    }
}
