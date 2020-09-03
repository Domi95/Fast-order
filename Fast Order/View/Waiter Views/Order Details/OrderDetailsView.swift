//
//  WaiterOrderView.swift
//  fastOrder
//
//  Created by Domagoj Beronic on 03/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class OrderDetailsView: UIView {
    let tableView = UITableView()
    let pricesSumLabel = UILabel()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setUpElements()
           setUpConstraints()
       }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpElements() {
        self.addSubview(pricesSumLabel)
        pricesSumLabel.style(size: 26, textColor: .white)
        pricesSumLabel.backgroundColor = .darkGray
        pricesSumLabel.layer.cornerRadius = 24
        
        self.addSubview(tableView)
        tableView.style(rowHeight: 60)
    }
    
    private func setUpConstraints() {
        pricesSumLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        pricesSumLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        pricesSumLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -6).isActive = true
        pricesSumLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.pricesSumLabel.topAnchor).isActive = true
    }
}
