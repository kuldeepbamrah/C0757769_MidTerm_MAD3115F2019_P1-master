//
//  CustomTableViewCell.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    

    @IBOutlet weak var custID: UILabel!
    @IBOutlet weak var custName: UILabel!
    @IBOutlet weak var custEmail: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
