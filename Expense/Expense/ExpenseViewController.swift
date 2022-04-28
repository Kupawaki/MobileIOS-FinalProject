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
    @IBOutlet weak var expenseTV: UITableView!
    
    var indivExpenses : [String] = []
    var expense = NSDictionary()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        expenseTV.delegate = self
        expenseTV.dataSource = self
        
        fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return indivExpenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = expenseTV.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        
        cell.textLabel?.text = indivExpenses[indexPath.row]
        
        return cell
    }
    
    
    func fetchData()
    {
        let databaseRef = Database.database().reference()
        
        databaseRef.child("expense").observeSingleEvent(of: .value){ [self]snapshot in
            let expense = snapshot.value as! NSDictionary
            self.indivExpenses = expense.allKeys as! [String]
            self.expenseTV.reloadData()
        }
    }
}
