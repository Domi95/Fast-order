//
//  WaiterRequestsCell.swift
//  Fast Order Waiter App
//
//  Created by Domagoj Beronic on 17/08/2020.
//  Copyright © 2020 Domagoj Beronic. All rights reserved.
//

import UIKit

class WaiterRequestCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var tableNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.setCellView()
        backgroundColor = .black
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(table: String, time: String) {
        tableNumber.style(size: 18, text: "Stol: \(table)", textColor: .white, bgColor: .darkGray)
        timeStamp.style(size: 16, text: time, textColor: .white, bgColor: .darkGray)
        cellView.backgroundColor = .darkGray
        
        selectionStyle = .none
    }
    
}
