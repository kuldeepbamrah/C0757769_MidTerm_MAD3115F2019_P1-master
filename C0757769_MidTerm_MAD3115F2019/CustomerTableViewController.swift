//
//  CustomerTableViewController.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import UIKit

class CustomerTableViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
 var temp1 = Singleton.getInstance()
    
    
    @IBOutlet weak var customerTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        customerTable.delegate = self
        customerTable.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        customerTable.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temp1.returnCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let t1 = temp1.returnCustObject(custID: Int(indexPath.row+1))
        //let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! CustomTableViewCell
        
        cell1.custName.text = t1?.customerFName
        cell1.custEmail.text = t1?.customerEmail
        let y : Int = t1!.customerID!
        cell1.custID.text = String(y)
        //cell.detailTextLabel?.text = t1?.customerEmail
        return cell1
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let custDetails = sb.instantiateViewController(withIdentifier: "custDetails") as! CustomerDetailsViewController
        custDetails.custTemp = temp1.returnCustObject(custID: indexPath.row + 1)
        
        navigationController?.pushViewController(custDetails, animated: true)
    }
    
    @IBAction func logOutBtn(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
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
