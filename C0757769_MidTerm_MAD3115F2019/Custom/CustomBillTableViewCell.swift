//
//  CustomBillTableViewCell.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-05.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import UIKit

class CustomBillTableViewCell: UITableViewCell {

   
    
    
    
    
    @IBOutlet weak var billDate: UILabel!
    @IBOutlet weak var billType: UILabel!
    @IBOutlet weak var billAmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
