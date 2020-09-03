//
//  BeverageCell.swift
//  Fast Order
//
//  Created by Domagoj Beronic on 11/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class BeverageCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var beverageNameLabel: UILabel!
    @IBOutlet weak var separatorLabel: UILabel!
    @IBOutlet weak var plusImage: UIImageView!
    @IBOutlet weak var minusImage: UIImageView!
    @IBOutlet weak var beverageImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var orderedBeveragesSumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
        
        beverageNameLabel.style(size: 16, text: "")
        
        orderedBeveragesSumLabel.style(isHidden: true, size: 18, text: "")
        
        cellView.backgroundColor = .black
        cellView.layer.cornerRadius = 10
        
        separatorLabel.backgroundColor = .gray
        separatorLabel.text = ""
        
        beverageImageView.layer.cornerRadius = 20
        
        priceLabel.style(size: 18, text: "")
        
        minusImage.isHidden = true
    }
    
    func setUpCell(menu: [MenuSection], indexPath: IndexPath) {
        orderedBeveragesSumLabel.isHidden = true
        //If and else clause will fix problem connected to Reusable cell appearance
        if menu[indexPath.section].beverages[indexPath.row].beverageCounter > 0 {
            minusImage.isHidden = false
            orderedBeveragesSumLabel.isHidden = false
            orderedBeveragesSumLabel.text = "\(menu[indexPath.section].beverages[indexPath.row].beverageCounter)x"
        } else {
            minusImage.isHidden = true
        }
        beverageNameLabel.text = menu[indexPath.section].beverages[indexPath.row].name
        plusImage.image = UIImage(named: "grayPlusImage")
        minusImage.image = UIImage(named: "grayMinusImage")
        beverageImageView.image = UIImage(named: menu[indexPath.section].beverages[indexPath.row].imageString)
        priceLabel.text = "\(String(menu[indexPath.section].beverages[indexPath.row].price)) kn"
        selectionStyle = .none
    }
    
    func minusImageTapped(menu: [MenuSection], tapGesture: MyTapGesture) {
        DispatchQueue.main.async {
            self.orderedBeveragesSumLabel.text = "\(menu[tapGesture.section].beverages[tapGesture.row].beverageCounter)x"
            self.orderedBeveragesSumLabel.pulsate()
            
            if menu[tapGesture.section].beverages[tapGesture.row].beverageCounter == 0 {
                self.orderedBeveragesSumLabel.isHidden = true
                self.minusImage.isHidden = true
            }
        }
    }
    
    func plusImageTapped(menu: [MenuSection], tapGesture: MyTapGesture) {
        DispatchQueue.main.async {
            self.minusImage.isHidden = false
            self.orderedBeveragesSumLabel.isHidden = false
            self.orderedBeveragesSumLabel.text = "\(menu[tapGesture.section].beverages[tapGesture.row].beverageCounter)x"
            self.orderedBeveragesSumLabel.pulsate()
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
