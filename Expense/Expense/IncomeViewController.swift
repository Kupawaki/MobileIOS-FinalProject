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
    
    let ref = Database.database().reference()
    var indivIncomes : [String] = []
    var income = NSDictionary()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchData()
        incomeTV.delegate = self
        incomeTV.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return indivIncomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = incomeTV.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        
        cell.textLabel?.text = indivIncomes[indexPath.row]
        
        return cell
    }
    
    func fetchData()
    {
        ref.child("income").observeSingleEvent(of: .value)
        { [self]snapshot in
            let income = snapshot.value as! NSDictionary
            self.indivIncomes = income.allKeys as! [String]
            self.incomeTV.reloadData()
        }
    }
}
