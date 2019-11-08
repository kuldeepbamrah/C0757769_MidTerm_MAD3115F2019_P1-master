//
//  Hydro.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import Foundation

class Hydro : Bill
{
    

var agencyName:String
var unitsConsumed: Float

init(agencyName:String,unitsConsumed:Float,billAmount : Float,billId : Int,billType : Bill.billTypes,billDate : String)
{
    self.agencyName=agencyName
    self.unitsConsumed=unitsConsumed
    super.init(billId: billId, billDate: billDate, billType: billType,billAmount: billAmount)
    
}
}
