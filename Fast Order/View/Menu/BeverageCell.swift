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
        
        orderedBeveragesSumLabel.style(size: 18, text: "")
        orderedBeveragesSumLabel.isHidden = true
        
        priceLabel.text = ""
        
        cellView.backgroundColor = .black
        cellView.layer.cornerRadius = 10
        
        separatorLabel.backgroundColor = .gray
        separatorLabel.text = ""
        
        beverageImageView.layer.cornerRadius = 20
        
        priceLabel.style(size: 18, text: "")
        
        minusImage.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
