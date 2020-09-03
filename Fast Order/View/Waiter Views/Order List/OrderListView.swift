//
//  WaiterMenuView.swift
//  fastOrder
//
//  Created by Domagoj Beronic on 26/07/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class OrderListView: UIView {
    
    let tableView = UITableView()
    let beveragesImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        setUpElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpElements() {
        self.addSubview(tableView)
        tableView.style(rowHeight: 50)
        
        self.addSubview(beveragesImageView)
        beveragesImageView.image = UIImage(named:"beveragesCover")
        beveragesImageView.styleView(cornerRadius: 15)
    }
    
    private func setUpConstraints() {
        beveragesImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        beveragesImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        beveragesImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        beveragesImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        tableView.topAnchor.constraint(equalTo: self.beveragesImageView.bottomAnchor, constant: 5).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20).isActive = true
    }
}
