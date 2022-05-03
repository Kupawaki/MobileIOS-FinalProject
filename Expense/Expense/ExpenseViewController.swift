//
//  ExpenseViewController.swift
//  Expense
//
//  Created by student on 4/5/22.
//
import UIKit
import Firebase

class ExpenseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var valueTF: UITextField!
    @IBOutlet weak var expenseTV: UITableView!
    
    let ref = Database.database().reference()
    var expenseKeys:[String] = []
    var expenseValues:[String] = []
    var expense = NSDictionary()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        fetchData()
        expenseTV.delegate = self
        expenseTV.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return expenseKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = expenseTV.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        
        cell.textLabel?.text = expenseKeys[indexPath.row] + ", " + String(expenseValues[indexPath.row])
        
        return cell
    }
    
    func fetchData()
    {
        ref.child("expense").observeSingleEvent(of: .value)
        { [self] snapshot in
            let expense = snapshot.value as! NSDictionary
            self.expenseKeys = expense.allKeys as! [String]
            self.expenseValues = expense.allValues as! [String]
            self.expenseTV.reloadData()
        }
    }
    
    
    @IBAction func addExpenseBTNOnClick(_ sender: Any)
    {
        if(nameTF.text!.isEmpty || valueTF.text!.isEmpty)
        {
            print("Both value and name cannot be empty")
            return
        }
        
        self.ref.child("expense").child(nameTF.text!).setValue(valueTF.text!)
        fetchData()
    }
    
    
}
