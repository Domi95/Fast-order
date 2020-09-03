//
//  OrderListCell.swift
//  Fast Order Waiter App
//
//  Created by Domagoj Beronic on 23/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class OrderListCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var tableNumber: UILabel!
    @IBOutlet weak var beveragesPriceSum: UILabel!
    @IBOutlet weak var seenImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.setCellView()
        backgroundColor = .black
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setUp(order: Order, indexPath: IndexPath) {
        var image = "questionMark"
        tableNumber.style(size: 16, text: "Stol: 404", textColor: .white, bgColor: .darkGray)
        beveragesPriceSum.style(size: 20, text: "\(order.beveragesPriceSum) Kn", textColor: .white, bgColor: .darkGray)
        beveragesPriceSum.numberOfLines = 1
        if order.seenBoolean == true {
            image = "seenIcon"
        } else {
            image = "questionMark"
        }
        seenImageView.image = UIImage(named: image)
        selectionStyle = .none
    }
    
    func changeSeenImage() {
        DispatchQueue.main.async {
            self.seenImageView.image = UIImage(named: "seenIcon")
            }
        }
}
