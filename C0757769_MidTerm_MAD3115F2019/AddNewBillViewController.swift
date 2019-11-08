//
//  AddNewBillViewController.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-07.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
   
    var custObj : Customer? = nil
    
    let myPickerData = [String](arrayLiteral: "Hydro", "Internet", "Mobile")
    @IBOutlet weak var billDate: UITextField!
    @IBOutlet weak var billId: UITextField!
    @IBOutlet weak var billType: UITextField!
    @IBOutlet weak var billAmount: UITextField!
    
    
    
    @IBOutlet weak var tempLabel1: UILabel!
    @IBOutlet weak var tempLabel2: UILabel!
    @IBOutlet weak var tempLabel3: UILabel!
    @IBOutlet weak var tempLabel4: UILabel!
    @IBOutlet weak var tempLabel5: UILabel!
    @IBOutlet weak var tempLabel6: UILabel!
    
    
    @IBOutlet weak var tempField1: UITextField!
    @IBOutlet weak var tempField2: UITextField!
    @IBOutlet weak var tempfield3: UITextField!
    @IBOutlet weak var tempField4: UITextField!
    @IBOutlet weak var tempField5: UITextField!
    @IBOutlet weak var tempField6: UITextField!
    
    
    private var datePicker : UIDatePicker?
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    
    
    
    @IBAction func saveBill(_ sender: Any)
    {
        
        let billid = Int(billId.text!)
        let billtype = String(billType.text!)
        let billdate = String(billDate.text!)
        let billamount = Float(billAmount.text!)
        
        if (billid == nil || billtype == "" || billdate == "" || billamount! == 0.0)
        {
            let alert = UIAlertController(title: "Empty Field", message: "Please Fill all th details", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }else{
        if billtype.elementsEqual("Internet")
        {
            
            let providerName = tempField1.text
            let internetUsage = Float(tempField2.text!)
                if (providerName != nil && internetUsage != nil)
                {
            let ibill = Internet(providerName: providerName!, dataConsumed: internetUsage! , billId: billid!, billDate: billdate, billAmount: billamount!, billType: Bill.billTypes(rawValue: billtype)!)
            custObj?.addBill(Bill: ibill)
            }else{
                let alert = UIAlertController(title: "Empty Field", message: "Please Fill all th details", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
        if billtype.elementsEqual("Hydro")
        {
            
            let agencyName = tempField1.text
            let unitsConsumed = Float(tempField2.text!)
            if (agencyName != nil && unitsConsumed != nil)
            {
            let hbill = Hydro(agencyName: agencyName!, unitsConsumed: unitsConsumed!, billAmount: billamount!, billId: billid!, billType: Bill.billTypes(rawValue: billtype)!, billDate: billdate)
            custObj?.addBill(Bill: hbill)
            }else{
                let alert = UIAlertController(title: "Empty Field", message: "Please Fill all th details", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
                
            }
            }
        if billtype.elementsEqual("Mobile")
        {
            
            let planName = tempField1.text
            let mobileNumber = tempField2.text
            let model = tempfield3.text
            let manufacturer = tempField4.text
            let internetUsage = Float(tempField5.text!)
            let minutes = Int(tempField6.text!)
            
            
            if(planName != nil && mobileNumber != nil && model != nil && manufacturer != nil && internetUsage != nil && minutes != nil){
            let mBill = Mobile(manufacturerName: manufacturer!, modelName: model!, planName: planName!, mobileNumber: mobileNumber!, internetUsed: internetUsage!, minutes: minutes!, billAmount: billamount!, billId: billid!, billType: Bill.billTypes(rawValue: billtype)!, billDate: billdate)
           
            custObj?.addBill(Bill: mBill)
                
                
            }else{
                let alert = UIAlertController(title: "Empty Field", message: "Please Fill all th details", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
        }
            
        
        
      
    }
        
        let alert = UIAlertController(title: "Bill Added", message: "Bill was Successfully Added.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        navigationController?.popViewController(animated: true)
        self.present(alert, animated: true)
        
    }
    
    
    
    
    
    @IBAction func billType(_ sender: UITextField) {
        
        let thePicker = UIPickerView()
        thePicker.delegate = self
        thePicker.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        billType.inputView = thePicker
    }
    
    
    
    
    
    
    
    
    
    @IBAction func billDate(_ sender: UITextField)
    {
        
        let datePickerView:UIDatePicker = UIDatePicker()
             
        datePickerView.datePickerMode = UIDatePicker.Mode.date
             
            
             
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        sender.inputView = datePickerView
        
    }
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
        let billTemp = billType.text
        if (billTemp?.elementsEqual("Internet"))!
        {
            tempField1.isHidden = false
            tempField2.isHidden = false
            tempLabel1.isHidden = false
            tempLabel2.isHidden = false
            
            tempLabel3.isHidden = true
            tempLabel4.isHidden = true
            tempLabel5.isHidden = true
            tempLabel6.isHidden = true
            tempfield3.isHidden = true
            tempField4.isHidden = true
            tempField5.isHidden = true
            tempField6.isHidden = true
            
            tempLabel1.text = "Provider Name"
            tempLabel2.text = "Internet Usage"
        }
        if (billTemp?.elementsEqual("Hydro"))!
        {
            tempField1.isHidden = false
            tempField2.isHidden = false
            tempLabel1.isHidden = false
            tempLabel2.isHidden = false
             tempLabel3.isHidden = true
                       tempLabel4.isHidden = true
                       tempLabel5.isHidden = true
                       tempLabel6.isHidden = true
                       tempfield3.isHidden = true
                       tempField4.isHidden = true
                       tempField5.isHidden = true
                       tempField6.isHidden = true
            tempLabel1.text = "Agency Name"
            tempLabel2.text = "Units Consumed"
        }
        if (billTemp?.elementsEqual("Mobile"))!
        {
            tempField1.isHidden = false
            tempField2.isHidden = false
            tempLabel1.isHidden = false
            tempLabel2.isHidden = false
            tempLabel3.isHidden = false
            tempLabel4.isHidden = false
            tempLabel5.isHidden = false
            tempLabel6.isHidden = false
            tempfield3.isHidden = false
            tempField4.isHidden = false
            tempField5.isHidden = false
            tempField6.isHidden = false
            tempLabel1.text = "Plan Name"
            tempLabel2.text = "Mobile Number"
            tempLabel3.text = "Model"
            tempLabel4.text = "Manufacturer"
            tempLabel5.text = "Internet Usage"
            tempLabel6.text = "Miunutes"
            
        }
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker)
    {
         
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM, yyyy"
        billDate.text = dateFormatter.string(from: sender.date)
        
    }

    
    
    //Picker view coding
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
       }
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return myPickerData[row]
    }
     
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        //view.addGestureRecognizer(tapGesture)
        billType.text = myPickerData[row]
        
        
    }

        
        
    }
    

  

