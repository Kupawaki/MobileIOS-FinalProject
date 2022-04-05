//
//  ViewController.swift
//  Expense
//
//  Created by Student on 4/5/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        <#code#>
    }
    
    
    @IBOutlet weak var mainTV: UITableView!
    var productsArray = [AppleProduct]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let product1 = AppleProduct("IPhoneX", "IPhone")
        let product2 = AppleProduct("IPhone XIV Super Mega Awesome", "IPhone")
        let product3 = AppleProduct("MacBook I", "MacBook")
        
        productsArray.append(product1)
        productsArray.append(product2)
        productsArray.append(product3)
        
        mainTV.delegate = self
        mainTV.dataSource = self
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let transition = segue.identifier
        if transition == "segueOne"
        {
            let destination = segue.destination as! SecondViewController
        }
    }
}

class AppleProduct
{
    //Class attributes (both are optional type String)
    public var productName:String?
    public var productCategory:String?
    
    //Constructor
    init(_ name:String?, _ category:String?)
    {
        self.productName = name
        self.productCategory = category
    }
}

