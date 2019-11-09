//
//  ViewController.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var rememebrMeBtn: UISwitch!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let layer = CAGradientLayer()
//        layer.frame = view.bounds
//        layer.colors = [UIColor.blue.cgColor,UIColor.red.cgColor]
//        layer.startPoint = CGPoint(x: 0,y: 0)
//        view.layer.insertSublayer(layer, at: 0)


        let gblData = Singleton.getInstance()
        gblData.createCust()
        emailField.text = UserDefaults.standard.string(forKey: "email")
        passField.text = UserDefaults.standard.string(forKey: "pass") 
        rememebrMeBtn.isOn = true
        
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func RemeberMe(_ sender: UISwitch)
    {
        
    }
    
    
    
    
    @IBAction func LogIn(_ sender: UIButton)
    {
        if readInformationPlist()
            {
                if self.rememebrMeBtn.isOn{
                    
                    UserDefaults.standard.set(emailField.text, forKey: "email")
                    UserDefaults.standard.set(passField.text, forKey: "pass")
                }else{
                     
                    UserDefaults.standard.removeObject(forKey: "userName")
                    UserDefaults.standard.removeObject(forKey: "userPassword")
                    }
                
                let sb=UIStoryboard(name: "Main", bundle: nil)
                let customerVC = sb.instantiateViewController(withIdentifier: "TableVC") as! CustomerTableViewController
                       navigationController?.pushViewController(customerVC, animated: true)
        }
            else{
                let alert = UIAlertController(title: "Invalid Username Or Password", message: "Please Enter Valid username or password", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
            }
    }
    
    func readInformationPlist() -> Bool{
    if let bundlePath = Bundle.main.path(forResource: "Plist", ofType: "plist") {
        let dictionary = NSMutableDictionary(contentsOfFile: bundlePath)

         let usersList = dictionary!["users"] as! NSArray
     
         for u in usersList
         {
              let user = u as! NSDictionary
             let uname = user["uname"]! as! String
             let pwd = user["pwd"]! as! String
             if uname==emailField.text! && pwd==passField.text!
             {
                 return true
             }
         }
     
    
        }
         return false
    }
    
    
}

