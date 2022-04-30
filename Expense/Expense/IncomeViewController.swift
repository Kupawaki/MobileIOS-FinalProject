//
//  IncomeViewController.swift
//  Expense
//
//  Created by student on 4/5/22.
//

import UIKit
import Firebase

class IncomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var incomeTV: UITableView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var valueTF: UITextField!
    
    let ref = Database.database().reference()
    var incomeKeys:[String] = []
    var incomeValues:[String] = []
    var incomeSnapshot = NSDictionary()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchData()
        incomeTV.delegate = self
        incomeTV.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return incomeKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = incomeTV.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        
        cell.textLabel?.text = incomeKeys[indexPath.row] + ", " + String(incomeValues[indexPath.row])
        
        return cell
    }
    
    func fetchData()
    {
        ref.child("income").observeSingleEvent(of: .value)
        { [self] snapshot in
            let income = snapshot.value as! NSDictionary
            self.incomeKeys = income.allKeys as! [String]
            self.incomeValues = income.allValues as! [String]
            self.incomeTV.reloadData()
        }
    }
    
    @IBAction func addValueBTNOnClick(_ sender: Any)
    {
        if(nameTF.text!.isEmpty || valueTF.text!.isEmpty)
        {
            print("Both value and name cannot be empty")
            return
        }
        
        self.ref.child("income").child(nameTF.text!).setValue(valueTF.text!)
        fetchData()
    }
}
