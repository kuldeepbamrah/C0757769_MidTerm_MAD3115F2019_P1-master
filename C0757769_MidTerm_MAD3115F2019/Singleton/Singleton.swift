//
//  Singleton.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import Foundation


class Singleton: NSObject
{
    private var customerDictionary  = [Int:Customer]()
    
    private static var obj = Singleton()
    
    
    private override init() {
        
    }
    
    internal static func getInstance() -> Singleton
    {
        return obj
}
    func createCust()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date1 = formatter.date(from: "2019/08/01")?.dateformatter()
        let date2 = formatter.date(from: "2019/09/01")?.dateformatter()
        let date3 = formatter.date(from: "2019/10/01")?.dateformatter()
        //let date4 = formatter.date(from: "2020/08/01")?.dateformatter()
        
        
        let i = Internet(providerName: "Freedom", dataConsumed: 35.6, billId: 101, billDate: date1!, billAmount: 56.7, billType: Bill.billTypes.Internet)
        let m = Mobile(manufacturerName: "Apple",modelName : "Iphone 11", planName: "Big Gig", mobileNumber: "123456789", internetUsed: 6.7, minutes: 476, billAmount: 78.6, billId: 201, billType:Bill.billTypes.Mobile, billDate: date3!)
        let h = Hydro(agencyName: "Planet Energy", unitsConsumed: 56.7, billAmount: 150, billId: 103, billType: Bill.billTypes.Hydro, billDate: date2!)
        
        let i1 = Internet(providerName: "Fido", dataConsumed: 75.7, billId: 102, billDate: date1!, billAmount: 89.7, billType: Bill.billTypes.Internet)
        let m1 = Mobile(manufacturerName: "Samsung",modelName : "Galaxy s11", planName: "Big Gig 6 GB", mobileNumber: "99485937734", internetUsed: 12.7, minutes: 456, billAmount: 78.6, billId: 202, billType:Bill.billTypes.Mobile, billDate: date3!)
        let h1 = Hydro(agencyName: "Planet Energy", unitsConsumed: 45.8, billAmount: 67.8, billId: 103, billType: Bill.billTypes.Hydro, billDate: date2!)
        
        
        let i2 = Internet(providerName: "Freedom", dataConsumed: 35.7, billId: 103, billDate: date1!, billAmount: 67.7, billType: Bill.billTypes.Internet)
        let m2 = Mobile(manufacturerName: "Apple",modelName : "Iphone 11", planName: "Big Gig", mobileNumber: "839479345787943", internetUsed: 19.5, minutes: 786, billAmount: 56.6, billId: 203, billType:Bill.billTypes.Mobile, billDate: date3!)
               let h2 = Hydro(agencyName: "Planet Energy", unitsConsumed: 56.7, billAmount: 150, billId: 103, billType: Bill.billTypes.Hydro, billDate: date2!)

        
        let customer1 = Customer(customerID: 1, customerFName: "Rizul", customerLName: "Goyal", customerEmail: "rizulgoyal23@gmail.com ")
        AddCustomer(customer: customer1)
        let customer2 = Customer(customerID: 2, customerFName: "Anmol", customerLName: "Sharma", customerEmail: "anmol123@gmail.com ")
        AddCustomer(customer: customer2)
        let customer3 = Customer(customerID: 3, customerFName: "Kuldeep", customerLName: "Singh", customerEmail: "kuldeep321@gmail.com ")
        AddCustomer(customer: customer3)
        let customer4 = Customer(customerID: 4, customerFName: "Harpreet", customerLName: "Singh", customerEmail: "har5677@gmail.com ")
        AddCustomer(customer: customer4)
        let customer5 = Customer(customerID: 5, customerFName: "Ritik", customerLName: "Gupta", customerEmail: "ritik098@gmail.com ")
        AddCustomer(customer: customer5)
        
        
        customer1.addBill(Bill: i)
        customer1.addBill(Bill: m)
        customer1.addBill(Bill: h)
        customer2.addBill(Bill: i1)
        customer2.addBill(Bill: m1)
        customer3.addBill(Bill: i2)
        customer3.addBill(Bill: h2)
        customer4.addBill(Bill: h1)
        customer4.addBill(Bill: m2)
        
        
        
        
    }
    
    func AddCustomer(customer: Customer)
    {
        customerDictionary.updateValue(customer, forKey: customer.customerID!)
    }
    
    
    func addNewCustomer(First_Name : String, Last_Name : String, email : String)
    {
        let c = customerDictionary.count + 1
        //let c1 = "c" + String(customerDictionary.count)
        let temp = Customer(customerID: c, customerFName: First_Name, customerLName: Last_Name, customerEmail: email)
        self.AddCustomer(customer: temp)
    }
    
    func returnCustObject(custID : Int) -> Customer?
    {
        for (k,v) in customerDictionary
        {
            if custID == k
            {
                return v
            }
        }
        return nil
        
    }
    
    func returnCount() -> Int
    {
        return customerDictionary.count
    }
    
    
    
    
}
