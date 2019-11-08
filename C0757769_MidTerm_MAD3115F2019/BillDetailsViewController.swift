//
//  BillDetailsViewController.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-07.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import UIKit

class BillDetailsViewController: UIViewController
{
    
    
    var tempBillObj : Bill? = nil

    @IBOutlet weak var billId: UITextField!
    @IBOutlet weak var billDate: UITextField!
    @IBOutlet weak var billType: UITextField!
    @IBOutlet weak var billAmount: UITextField!
    
    @IBOutlet weak var temp1: UITextField!
    @IBOutlet weak var temp2: UITextField!
    @IBOutlet weak var temp3: UITextField!
    @IBOutlet weak var temp4: UITextField!
    @IBOutlet weak var temp5: UITextField!
    @IBOutlet weak var temp6: UITextField!
    
    @IBOutlet weak var tempLabel1: UILabel!
    @IBOutlet weak var tempLabel2: UILabel!
    @IBOutlet weak var tempLabel3: UILabel!
    @IBOutlet weak var tempLabel4: UILabel!
    @IBOutlet weak var tempLabel5: UILabel!
    @IBOutlet weak var tempLabel6: UILabel!
    
    
    
    
    override func viewDidLoad()
    {
        billId.text = String(tempBillObj!.billId)
        billType.text = tempBillObj!.billType.rawValue
        billDate.text = tempBillObj?.billDate
        billAmount.text = String(tempBillObj!.totalBillAmount)
        

        
        let tempBill = tempBillObj!.billType.rawValue
        
        if tempBill.elementsEqual("Mobile")
        {
            let tempObj =  tempBillObj as! Mobile
            tempLabel1.text = "Manufacturer"
            tempLabel2.text = "Plan Name"
            tempLabel3.isHidden = false
            tempLabel4.isHidden = false
            tempLabel5.isHidden = false
            tempLabel6.isHidden = false
            temp3.isHidden = false
            temp4.isHidden = false
            temp5.isHidden = false
            temp6.isHidden = false
            tempLabel3.text = "Model"
            tempLabel4.text = "Mobile Number"
            tempLabel5.text = "Minutes"
            tempLabel6.text = "Internet Usage"
            
            temp1.text = tempObj.manufacturerName
            temp2.text = tempObj.planName
            temp3.text = tempObj.model
            temp4.text = tempObj.mobileNumber
            temp5.text = String(tempObj.minutes)
            temp6.text = String(tempObj.internetUsage)
            
            
        }
        if tempBill.elementsEqual("Internet")
        {
            let tempObj =  tempBillObj as! Internet
            tempLabel1.text = "Provider"
            tempLabel2.text = "GB Used"
            temp1.text = tempObj.providerName
            temp2.text = String(tempObj.dataConsumed)
           
        }
        if tempBill.elementsEqual("Hydro")
        {
            let tempObj =  tempBillObj as! Hydro
            tempLabel1.text = "Agency"
            tempLabel2.text = "Units"
            temp1.text = tempObj.agencyName
            temp2.text = String(tempObj.unitsConsumed)
            
        }
        
        
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
