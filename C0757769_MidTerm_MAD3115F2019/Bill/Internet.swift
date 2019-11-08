//
//  Internet.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import Foundation
class Mobile : Bill
    
{
    var manufacturerName : String
    var planName : String
    var mobileNumber : String
    var internetUsage : Float
    var minutes : Int
    var model : String
    
    init(manufacturerName:String,modelName : String, planName:String,mobileNumber:String,internetUsed:Float,minutes:Int,billAmount:Float,billId : Int,billType : billTypes,billDate: String) {
        self.manufacturerName=manufacturerName
        self.planName=planName
        self.mobileNumber=mobileNumber
        self.internetUsage=internetUsed
        self.minutes=minutes
        self.model = modelName
        super.init(billId: billId, billDate: billDate, billType: billType, billAmount : billAmount)
}
}
