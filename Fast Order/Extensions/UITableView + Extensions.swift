//
//  UITableView + Extensions.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 19/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

extension UITableView {
    
    func style(rowHeight: CGFloat = 80) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.backgroundColor = .black
        self.rowHeight = rowHeight
        self.sectionFooterHeight = 30
    }
}
