//
//  OrderDetailsCell.swift
//  Fast Order Waiter App
//
//  Created by Domagoj Beronic on 14/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class OrderDetailsCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var separatorLabel: UILabel!
    @IBOutlet weak var beverageCounter: UILabel!
    @IBOutlet weak var beverageName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
    
        separatorLabel.backgroundColor = .white
        separatorLabel.text = ""
        
        cellView.backgroundColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(order: Order, indexPath: IndexPath) {
        beverageName.style(size: 16, text: order.beverages[indexPath.row].name, textColor: .white)
        beverageCounter.style(size: 18, text: "\(order.beverages[indexPath.row].beverageCounter)x", textColor: .white)
        selectionStyle = .none
    }
}
