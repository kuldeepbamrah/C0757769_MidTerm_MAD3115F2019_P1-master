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
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.yellow.cgColor,UIColor.red.cgColor]
        layer.startPoint = CGPoint(x: 0,y: 0)
        view.layer.insertSublayer(layer, at: 0)


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
        let emailtemp = emailField.text!
        if emailtemp.hasSuffix("@gmail.com")
        {
            let pass = passField.text!
            let email = emailField.text!
            if email == "kuldeep@gmail.com"
            {
                if pass == "1234"
                {
                    print("login Success")
                    if rememebrMeBtn.isOn
                    {
                        let email1 = emailField.text!
                        let passtemp1 = passField.text!
                        UserDefaults.standard.set(email1, forKey: "email")
                        UserDefaults.standard.set(passtemp1, forKey: "pass")
                    }else
                    {
                        UserDefaults.standard.removeObject(forKey: "email")
                        UserDefaults.standard.removeObject(forKey: "pass")
                    }
                    
                    
                    
                }else{
                    let alert = UIAlertController(title: "Incorrect Password", message: "Password You have entered is Incorrect", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    alert.addAction(UIAlertAction(title: "Ignore", style: .destructive, handler: nil))
                    
                    self.present(alert, animated: true)
                }
            }else{
                let alert = UIAlertController(title: "Email Error", message: "Email not found.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Ignore", style: .destructive, handler: nil))
                
                self.present(alert, animated: true)
            }
            
            
        } else{
            let alert = UIAlertController(title: "Email Error", message: "Please enter a valid email", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Ignore", style: .destructive, handler: nil))
            
            self.present(alert, animated: true)
            
        }
    }
    
    
    
}

