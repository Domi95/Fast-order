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
        render()
    }
    
    private func render() {
        self.backgroundColor = .black
        setUpElements()
        setUpConstraints()
    }
    
    func setUpElements(){
        self.addSubview(makeOrderButton)
        makeOrderButton.translatesAutoresizingMaskIntoConstraints = false
        makeOrderButton.isHidden = true
        makeOrderButton.setTitleColor(.white, for: .normal)
        makeOrderButton.backgroundColor = .systemGray
        makeOrderButton.layer.cornerRadius = 24
        makeOrderButton.titleLabel?.font = UIFont.systemFont(ofSize: 19.0, weight: .bold)
        
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = .black
        tableView.rowHeight = 80
        tableView.sectionFooterHeight = 30
    }
    
    func setUpConstraints(){
        makeOrderButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -6).isActive = true
        makeOrderButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        makeOrderButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        makeOrderButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        tableView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -351).isActive = true
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 378).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.makeOrderButton.topAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
