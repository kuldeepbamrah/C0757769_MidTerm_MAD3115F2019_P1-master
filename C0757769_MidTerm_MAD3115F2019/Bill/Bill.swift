//
//  Bill.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import Foundation
class Bill
{
    var billId : Int
    var billDate :  String
    enum billTypes : String{
        case Internet
        case Hydro
        case Mobile
        case Insurance
    }
    var billType : billTypes
    var totalBillAmount : Float = 0
    
    init(billId : Int , billDate : String, billType : billTypes, billAmount: Float)
    {
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
        self.totalBillAmount = billAmount
    }
    
    
}
