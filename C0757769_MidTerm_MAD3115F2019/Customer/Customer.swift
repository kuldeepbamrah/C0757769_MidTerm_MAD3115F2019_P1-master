//
//  Customer.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import Foundation
class Customer
{
    var customerID : Int?
    var customerFName: String?
    var customerLName : String?
    var fullName : String{
        return customerFName! + " " + customerLName!
    }
    var customerEmail: String?
    var billDictionary = [Int:Bill]()
    var totalBillAmount : Float?
    
    init(customerID:Int,customerFName: String,customerLName:String,customerEmail:String) {
        self.customerID=customerID
        self.customerFName=customerFName
        self.customerLName=customerLName
        self.customerEmail=customerEmail
    }
    
    func addBill(Bill : Bill)
    {
        billDictionary.updateValue(Bill, forKey: Bill.billId)
    }
    
    
    func returnBillArray() -> Array<Bill>
    {
        var temp : Array<Bill> = []
        for i in billDictionary.values
        {
            temp.append(i)
        }
        return temp
    }
    func calcTotal() -> Float
    {
        var sum: Float = 0.0
        
        for j in billDictionary.values
        {
            sum += j.totalBillAmount
            
            
        }
        return sum
    }
    
    
}
