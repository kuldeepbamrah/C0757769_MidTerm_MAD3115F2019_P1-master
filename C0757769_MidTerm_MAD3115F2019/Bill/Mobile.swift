//
//  Mobile.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import Foundation
class Internet : Bill
{
    
    
    var providerName : String
    var dataConsumed : Float
    
    init(providerName : String, dataConsumed : Float, billId : Int, billDate : String,billAmount: Float, billType : Bill.billTypes)
    {
        self.providerName = providerName
        self.dataConsumed = dataConsumed
        super.init(billId: billId, billDate: billDate, billType: billType,billAmount: billAmount)
}
}
