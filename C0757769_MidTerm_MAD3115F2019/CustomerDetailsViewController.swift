//
//  CustomerDetailsViewController.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import UIKit

class CustomerDetailsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
   

    var custTemp : Customer? = nil
    
    @IBOutlet weak var billTable: UITableView!
    @IBOutlet weak var custFName: UITextField!
    @IBOutlet weak var custEmail: UITextField!
    @IBOutlet weak var custId: UITextField!
    
    @IBAction func addNewBill(_ sender: UIBarButtonItem)
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let newBill = sb.instantiateViewController(withIdentifier: "addNewBill") as! AddNewBillViewController
        newBill.custObj = custTemp
        navigationController?.pushViewController(newBill, animated: true)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        billTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if custTemp != nil
        {
            billTable.dataSource = self
            billTable.delegate = self
            custFName.text = custTemp?.fullName
            custEmail.text = custTemp?.customerEmail
            if let id = custTemp?.customerID {
                custId.text = "\(id)"
            }
        }

        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (custTemp?.billDictionary.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! CustomBillTableViewCell
        let tempArray = custTemp!.returnBillArray()
        
        let tempBillType = tempArray[indexPath.row].billType.rawValue
        
        if tempBillType.elementsEqual("Mobile")
        {
            let tempObj =  tempArray[indexPath.row] as! Mobile
            cell.billType.text = tempBillType
            cell.billDate.text = tempObj.billDate
            cell.billAmount.text = String(tempObj.totalBillAmount)
        }
        if tempBillType.elementsEqual("Internet")
        {
            let tempObj =  tempArray[indexPath.row] as! Internet
            cell.billType.text = tempBillType
            cell.billDate.text = tempObj.billDate
            cell.billAmount.text = String(tempObj.totalBillAmount)
        }
        if tempBillType.elementsEqual("Hydro")
        {
            let tempObj =  tempArray[indexPath.row] as! Hydro
            cell.billType.text = tempBillType
            cell.billDate.text = tempObj.billDate
            cell.billAmount.text = String(tempObj.totalBillAmount)
        }
        
        //cell.billType.text =  tempArray[indexPath.row].billType.rawValue
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let sb = UIStoryboard(name: "Main", bundle: nil)
        let billDetails = sb.instantiateViewController(withIdentifier: "billDetails") as! BillDetailsViewController
        let tempArray = custTemp!.returnBillArray()
        billDetails.tempBillObj = tempArray[indexPath.row]
        navigationController?.pushViewController(billDetails, animated: true)
        
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
