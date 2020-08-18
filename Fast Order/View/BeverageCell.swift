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
            
            beverageNameLabel.adjustsFontSizeToFitWidth = true
            beverageNameLabel.numberOfLines = 1
            beverageNameLabel.textColor = .white
            beverageNameLabel.font = UIFont(name:"HelveticaNeue", size: 16.0)
            beverageNameLabel.textAlignment = .left
            
            orderedBeveragesSumLabel.adjustsFontSizeToFitWidth = true
            orderedBeveragesSumLabel.numberOfLines = 1
            orderedBeveragesSumLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
            orderedBeveragesSumLabel.textAlignment = .center
            orderedBeveragesSumLabel.textColor = .white
            orderedBeveragesSumLabel.isHidden = true
            
            priceLabel.text = ""
            
            cellView.backgroundColor = .black
            cellView.layer.cornerRadius = 10
            
            separatorLabel.backgroundColor = .gray
            separatorLabel.text = ""
            
            beverageImageView.layer.cornerRadius = 20
            
            priceLabel.adjustsFontSizeToFitWidth = true
            priceLabel.numberOfLines = 1
            priceLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
            priceLabel.textAlignment = .left
            priceLabel.textColor = .white
            
            minusImage.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
