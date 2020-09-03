//
//  RequestedWaiterView.swift
//  Fast Order Waiter App
//
//  Created by Domagoj Beronic on 14/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class WaiterRequestsView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           self.backgroundColor = .black
           setUpElements()
           setUpConstraints()
       }
    
    private func setUpElements() {
        self.addSubview(tableView)
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 40
    }
    
    private func setUpConstraints() {
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
           tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
           tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
       }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
