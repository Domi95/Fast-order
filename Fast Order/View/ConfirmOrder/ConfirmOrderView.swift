//
//  ConfirmOrderView.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class ConfirmOrderView: UIView {
    let tableView = UITableView()
    let confirmOrderButton = UIButton()
    
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
        addSubview(tableView)
        tableView.style()
        tableView.tableFooterView = UIView(frame: CGRect.init())
        
        addSubview(confirmOrderButton)
        confirmOrderButton.style(size: 19, bgColor: .gray)
    }
    
    private func setUpConstraints(){
        confirmOrderButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -6).isActive = true
        confirmOrderButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        confirmOrderButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        confirmOrderButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 1).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.confirmOrderButton.topAnchor).isActive = true
    }
}


