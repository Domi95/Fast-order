//
//  ConfirmOrderCell.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 22/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class ConfirmOrderCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var minusImageView: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var beverageName: UILabel!
    @IBOutlet weak var separator: UILabel!
    @IBOutlet weak var plusImageView: UIImageView!
    @IBOutlet weak var beverageImageView: UIImageView!
    @IBOutlet weak var beveragesSum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .black
        
        beverageName.style(size: 16, text: "")
        
        beveragesSum.style(isHidden: true, size: 18, text: "")
        
        cellView.backgroundColor = .black
        cellView.layer.cornerRadius = 10
        
        separator.backgroundColor = .gray
        separator.text = ""
        
        beverageImageView.layer.cornerRadius = 20
        
        price.style(size: 18, text: "")
        
        minusImageView.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setUpCell(order: Order, indexPath: IndexPath) {
        beverageName.text = order.beverages[indexPath.row].name
        plusImageView.image = UIImage(named: "grayPlusImage")
        minusImageView.image = UIImage(named: "grayMinusImage")
        beveragesSum.text = "\(String(order.beverages[indexPath.row].beverageCounter))x"
        minusImageView.isHidden = false
        beveragesSum.isHidden = false
        beverageImageView.image = UIImage(named: order.beverages[indexPath.row].imageString)
        price.text = "\(String(order.beverages[indexPath.row].price)) kn"
        selectionStyle = .none
    }
    
    func minusImageTapped(order: Order, tapGesture: MyTapGesture) {
        DispatchQueue.main.async {
            self.beveragesSum.text = "\(order.beverages[tapGesture.row].beverageCounter)x"
            self.beveragesSum.pulsate()
            
            if order.beverages[tapGesture.row].beverageCounter == 0 {
                self.beveragesSum.isHidden = true
                self.minusImageView.isHidden = true
            }
        }
    }
    
    func plusImageTapped(order: Order, tapGesture: MyTapGesture) {
        DispatchQueue.main.async {
            self.minusImageView.isHidden = false
            self.beveragesSum.isHidden = false
            self.beveragesSum.text = "\(order.beverages[tapGesture.row].beverageCounter)x"
            self.beveragesSum.pulsate()
        }
        
    }
    
    
}
