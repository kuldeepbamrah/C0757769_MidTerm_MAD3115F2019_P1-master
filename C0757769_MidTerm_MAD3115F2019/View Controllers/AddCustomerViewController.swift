//
//  AddCustomerViewController.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import UIKit

class AddCustomerViewController: UIViewController {

    
    let temp = Singleton.getInstance()
    
    @IBOutlet weak var custFName: UITextField!
    
    @IBOutlet weak var custLName: UITextField!
    
    @IBOutlet weak var custEmail: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
        
    @IBAction func addCustomerBtn(_ sender: UIButton)
    {
        
        let cFName = custFName.text
        let cLName = custLName.text
        let cEmail = custEmail.text
        
        
        if cFName == "" || cLName == "" || cEmail == ""
        {
            let alert = UIAlertController(title: "Empty Field", message: "Please enter all the details", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Ignore", style: .destructive, handler: nil))
            
            self.present(alert, animated: true)
        }else{
        if (cEmail?.hasSuffix(".com"))!
        {
        temp.addNewCustomer(First_Name: cFName!, Last_Name: cLName!, email: cEmail!)
            
            
            let alert = UIAlertController(title: "Customer Details Added", message: "Customer Details were successfully stored.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            
        }
        else
        {
            let alert = UIAlertController(title: "Invalid Email", message: "Please enter a valid email", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Ignore", style: .destructive, handler: nil))
            
            self.present(alert, animated: true)
            
        }
        }
    
    
        
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
